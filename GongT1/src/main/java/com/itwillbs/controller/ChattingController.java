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
	
	
	@GetMapping("/inc/chattingc")
	public String chattingc(HttpSession session, Model model) {
		System.out.println("ChattingController chattingc()");
		
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		List<ChatDTO> ChattingDTOListCC = chattingService.ChattingBangCC(id);
		
		model.addAttribute("ChattingDTOListCC",ChattingDTOListCC);
		
		return "/inc/chattingc";
	}//
	
	
	@GetMapping("/inc/chattingf")
	public String chattingf(Model model, HttpServletRequest request) {
		System.out.println("ChattingController chattingf()");
		int c_num = Integer.parseInt(request.getParameter("c_num"));
		List<ChatDTO> chattingDTOListFF = chattingService.ChattingBangFF(c_num);
		
		model.addAttribute("chatDTO", chattingService.getChat(c_num));
		model.addAttribute("chattingDTOListFF",chattingDTOListFF);
		
		return "/inc/chattingf";
	}//
	
	
	@PostMapping("/inc/insertMessagePro")
	public String insertMessagePro(MessageDTO messageDTO) {
		System.out.println("ChattingController insertMessagePro()");
		chattingService.insertMessage(messageDTO);
		return "redirect:/inc/chatting?c_num="+messageDTO.getC_num();
	}//insertMessagePro
	
	
}//class ChattingController
