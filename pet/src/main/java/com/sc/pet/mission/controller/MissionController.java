package com.sc.pet.mission.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sc.pet.board.command.Command;
import com.sc.pet.register.command.RegisterCommand;
import com.sc.pet.register.service.RegisterService;

@Controller
@RequestMapping(value="/mission")
public class MissionController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "registerService")
	private RegisterService registerService;
	
	@RequestMapping(value = "/openRegister.do")
	public ModelAndView openRegister(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/register/register");
		return mv;
	}
	
	@RequestMapping(value="/insertInfo.do")
	public ModelAndView insertInfo(RegisterCommand command) throws Exception{
	    ModelAndView mv = new ModelAndView("/../../main");
	    registerService.insertInfo(command);
	    return mv;
	}
	
	@RequestMapping(value="/checkId.do")
	public ModelAndView checkId(RegisterCommand command, @RequestParam("id")String id) throws Exception{
	    ModelAndView mv = new ModelAndView("jsonView");
	    command.setID(id);
	    int result=registerService.checkId(command);
	    mv.addObject("result", result);
	    return mv;
	}

}
