package com.sc.anifinder.sample.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sc.anifinder.sample.command.Command;
import com.sc.anifinder.sample.dao.SampleDAO;
 
@Service("sampleService")
public class SampleServiceImpl implements SampleService{
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="sampleDAO")
    private SampleDAO sampleDAO;
     
    @Override
    public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
        return sampleDAO.selectBoardList(map);
    }
    
    @Override
    public void insertBoard(Command command) throws Exception {
        sampleDAO.insertBoard(command);
    }

	@Override
	public Map<String, Object> selectBoardDetail(Command command) throws Exception {
		// TODO Auto-generated method stub
		sampleDAO.updateHitCnt(command);
		return sampleDAO.selectBoardDetail(command);
	}
	
	@Override
	public int updateBoard(Command command) throws Exception{
	     return sampleDAO.updateBoard(command);
	}

	@Override
	public int deleteBoard(Command command) throws Exception {
		// TODO Auto-generated method stub
		return sampleDAO.deleteBoard(command);
	}



 
}
