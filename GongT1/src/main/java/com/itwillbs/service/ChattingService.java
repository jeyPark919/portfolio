package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ChattingDAO;

import com.itwillbs.domain.ChatDTO;

import com.itwillbs.domain.MessageDTO;
@Service
public class ChattingService {

	@Inject
	private ChattingDAO chattingDAO;
	
	public List<ChatDTO> ChattingBangC(String id) {
		System.out.println("ChattingService ChattingBangC()");
		
		return chattingDAO.ChattingBangC(id);
	}//ChattingBang()
	
	public List<ChatDTO> ChattingBangF(String id) {
		System.out.println("ChattingService ChattingBangF()");
		
		return chattingDAO.ChattingBangF(id);
	}//ChattingBang()
	

	
	

	
	public void insertMessage(MessageDTO messageDTO) {
		System.out.println("MemberService insertMember()");
		chattingDAO.insertMessage(messageDTO);
	}


	public void updateMatching(ChatDTO chatDTO) {
		System.out.println("BoardService updateBoard()");
		
		chattingDAO.updateMatching(chatDTO);
	}
	
	public ChatDTO getChat(int c_num) {
		// TODO Auto-generated method stub
		return chattingDAO.getChat(c_num);
	}

	public List<ChatDTO> getMessage(int c_num) {
		// TODO Auto-generated method stub
		return chattingDAO.getMessage(c_num);

	}
	
	
}
