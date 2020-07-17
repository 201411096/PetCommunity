package com.mycompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.FindBoardDAOImpl;
import com.mycompany.domain.FindBoardVO;
import com.mycompany.domain.FindHospitalVO;

@Service("findHospitalService")
public class FindHospitalServiceImpl implements FindHospitalService{
	@Autowired
	FindHospitalServiceImpl findHospitalDAO;

	@Override
	public List<FindHospitalVO> findHospital(FindHospitalVO findHospitalVO) {
		
		return findHospitalDAO.findHospital(findHospitalVO);
	}
}
