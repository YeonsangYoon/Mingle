package com.sist.Authentication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Primary
public class AuthenticationServiceImpl implements AuthenticationService {
    private AuthenticationDAO dao;

    @Autowired
    AuthenticationServiceImpl(AuthenticationDAO dao){
        this.dao = dao;
    }

    @Override
    public List<AuthenticationVO> getMembersByID(String id) {
        return dao.getMembersByID(id);
    }
}
