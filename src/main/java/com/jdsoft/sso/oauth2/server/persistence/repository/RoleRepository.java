package com.jdsoft.sso.oauth2.server.persistence.repository;

import com.jdsoft.sso.oauth2.server.persistence.entity.RoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<RoleEntity, Long> {
    RoleEntity findByRoleName(String roleName);
}
