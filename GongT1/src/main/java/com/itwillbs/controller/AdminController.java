package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.InquiryDTO;
import com.itwillbs.domain.MemberDTO;
//import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.ResumeDTO;
import com.itwillbs.service.AdminService;

@Controller
//@RequestMapping("/Admin/*")
public class AdminController {
	@Inject
	private AdminService adminService;
	
	
	@RequestMapping(value="/Admin/notice" ,method=RequestMethod.GET)
	public String list(HttpServletRequest request, NoticeDTO noticeDTO, Model model) {
		System.out.println("NoticeController list()");
		int pageSize =15;
		String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		noticeDTO.setPageSize(pageSize);
		noticeDTO.setPageNum(pageNum);
		noticeDTO.setCurrentPage(currentPage);
		
		List<NoticeDTO> noticeList = adminService.getNoticeList(noticeDTO);
		int count = adminService.getNoticeCount(noticeDTO);
		int pageBlock=10;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		// 한 화면에 보여줄 끝페이지 구하기
		int endPage = startPage + pageBlock - 1;
		// 전체 페이지개수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		// 끝페이지 , 전체 페이지수 비교 => 끝페이지 크면 => 전체 페이지수로 끝페이지 변경
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		noticeDTO.setCount(count); 
		noticeDTO.setPageBlock(pageBlock);
		noticeDTO.setStartPage(startPage);
		noticeDTO.setEndPage(endPage);
		noticeDTO.setPageCount(pageCount);
		
		model.addAttribute("noticeDTO", noticeDTO);
		model.addAttribute("noticeList", noticeList);
		
		return "Admin/notice";
	}
	
	@RequestMapping(value="/Admin/write" ,method=RequestMethod.GET)
	public String write() {
		System.out.println("AdminController write()");
		
		// center/write.jsp 주소변경없이 이동
		return "Admin/write";
	}//write()
	
	// post방식 /board/writePro 주소 매핑
	// BoardDTO boardDTO 전달받으면 자동으로 request에 담긴 파라미터 값이 저장
	// boardService.insertBoard(boardDTO) 메서드 호출
	// /board/list 글목록으로 주소변경하면서 이동
	@RequestMapping(value="/Admin/writePro" ,method=RequestMethod.POST)
	public String writePro(NoticeDTO noticeDTO) {
		System.out.println("AdminController writePro()");
		System.out.println(noticeDTO);
		
		adminService.insertNotice(noticeDTO);
		
		// /board/list 글목록으로 주소변경하면서 이동
		return "redirect:/Admin/notice";
	}//writePro()
	@RequestMapping(value="/Admin/content" ,method=RequestMethod.GET)
	public String content(NoticeDTO noticeDTO,Model model) {
		System.out.println("AdminController content()");
		System.out.println(noticeDTO);
		// 조회수 1 증가
		adminService.updateReadcount(noticeDTO);
		
		
		noticeDTO = adminService.getNotice(noticeDTO);
		
		model.addAttribute("boardDTO",noticeDTO);
		
		return "Admin/content";
	}
	
	@RequestMapping(value="/Admin/FAQ" ,method=RequestMethod.GET)
	public String FAQ(NoticeDTO noticeDTO) {
		System.out.println("AdminController FAQ()");
		System.out.println(noticeDTO);
		
		
		return "Admin/FAQ";
	}
	@RequestMapping(value="/Admin/Notice" ,method=RequestMethod.GET)
	public String Notice(NoticeDTO noticeDTO) {
		System.out.println("AdminController Notice()");
		System.out.println(noticeDTO);
		
		
		return "Admin/Notice";
	}
	@RequestMapping(value="/Admin/inquiry" ,method=RequestMethod.GET)
	public String Inquiry(NoticeDTO noticeDTO) {
		System.out.println("AdminController inquiry()");
		System.out.println(noticeDTO);
		
		
		return "Admin/inquiry";
	}
	@RequestMapping(value="/Admin/inquiry_write" ,method=RequestMethod.GET)
	public String Inquiry_write(NoticeDTO noticeDTO) {
		System.out.println("AdminController inquiry_write()");
		System.out.println(noticeDTO);
		
		
		return "Admin/inquiry_write";
	}	
	@RequestMapping(value="/Admin/inquiry_writePro" ,method=RequestMethod.POST)
	public String inquiry_writePro(NoticeDTO noticeDTO) {
		System.out.println("AdminController inquiry_writePro()");
		System.out.println(noticeDTO);
		
		adminService.insertNotice(noticeDTO);
		
		
		return "redirect:/Admin/inquiry";
	}
	
	@RequestMapping(value="/Admin/update" ,method=RequestMethod.GET)
	public String update(NoticeDTO noticeDTO,Model model) {
		System.out.println("AdminController update()");
		System.out.println(noticeDTO);
		noticeDTO = adminService.getNotice(noticeDTO);
		System.out.println(noticeDTO);
		model.addAttribute("noticeDTO",noticeDTO);
		return "Admin/update";
	}	
	@RequestMapping(value="/Admin/updatePro" ,method=RequestMethod.POST)
	public String updatePro(NoticeDTO noticeDTO) {
		System.out.println("AdminController updatePro()");
		System.out.println(noticeDTO);
		
		adminService.updateNotice(noticeDTO);
		
		// /board/list 글목록으로 주소변경하면서 이동
		return "redirect:/Admin/notice";
	}
	@RequestMapping(value="/Admin/delete" ,method=RequestMethod.GET)
	public String delete(NoticeDTO noticeDTO) {
		System.out.println("AdminController delete()");
		System.out.println(noticeDTO);
		adminService.deleteNotice(noticeDTO);
		return "redirect:/Admin/notice";
	}
	
	
	
	
	
	@RequestMapping(value="/Adminpage/Adminmain" ,method=RequestMethod.GET)
	public String Adminmain(HttpSession session, Model model) {
		System.out.println("MemberController Adminmain()");
		
//		String id = (String)session.getAttribute("id");
//		System.out.println(id);

		List<MemberDTO>MemberDTOList = adminService.amember();
		System.out.println(MemberDTOList.size());
		model.addAttribute("MemberDTOList",MemberDTOList);
		
		return "/Adminpage/Adminmain";
	}
	
	@RequestMapping(value="/Adminpage/Adminpro" ,method=RequestMethod.GET)
	public String Adminpro(HttpSession session, Model model) {
		System.out.println("AdminController Adminpro()");
		
		List<ProjectDTO>ProjectDTOList = adminService.aproject();
		
		
//		int p_num = (int)session.getAttribute("p_num");
//		System.out.println(p_num);
		
		model.addAttribute("ProjectDTOList",ProjectDTOList);
		
		return "/Adminpage/Adminpro";
	}
	
	@GetMapping("/Adminpage/AdeletePro")
	public String AdeletePro(ProjectDTO projectDTO) {

		System.out.println("AdminController AdeletePro()");
		System.out.println(projectDTO); 


		
		adminService.deleteproject(projectDTO);

		
		return "redirect:/Adminpage/Adminpro";
	}

	@RequestMapping(value="/Adminpage/Adminresume" ,method=RequestMethod.GET)
	public String Adminre(HttpSession session, Model model) {
		System.out.println("MemberController Adminre()");
		
		List<ResumeDTO>ResumeDTOList = adminService.aresume();
		
		model.addAttribute("ResumeDTOList",ResumeDTOList);
		
		return "/Adminpage/Adminresume";
	}
	
	@GetMapping("/Adminpage/AdeleteRe")
	public String AdeleteRe(ResumeDTO resumeDTO) {

		System.out.println("AdminController AdeleteRe()");
		System.out.println(resumeDTO); 


		
		adminService.deleteresume(resumeDTO);

		
		return "redirect:/Adminpage/Adminresume";
	}

	
	
	
	
	@RequestMapping(value="/Adminpage/Adminnotice" ,method=RequestMethod.GET)
	public String Adminno(HttpSession session, Model model) {
		System.out.println("MemberController Adminno()");
		
		List<NoticeDTO>NoticeDTOList = adminService.anotice();
		
		model.addAttribute("NoticeDTOList",NoticeDTOList);
		
		return "/Adminpage/Adminnotice";
	}
	@RequestMapping(value="/Adminpage/Admininquiry" ,method=RequestMethod.GET)
	public String Adminin(HttpSession session, Model model) {
		System.out.println("MemberController Adminin()");
		
		List<InquiryDTO>InquiryDTOList = adminService.ainquiry();
		
		model.addAttribute("InquiryDTOList",InquiryDTOList);
		
		return "/Adminpage/Admininquiry";
	}
	
}
