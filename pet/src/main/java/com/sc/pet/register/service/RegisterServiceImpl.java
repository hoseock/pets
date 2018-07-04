package com.sc.pet.register.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sc.pet.register.command.RegisterCommand;
import com.sc.pet.register.dao.RegisterDAO;
 
@Service("registerService")
public class RegisterServiceImpl implements RegisterService{
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="registerDAO")
    private RegisterDAO registerDAO;

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void Register(RegisterCommand command) throws Exception {
		// TODO Auto-generated method stub
		registerDAO.Register(command);	
	}
	@Override
	public void insertInfo(RegisterCommand command) throws Exception {
		// TODO Auto-generated method stub
		registerDAO.insertInfo(command);
	}
	@Override
	public int checkId(RegisterCommand command) throws Exception {
		// TODO Auto-generated method stub
		return registerDAO.checkId(command);
	}
	@Override
	public Map<String, Object> selectBoardDetail(RegisterCommand command) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
//	@Override
//	public Map<String, Object> selectBoardDetail(Command command) throws Exception {
//		// TODO Auto-generated method stub
//		sampleDAO.updateHitCnt(command);
//		return sampleDAO.selectBoardDetail(command);
//	}
//	
//	@Override
//	public int updateBoard(Command command) throws Exception{
//	     return sampleDAO.updateBoard(command);
//	}
//
//	@Override
//	public int deleteBoard(Command command) throws Exception {
//		// TODO Auto-generated method stub
//		return sampleDAO.deleteBoard(command);
//	}

}
