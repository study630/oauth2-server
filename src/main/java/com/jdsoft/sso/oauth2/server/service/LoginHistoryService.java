package com.jdsoft.sso.oauth2.server.service;

import com.jdsoft.sso.oauth2.server.domain.JsonObjects;
import com.jdsoft.sso.oauth2.server.domain.LoginHistory;

public interface LoginHistoryService extends CommonServiceInterface<LoginHistory> {
    JsonObjects<LoginHistory> listByUsername(String username, int pageNum,
                                             int pageSize,
                                             String sortField,
                                             String sortOrder);
    
    void asyncCreate(LoginHistory loginHistory);

}
