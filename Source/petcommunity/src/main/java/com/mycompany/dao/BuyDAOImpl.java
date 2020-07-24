package com.mycompany.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.MemberVO;
import com.mycompany.domain.MyBuyVO;


@Repository("BuyDAO")
public class BuyDAOImpl implements BuyDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<MyBuyVO> buyList(MemberVO vo) {
		return mybatis.selectList("buy.mybuyList",vo);
	}

	@Override
	public List<Map<String, String>> buyReceipt(String id) {
		System.out.println(id);
		return mybatis.selectList("buy.buyReceipt",id);
	}
	
}
