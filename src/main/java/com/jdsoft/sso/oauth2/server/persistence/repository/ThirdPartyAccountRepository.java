package com.jdsoft.sso.oauth2.server.persistence.repository;

import com.jdsoft.sso.oauth2.server.persistence.entity.ThirdPartyAccountEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ThirdPartyAccountRepository extends JpaRepository<ThirdPartyAccountEntity, Long> {
    ThirdPartyAccountEntity findByThirdPartyAndThirdPartyAccountId(String thirdParty, String thirdPartyAccountId);
}
