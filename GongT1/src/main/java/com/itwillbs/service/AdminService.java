package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.AdminDAO;
import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.InquiryDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.ResumeDTO;

@Service
public class AdminService {
	
	@Inject
	private AdminDAO adminDAO;
	
	public void insertNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminService insertAdmin()");
		noticeDTO.setN_num(adminDAO.getMaxnum() + 1);
		noticeDTO.setN_readcount(0);
		noticeDTO.setN_date(new Timestamp(System.currentTimeMillis()));
		adminDAO.insertNotice(noticeDTO);
	}
	public List<NoticeDTO> getNoticeList(NoticeDTO noticeDTO){
		System.out.println("NoticeService getNoticeList()");
		int currentPage = noticeDTO.getCurrentPage();
		int pageSize = noticeDTO.getPageSize();
		
		int startRow = (currentPage-1) * pageSize + 1;
		
		// 끝나는 행번호 구하기
		int endRow = startRow + pageSize -1;
		
		// pageDTO에 저장
		// boardMapper => limit 시작행-1,개수
		noticeDTO.setStartRow(startRow - 1);
		noticeDTO.setEndRow(endRow);
		
		return adminDAO.getNoticeList(noticeDTO);
		
	}
	public int getNoticeCount(NoticeDTO noticeDTO) {
		System.out.println("NoticeService getNoticeCount()");
		
		return adminDAO.getNoticeCount(noticeDTO);
	}
	public NoticeDTO getNotice(NoticeDTO noticeDTO) {
		System.out.println("NoticeService getNotice()");
		return adminDAO.getNotice(noticeDTO);
	}
	public void updateReadcount(NoticeDTO noticeDTO) {
		System.out.println("NoticeService updateReadcount");
		adminDAO.updateReadcount(noticeDTO);
	}
	public void updateNotice(NoticeDTO noticeDTO) {
		System.out.println("BoardService updateBoard");
		adminDAO.updateNotice(noticeDTO);
		
	}

	public void deleteNotice(NoticeDTO noticeDTO) {
		System.out.println("BoardService deleteBoard");
		adminDAO.deleteNotice(noticeDTO);
		
	}
	
	public List<MemberDTO> amember() {
		System.out.println("AdminService admincom()");
		
		return adminDAO.amember();
	}
	
	public List<ProjectDTO> aproject() {
		System.out.println("AdminService aproject()");
		
		return adminDAO.aproject();
	}
	
	public List<ResumeDTO> aresume() {
		System.out.println("AdminService aproject()");
		
		return adminDAO.aresume();
	}
	
	public List<NoticeDTO> anotice() {
		System.out.println("AdminService aproject()");
		
		return adminDAO.anotice();
	}
	
	public List<InquiryDTO> ainquiry() {
		System.out.println("AdminService aproject()");
		
		return adminDAO.ainquiry();
	}
	
	public void deleteproject(ProjectDTO projcetDTO) {
		System.out.println("AdminService deleteproject()");
		
		
		adminDAO.deleteproject(projcetDTO);
	}
	
	
	public void deleteresume(ResumeDTO resumeDTO) {
		System.out.println("AdminService deleteresume()");
		
		
		adminDAO.deleteresume(resumeDTO);
	}
}
