package com.jdsoft.sso.oauth2.server.controller;

import com.jdsoft.sso.oauth2.server.domain.*;
import com.jdsoft.sso.oauth2.server.service.OauthClientService;
import com.jdsoft.sso.oauth2.server.service.UserAccountService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/app")
public class AppController {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    OauthClientService oauthClientService;

    @Autowired
    UserAccountService userAccountService;

    @GetMapping(value = {"/", "", "/home"})
    public String master(Principal principal,
                          Model model) {
        try {
            UserAccount userAccount = userAccountService.findByUsername(principal.getName());
            List<OauthClient> listOauthApp = userAccount.getApps();
            List<Map<String,Object>> lApps = new ArrayList<>();
            for (int i=0;i<listOauthApp.size();i++){
                Map<String,Object> map = new HashMap();
                map.put("appId",listOauthApp.get(i).getId());
                map.put("appName",listOauthApp.get(i).getApplicationName());
                map.put("appUrl",listOauthApp.get(i).getAppUrl());
                map.put("icon",listOauthApp.get(i).getIcon());
                map.put("orderNum",listOauthApp.get(i).getOrderNum());
                lApps.add(map);
            }
            model.addAttribute("applist", lApps);
        } catch (EntityNotFoundException e) {
            if (log.isErrorEnabled()) {
                log.error("findByUsername exception", e);
            }
        }

        return "apphome";
    }

    @GetMapping(value = "/list")
    @ResponseBody
    public JsonObjects<OauthClient> listObjects(@RequestParam(value = "searchValue", required = false, defaultValue = "") String searchValue,
                                                @RequestParam(value = "draw", defaultValue = "0") int draw,
                                                @RequestParam(value = "length", defaultValue = "10") Integer pageSize,
                                                @RequestParam(value = "start", defaultValue = "0") Integer start,
                                                @RequestParam(value = "sortField", required = false, defaultValue = "id") String sortField,
                                                @RequestParam(value = "sortOrder", required = false, defaultValue = "desc") String sortOrder) {
        int pageNum = start / 10 + 1;
        JsonObjects<OauthClient> result = oauthClientService.list(pageNum, pageSize, sortField, sortOrder);
        result.setDraw(draw + 1);
        return result;
    }

    @GetMapping(value = "/details")
    @ResponseBody
    public OauthClient setupDetails(@RequestParam(value = "id") Long id,
                                    @RequestParam(value = "additionalData", required = false) String additionalData) {
        OauthClient object = oauthClientService.retrieveById(id);
        object.setAdditionalData(additionalData);
        return object;
    }

    @PostMapping(value = "/details")
    @ResponseBody
    public ResponseResult<Object> handlePost(@RequestParam(value = "id", required = false) long id,
                                             @RequestParam(value = "deleteOperation", required = false, defaultValue = "1") int deleteOperation,
                                             @RequestParam(value = "clientId", required = false) String clientId,
                                             @RequestParam(value = "clientSecret", required = false) String clientSecret,
                                             @RequestParam(value = "authorities", required = false) String authorities,
                                             @RequestParam(value = "scope", required = false) String scope,
                                             @RequestParam(value = "authorizedGrantTypes", required = false) String authorizedGrantTypes,
                                             @RequestParam(value = "webServerRedirectUri", required = false) String webServerRedirectUri,
                                             @RequestParam(value = "remarks", required = false) String remarks) {

        ResponseResult<Object> responseResult = new ResponseResult<>();

        if (deleteOperation == -1 && id > 0) {
            oauthClientService.updateRecordStatus(id, 0);
            responseResult.setStatus(GlobalConstant.SUCCESS);
        } else if (deleteOperation == 0 && id > 0) {
            oauthClientService.updateRecordStatus(id, -1);
            responseResult.setStatus(GlobalConstant.SUCCESS);
        } else if (id > 0) {
            OauthClient object = oauthClientService.retrieveById(id);
            if (StringUtils.isNotEmpty(clientSecret)) {
                object.setClientSecret(passwordEncoder.encode(StringUtils.trim(clientSecret)));
            }
            if (StringUtils.isNotEmpty(authorities)) {
                object.setAuthorities(authorities);
            }
            if (StringUtils.isNotEmpty(scope)) {
                object.setScope(scope);
            }
            if (StringUtils.isNotEmpty(authorizedGrantTypes)) {
                object.setAuthorizedGrantTypes(authorizedGrantTypes);
            }
            if (StringUtils.isNotEmpty(webServerRedirectUri)) {
                object.setWebServerRedirectUri(webServerRedirectUri);
            }
            if (StringUtils.isNotEmpty(remarks)) {
                object.setRemarks(remarks);
            }
            oauthClientService.updateById(object);
        } else {
            if (StringUtils.isAnyEmpty(clientId, clientSecret, authorities, scope, authorizedGrantTypes, webServerRedirectUri)) {
                responseResult.setStatus(GlobalConstant.ERROR);
            } else {
                OauthClient object = new OauthClient();
                object.setClientId(clientId);
                object.setClientSecret(passwordEncoder.encode(StringUtils.trim(clientSecret)));
                object.setAuthorities(authorities);
                object.setScope(scope);
                object.setAuthorizedGrantTypes(authorizedGrantTypes);
                object.setWebServerRedirectUri(webServerRedirectUri);
                object.setRemarks(remarks);
                oauthClientService.create(object);
            }

        }

        return responseResult;
    }

}
