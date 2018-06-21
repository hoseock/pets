package com.sc.pet.sample.service;

import java.util.List;
import java.util.Map;

import com.sc.pet.sample.command.Command;

public interface SampleService {
	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;

    void Register(Command command) throws Exception;
    void insertInfo(Command command) throws Exception;
    int checkId(Command command) throws Exception;
   
    Map<String, Object> selectBoardDetail(Command command) throws Exception;
  
    int updateBoard(Command command) throws Exception;
    int deleteBoard(Command command) throws Exception;


}
