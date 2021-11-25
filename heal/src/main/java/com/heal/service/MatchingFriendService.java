package com.heal.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heal.dao.FriendDao;
import com.heal.dto.Friend;
import com.heal.dto.Member;
import com.heal.dto.Profile;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MatchingFriendService {
	
	/** DAO 연결 */
	@Autowired
	private FriendDao dao;

	/** 프로필 저장*/
	public int insertProfile(Profile profile) throws Exception {
		int result = dao.insertProfile(profile);
		
		return result;
	}

	/** 프로필 불러오기 */
	public Profile getProfile(String id) {
		return dao.getProfile(id);
	}

	/**아이디 불러오기*/
	public String findAge(String id) {
		return dao.findAge(id);
	}

	/** 닉네임 불러오기*/
	public String findNick(String id) {
		return dao.findNick(id);
	}

	/** 프로필 삭제 */
	public int deleteForm(String id) {
		
		int result = dao.deleteForm(id);
		System.out.println("서비스의 "+result);

		return result;
	}

	public ArrayList<Profile> getAllProfile(String id) {
		return dao.getAllProfile(id);
	}

	public int addFriend(String id, String friend) {
		int result = dao.addFriend(id, friend);
		return result;
	}

	public int addFriendToo(String id, String friend) {
		int result = dao.addFriendToo(id, friend);
		return result;
	}

	public ArrayList<Profile> getFriendProfile(String id) {
		return dao.getFriendProfile(id);
	}

	public Profile getFriendDetail(String id) {
		return dao.getFriendDetail(id);
	}

	public int deleteFriend(String id) {
		int result = dao.deleteFriend(id);
		return result;
	}

	public ArrayList<Profile> getFriendList(String id) {
		return dao.getFriendList(id);
	}

	public Member selectMe(String id) {
		return dao.selectMe(id);
	}

	public ArrayList<Profile> getSameAgeFriend(String id, String age) {
		return dao.getSameAgeFriend(id,age);
	}

	public String getMyInterest(String id) {
		return dao.getMyInterest(id);
	}

	public ArrayList<Profile> getSameInterest(String id, String interest) {
		return dao.getSameInterest(id,interest);
	}

	public int updateProfile(Profile profile) {
		int result = dao.updateProfile(profile);
		
		return result;
	}

	public ArrayList<Friend> getMyFriend(String id) {
		return dao.getMyFriend(id);
	}

	
}
