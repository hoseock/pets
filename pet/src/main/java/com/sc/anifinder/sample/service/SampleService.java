package com.sc.anifinder.sample.service;

import java.util.List;
import java.util.Map;

import com.sc.anifinder.sample.command.Command;

public interface SampleService {
	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;

    void insertBoard(Command command) throws Exception;
   
    Map<String, Object> selectBoardDetail(Command command) throws Exception;
  
    int updateBoard(Command command) throws Exception;
    int deleteBoard(Command command) throws Exception;


}
