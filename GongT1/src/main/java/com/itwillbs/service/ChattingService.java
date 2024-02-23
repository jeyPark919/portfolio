package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ChattingDAO;
import com.itwillbs.domain.ChatDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MessageDTO;
@Service
public class ChattingService {

	@Inject
	private ChattingDAO chattingDAO;
	
	public List<ChatDTO> ChattingBang(String id) {
		System.out.println("ChattingService ChattingBang()");
		
		return chattingDAO.ChattingBang(id);
	}//ChattingBang()
	
	
	public void insertMessage(MessageDTO messageDTO) {
		System.out.println("MemberService insertMember()");
		chattingDAO.insertMessage(messageDTO);
	}
	
	
}
