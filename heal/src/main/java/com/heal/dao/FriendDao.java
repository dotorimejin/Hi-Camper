package com.heal.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.heal.dto.Friend;
import com.heal.dto.Member;
import com.heal.dto.Profile;

@Mapper
public interface FriendDao {
	
	//프로필 등록
	public int insertProfile(Profile profile) throws Exception;

	//내 프로필 조회
	public Profile getProfile(String id);

	//연령대 불러오기
	public String findAge(String id);

	//닉네임 불러오기
	public String findNick(String id);

	//프로필 삭제하기
	public int deleteForm(String id);

	//회원 전체 프로필 불러오기
	public ArrayList<Profile> getAllProfile(String id);

	//친구 추가하기
	public int addFriend(String id, String friend);

	public int addFriendToo(String id, String friend);

	//친구 프로필 불러오기
	public ArrayList<Profile> getFriendProfile(String id);

	//프로필 디테일
	public Profile getFriendDetail(String id);

	//친구 삭제하기
	public int deleteFriend(String id);

	//친구 전체 목록 
	public ArrayList<Profile> getFriendList(String id);

	//내 정보 불러오기
	public Member selectMe(String id);

	//동년배 불러오기
	public ArrayList<Profile> getSameAgeFriend(String id, String age);

	//내 취미 불러오기
	public String getMyInterest(String id);

	//같은 취미 불러오기
	public ArrayList<Profile> getSameInterest(String id, String interest);

	//프로필 업데이트
	public int updateProfile(Profile profile);

	//내 친구 목록
	public ArrayList<Friend> getMyFriend(String id);

	


}
