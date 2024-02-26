package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ChatDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MessageDTO;

@Repository
public class ChattingDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.ChatMapper";
	
	
	public List<ChatDTO> ChattingBangC(String id) {
		System.out.println("ChattingDAO ChattingBangC()");
		
		return sqlSession.selectList(namespace + ".ChattingBangC", id);
	
	}//ChattingCheck()
	
	public List<ChatDTO> ChattingBangF(String id) {
		System.out.println("ChattingDAO ChattingBangF()");
		
		return sqlSession.selectList(namespace + ".ChattingBangF", id);
	
	}//ChattingCheck()
	
	public List<ChatDTO> ChattingBangFF(String id) {
		System.out.println("ChattingDAO ChattingBangFF()");
		
		return sqlSession.selectList(namespace + ".ChattingBangFF", id);
	
	}//ChattingCheck()
	
	public List<ChatDTO> ChattingBangCC(String id) {
		System.out.println("ChattingDAO ChattingBangCC()");
		
		return sqlSession.selectList(namespace + ".ChattingBangCC", id);
	
	}//ChattingCheck()
	
	
	public void insertMessage(MessageDTO messageDTO) {
		System.out.println("MemberDAO insertMember()");
		System.out.println(messageDTO.getId());
		
	
		sqlSession.insert(namespace+".insertmessage",messageDTO);
	}

	public ChatDTO getChat(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getChat", id);
	}
}
