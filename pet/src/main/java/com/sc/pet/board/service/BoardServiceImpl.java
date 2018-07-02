package com.sc.pet.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sc.pet.board.command.Command;
import com.sc.pet.board.dao.boardDAO;
import com.sc.pet.common.util.FileUtils;
import com.sc.pet.file.dao.FileDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name = "boardDAO")
	private boardDAO boardDAO;
	
	@Resource(name = "FileDAO")
	private FileDAO FileDAO;
	
    @Resource(name="fileUtils")
    private FileUtils fileUtils;
	@Override
	public List<Command> selectBoardList(Command command) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardList(command);
	}


	@Override
	public int deleteBoard(Command command) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.deleteBoard(command);
	}


	@Override
	public int updateBoard(Command command) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.updateBoard(command);
	}

	@Override
	public void insertBoard(Command command, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.insertBoard(command);
		List<Map<String,Object>> list = FileUtils.parseInsertFileInfo(command, request); // 파일을 읽어서 저장 하는 곳,,,
    	for(int i=0, size=list.size(); i<size; i++){
    		FileDAO.insertFile(list.get(i));
    	}
    
	}
	public Map<String, Object> selectBoardDetail(Command command) throws Exception {
		// TODO Auto-generated method stub
			boardDAO.updateHitCount(command);
		    Map<String, Object> resultMap = new HashMap<String,Object>();
		    Map<String, Object> tempMap = boardDAO.selectBoardDetail(command);
		    resultMap.put("map", tempMap);
		     
		    List<Map<String,Object>> list = FileDAO.selectFileList(command);
		    resultMap.put("list", list);
		     
		    return resultMap;
	}

}

