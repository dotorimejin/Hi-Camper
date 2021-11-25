package com.heal.dao;

import org.apache.ibatis.annotations.Mapper;

import com.heal.dto.Member;


@Mapper
public interface MemberDao {
	
	/** login : return grade */
	public String login(String id, String pw);
	
	/** login : return domain */
	public Member loginToMember(String id, String pw);
	
	public Member idCheck(String MemberId);
	
	public int insertMember(Member dto);
	
	public boolean updateMember(Member dto);
	
	public int updateLastLogin(String last_login, String id);

	/** 회원 탈퇴 */
	public void deleteMember(String id, String pw);
	
	public Member userPw(Member dto);

}
