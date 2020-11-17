package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.mapper.QnADAO;
import com.ssafy.happyhouse.dto.QnA;

@Service
public class QnAServiceImpl implements QnAService{
	
	@Autowired
	private QnADAO dao;
	
	@Override
	public List<QnA> retrieveQnA() {
		return dao.selectQnA();
	}

	@Override
	public QnA retrieveQnAByNo(int qnaNo) {
		return dao.selectQnAByNo(qnaNo);
	}

	@Override
	public boolean insertQnA(QnA qna) {
		return dao.insertQnA(qna) == 1;
	}

	@Override
	@Transactional
	public boolean updateQnA(QnA qna) {
		return dao.updateQnA(qna) == 1;
	}

	@Override
	@Transactional
	public boolean updateQnAReply(QnA qna) {
		return dao.updateQnAReply(qna) == 1;
	}

	@Override
	@Transactional
	public boolean deleteQnA(int qnaNo) {
		return dao.deleteQnA(qnaNo) == 1;
	}

}
