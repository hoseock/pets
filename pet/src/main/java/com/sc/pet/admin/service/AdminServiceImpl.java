package com.sc.pet.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sc.pet.admin.dao.AdminDAO;
import com.sc.pet.register.command.RegisterCommand;
 
@Service("adminService")
public class AdminServiceImpl implements AdminService{
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="adminDAO")
    private AdminDAO adminDAO;


	@Override
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		return adminDAO.selectMemberList(map);
	}

	@Override
	public int deleteMember(RegisterCommand command) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.deleteMember(command);
	}
	
	@Override
	public int authorize(RegisterCommand command) throws Exception{
	     return adminDAO.authorize(command);
	}
	@Override
	public int delAuthority(RegisterCommand command) throws Exception{
		return adminDAO.delAuthority(command);
	}

	@Override
	public String checkAuth(RegisterCommand command) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.checkAuth(command);
	}
	
//	@Override
//	public Map<String, Object> selectBoardDetail(Command command) throws Exception {
//		// TODO Auto-generated method stub
//		sampleDAO.updateHitCnt(command);
//		return sampleDAO.selectBoardDetail(command);
//	}
//	

//

}
