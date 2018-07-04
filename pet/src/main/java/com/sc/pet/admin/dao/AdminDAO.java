package com.sc.pet.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sc.pet.common.dao.AbstractDAO;
import com.sc.pet.register.command.RegisterCommand;

@Repository("adminDAO")
public class AdminDAO extends AbstractDAO {
	@SuppressWarnings("unchecked")
	
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("admin.selectMemberList", map);
	}

//	public int updateHitCnt(Command command) throws Exception{
//	    return update("sample.updateHitCnt", command);
//	}
//
//	@SuppressWarnings("unchecked")
//	public Map<String, Object> selectBoardDetail(Command command) throws Exception {
//		return (Map<String, Object>) selectOne("sample.selectBoardDetail", command);
//	}
	public int authorize(RegisterCommand command) throws Exception{
	    return update("admin.authorize", command);
	}
	public int delAuthority(RegisterCommand command) throws Exception{
		return update("admin.delAuthority", command);
	}
//	
	public int deleteMember(RegisterCommand command) throws Exception{
	    return delete("admin.deleteMember", command);
	}
	
	public String checkAuth(RegisterCommand command) throws Exception{
		String result=(String) selectOne("admin.checkAuth", command);
	    return result;
	}

}
