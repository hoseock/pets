package com.sc.pet.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sc.pet.admin.service.AdminService;
import com.sc.pet.sample.command.Command;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "adminService")
	private AdminService adminService;
		
	@RequestMapping(value="/adminpage.do")
	public ModelAndView adminpage(Command command) throws Exception{
	    ModelAndView mv = new ModelAndView("/sample/adminpage");
	    return mv;
	}

	@RequestMapping(value = "/openMemberList.do")
	public ModelAndView openMemberList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/sample/memberList");		
		List<Map<String, Object>> list = adminService.selectMemberList(commandMap);
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping(value="/deleteMember.do")
	public ModelAndView deleteMember(Command command) throws Exception{
	    ModelAndView mv = new ModelAndView("jsonView");
	    adminService.deleteMember(command);   
	    return mv;
	}
	
	@RequestMapping(value="/authorize.do")
	public ModelAndView authorize(Command command) throws Exception{
	    ModelAndView mv = new ModelAndView("jsonView");
	    adminService.authorize(command);
	  	//mv.addObject("PAARO", command.getPAARO());
	    return mv;
	}
	@RequestMapping(value="/delAuthority.do")
	public ModelAndView delAuthority(Command command) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		adminService.delAuthority(command);
		//mv.addObject("PAARO", command.getPAARO());
		return mv;
	}

}
