package com.sc.pet.admin.service;

import java.util.List;
import java.util.Map;

import com.sc.pet.register.command.RegisterCommand;

public interface AdminService {
	List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception;
//
//    void Register(Command command) throws Exception;
//    void insertInfo(Command command) throws Exception;
//    int checkId(Command command) throws Exception;
//   
//    Map<String, Object> selectBoardDetail(Command command) throws Exception;
  
	int authorize(RegisterCommand command) throws Exception;
	int delAuthority(RegisterCommand command) throws Exception;
	int deleteMember(RegisterCommand command) throws Exception;
	String checkAuth(RegisterCommand command) throws Exception;
}
