package com.jdsoft.sso.oauth2.server.service;

import com.jdsoft.sso.oauth2.server.domain.EntityNotFoundException;
import com.jdsoft.sso.oauth2.server.domain.JsonObjects;
import com.jdsoft.sso.oauth2.server.domain.UserAccount;

public interface UserAccountService extends CommonServiceInterface<UserAccount> {
    JsonObjects<UserAccount> listByUsername(String username,
                                            int pageNum,
                                            int pageSize,
                                            String sortField,
                                            String sortOrder);

    UserAccount findByUsername(String username) throws EntityNotFoundException;

    boolean existsByUsername(String username);

    void loginSuccess(String username) throws EntityNotFoundException;

    void loginFailure(String username);
}
