<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
실종동물 요일별 통계
	<div id="graph_01_outer_container">
		<div id="graph_01_option_container">
			<span>
				<select id="graph_01_chartShape_option">
					<option selected value="bar">막대</option>
					<option value="pie">원형</option>
					<option value="line">선형</option>
					<option value="doughnut">도넛</option>
					<option value="polarArea">폴라</option>
				</select>
			</span>
			<span>
				<select id="graph_01_chartTime_option">
					<option selected value="0">시간</option>
					<option value="1">요일</option>
					<option value="2">월</option>
					<option value="3">년도</option>
				</select>
			</span>
		</div>
		<div id="graph_01_container"></div>
	</div>
	<div id="graph_02_outer_container">
				<div id="graph_02_option_container">
			<span>
				<select id="graph_02_chartShape_option">
					<option selected value="bar">막대</option>
					<option value="pie">원형</option>
					<option value="line">선형</option>
					<option value="doughnut">도넛</option>
					<option value="polarArea">폴라</option>
				</select>
			</span>
			<span>
				<select id="graph_02_chartTime_option">
					<option selected value="0">시간</option>
					<option value="1">요일</option>
					<option value="2">월</option>
					<option value="3">년도</option>
				</select>
			</span>
		</div>
		<div id="graph_02_container"></div>
	</div>
	
	<div id="salesHistoryGraph_outer_container"></div>


<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="resources/js/util/module_graph.js"></script>
<script src="resources/js/sample_graph.js"></script>
</body>
</html>