package com.sc.pet.register.service;

import java.util.List;
import java.util.Map;

import com.sc.pet.register.command.RegisterCommand;

public interface RegisterService {
	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;

    void Register(RegisterCommand command) throws Exception;
    void insertInfo(RegisterCommand command) throws Exception;
    int checkId(RegisterCommand command) throws Exception;
   
    Map<String, Object> selectBoardDetail(RegisterCommand command) throws Exception;
  
}
