package com.sc.pet.register.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sc.pet.register.service.RegisterService;
import com.sc.pet.sample.command.Command;

@Controller
@RequestMapping(value="register")
public class RegisterController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "registerService")
	private RegisterService registerService;
	
	@RequestMapping(value = "/openRegister.do")
	public ModelAndView openRegister(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/sample/register");
		return mv;
	}
	
	@RequestMapping(value="/insertInfo.do")
	public ModelAndView insertInfo(Command command) throws Exception{
	    ModelAndView mv = new ModelAndView("/../../main");
	    registerService.insertInfo(command);
	    return mv;
	}
	
	@RequestMapping(value="/checkId.do")
	public ModelAndView checkId(Command command, @RequestParam("id")String id) throws Exception{
	    ModelAndView mv = new ModelAndView("jsonView");
	    command.setID(id);
	    int result=registerService.checkId(command);
	    mv.addObject("result", result);
	    return mv;
	}

}
