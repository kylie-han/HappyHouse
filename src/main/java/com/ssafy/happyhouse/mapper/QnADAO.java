package com.ssafy.happyhouse.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.QnA;

@Mapper
public interface QnADAO {
	
	public List<QnA> selectQnA();
	public QnA selectQnAByNo(int qnaNo);
	public int insertQnA(QnA qna);
	public int updateQnA(QnA qna);
	public int updateQnAReply(QnA qna);
	public int deleteQnA(int qnaNo);
}
