package com.heal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heal.dao.MemberDao;
import com.heal.dto.Member;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService {

	@Autowired
	private MemberDao memberDao;

	/**
	 * login
	 * 
	 * @param memberId 아이디
	 * @param memberPw 비밀번호
	 * @return grade
	 */
	public String login(String id, String pw) {
		String grade = memberDao.login(id, pw);
		log.debug("member grade :: " + grade);
		return grade;
	}

	/**
	 * login
	 * 
	 * @param memberId 아이디
	 * @param memberPw 비밀번호
	 * @return member domain
	 */
	public Member loginToMember(String id, String pw) {
		Member dto = memberDao.loginToMember(id, pw);
		log.debug("loginToMember :: " + dto);
		return dto;
	}

	/**
	 * 
	 * @param id
	 * @return
	 */
	public Member memberSelect(String id) {
		log.debug("memberSelect" + id);
		Member dto = memberDao.idCheck(id);
		return dto;
	}

	/**
	 * 
	 * @param dto
	 * @return
	 */
	public int insertMember(Member dto) {
		try {
			memberDao.insertMember(dto);
			log.debug("dao result::" + dto);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 2;
		}
	}

	public boolean updateMember(Member dto) {
		memberDao.updateMember(dto);
		return true;
	}
	
	
	/**
	 * delete account
	 * @param id 아이디
	 * @param pw 비밀번호
	 * @return T/F
	 */
	public boolean deleteMember(String id, String pw) {
		if(id != null && pw != null) {			
			memberDao.deleteMember(id, pw); 
		} else {
			log.debug("deleteMember Fail :: memberService");
			return false;
		}
		return true;
	}
	
	
	/** 로그인 날짜 갱신
	 * @param id */
	public int updateLastLogin(String last_login, String id) {
		return memberDao.updateLastLogin(last_login, id);
	}

	public Member userPw(Member dto) {
		return memberDao.userPw(dto);
	}
	
	public int userLogin(Member dto) {
		Member vo = new Member();
		vo.setId(dto.getId());

			return 0;
		}

	
}
