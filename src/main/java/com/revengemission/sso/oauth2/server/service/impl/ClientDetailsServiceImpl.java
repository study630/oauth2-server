package com.revengemission.sso.oauth2.server.service.impl;

import com.revengemission.sso.oauth2.server.config.CachesEnum;
import com.revengemission.sso.oauth2.server.domain.AlreadyExpiredException;
import com.revengemission.sso.oauth2.server.domain.InvalidClientException;
import com.revengemission.sso.oauth2.server.persistence.entity.OauthAppEntity;
import com.revengemission.sso.oauth2.server.persistence.repository.OauthClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.provider.ClientDetails;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.ClientRegistrationException;
import org.springframework.security.oauth2.provider.NoSuchClientException;
import org.springframework.security.oauth2.provider.client.BaseClientDetails;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class ClientDetailsServiceImpl implements ClientDetailsService {

    @Autowired
    OauthClientRepository oauthClientRepository;

    @Autowired
    CacheManager cacheManager;

    @Override
    public ClientDetails loadClientByClientId(String clientId) throws ClientRegistrationException {

        Cache.ValueWrapper valueWrapper = cacheManager.getCache(CachesEnum.Oauth2ClientCache.name()).get(clientId);

        if (valueWrapper != null) {
            return (ClientDetails) valueWrapper.get();
        }

        OauthAppEntity oauthAppEntity = oauthClientRepository.findByClientId(clientId);
        if (oauthAppEntity != null) {
            if (oauthAppEntity.getRecordStatus() < 0) {
                throw new InvalidClientException(String.format("clientId %s is disabled!", clientId));
            }
            if (oauthAppEntity.getExpirationDate() != null && oauthAppEntity.getExpirationDate().isBefore(LocalDateTime.now())) {
                throw new AlreadyExpiredException(String.format("clientId %s already expired!", clientId));
            }
            BaseClientDetails baseClientDetails = new BaseClientDetails();
            baseClientDetails.setClientId(oauthAppEntity.getClientId());
            if (!StringUtils.isEmpty(oauthAppEntity.getResourceIds())) {
                baseClientDetails.setResourceIds(StringUtils.commaDelimitedListToSet(oauthAppEntity.getResourceIds()));
            }
            baseClientDetails.setClientSecret(oauthAppEntity.getClientSecret());
            if (!StringUtils.isEmpty(oauthAppEntity.getScope())) {
                baseClientDetails.setScope(StringUtils.commaDelimitedListToSet(oauthAppEntity.getScope()));
            }
            if (!StringUtils.isEmpty(oauthAppEntity.getAuthorizedGrantTypes())) {
                baseClientDetails.setAuthorizedGrantTypes(StringUtils.commaDelimitedListToSet(oauthAppEntity.getAuthorizedGrantTypes()));
            } else {
                baseClientDetails.setAuthorizedGrantTypes(StringUtils.commaDelimitedListToSet("authorization_code"));
            }
            if (!StringUtils.isEmpty(oauthAppEntity.getWebServerRedirectUri())) {
                baseClientDetails.setRegisteredRedirectUri(StringUtils.commaDelimitedListToSet(oauthAppEntity.getWebServerRedirectUri()));
            }
            if (!StringUtils.isEmpty(oauthAppEntity.getAuthorities())) {
                List<SimpleGrantedAuthority> authorities = new ArrayList<>();
                StringUtils.commaDelimitedListToSet(oauthAppEntity.getAuthorities()).forEach(s -> authorities.add(new SimpleGrantedAuthority(s)));
                baseClientDetails.setAuthorities(authorities);
            }
            if (oauthAppEntity.getAccessTokenValidity() != null && oauthAppEntity.getAccessTokenValidity() > 0) {
                baseClientDetails.setAccessTokenValiditySeconds(oauthAppEntity.getAccessTokenValidity());
            }
            if (oauthAppEntity.getRefreshTokenValidity() != null && oauthAppEntity.getRefreshTokenValidity() > 0) {
                baseClientDetails.setRefreshTokenValiditySeconds(oauthAppEntity.getRefreshTokenValidity());
            }
///            baseClientDetails.setAdditionalInformation(oauthClientEntity.getAdditionalInformation());
            if (!StringUtils.isEmpty(oauthAppEntity.getAutoApprove())) {
                baseClientDetails.setAutoApproveScopes(StringUtils.commaDelimitedListToSet(oauthAppEntity.getAutoApprove()));
            }
            cacheManager.getCache(CachesEnum.Oauth2ClientCache.name()).put(clientId, baseClientDetails);
            return baseClientDetails;
        } else {
            throw new NoSuchClientException("No client with requested id: " + clientId);
        }
    }
}
