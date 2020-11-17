package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.NoticeDto;
import com.ssafy.happyhouse.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	NoticeMapper mapper;
	
	@Override
	public void writeNotice(NoticeDto noticeDto) throws Exception {
		mapper.writeNotice(noticeDto);
	}

	@Override
	public List<NoticeDto> listNotice(String key, String word) throws Exception {
		return mapper.listNotice(key, word);
	}

	@Override
	public NoticeDto getNotice(int noticeno) throws Exception {
		return mapper.getNotice(noticeno);
	}

	@Override
	public void modifyNotice(NoticeDto noticeDto) throws Exception {
		mapper.modifyNotice(noticeDto);
	}

	@Override
	public void deleteNotice(int noticeno) throws Exception {
		mapper.deleteNotice(noticeno);
	}

}
