package com.sist.Authentication;

import java.util.List;

public interface AuthenticationService {
    public List<AuthenticationVO> getMembersByID(String id);
}
