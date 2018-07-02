package com.sc.pet.file.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sc.pet.board.command.Command;
import com.sc.pet.file.service.FileService;

@Controller
@RequestMapping(value = "/file")
public class FileController {
	Logger log = Logger.getLogger(getClass());
	
	 @Resource(name="fileService")
	 private FileService fileService;
	 @RequestMapping(value="/board/insertBoard.do")
	 public ModelAndView insertBoard(Command command, HttpServletRequest request) throws Exception{
	     ModelAndView mv = new ModelAndView("redirect:/board/openBoardList.do");
	      
	     fileService.insertBoard(command, request);
	      
	     return mv;
	 }
	 
	   
}
