<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../views/header.jsp"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="./resources/css/findHospitalList.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resources/js/findHospital.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
<!--  <script type = "text/javascript" src="https://d3js.org/d3.v4.min.js"></script>
-->
<title>게시판</title>
</head>
<body>
 
<div class="container">
	<header>
			<h1>병원 찾기</h1>
	</header>
	<hr/>

			<!-- 도시 고를 수 있는 셀렉트박스 -->
		<section id="container">			
			<div class="col-xs-0 col-sm-3" style="margin-right: 10%;">
				<!-- <input name="sGubun" type="radio" checked value="0" > -->
					<label class="radio">지역별 검색</label>
						<select class="form-control" id='cityName' name ='cityName'>
							<option >시/도</option>
							<option >서울</option>
							<option >인천</option>
							<option >대전</option>
							<option >광주</option>
							<option >울산</option>
							<option >대구</option>
							<option >부산</option>
							<option >세종</option>
							<option >경기</option>
							<option >강원</option>
							<option >충북</option>
							<option >충남</option>
							<option >전북</option>
							<option >전남</option>
							<option >경북</option>
							<option >경남</option>
							<option >제주</option>
						</select>
						<select class="form-control" id='province' name ='province'>
							<option >구/군</option>					
						</select>
										
						<span class="input-group-btn" style="padding-top: 10px;">
							<button type="button" class="btn btn-default" id='searchLocation'>지역별 검색
							</button>
						</span><br/><br/>
			 </div>
								

			<div class="col-xs-0 col-sm-3" style="margin-right: 10%;">
				<!-- <input name="sGubun" type="radio" value="1"> -->	
				  <label class="radio">병원명 검색</label>
						<input type="text" name="keyword" id="keywordInput" class="form-control"  placeholder="검색어, 병원명을 입력하세요."/>
							
						<span class="input-group-btn" style="padding-top: 10px;">
							<button type="button" class="btn btn-default" id='searchName'>병원명 검색
							</button>
						</span><br/><br/>			
			</div>
			
			
			<div class="col-xs-0 col-sm-3">
				<label class="radio">동물병원 워드 클라우드↓↓</label>
				<button type="button" class="btn btn-default" id='wordCloud'>word cloud here
				</button>
				<!-- <a href="#" onclick="window.open('https://localhost:8443/petcommunity/resources/imgs/wordCloud/동물병원.png', 'width=1000, height=1000')"><img src="./resources/imgs/wordCloud/동물병원.png"></a>
	 -->
			</div>
			
			
		
	<br/><br/><br/>	


			<!-- 병원 리스트 맵 영역 
	<div class="form-group"> -->
	 <div id="map"></div>
	 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a33e4a3d21ae68ddacd68ab7eda22a2a&libraries=services,clusterer,drawing"></script>
	<script>

/* 	d3.csv("resources/data/csv/FINDHOSPITAL_LIST.csv", encoding="charset=utf-8", function(error, data){
		if (error) throw error;
// 		console.log(data["findhospitalName"]);
		/* data.forEach(function(d){
			console.log(d.findhospitalName)

				}); */
				//console.log(data);
				//alert('>'+data)
				//console.log("-----------------------------------")
				//for(var key in data){
					//console.log("key: " + key );
					//}
				//console.log("-----------------------------------")
// 				data['findhospitalName']
	/* });
 */ 

	console.log("-----------------------------------")
 
	var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(36.601621, 127.2983811),
			level: 7
		};

		var map = new kakao.maps.Map(container, options);

		

	    var positions = [
	        {
	            title: '월드펫동물병원', 
	            latlng: new kakao.maps.LatLng(37.6059928, 126.9608104)
	        },
	        {
	            title: '올리브동물병원', 
	            latlng: new kakao.maps.LatLng(37.599235, 126.9589611)
	        },
	        {
	            title: '누리봄동물병원', 
	            latlng: new kakao.maps.LatLng(37.5757539, 126.9710573)
	        },
	        {
	            title: '우리동물병원',
	            latlng: new kakao.maps.LatLng(37.5786667, 127.0156223)
	        },
	        {
	            title: '북악동물병원',
	            latlng: new kakao.maps.LatLng(37.5988401, 126.960261)
	        },
	        {
	            title: '현대동물병원', 
	            latlng: new kakao.maps.LatLng(37.8799992, 127.7429144)
	        },
	        {
	            title: '24시보듬동물병원', 
	            latlng: new kakao.maps.LatLng(37.753189, 128.8939975)
	        },
	        {
	            title: '아산동물의료센터', 
	            latlng: new kakao.maps.LatLng(36.7742253,127.0109571)
	        },
	        {
	            title: '내포동물의료센터', 
	            latlng: new kakao.maps.LatLng(36.660275,126.6811263)
	        },
	        {
	            title: '세종다온동물병원', 
	            latlng: new kakao.maps.LatLng(36.601621, 127.2983811)
	        },
	        {
	            title: '바른동물병원',
	            latlng: new kakao.maps.LatLng(36.4889557, 127.1953441)
	        },
	        {
	            title: '도그빌 동물병원', 
	            latlng: new kakao.maps.LatLng(37.7588094, 128.896512)
	        },
	        {
	            title: '강남 종합동물병원', 
	            latlng: new kakao.maps.LatLng(37.8629183, 127.7499599)
	        },
	        {
	            title: '거제동물메디컬센터', 
	            latlng: new kakao.maps.LatLng(34.8883645,128.6203258)
	        },
	        {
	            title: '메이동물메디컬센터', 
	            latlng: new kakao.maps.LatLng(35.8123338, 127.1236246)
	        },
	        {
	            title: '군산24시제일동물병원', 
	            latlng: new kakao.maps.LatLng(35.9749456,126.7330588)
	        }
	        ,
	        {
	            title: '용동물병원',
	            latlng: new kakao.maps.LatLng(35.2205922, 128.6815801)
	        },
	        {
	            title: '구미옥계동물병원', 
	            latlng: new kakao.maps.LatLng(36.1370821, 128.4224143)
	        },
	        {
	            title: '케비어동물병원 논산점', 
	            latlng: new kakao.maps.LatLng(36.2033792, 127.088827)
	        },
	        {
	            title: '엔젤동물병원', 
	            latlng: new kakao.maps.LatLng(36.8036022,127.1277523)
	        },
	        {
	            title: '선샤인동물병원', 
	            latlng: new kakao.maps.LatLng(36.1383607,128.3093119)
	        },
	        {
	            title: '조은동물병원', 
	            latlng: new kakao.maps.LatLng(36.0120904,129.3496726)
	        },
	        {
	            title: '목포동물병원', 
	            latlng: new kakao.maps.LatLng(34.8067875, 126.3982499)
	        },
	        {
	            title: '아빠손동물병원', 
	            latlng: new kakao.maps.LatLng(34.8120871, 126.4607132)
	        },
	        {
	            title: '여수동물병원', 
	            latlng: new kakao.maps.LatLng(34.784365, 127.6931515)
	        }
	        ,
	        {
	            title: '현대종합동물병원', 
	            latlng: new kakao.maps.LatLng(37.359095,127.8160558)
	        }
	        ,
	        {
	            title: '태백동물병원', 
	            latlng: new kakao.maps.LatLng(37.1635465,128.9887628)
	        },
	        {
	            title: '무양반려동물병원', 
	            latlng: new kakao.maps.LatLng(36.4186268,128.1551491)
	        },
	        {
	            title: '24시N동물의료센터', 
	            latlng: new kakao.maps.LatLng(37.6574007, 127.0667307)
	        },
	        {
	            title: '혜민동물병원', 
	            latlng: new kakao.maps.LatLng(37.5145452, 127.0437252)
	        },
	        {
	            title: '웨스턴동물의료센터', 
	            latlng: new kakao.maps.LatLng(37.5551902, 126.93805571)
	        },
	        {
	            title: '서울대학교 수의과대학 동물병원', 
	            latlng: new kakao.maps.LatLng(37.459882, 126.9519053)
	        },
	        {
	            title: '고양이병원 백산동물병원', 
	            latlng: new kakao.maps.LatLng(37.4999946, 127.0393429)
	        },
	        {
	            title: '서산동물병원', 
	            latlng: new kakao.maps.LatLng(36.7778902, 126.457463)
	        }
	        ,
	        {
	            title: '코끼리동물병원', 
	            latlng: new kakao.maps.LatLng(35.8192217, 127.1183412)
	        }
	        ,
	        {
	            title: '이노동물병원', 
	            latlng: new kakao.maps.LatLng(35.8206231, 127.0225475)
	        }
	        ,
	        {
	            title: '펫119동물병원', 
	            latlng: new kakao.maps.LatLng(34.8100428, 126.4244462)
	        }
	        ,
	        {
	            title: '소망동물병원', 
	            latlng: new kakao.maps.LatLng(37.865445, 127.7200327)
	        }
	        ,
	        {
	            title: '대명동물병원', 
	            latlng: new kakao.maps.LatLng(38.0736168, 128.6201829)
	        }
	        ,
	        {
	            title: '신일환동물병원', 
	            latlng: new kakao.maps.LatLng(34.7667261, 127.6607738)
	        }
	        ,
	        {
	            title: '광주TNR동물병원', 
	            latlng: new kakao.maps.LatLng(37.4174304, 127.2752895)
	        },
	        {
	            title: '내포동물의료센터', 
	            latlng: new kakao.maps.LatLng(36.660275, 126.6811263)
	        }
	        ,
	        {
	            title: '천안모아동물병원', 
	            latlng: new kakao.maps.LatLng(36.8182749, 127.110726)
	        }
	        ,
	        {
	            title: '킴스동물의료센터', 
	            latlng: new kakao.maps.LatLng(36.8936109, 126.6283278)
	        },
	        {
	            title: '안양본동물의료센터', 
	            latlng: new kakao.maps.LatLng(37.3957928, 126.9717506)
	        },
	        {
	            title: '24시숨동물병원', 
	            latlng: new kakao.maps.LatLng(37.2586778, 127.0296231)
	        },
	        {
	            title: '양산24시에스동물메디컬센터', 
	            latlng: new kakao.maps.LatLng(35.3083079, 129.0102285)
	        },
	        {
	            title: '랑스 종합동물병원', 
	            latlng: new kakao.maps.LatLng(35.1836043, 128.116963)
	        },
	        {
	            title: '대명동물병원', 
	            latlng: new kakao.maps.LatLng(38.0736168, 128.6201829)
	        },
	        {
	            title: '하나동물병원', 
	            latlng: new kakao.maps.LatLng(37.2781285, 127.4480699)
	        },
	        {
	            title: '정선가축병원', 
	            latlng: new kakao.maps.LatLng(37.3794095, 128.6606759)
	        },
	        {
	            title: '인제종합동물병원', 
	            latlng: new kakao.maps.LatLng(38.0618971, 128.1681574)
	        },
	        {
	            title: '양구축협 동물병원', 
	            latlng: new kakao.maps.LatLng(38.1058889, 127.9894959)
	        },
	        {
	            title: '홍천축협동물병원', 
	            latlng: new kakao.maps.LatLng(37.6907686, 127.8823562)
	        },
	        {
	            title: '내포동물의료센터', 
	            latlng: new kakao.maps.LatLng(36.660275, 126.6811263)
	        },
	        {
	            title: '광주스카이동물메디컬센터', 
	            latlng: new kakao.maps.LatLng(35.1506819, 126.8581309)
	        },
	        {
	            title: '바른동물병원', 
	            latlng: new kakao.maps.LatLng(35.1713798,126.869717)
	        },
	        {
	            title: '도그천사', 
	            latlng: new kakao.maps.LatLng(34.5210938, 126.2709552)
	        },
	        {
	            title: '우수영동물병원', 
	            latlng: new kakao.maps.LatLng(34.5966898, 126.3127296)
	        },
	        {
	            title: '광주동물병원', 
	            latlng: new kakao.maps.LatLng(34.6073702, 127.2845258)
	        },
	        {
	            title: '경북대학교 수의과대학 부속동물병원분원', 
	            latlng: new kakao.maps.LatLng(36.3735147, 128.1405368)
	        },
	        {
	            title: '정가축병원', 
	            latlng: new kakao.maps.LatLng(35.2102784, 127.4648492)
	        },
	        {
	            title: '마로동물병원', 
	            latlng: new kakao.maps.LatLng(35.283619, 127.293248)
	        },
	        {
	            title: '영주동물병원', 
	            latlng: new kakao.maps.LatLng(36.8238494, 128.6219593)
	        },
	        {
	            title: '박동물병원', 
	            latlng: new kakao.maps.LatLng(36.990978, 127.9292386)
	        },
	        {
	            title: '목도동물병원', 
	            latlng: new kakao.maps.LatLng(36.8711924, 127.8546245)
	        },
	        {
	            title: '대구가축병원', 
	            latlng: new kakao.maps.LatLng(36.9891621, 129.399165)
	        },
	        {
	            title: '두타동물병원', 
	            latlng: new kakao.maps.LatLng(37.4452425, 129.1676564)
	        },
	        {
	            title: '문혜동물병원', 
	            latlng: new kakao.maps.LatLng(38.1837856, 127.3220406)
	        },
	        {
	            title: '대한동물병원', 
	            latlng: new kakao.maps.LatLng(38.0921264, 127.2707395)
	        },
	        {
	            title: '대구종합가축병원', 
	            latlng: new kakao.maps.LatLng(36.5548968, 128.7551302)
	        },
	        {
	            title: '24아프리카동물메디컬센터', 
	            latlng: new kakao.maps.LatLng(36.3454705, 127.3817274)
	        },
	        {
	            title: '명진동물병원', 
	            latlng: new kakao.maps.LatLng(37.1404275, 128.1952689)
	        },
	        {
	            title: '노형꿈동물병원', 
	            latlng: new kakao.maps.LatLng(33.4856566, 126.4743606)
	        },
	        {
	            title: '완도동물병원', 
	            latlng: new kakao.maps.LatLng(34.3164584, 126.7528319)
	        },
	        {
	            title: '남창동물병원', 
	            latlng: new kakao.maps.LatLng(34.4050713,126.6278036)
	        }
	        
	        
	        
	        
	    ];

	   
	    // 마커 이미지의 이미지 주소입니다
	    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	        
	    for (var i = 0; i < positions.length; i ++) {
	        
	        // 마커 이미지의 이미지 크기 입니다
	        var imageSize = new kakao.maps.Size(24, 35); 
	        
	        // 마커 이미지를 생성합니다    
	        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	        
	        // 마커를 생성합니다
	        var marker = new kakao.maps.Marker({
	            map: map, // 마커를 표시할 지도
	            position: positions[i].latlng, // 마커를 표시할 위치
	            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	            image : markerImage // 마커 이미지 
	        });
	    }

	</script>

	<br/><br/>
	
			<form role="form" method="get">
				<table class="table table-hover" id="findHospitalTable">	
					<thead>
						<tr>
							<th>병원명</th>
							<th>전화 번호</th>
							<th>주소</th>
							<th>운영 시간</th>
						</tr>
					</thead>
					<tbody id="findHospitalTbody">
	
					</tbody>
				</table>
			</form>
		
		
	<div class="col-md-offset-3" id="pagination_container">		
		<ul id="pagination-demo" class="pagination-lg"></ul>
	</div>

		
	
	<!-- Footer -->
	
	</section></div></body></html> 



