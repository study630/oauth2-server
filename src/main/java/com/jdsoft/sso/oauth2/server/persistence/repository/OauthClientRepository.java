package com.jdsoft.sso.oauth2.server.persistence.repository;

import com.jdsoft.sso.oauth2.server.persistence.entity.OauthAppEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OauthClientRepository extends JpaRepository<OauthAppEntity, Long> {
    OauthAppEntity findByClientId(String clientId);
}
