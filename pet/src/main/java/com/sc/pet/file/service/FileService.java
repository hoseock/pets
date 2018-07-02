package com.sc.pet.file.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sc.pet.board.command.Command;

public interface FileService { 
	void insertBoard(Command command, HttpServletRequest request) throws Exception;

	Map<String, Object> selectBoardDetail(Command command) throws Exception;
}

