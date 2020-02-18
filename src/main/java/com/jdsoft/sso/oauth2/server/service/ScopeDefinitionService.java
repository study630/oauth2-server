package com.jdsoft.sso.oauth2.server.service;

import com.jdsoft.sso.oauth2.server.domain.NotImplementException;
import com.jdsoft.sso.oauth2.server.domain.ScopeDefinition;

public interface ScopeDefinitionService extends CommonServiceInterface<ScopeDefinition> {
    default ScopeDefinition findByScope(String scope) throws NotImplementException {
        throw new NotImplementException();
    }
}
