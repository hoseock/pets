package com.sc.pet.admin.service;

import java.util.List;
import java.util.Map;

import com.sc.pet.sample.command.Command;

public interface AdminService {
	List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception;
//
//    void Register(Command command) throws Exception;
//    void insertInfo(Command command) throws Exception;
//    int checkId(Command command) throws Exception;
//   
//    Map<String, Object> selectBoardDetail(Command command) throws Exception;
  
	int authorize(Command command) throws Exception;
	int delAuthority(Command command) throws Exception;
	int deleteMember(Command command) throws Exception;
	String checkAuth(Command command) throws Exception;
}
