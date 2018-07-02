package com.sc.pet.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sc.pet.board.command.Command;

public interface BoardService { 
    List<Command> selectBoardList(Command command) throws Exception; 
    Map<String, Object> selectBoardDetail(Command command) throws Exception;
    int updateBoard(Command command) throws Exception;
	int deleteBoard(Command command) throws Exception;
	void insertBoard(Command command, HttpServletRequest request) throws Exception;
}

