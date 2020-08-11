package com.mycompany.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.service.GraphServiceImpl;

@Controller
public class GraphController {
	@Autowired
	GraphServiceImpl graphService;

	@RequestMapping(value = "/testForGraph_01", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map testMakeGraph(@RequestBody HashMap inputData) {
		Map result = new HashMap();
		List<Map> dataList = new ArrayList();
		for(int i=0; i<10; i++) {
			HashMap data = new HashMap();
			data.put("name", "name"+Integer.toString(i));
			data.put("value", 10-i);
			dataList.add(data);
		}
		result.put("chartType", "bar");
		result.put("data", dataList);
		result.put("dataSize", dataList.size());
		return result;
	}
	//실종동물 요일, 시간별 통계 (group by)
	@RequestMapping(value = "/lostGraph.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map makeLostGraph(@RequestBody HashMap inputData) {
		Map result = new HashMap();
		Map graphOption = new HashMap();
		if(inputData.get("chartType")==null) {
			inputData.put("chartType", "bar");
		}
		if(inputData.get("timeOption")==null) {
			inputData.put("timeOption", "0");
		}		
		String timeOptionArray [] = {"HH24", "D", "MM", "YYYY"};
		String dayArray [] = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
		graphOption.put("timeOption", timeOptionArray[Integer.parseInt((String)inputData.get("timeOption"))]);
		List<Map> selectList = graphService.getLostGraph(graphOption);
		List<Map> dataList = new ArrayList();
		for(int i=0; i<selectList.size(); i++) {
			HashMap data = new HashMap();
			if(graphOption.get("timeOption").equals("D")) {
				data.put("name", dayArray[Integer.parseInt((String)selectList.get(i).get("TIME"))-1]); //숫자로 반환되는  요일을 한글로 변경
			}else {
				data.put("name", selectList.get(i).get("TIME"));
			}
			data.put("value", selectList.get(i).get("COUNT"));
			dataList.add(data);
		}
		result.put("chartType", inputData.get("chartType"));
		result.put("data", dataList);
		result.put("dataSize", dataList.size());
		return result;
	}
	//찾은동물 요일, 시간별 통계 (group by)
	@RequestMapping(value = "/findGraphFromLostBoard.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map makeFindGraphFromLostBOard(@RequestBody HashMap inputData) {
		Map result = new HashMap();
		Map graphOption = new HashMap();
		if(inputData.get("chartType")==null) {
			inputData.put("chartType", "bar");
		}
		if(inputData.get("timeOption")==null) {
			inputData.put("timeOption", "0");
		}		
		String timeOptionArray [] = {"HH24", "D", "MM", "YYYY"};
		String dayArray [] = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
		graphOption.put("timeOption", timeOptionArray[Integer.parseInt((String)inputData.get("timeOption"))]);
		List<Map> selectList = graphService.getFindGraphFromLostBoard(graphOption);
		List<Map> dataList = new ArrayList();
		for(int i=0; i<selectList.size(); i++) {
			HashMap data = new HashMap();
			if(graphOption.get("timeOption").equals("D")) {
				data.put("name", dayArray[Integer.parseInt((String)selectList.get(i).get("TIME"))-1]); //숫자로 반환되는  요일을 한글로 변경
			}else {
				data.put("name", selectList.get(i).get("TIME"));
			}
			data.put("value", selectList.get(i).get("COUNT"));
			dataList.add(data);
		}
		result.put("chartType", inputData.get("chartType"));
		result.put("data", dataList);
		result.put("dataSize", dataList.size());
		return result;
	}
	//매출 통계 (group by)
	@RequestMapping(value = "/makeSalesHistoryChartWithGrouping.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map makeSalesHistoryChartWithGrouping(@RequestBody HashMap inputData) {
		Map result = new HashMap();
		Map graphOption = new HashMap();
		if(inputData.get("chartType")==null) {
			inputData.put("chartType", "bar");
		}
		if(inputData.get("timeOption")==null) {
			inputData.put("timeOption", "0");
		}		
		String timeOptionArray [] = {"HH24", "D", "MM", "YYYY"};
		String dayArray [] = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
		graphOption.put("timeOption", timeOptionArray[Integer.parseInt((String)inputData.get("timeOption"))]);
		List<Map> selectList = graphService.makeSalesHistoryChartWithGrouping(graphOption);
		List<Map> dataList = new ArrayList();
		for(int i=0; i<selectList.size(); i++) {
			HashMap data = new HashMap();
			if(graphOption.get("timeOption").equals("D")) {
				data.put("name", dayArray[Integer.parseInt((String)selectList.get(i).get("TIME"))-1]); //숫자로 반환되는  요일을 한글로 변경
			}else {
				data.put("name", selectList.get(i).get("TIME"));
			}
			data.put("value", selectList.get(i).get("SUM"));
			dataList.add(data);
		}
		result.put("chartType", inputData.get("chartType"));
		result.put("data", dataList);
		result.put("dataSize", dataList.size());
		return result;
	}
	//매출 통계 (grouping x)
	@RequestMapping(value = "/makeSalesHistoryChart.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map makeSalesHistoryChart(@RequestBody HashMap inputData) {
		Map result = new HashMap();
		Map graphOption = new HashMap();
		if(inputData.get("chartType")==null) {
			inputData.put("chartType", "line");
		}
		if(inputData.get("timeOption")==null) {
			inputData.put("timeOption", "2");
		}
		if(inputData.get("startDate")=="" || inputData.get("startDate")==null) {
			SimpleDateFormat format = new SimpleDateFormat ( "yyyyMMddHHmmss");				
			Date time = new Date();
			String strTime = format.format(time);
			inputData.put("startDate", strTime.substring(0, 8)+"000000");
		}
		if(inputData.get("endDate")=="" || inputData.get("endDate")==null) {
			SimpleDateFormat format = new SimpleDateFormat ( "yyyyMMddHHmmss");				
			Date time = new Date();
			String strTime = format.format(time);
			inputData.put("endDate", strTime.substring(0, 8)+"235959");
		}
		String timeOptionArray [] = {"YYYYMMDDHH24MISS", "YYYYMMDDHH24MI", "YYYYMMDDHH24", "YYYYMMDD", "YYYYMM", "YYYY"};
		graphOption.put("timeOption", timeOptionArray[Integer.parseInt((String)inputData.get("timeOption"))]);
		graphOption.put("startDate", ((String)inputData.get("startDate")).replaceAll("-", "").replaceAll("T", "").replaceAll(":", ""));
		graphOption.put("endDate", ((String)inputData.get("endDate")).replaceAll("-", "").replaceAll("T", "").replaceAll(":", ""));		
		List<Map> selectList = graphService.makeSalesHistoryChart(graphOption);
		List<Map> dataList = new ArrayList();
		for(int i=0; i<selectList.size(); i++) {
			HashMap data = new HashMap();
			data.put("name", selectList.get(i).get("DAY"));
			data.put("value", selectList.get(i).get("PRICE"));
			dataList.add(data);
		}
		result.put("chartType", inputData.get("chartType"));
		result.put("data", dataList);
		result.put("dataSize", dataList.size());
		return result;
	}
	//매출 통계 (품목별)
	@RequestMapping(value = "/makeSalesHistoryChartGroupByCategory.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map makeSalesHistoryChartGroupByCategory(@RequestBody HashMap inputData) {
		Map result = new HashMap();
		Map graphOption = new HashMap();
		if(inputData.get("chartType")==null) {
			inputData.put("chartType", "bar");
		}
		if(inputData.get("startDate")=="" || inputData.get("startDate")==null) {
			SimpleDateFormat format = new SimpleDateFormat ( "yyyyMMddHHmmss");				
			Date time = new Date();
			String strTime = format.format(time);
			inputData.put("startDate", strTime.substring(0, 8)+"000000");
		}
		if(inputData.get("endDate")=="" || inputData.get("endDate")==null) {
			SimpleDateFormat format = new SimpleDateFormat ( "yyyyMMddHHmmss");				
			Date time = new Date();
			String strTime = format.format(time);
			inputData.put("endDate", strTime.substring(0, 8)+"235959");
		}
		graphOption.put("startDate", ((String)inputData.get("startDate")).replaceAll("-", "").replaceAll("T", "").replaceAll(":", ""));
		graphOption.put("endDate", ((String)inputData.get("endDate")).replaceAll("-", "").replaceAll("T", "").replaceAll(":", ""));
		List<Map> selectList = graphService.makeSalesHistoryChartGroupByCategory(graphOption);
		List<Map> dataList = new ArrayList();
		for(int i=0; i<selectList.size(); i++) {
			HashMap data = new HashMap();
			data.put("name", selectList.get(i).get("FEATURE"));
			data.put("value", selectList.get(i).get("PRICE"));
			dataList.add(data);
		}
		result.put("chartType", inputData.get("chartType"));
		result.put("data", dataList);
		result.put("dataSize", dataList.size());
		return result;
	}
}
