package com.sc.anifinder.sample.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sc.anifinder.common.dao.AbstractDAO;
import com.sc.anifinder.sample.command.Command;

@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO {
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("sample.selectBoardList", map);
	}
	
	public void insertBoard(Command command) throws Exception{
	    insert("sample.insertBoard", command);
	}
	
	public int updateHitCnt(Command command) throws Exception{
	    return update("sample.updateHitCnt", command);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Command command) throws Exception {
		return (Map<String, Object>) selectOne("sample.selectBoardDetail", command);
	}
	public int updateBoard(Command command) throws Exception{
	    return update("sample.updateBoard", command);
	}
	
	public int deleteBoard(Command command) throws Exception{
	    return update("sample.deleteBoard", command);
	}

}
