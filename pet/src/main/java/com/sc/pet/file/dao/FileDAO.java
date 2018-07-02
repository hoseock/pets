package com.sc.pet.file.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sc.pet.board.command.Command;
import com.sc.pet.common.dao.AbstractDAO;

@Repository("FileDAO")
public class FileDAO extends AbstractDAO {
	
    public void insertFile(Map<String,Object> map) throws Exception{
		insert("file.insertFile", map);
	}
	/*@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Command command) throws Exception{
        return (Map<String, Object>)selectOne("file.selectBoardDetail", command);
    }*/
	public void deleteFileList(Command command) throws Exception{
        update("file.deleteFileList", command);
    }
   
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Command command) {
		return (List<Map<String, Object>>)selectList("file.selectFileList", command);
	}
}
