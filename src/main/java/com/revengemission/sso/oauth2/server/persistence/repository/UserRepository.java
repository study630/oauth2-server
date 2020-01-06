package com.revengemission.sso.oauth2.server.persistence.repository;

import com.revengemission.sso.oauth2.server.persistence.entity.UserEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
    UserEntity findByUsername(String username);

    UserEntity findByUsernameOrMobile(String username,String mobile);

    UserEntity findByMobile(String mobile);

    Page<UserEntity> findByUsernameLike(String username, Pageable page);

    boolean existsByUsername(String username);
}
