package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.FindBoardVO;

public interface FindBoardDAO {
	public List<FindBoardVO> selectFindBoard(Map map);
	public List<FindBoardVO> selectFindBoardWithPaging(Map map);
	public int insertFindBoard(FindBoardVO findBoardVO);
	public FindBoardVO getFindBoard(FindBoardVO findBoardVO);
	public int increaseFindBoardReadcount(FindBoardVO findBoardVO);
	public int deleteFindBoard(FindBoardVO findBoardVO);
	public int updateFindBoard(FindBoardVO findBoardVO);
}
