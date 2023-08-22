package com.sist.Authentication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Primary
public class AuthenticationServiceImpl implements AuthenticationService {
    private AuthenticationDAO dao;
    private BCryptPasswordEncoder pwdEncoder;

    @Autowired
    AuthenticationServiceImpl(AuthenticationDAO dao, BCryptPasswordEncoder encoder){
        this.dao = dao;
        this.pwdEncoder = encoder;
    }

    @Override
    public Map<String, String> isValidLogin(String id, String pwd) {
        MemberVO member = dao.getMemberByID(id);

        Map<String, String> ret = new HashMap<String, String>();
        if(member != null){
            if(pwdEncoder.matches(pwd, member.getPassword())){
                ret.put("result", "OK");
                ret.put("nickname", member.getNickname());
            }
            else{
                ret.put("result", "NOPWD");
            }
        }
        else{
            ret.put("result", "NOID");
        }

        return ret;
    }

    @Override
    public MemberVO getMemberByID(String id){
        MemberVO member = dao.getMemberByID(id);

        // 성별 전환
        if(member.getGender().equals("m")){
            member.setGender("남자");
        }
        else{
            member.setGender("여자");
        }

        return member;
    }

    @Override
    public int getIDCount(String id) {
        return dao.getIDCount(id);
    }

    @Override
    public int getNicknameCount(String nickname) {
        return dao.getNicknameCount(nickname);
    }

    @Override
    public int addMember(MemberVO member) {
        // password 인코딩
        member.setPassword(pwdEncoder.encode(member.getPassword()));

        return dao.insertMember(member);
    }

    @Override
    public boolean isValidPassword(String user_id, String pwd) {
        MemberVO member = dao.getMemberByID(user_id);
        return pwdEncoder.matches(pwd, member.getPassword());
    }

    @Override
    public int updateMember(MemberVO member) {
        return dao.updateMember(member);
    }

/*
1. 스터디 삭제
    -> 파일 삭제(user가 작성한 스터디의 파일 삭제)
    -> 기술 스택 삭제(user가 작성한 스터디의 기술 스택 삭제)
    -> 좋아요 삭제(user가 좋아요 누름 + user가 작성한 스터디의 좋아요)
    -> 댓글 삭제(user가 작성한 댓글 + user가 작성한 스터디에 작성된 댓글)
    -> 스터디 삭제
2. 멘토 삭제
    -> 멘토 팔로우 (user의 팔로우 기록, user(멘토)에게 팔로우한 기록)
    -> 멘토 상담 (user가 신청한 상담, user(멘토)에게 팔로우한 기록)
    -> 멘토 리뷰 (user가 작성한 리뷰, user(멘토)에게 작성된 리뷰)
    -> 멘토링 시간 (user가 등록한 멘토링 시간)
    -> 멘토 삭제
3. 공간 삭제
    -> 공간 리뷰 삭제 (user가 작성한 리뷰 삭제)
    -> 공간 찜 삭제 (user가 등록한 찜 삭제)
    -> 공간 예약 삭제 (user의 예약기록 삭제)
*/

    @Override
    @Transactional
    public int withdrawMember(String user_id){ // 탈퇴 로직
        // 스터디 삭제
        dao.deleteStudyFile(user_id);
        dao.deleteStudyTech(user_id);
        dao.deleteStudyLike(user_id);
        dao.deleteStudyReply(user_id);
        dao.deleteStudy(user_id);

        // 공간 삭제
        dao.deleteSpaceReview(user_id);
        dao.deleteSpaceZzim(user_id);
        dao.deleteSpaceBooking(user_id);

        // 멘토 삭제
        dao.deleteMentoFollow(user_id);
        dao.deleteMentoCounsel(user_id);
        dao.deleteMentoReview(user_id);
        dao.deleteMentoTime(user_id);
        dao.deleteMento(user_id);

        return dao.deleteMember(user_id);
    }

    @Override
    public int withdrawSelf(String user_id, String pwd) { // user 스스로 탈퇴
        // 비밀번호 우선 확인
        if(!isValidPassword(user_id, pwd)){
            return -1;
        }
        return withdrawMember(user_id);
    }

    @Override
    public int withdrawByAdmin(String user_id) { // 관리자가 삭제
        return withdrawMember(user_id);
    }
}
