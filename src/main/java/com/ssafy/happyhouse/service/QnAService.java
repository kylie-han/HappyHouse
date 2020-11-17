package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.QnA;

public interface QnAService {
	List<QnA> retrieveQnA();
	QnA retrieveQnAByNo(int qnaNo);
	boolean insertQnA(QnA qna);
	boolean updateQnA(QnA qna);
	boolean updateQnAReply(QnA qna);
	boolean deleteQnA(int qnaNo);
}
