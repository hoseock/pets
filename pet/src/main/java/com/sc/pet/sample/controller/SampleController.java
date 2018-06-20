package com.sc.pet.sample.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	    ModelAndView mv = new ModelAndView("redirect:/sample/openRegister.do");
	    sampleService.insertInfo(command);
	    return mv;
	}
	
//	@RequestMapping(value = "/sample/checkId.do", method = RequestMethod.POST)
//	@ResponseBody
//	public String checkId(@RequestParam("id")String id,Model model) throws Exception {
//		String result=sampleService.checkId(id);
//		if(result==null){
//			model.addAttribute("result","true");
//			return "{\"result\":\""+"true\"}";
//		}else{
//			model.addAttribute("result","false");
//			return "{\"result\":\""+"false\"}";
//		}
//	}
	
	@RequestMapping("/sample/checkId.do")
    public ModelAndView main(HttpServletRequest request) {  //HttpServletRequest 를 받아서 처리한다.
        
        String result = "0";
        
        log.info("User Join AjaxData");
        
        ModelAndView mav = new ModelAndView("main");
        mav.setViewName("/joinAjaxData");
        
        String id = request.getParameter("id");
        
        Command command = new Command();  //파라미터 값을 Vo클래스에 추가한후
        command.setID(id);
            
        int resultValue = 0;      
        try { resultValue = sampleService.checkId(command) ; } catch(Exception e) {} //서비스 클래스를 이용해 결과를 받아온다.
        
        if (resultValue == 1) { //정상적으로 처리가 됬으면 성공한 로우의 수인 1을 받아오므로 이렇게 처리를 했다.
            result ="1";
        }
        mav.addObject("result", result); //해당 값을 뷰로 넘겨준다.
        return mav; 
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
