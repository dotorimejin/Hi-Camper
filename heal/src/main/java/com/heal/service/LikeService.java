package com.heal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.heal.dao.LikeDao;
import com.heal.dto.Like;

import lombok.extern.slf4j.Slf4j;

@Component
public class LikeService {

	@Autowired
	private LikeDao likeDao;
	
	/** 좋아요 추가 */
	public int likeCheck(Like dto) {
		//dto.setRe_date(Utility.getCurrentDate());
		int result = likeDao.likeCheck(dto);
		return result;
	}


	/** 좋아요 삭제 */
	public int likeCheckCancel(Like dto) {
		int result = likeDao.likeCheckCancel(dto);
		return result;
	}

	
	public Like like(int re_no, String member_id) {
		Like result = likeDao.like(re_no, member_id);
		return result;
	}
}
