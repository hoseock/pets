package com.sc.pet.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sc.pet.board.command.Command;

@Component("fileUtils")
public class FileUtils{
	private static final String filePath = "C:\\CookAndroid\\Project\\pet\\src\\main\\webapp\\WEB-INF\\uploadFiles\\";
	
	public static List<Map<String,Object>> parseInsertFileInfo(Command command, HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    	
    	MultipartFile multipartFile = null;
    	String originalFileName = null;
    	String originalFileExtension = null;
    	String storedFileName = null;
    	
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        HashMap<String, Object> listMap = null; 
        
        String boardIdx = (String)command.getBOARD_ID();
        
        File file = new File(filePath);
        if(file.exists() == false){
        	file.mkdirs();
        }
        
        while(iterator.hasNext()){
        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
        	if(multipartFile.isEmpty() == false){
        		originalFileName = multipartFile.getOriginalFilename();
        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        		storedFileName = CommonUtils.getRandomString() + originalFileExtension;
        		
        		file = new File(filePath + storedFileName);
        		multipartFile.transferTo(file);
        		
        		listMap = new HashMap<String,Object>();
        		listMap.put("BOARD_ID", boardIdx);
        		listMap.put("ORIGINAL_FILES_NM", originalFileName);
        		listMap.put("STORED_FILES_NM", storedFileName);
        		listMap.put("FILES_SIZE", multipartFile.getSize());
        		list.add(listMap);
        	}
        }
		return list;
	}
}