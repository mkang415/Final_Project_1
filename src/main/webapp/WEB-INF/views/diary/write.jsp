<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- header -->
<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
<!-- header -->


<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>


<!-- 네이버 맵 사용을 위한 설정 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=l0hnqofc58"></script>


<script type="text/javascript">

var globaldata;
var placename;
var road_address;
var geoX;
var geoY;

function mapSearchF() {
		
	var data = $('#mapSearch').val();
		
	$.ajax({
		data: {"data": data},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		dataType: 'json',
		type: "GET",
		url: '/navermap/send',
		success: function(data) {
				
			globaldata = data;
			getElementsFromData(data);
	
		}
	});
}

function getElementsFromData(data) {
	
	var divStart = "<div class='list' onclick='changeMap()'>";
	var divEnd = "</div>";
	var ptagStart = "<p>";
	var ptagEnd = "</p>";
	
	var placeList = new Array();
	
	var list="";
	
	
	for(i=0; i<data["places"].length; i++) {
		
		var name = data["places"][i]["name"];
		var road_address = data["places"][i]["road_address"];
		var jibun_address = data["places"][i]["jibun_address"];
		var phone_number = data["places"][i]["phone_number"];
		var geocoding = {"x": data["places"][i]["x"], "y": data["places"][i]["y"]};
		var distance = data["places"][i]["distance"];
		var sessionId = data["places"][i]["sessionId"];

		placeList[i] = {"name":name, "road_address":road_address, "jibun_address":jibun_address, "phone_number":phone_number, "geocoding":geocoding, "distance":distance, "sessionId":sessionId};	
		
		list += "<div class='list' onclick='changeMap("+i+")'>" + ptagStart + name + ptagEnd + ptagStart + road_address + ptagEnd + divEnd;
	}
		if(data["places"].length<5) {
			for(i=data["places"].length; i<5; i++) {
				list+="<div class='list'></div>";
			}
		}
		
	document.getElementById("placeinfo").innerHTML = list;
	
	
	var mapOptions = {
		center: new naver.maps.LatLng(parseFloat(data["places"][0]["y"]), parseFloat(data["places"][0]["x"])),
		zoom: 10
	};

	var map = new naver.maps.Map('map', mapOptions);
			
	var marker = new naver.maps.Marker({
		position: new naver.maps.LatLng(parseFloat(data["places"][0]["y"]), parseFloat(data["places"][0]["x"])),
		map: map
	});
	
	console.log(list);
	
}

function mapReload() {
	$("#map").remove();
	console.log("삭제");
	$("#dataDiv").prepend("<div id='map' style='width:400px;height:400px;'></div>");
	console.log("다시추가");
}

function changeMap(value) {	
	
	mapReload();
	
	console.log(value);
	
	console.log(globaldata);
	
	
	mapOptions = {
	    center: new naver.maps.LatLng(parseFloat(globaldata["places"][value]["y"]), parseFloat(globaldata["places"][value]["x"])),
	    zoom: 10
	};

	map = new naver.maps.Map('map', mapOptions);

	marker = new naver.maps.Marker({
		position: new naver.maps.LatLng(parseFloat(globaldata["places"][value]["y"]), parseFloat(globaldata["places"][value]["x"])),
		map: map
	});
	
	placename = globaldata["places"][value]["name"];
	road_address = globaldata["places"][value]["road_address"];
	geoX = parseFloat(globaldata["places"][value]["y"]);
	geoY = parseFloat(globaldata["places"][value]["x"]);

}

function addMap() {
	console.log("placename:" + placename);
	console.log("x:"+ geoX);
	console.log("y:"+geoY);
	if(placename!=null) {

		var imgUrl = "https://naveropenapi.apigw.ntruss.com/map-static/v2/raster-cors?w=480&h=300&markers=type:d|size:mid|pos:"+geoY+"%20"+geoX+"&X-NCP-APIGW-API-KEY-ID=l0hnqofc58";

		$("#modal_map").attr("style", "display:none");
		$('#summernote').summernote('editor.insertImage', imgUrl);
		
		var insertPlaceName = "<p align='center'>" + placename + "</p>";
		var insertRoadAddress = "<p align='center'>" + road_address + "</p><br>";	
		
		$("#summernote").summernote('pasteHTML', insertPlaceName);
		$("#summernote").summernote('pasteHTML', insertRoadAddress);		
		
// 		$("#summernote").summernote('editor.insertText', placename);
// 		$("#summernote").summernote('editor.insertText', road_address);
	}
}

</script>

<!--  -->

<style type="text/css">

.wrapper {
	margin-left: 20%;
	margin-right: 20%;
}

#title {
	margin-bottom: 10px;
	border: white;
	width: 100%;
	font-size: 2em;
}

.content {
	padding-top: 1em;
}

#summernote {
	width: 100%;
	height: 30em;
	margin-bottom: 10px;
}


#modal_map {
	display: none;
	position:relative;
	width:100%;
	height:100%;
	z-index:1;
}

#modal_map .modal_content {
	position: fixed;
	top: 20%;
	left: 25%;

	width:auto;
	padding:10px;
	background:#fff;
	border:2px solid #666;
}

#modal_map .modal_layer {
	position:fixed;
	top:0;
	left:0;
	width:100%;
	height:100%;
	background:rgba(0, 0, 0, 0.5);
	z-index:-1;
}

#dataDiv {
	margin-top: 10px;
	margin-bottom: 10px;
	position: relative;
}

.list {
	margin-top: 0;
	margin-right: 1em;
	padding-left: 1em;
	padding-top: 0;
	padding-bottom: 0;
	border-top: 1px solid grey;
	border-bottom: 1px solid grey;
	overflow: hidden;
	text-overflow: ellipsis;
	width: 390px;
	height: 78px;
}

#map {
	display: inline-block;
}

#placeinfo {
	display: inline-block;
	height: 400px;
	margin-right: 10px;
	width: 400px;

}


</style>


<div class="wrapper">


<form action="/diary/write" method="post">
	<div>
	<button type="button" onClick="mapBtnClick()">위치 추가하기</button>
	<script type="text/javascript">
		function mapBtnClick() {
			$("#modal_map").attr("style", "display:block");
		}
	</script>
	<input type="text" id="title" name="title" placeholder="Title"></input>
	<textarea id="summernote" name="content" placeholder="Contents"></textarea>
	</div>

	<div id="btnBox" align="center">
	<button>작성</button> <button type="button" onClick="history.go(-1)">취소</button>
	</div>
	
</form>


<div id="modal_map">

	<div class="modal_content">
	<div><h1>Insert Map</h1></div>
	<hr>

	<div>
		<input type="text" id="mapSearch"> <button type="button" id="mapSearchBtn" onclick="mapSearchF()">검색</button>
	</div>
	
	<div id="dataDiv">
		<div id="map" style="width:400px;height:400px;"></div>
		<div id="placeinfo"></div>
	</div>
	<div>
		<button type="button" onClick="addMap()">저장</button><button type="button" onClick="mapModalClose()">취소</button>
		

	</div>
	</div>


	<div class="modal_layer"></div>
        
</div>
</div>

<script type="text/javascript">
	function mapModalClose() {
		$("#modal_map").attr("style", "display:none");
	}
</script>


<script type="text/javascript">
$(document).ready(function() {
	$('#summernote').summernote({
		height: 500,
		minHeight: null,
		maxHeight: null,
		placeholder: "Content",
		
		callbacks: {
			onImageUpload: function(files, editor, welEditable) {

				for (var i = files.length - 1; i >= 0; i--) {
					sendFile(files[i], this);
				}
			}
		}

	});
	
	function sendFile(file, el) {
		var form_data = new FormData();
      	form_data.append('file', file);
      	$.ajax({
        	data: form_data,
        	type: "POST",
        	url: '/diary/write/fileTemp',
        	cache: false,
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,
        	success: function(data) {
        		console.log(data);
          		$(el).summernote('editor.insertImage', data);
          		$("#imageBoard > ul").append('<li><img src="'+data+'" width="480px" height="auto"/></li>');
        	}
      	});
    }
});
</script>



<!-- footer -->
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>