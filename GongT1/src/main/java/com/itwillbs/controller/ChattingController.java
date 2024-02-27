package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.domain.ChatDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MessageDTO;
import com.itwillbs.service.ChattingService;
import com.itwillbs.service.MemberService;

@Controller
public class ChattingController {

	@Inject
	ChattingService chattingService;
	
	@Inject
	private MemberService memberService;
	
	
	@GetMapping("/inc/chatting")
	public String chattingbang(HttpServletRequest request, Model model) {
		System.out.println("ChattingController chattingbang()");
		int c_num = Integer.parseInt(request.getParameter("c_num"));
		List<ChatDTO> messageList = chattingService.getMessage(c_num);
		
		model.addAttribute("chatDTO", chattingService.getChat(c_num));
		model.addAttribute("messageList",messageList);
		
		return "/inc/chatting";
	}//chattingbang()
	
	
	@PostMapping("/inc/insertMessagePro")
	public String insertMessagePro(MessageDTO messageDTO) {
		System.out.println("ChattingController insertMessagePro()");
		chattingService.insertMessage(messageDTO);
		return "redirect:/inc/chatting?c_num="+messageDTO.getC_num();
	}//insertMessagePro()
	
	
	@GetMapping("/inc/close")
	public String close() {
		return "/inc/close";
	}//close()
	
	
	@PostMapping("/inc/insertChatPro")
	public String insertChattingPro(ChatDTO chatDTO) {
		System.out.println("ChattingController insertChatPro()");
		int c_num = chattingService.insertChat(chatDTO);
		return "redirect:/inc/chatting?c_num="+c_num;
	}//insertChattingPro()
	
	
}//class ChattingController
