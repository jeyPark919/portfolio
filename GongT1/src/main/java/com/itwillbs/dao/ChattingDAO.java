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
	
	
	public List<ChatDTO> ChattingBang(String id) {
		System.out.println("ChattingDAO ChattingBang()");
		
		return sqlSession.selectList(namespace + ".ChattingBang", id);
	
	}//ChattingCheck()
	
	
	public void insertMessage(MessageDTO messageDTO) {
		System.out.println("MemberDAO insertMember()");
		System.out.println(messageDTO.getId());
		
	
		sqlSession.insert(namespace+".insertmessage",messageDTO);
	}
}
