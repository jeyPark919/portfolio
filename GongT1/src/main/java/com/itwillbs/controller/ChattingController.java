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

import com.itwillbs.domain.MessageDTO;
import com.itwillbs.service.ChattingService;


@Controller
public class ChattingController {

	@Inject
	ChattingService chattingService;
	

	
//	@GetMapping("/inc/chatting")
//	public String chattingbang(HttpSession session, Model model, MemberDTO memberDTO) {
//		System.out.println("ChattingController chattingbang()");
//		
//		String id = (String)session.getAttribute("id");
//		System.out.println(id);
////		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
////		
//		session.setAttribute("id",memberDTO.getId());
//		
//		List<ChatDTO> ChattingDTOList2 = chattingService.ChattingBang(id);
//		
//		
//		model.addAttribute("ChattingDTOList2",ChattingDTOList2);
//		
//		return "/inc/chatting";
//	}
	
	

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
	}//insertMessagePro
	

	@PostMapping("/inc/updateMatching")
	public String updateMatching(ChatDTO chatDTO) {
		System.out.println("BoardController updatePro()");
		System.out.println(chatDTO);
		
		chattingService.updateMatching(chatDTO);
		
		return "redirect:/inc/close";
	}
	
	
	@GetMapping("/inc/close")
	public String close() {
		System.out.println("close()");
		return "/inc/close";
	}

	


	
}//class ChattingController

