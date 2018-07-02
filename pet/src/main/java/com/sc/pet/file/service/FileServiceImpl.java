package com.sc.pet.file.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sc.pet.board.command.Command;
import com.sc.pet.common.util.FileUtils;
import com.sc.pet.file.dao.FileDAO;

@Service("fileService")
public class FileServiceImpl implements FileService {
	Logger log = Logger.getLogger(getClass());
	@Resource(name = "FileDAO")
	private FileDAO FileDAO;
	
    @Resource(name="fileUtils")
    private FileUtils fileUtils;

	@Override
	public void insertBoard(Command command, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		
		
		List<Map<String,Object>> list = FileUtils.parseInsertFileInfo(command, request); // 파일을 읽어서 저장 하는 곳,,,
        	for(int i=0, size=list.size(); i<size; i++){
        		FileDAO.insertFile(list.get(i));
        }
	}

	@Override
	public Map<String, Object> selectBoardDetail(Command command) throws Exception {
		// TODO Auto-generated method stub
		    Map<String, Object> resultMap = new HashMap<String,Object>();
		    /*Map<String, Object> tempMap = FileDAO.selectBoardDetail(command);
		    resultMap.put("map", tempMap);*/
		     
		    List<Map<String,Object>> list = FileDAO.selectFileList(command);
		    resultMap.put("list", list);
		     
		    return resultMap;
	}


}
