package com.heal.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.heal.dto.QnaReply;
import com.heal.service.QnaReplyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reply")
public class QnaReplyController {
	
	private QnaReplyService qnaReplyService; 
	
	@RequestMapping("/replyList")
    @ResponseBody
    public List<QnaReply> replyList(Model model, int qnaNo) throws Exception{
        return qnaReplyService.replyList(qnaNo);
    }
    
	
    @RequestMapping("/insertReply")
    @ResponseBody
    public int insertReply(@RequestParam int qnaNo, @RequestParam String replyText, @RequestParam String id,HttpServletRequest request, HttpSession session) throws Exception{
    	QnaReply reply = new QnaReply();
    	//String id = (String)session.getAttribute("id"); 
    	reply.setQnaNo(qnaNo);
    	reply.setReplyText(replyText);
    	reply.setId("test");
        return qnaReplyService.insertReply(reply);
    }
    
    
    @RequestMapping("/updateReply")
    @ResponseBody
    public int updateReply(@RequestParam int replyNo, @RequestParam String replyText) throws Exception{
    	QnaReply reply = new QnaReply();
    	reply.setReplyNo(replyNo);
    	reply.setReplyText(replyText);
        return qnaReplyService.updateReply(reply);
    }
    
    
    @RequestMapping("/deleteReply/{replyNo}")
    @ResponseBody
    public int deleteReply(@PathVariable int replyNo) throws Exception{
        return qnaReplyService.deleteReply(replyNo);
    }


}
