package com.sc.pet.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sc.pet.board.command.Command;
import com.sc.pet.common.dao.AbstractDAO;

@Repository("boardDAO")
public class boardDAO extends AbstractDAO {
	@SuppressWarnings("unchecked")
    public List<Command> selectBoardList(Command command) throws Exception{
        return (List<Command>)selectList("board.selectBoardList", command);
    }
	public void insertBoard(Command command) throws Exception{
		insert("board.insertBoard", command);
	}
    public int updateHitCount(Command command) throws Exception{
        return update("board.updateHitCount", command);
    }
    public int updateBoard(Command command) throws Exception{
        return update("board.updateBoard", command);
    }
    public int deleteBoard(Command command) throws Exception{
        return update("board.deleteBoard", command);
    }
    public void insertFile(Map<String,Object> map) throws Exception{
		insert("board.insertFile", map);
	}
    public void deleteFileList(Command command) throws Exception{
        update("board.deleteFileList", command);
    }
    @SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Command command) throws Exception{
        return (Map<String, Object>)selectOne("board.selectBoardDetail", command);
    }
}