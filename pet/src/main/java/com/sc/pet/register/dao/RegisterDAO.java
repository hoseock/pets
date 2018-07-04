package com.sc.pet.register.dao;

import org.springframework.stereotype.Repository;

import com.sc.pet.common.dao.AbstractDAO;
import com.sc.pet.register.command.RegisterCommand;

@Repository("registerDAO")
public class RegisterDAO extends AbstractDAO {
	@SuppressWarnings("unchecked")

	public void Register(RegisterCommand command) throws Exception{
	    insert("register.register", command);
	}
	public void insertInfo(RegisterCommand command) throws Exception{
	    insert("register.insertInfo", command);
	}
	public int checkId(RegisterCommand command) throws Exception{
		int result=(Integer)selectOne("register.checkId", command);
	    return result;
	}

//	public int updateHitCnt(Command command) throws Exception{
//	    return update("sample.updateHitCnt", command);
//	}
//
//	@SuppressWarnings("unchecked")
//	public Map<String, Object> selectBoardDetail(Command command) throws Exception {
//		return (Map<String, Object>) selectOne("sample.selectBoardDetail", command);
//	}
//	public int updateBoard(Command command) throws Exception{
//	    return update("sample.updateBoard", command);
//	}
//	
//	public int deleteBoard(Command command) throws Exception{
//	    return update("sample.deleteBoard", command);
//	}

}
