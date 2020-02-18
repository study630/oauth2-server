package com.jdsoft.sso.oauth2.server;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.jdsoft.sso.oauth2.server.utils.JsonUtil;
import com.jdsoft.sso.oauth2.server.persistence.entity.UserEntity;
import com.jdsoft.sso.oauth2.server.persistence.repository.UserRepository;
import org.apache.commons.lang3.RandomStringUtils;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import java.time.LocalDate;
import java.util.UUID;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ApplicationTests {


    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Ignore
    @Test
    public void localDateTest() {

        LocalDate date = LocalDate.of(1988, 6, 6);
        int count = jdbcTemplate.update("update user_account_entity set birthday=? where id=1; ", date);
        System.out.println("count = " + count);

    }

    @Ignore
    @Test
    public void insertUserAccount() throws JsonProcessingException {
        UserEntity userAccountEntity = new UserEntity();
        userAccountEntity.setUsername(RandomStringUtils.randomAlphabetic(10));
        userAccountEntity.setPassword(passwordEncoder.encode("tgb.258"));
        userAccountEntity.setAccountOpenCode(UUID.randomUUID().toString());
        LocalDate date = LocalDate.of(1988, 6, 6);
        userAccountEntity.setBirthday(date);
        userRepository.save(userAccountEntity);

        System.out.println(JsonUtil.objectToJsonString(userAccountEntity));
        System.out.println("---------------------------");

    }

    @Ignore
    @Test
    public void updateUserAccount() {
        userRepository.findById(1L).ifPresent(e -> {
            //e.setRemarks("123");
            userRepository.save(e);
        });

        System.out.println("---------------------------");

    }

}