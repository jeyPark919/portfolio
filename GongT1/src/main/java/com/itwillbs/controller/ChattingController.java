package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
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
	
	
	@GetMapping("/inc/chattingc")
	public String chattingc(HttpSession session, Model model) {
		System.out.println("MemberController mypageCompany5()");
		
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		List<ChatDTO> ChattingDTOListCC = chattingService.ChattingBangCC(id);
		
		model.addAttribute("ChattingDTOListCC",ChattingDTOListCC);
		
		return "/inc/chattingc";
	}//mypageFreelancer5
	
	@GetMapping("/inc/chattingf")
	public String chattingf(HttpSession session, Model model) {
		System.out.println("MemberController mypageCompany5()");
		
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		List<ChatDTO> ChattingDTOListFF = chattingService.ChattingBangFF(id);
		
		model.addAttribute("ChatDTO", chattingService.getChat(id));
		model.addAttribute("ChattingDTOListFF",ChattingDTOListFF);
		
		return "/inc/chattingf";
	}//mypageFreelancer5
	
	
	@PostMapping("/inc/insertMessagePro")
	public String insertMessagePro(MessageDTO messageDTO) {
		System.out.println("chattingController insertMessagePro()");
		chattingService.insertMessage(messageDTO);
		return "redirect:/inc/chatting";
	}
	
//	@PostMapping("/updateMatching")
//	public String updateMatchingC(ChatDTO chatDTO) {
//		System.out.println("BoardController updatePro()");
//		System.out.println(chatDTO);
//		
//		chattingService.updateMatching(chatDTO);
//		
//		// /board/list 글목록으로 주소변경하면서 이동
//		return "redirect:/mypageCompany/mypageCompany5";
//	}
//	
//	@PostMapping("/updateMatching")
//	public String updateMatchingF(ChatDTO chatDTO) {
//		System.out.println("BoardController updatePro()");
//		System.out.println(chatDTO);
//		
//		chattingService.updateMatching(chatDTO);
//		
//		// /board/list 글목록으로 주소변경하면서 이동
//		return "redirect:/mypageFreelancer/mypageFreelancer5";
//	}
	
}
