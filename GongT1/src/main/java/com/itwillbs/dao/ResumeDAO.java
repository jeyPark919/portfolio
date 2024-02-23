package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;



import com.itwillbs.domain.FieldDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.RegionDTO;
import com.itwillbs.domain.ResumeDTO;

@Repository
public class ResumeDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.ResumeMapper";
	
	public int getResumeCount() {
		System.out.println("ResumeDAO getResumeCount()");
		
		return sqlSession.selectOne(namespace + ".getResumeCount");
	}//getResumeCount()
	
	public MemberDTO getMember(int r_num) {
		System.out.println("ResumeDAO getMember()");
		
		return sqlSession.selectOne(namespace+".getMember", r_num);
	}//getMember()

	
	public ResumeDTO getResume(int r_num) {
		System.out.println("ResumeDAO getResume()");
		
		return sqlSession.selectOne(namespace+".getResume", r_num);
	}//getResume()

	public int getResumeMaxNum() {
		System.out.println("ResumeDAO getResumeMaxNum()");
		return sqlSession.selectOne(namespace + ".getResumeMaxNum");
	}//getResumeMaxNum()

	public List<ResumeDTO> getResumeBoardList(PageDTO pageDTO) {
		System.out.println("ResumeDAO getResumeBoardList()");
		return sqlSession.selectList(namespace + ".getResumeBoardList", pageDTO);
	}//getResumeBoardList()
	
	public int getResumeBoardCount(PageDTO pageDTO) {
		System.out.println("ResumeDAO getResumeBoardCount()");
		return sqlSession.selectOne(namespace + ".getResumeBoardCount", pageDTO);
	}//getResumeBoardCount()
	
	public ResumeDTO getResumeBoard(ResumeDTO resumeDTO) {
		System.out.println("ResumeDAO getResumeBoard()");
		return sqlSession.selectOne(namespace + ".getResumeBoard", resumeDTO);
	}//getResumeBoard()


	
}
