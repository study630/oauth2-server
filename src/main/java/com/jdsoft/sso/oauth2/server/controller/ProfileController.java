package com.jdsoft.sso.oauth2.server.controller;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jdsoft.sso.oauth2.server.domain.EntityNotFoundException;
import com.jdsoft.sso.oauth2.server.domain.OauthClient;
import com.jdsoft.sso.oauth2.server.domain.UserAccount;
import com.jdsoft.sso.oauth2.server.service.UserAccountService;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.text.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class ProfileController {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    private static final Pattern AUTHORIZATION_PATTERN = Pattern.compile("^Bearer (?<token>[a-zA-Z0-9-._~+/]+)=*$");

    @Autowired
    UserAccountService userAccountService;

    @Autowired
    TokenStore tokenStore;

    @ResponseBody
    @RequestMapping("/user/me")
    public Map<String, Object> info(@RequestParam(value = "access_token", required = false) String paramToken,
                                    @RequestHeader(value = "Authorization", required = false) String headerToken,
                                    @CookieValue(value = "access_token", required = false) String cookieToken) {
        Map<String, Object> result = new HashMap<>(16);
        try {
            String token = null;
            if (StringUtils.isNoneBlank(headerToken)) {
                Matcher matcher = AUTHORIZATION_PATTERN.matcher(headerToken);
                if (matcher.matches()) {
                    token = matcher.group("token");
                }
            }

            if (token == null && StringUtils.isNoneBlank(paramToken)) {
                token = paramToken;
            }

            if (token == null && StringUtils.isNoneBlank(cookieToken)) {
                token = cookieToken;
            }

            if (token != null) {
                OAuth2AccessToken auth2AccessToken = tokenStore.readAccessToken(token);
                if (auth2AccessToken.isExpired()) {
                    result.put("status", 0);
                    result.put("message", "access_token无效");
                    return result;
                }

                String username = auth2AccessToken.getAdditionalInformation().get("sub").toString();
                UserAccount userAccount = userAccountService.findByUsername(username);
                result.put("username", username);

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
                if (StringUtils.isNotEmpty(userAccount.getSex())) {
                    result.put("sex", userAccount.getSex());
                }
                if (StringUtils.isNotEmpty(userAccount.getNickName())) {
                    result.put("nickName", userAccount.getNickName());
                }
                result.put("grantType", auth2AccessToken.getAdditionalInformation().get("grantType"));
                result.put("accountOpenCode", "" + userAccount.getId());
                result.put("authorities", auth2AccessToken.getAdditionalInformation().get("authorities"));
                result.put("status", 1);
                result.put("apps",lApps);
            } else {
                result.put("status", 0);
                result.put("message", "未检测到access_token");
            }


        } catch (Exception e) {
            if (log.isInfoEnabled()) {
                log.info("/user/me exception", e);
            }
            result.put("status", 0);
            result.put("message", "access_token无效");
        }

        return result;
    }


    @GetMapping(value = {"", "/", "/user/profile"})
    public String profile(Principal principal,
                          Model model) {
        try {
            UserAccount userAccount = userAccountService.findByUsername(principal.getName());
            model.addAttribute("userAccount", userAccount);
        } catch (EntityNotFoundException e) {
            if (log.isErrorEnabled()) {
                log.error("findByUsername exception", e);
            }
        }

        return "profile";
    }

    @PostMapping("/user/profile")
    public String handleProfile(Principal principal,
                                @RequestParam(value = "nickName", required = false) String nickName,
                                @RequestParam(value = "avatarUrl", required = false) String avatarUrl,
                                @RequestParam(value = "email", required = false) String email,
                                @RequestParam(value = "mobile", required = false) String mobile,
                                @RequestParam(value = "region", required = false) String region,
                                @RequestParam(value = "address", required = false) String address,
                                @JsonFormat(pattern = "yyyy-MM-dd") @DateTimeFormat(pattern = "yyyy-MM-dd")
                                @RequestParam(value = "birthday", required = false) LocalDate birthday,
                                Model model) {

        try {
            UserAccount userAccount = userAccountService.findByUsername(principal.getName());
            userAccount.setNickName(StringEscapeUtils.escapeHtml4(nickName));
            userAccount.setAvatarUrl(StringEscapeUtils.escapeHtml4(avatarUrl));
            userAccount.setEmail(StringEscapeUtils.escapeHtml4(email));
            userAccount.setMobile(StringEscapeUtils.escapeHtml4(mobile));
            userAccount.setRegion(StringEscapeUtils.escapeHtml4(region));
            userAccount.setAddress(StringEscapeUtils.escapeHtml4(address));
            userAccount.setBirthday(birthday);
            userAccount = userAccountService.updateById(userAccount);
            model.addAttribute("userAccount", userAccount);
            model.addAttribute("updated", true);
        } catch (EntityNotFoundException e) {
            if (log.isErrorEnabled()) {
                log.error("findByUsername exception", e);
            }
        }

        return "profile";
    }
}
