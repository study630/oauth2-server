package com.revengemission.sso.oauth2.server.service.impl;

import com.revengemission.sso.oauth2.server.domain.UserInfo;
import com.revengemission.sso.oauth2.server.persistence.entity.RoleEntity;
import com.revengemission.sso.oauth2.server.persistence.entity.UserEntity;
import com.revengemission.sso.oauth2.server.persistence.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserEntity userAccountEntity = userRepository.findByUsername(username);
        if (userAccountEntity==null){
            userAccountEntity = userRepository.findByMobile(username);
        }
        if (userAccountEntity != null) {
            List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
            if (userAccountEntity.getRoles() != null && userAccountEntity.getRoles().size() > 0) {
                for (RoleEntity temp : userAccountEntity.getRoles()) {
                    GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(temp.getRoleName());
                    grantedAuthorities.add(grantedAuthority);
                }
            }
            return new UserInfo(userAccountEntity.getAccountOpenCode(), userAccountEntity.getUsername(), userAccountEntity.getPassword(),
                true, true, true, true, grantedAuthorities);
        } else {
            throw new UsernameNotFoundException(username + " not found!");
        }
    }
}
