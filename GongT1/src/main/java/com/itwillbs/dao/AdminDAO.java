package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.InquiryDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.ResumeDTO;

@Repository
public class AdminDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namesapce="com.itwillbs.mappers.AdminMapper";
	
	public void insertNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminDAO insertNotice()");
		System.out.println(noticeDTO);
		sqlSession.insert(namesapce+".insertNotice", noticeDTO);
	}
	public int getMaxnum() {
		System.out.println("AdminDAO getMaxNum()");
		return sqlSession.selectOne(namesapce + ".getMaxNum");
	}
	public List<NoticeDTO> getNoticeList(NoticeDTO noticeDTO){
		System.out.println("AdminDAO getNoticeList()");
		return sqlSession.selectList(namesapce+ ".getNoticeList",noticeDTO);
	}
	public int getNoticeCount(NoticeDTO noticeDTO) {
		System.out.println("AdminDAO getNoticeCount()");
		return sqlSession.selectOne(namesapce+".getNoticeCount");
	}
	public NoticeDTO getNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminDAO getNotice()");
		return sqlSession.selectOne(namesapce+ ".getNotice", noticeDTO);
	}
	public void updateReadcount(NoticeDTO noticeDTO) {
		System.out.println("AdminDAO updateReadcount");
		sqlSession.update(namesapce + ".updateReadcount" , noticeDTO);
	}
	public void updateNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminDAO updateBoard");
		sqlSession.update( namesapce + ".updateNotice" , noticeDTO);
	}

	public void deleteNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminDAO deleteBoard");
		sqlSession.delete(namesapce + ".deleteNotice", noticeDTO);
	}
	
	
	
	public List<MemberDTO> amember() {
		System.out.println("AdminDAO amember()");
		
		return sqlSession.selectList(namesapce + ".amember" );
	}
	
	public List<ProjectDTO> aproject() {
		System.out.println("AdminDAO aproject()");
		
		return sqlSession.selectList(namesapce + ".aproject" );
	}
	
	public List<ResumeDTO> aresume() {
		System.out.println("AdminDAO aproject()");
		
		return sqlSession.selectList(namesapce + ".aresume" );
	}
	
	public List<NoticeDTO> anotice() {
		System.out.println("AdminDAO aproject()");
		
		return sqlSession.selectList(namesapce + ".anotice" );
	}
	
	public List<InquiryDTO> ainquiry() {
		System.out.println("AdminDAO aproject()");
		
		return sqlSession.selectList(namesapce + ".ainquiry" );
	}
	
	public void deleteproject(ProjectDTO projectDTO) {
		System.out.println("AdminDAO deleteproject()");
		
		sqlSession.delete(namesapce+".deleteproject" , projectDTO);
	}
	
	public void deleteresume(ResumeDTO resumeDTO) {
		System.out.println("AdminDAO deleteresume()");
		
		sqlSession.delete(namesapce+".deleteresume" , resumeDTO);
	}
	
}
