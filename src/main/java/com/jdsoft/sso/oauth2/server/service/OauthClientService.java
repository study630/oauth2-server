package com.jdsoft.sso.oauth2.server.service;

import com.jdsoft.sso.oauth2.server.domain.NotImplementException;
import com.jdsoft.sso.oauth2.server.domain.OauthClient;

public interface OauthClientService extends CommonServiceInterface<OauthClient> {
    default OauthClient findByClientId(String clientId){
        throw new NotImplementException();
    }
}
