package com.heal.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.heal.dto.Member;

public abstract class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession session;
	
	

	@Override
	public Member userPw(Member dto) {

		return (Member)session.selectOne("memberPw",dto);
	}

}
