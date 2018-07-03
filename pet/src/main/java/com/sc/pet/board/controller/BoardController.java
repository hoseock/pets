package com.sc.pet.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sc.pet.board.command.Command;
import com.sc.pet.board.service.BoardService;
import com.sc.pet.file.service.FileService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	Logger log = Logger.getLogger(getClass());
	
	 @Resource(name="boardService")
	 private BoardService boardService;
	 @Resource(name="fileService")
	 private FileService fileService;
	
	 	@RequestMapping(value = "/openRegisterForm.do")
		public ModelAndView openRegister(Map<String, Object> commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("/board/register");
			return mv;
		}
	 	@RequestMapping(value = "/openLoginForm.do")
		public ModelAndView openLoginForm(Map<String, Object> commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("/board/login");
			return mv;
		}
	 	@RequestMapping(value="/openBoardList.do")
	    public ModelAndView openBoardList(Command command) throws Exception{
	        ModelAndView mv = new ModelAndView("/board/boardList");
	        List<Command> list = boardService.selectBoardList(command);
	        mv.addObject("list", list);
	         
	        return mv;
	    }
	    @RequestMapping(value="/openBoardWrite.do")
	    public ModelAndView openBoardWrite(Command command) throws Exception{
	        ModelAndView mv = new ModelAndView("/board/boardWrite");
	        
	        return mv;
	    }
	    @RequestMapping(value="/openBoardUpdate.do")
	    public ModelAndView openBoardUpdate(Command command) throws Exception{
	        ModelAndView mv = new ModelAndView("/board/boardUpdate");  
	        Map<String,Object> map = boardService.selectBoardDetail(command);
	        mv.addObject("map", map);
	         
	        return mv;
	    }
	   
	    
	    @RequestMapping(value="/deleteBoard.do")
	    public ModelAndView deleteBoard(Command command) throws Exception{
	        ModelAndView mv = new ModelAndView("redirect:/board/openBoardList.do");
	        int result = boardService.deleteBoard(command);
	        log.debug("deleteBoard "+result);
	        
	        return mv;
	    }
	    @RequestMapping(value="/insertBoard.do")
	    public ModelAndView insertBoard(Command command,HttpServletRequest request) throws Exception{
	        ModelAndView mv = new ModelAndView("redirect:/board/openBoardList.do");
	      	         
	        boardService.insertBoard(command, request);
	         
	        return mv;
	    }
	 

	    @RequestMapping(value="/updateBoard.do")
	    public ModelAndView updateBoard(Command command) throws Exception{
	        ModelAndView mv = new ModelAndView("redirect:/board/openBoardDetail.do");
			int result = boardService.updateBoard(command);
	        log.debug("updateBoard ==> "+result);
	        mv.addObject("BOARD_ID", command.getBOARD_ID());
	        
	        return mv;
	    }
	   
	    @RequestMapping(value="/openBoardDetail.do")
		 public ModelAndView openBoardDetail(Command command) throws Exception{
		     ModelAndView mv = new ModelAndView("/board/boardDetail");
		      
		     Map<String,Object> map = boardService.selectBoardDetail(command);
		     mv.addObject("map", map.get("map"));
		     mv.addObject("list", map.get("list"));
		      
		     return mv;
		 }
	    
	   
}
