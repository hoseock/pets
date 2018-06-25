package com.sc.pet.sample.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sc.pet.sample.command.Command;
import com.sc.pet.sample.service.SampleService;

@Controller
public class SampleController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "sampleService")
	private SampleService sampleService;
	
	@RequestMapping(value = "/sample/openRegister.do")
	public ModelAndView openRegister(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/sample/register");
		return mv;
	}
	
	@RequestMapping(value="/sample/insertInfo.do")
	public ModelAndView insertBoard(Command command) throws Exception{
	    ModelAndView mv = new ModelAndView("/../../main");
	    sampleService.insertInfo(command);
	    return mv;
	}
	
	@RequestMapping(value="/sample/checkId.do")
	public ModelAndView checkId(Command command, @RequestParam("id")String id) throws Exception{
	    ModelAndView mv = new ModelAndView("jsonView");
	    command.setID(id);
	    int result=sampleService.checkId(command);
	    mv.addObject("result", result);
	    return mv;
	}
	

//	@RequestMapping(value = "/sample/openBoardList.do")
//	public ModelAndView openSampleBoardList(Map<String, Object> commandMap) throws Exception {
//		ModelAndView mv = new ModelAndView("/sample/boardList");
//		
//		List<Map<String, Object>> list = sampleService.selectBoardList(commandMap);
//		mv.addObject("list", list);
//		return mv;
//	}
//	
//	@RequestMapping(value="/sample/openBoardWrite.do")
//	public ModelAndView openBoardWrite(Command command) throws Exception{
//	    ModelAndView mv = new ModelAndView("/sample/boardWrite");
//	     
//	    return mv;
//	}
//	
//	@RequestMapping(value="/sample/insertBoard.do")
//	public ModelAndView insertBoard(Command command) throws Exception{
//	    ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");
//	    sampleService.insertBoard(command);
//	    return mv;
//	}
//	
//	@RequestMapping(value="/sample/openBoardDetail.do")
//	public ModelAndView openBoardDetail(Command command) throws Exception{
//	    ModelAndView mv = new ModelAndView("/sample/boardDetail");
//	    Map<String, Object> map = sampleService.selectBoardDetail(command);
//	    mv.addObject("map",map);
//	    return mv;
//	}
//	
//	@RequestMapping(value="/sample/openBoardUpdate.do")
//	public ModelAndView openBoardUpdate(Command command) throws Exception{
//	    ModelAndView mv = new ModelAndView("/sample/boardUpdate");
//	     
//	    Map<String,Object> map = sampleService.selectBoardDetail(command);
//	    mv.addObject("map", map);
//	     
//	    return mv;
//	}
//	
//	@RequestMapping(value="/sample/updateBoard.do")
//	public ModelAndView updateBoard(Command command) throws Exception{
//	    ModelAndView mv = new ModelAndView("redirect:/sample/openBoardDetail.do");
//	     
//	    int result =sampleService.updateBoard(command);
//	   
//	    log.debug("�����Ǽ�:"+result);
//	     
//	    mv.addObject("IDX", command.getIDX());
//	    return mv;
//	}
//	
//	@RequestMapping(value="/sample/deleteBoard.do")
//	public ModelAndView deleteBoard(Command command) throws Exception{
//	    ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");
//	    int result =sampleService.deleteBoard(command);	   
//	    log.debug("�����Ǽ�:"+result);
//	    sampleService.deleteBoard(command);
//	     
//	    return mv;
//	}



}
