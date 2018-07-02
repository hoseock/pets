package com.sc.pet.sample.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sc.pet.common.dao.AbstractDAO;
import com.sc.pet.sample.command.Command;

@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO {
	@SuppressWarnings("unchecked")

	public void Register(Command command) throws Exception{
	    insert("sample.register", command);
	}
	public void insertInfo(Command command) throws Exception{
	    insert("sample.insertInfo", command);
	}
	public int checkId(Command command) throws Exception{
		int result=(Integer)selectOne("sample.checkId", command);
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
