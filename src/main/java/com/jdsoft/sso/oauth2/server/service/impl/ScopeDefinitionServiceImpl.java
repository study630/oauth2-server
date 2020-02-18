package com.jdsoft.sso.oauth2.server.service.impl;

import com.github.dozermapper.core.Mapper;
import com.jdsoft.sso.oauth2.server.persistence.entity.ScopeDefinitionEntity;
import com.jdsoft.sso.oauth2.server.persistence.repository.ScopeDefinitionRepository;
import com.jdsoft.sso.oauth2.server.domain.NotImplementException;
import com.jdsoft.sso.oauth2.server.domain.ScopeDefinition;
import com.jdsoft.sso.oauth2.server.service.ScopeDefinitionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScopeDefinitionServiceImpl implements ScopeDefinitionService {

    @Autowired
    ScopeDefinitionRepository scopeDefinitionRepository;

    @Autowired
    Mapper dozerMapper;

    @Override
    public ScopeDefinition findByScope(String scope) throws NotImplementException {
        ScopeDefinitionEntity scopeDefinitionEntity = scopeDefinitionRepository.findByScope(scope);
        if (scopeDefinitionEntity != null) {
            return dozerMapper.map(scopeDefinitionEntity, ScopeDefinition.class);
        } else {
            return null;
        }
    }

}
