<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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
		$('#summernote').summernote('insertImage', imgUrl);
		
		
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

body, html {
    margin: 0;
    padding: 0;
    height: 100%;
}

.wrapper {
	margin-left: 20%;
	margin-right: 20%;
}

#title {
	margin-bottom: 10px;
	border: white;
	width: 88%;
	font-size: 2em;
}

.content {
	padding-top: 1em;
}

#summernote {
	width: 100%;
	height: 40em;
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
	top: 15%;
	left: 20%;

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
	cursor: pointer;
}

.list:hover {
	background: #F0F0F0;
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

#closeBtn {
	position: absolute;
	width: 36px;
	height: 36px;
	top: 1em;
	right: 1em;
	border: 0;
/* 	outline: 0; */
/* 	background: url('resources/diary/img/cancel.png') no-repeat; */
	cursor: pointer;

}

#mapBtn {
	padding: 0;
	padding-bottom: 2px;
	margin-left: 0;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.4;
    color: #333;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    cursor: pointer;
    background-color: #fff;
    background-image: none;
    border: 1px solid #fff;
    border-color: #fff;
    border-radius: 1px;
    outline: 0;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    touch-action: manipulation;

   	
}

#mapBtnDiv {
    position: relative;
   	left: 89%;
   	top: 50px;
	width: 100px;
   	margin: 0;
   	padding: 0;
   	cursor: pointer;
}


#write-field {
 	margin-top: 50px;
	position: relative;
}

div.note-editor.note-frame {
	border: 0;
}

#submitbar {
	width: 100%;
	height: 70px;
	background-color: rgb(245,245,245);
	position: fixed;
	bottom: 0;

	
}

#butn {
  -webkit-border-radius: 28;
  -moz-border-radius: 28;
  border-radius: 28px;
  font-family: Arial;
  color: #ffffff;
  font-size: 15px;
  background: #000000;
  padding: 10px 20px 10px 20px;
  text-decoration: none;
	cursor: pointer;
}

#butn:hover {
  background: #5e5e5e;
  text-decoration: none;
}

#butnCancel {
  -webkit-border-radius: 28;
  -moz-border-radius: 28;
  border-radius: 28px;
  font-family: Arial;
  color: #000000;
  font-size: 15px;
  background: #FFFFFF;
  padding: 10px 20px 10px 20px;
  text-decoration: none;
  cursor: pointer;
}

#butnCancel:hover {
  background: #F0F0F0;
  text-decoration: none;
}

#btnBox {
	position: relative;
	top: 15px;
}

#mapSaveBtn {
  -webkit-border-radius: 28;
  -moz-border-radius: 28;
  border-radius: 28px;
  font-family: Arial;
  color: #ffffff;
  font-size: 15px;
  background: #000000;
  padding: 5px 10px 5px 10px;
  text-decoration: none;
	cursor: pointer;
}

#mapSaveBtn:hover {
  background: #5e5e5e;
  text-decoration: none;
}

#mapBtnBox {
	float: right;
	margin-bottom: 10px;
}

.note-resizebar {
	display: none;
	border: 0;
}

#mapSearch {
	height: 2em;
	width: 30em;
	margin-right: 0;
}

#mapSearchBtn {
	height: 2.5em;
	font-family: Arial;
	background: black;
	color: white;
	border: none;
	margin-left: 0;
	cursor: pointer;
}

</style>

</head>
<body>

<div class="wrapper">


<form id="writeSubmit" action="/diary/write" method="post">
	<div id="write-field">

	<div id="mapBtnDiv" onClick="mapBtnClick()">
	Insert Map
	<button type="button" id="mapBtn"><img src="/resources/diary/img/map.png" /></button>
	</div>
	<script type="text/javascript">
		function mapBtnClick() {
			$("#modal_map").attr("style", "display:block");
		}
	</script>
	<input type="text" id="title" name="title" placeholder="제목을 입력하세요"></input>
	<textarea id="summernote" name="content"></textarea>
	</div>
	
</form>


<div id="modal_map">

	<div class="modal_content">
	<button type="button" id="closeBtn" onClick="mapModalClose()"><img src="/resources/diary/img/closeBtn.png" /></button>
	<div><h1>Insert Map</h1></div>
	<hr>

	<div>
		<input type="text" id="mapSearch" placeholder="장소명을 입력하세요"><button type="button" id="mapSearchBtn" onclick="mapSearchF()">Search</button>
	</div>
	
	<div id="dataDiv">
		<div id="map" style="width:400px;height:400px;"></div>
		<div id="placeinfo"></div>
	</div>
	
	<div id="mapBtnBox">
		<button id="mapSaveBtn" type="button" onClick="addMap()">Insert Map</button>
	</div>
	
	</div>


	<div class="modal_layer"></div>
        
</div>


</div>

<div id="submitbar">
	<div id="btnBox" align="center">
	<button id="butn" onClick="writeSubmit()">Submit</button> <button id="butnCancel" type="button" onClick="history.go(-1)">Go Back</button>
	</div>
</div>

<script type="text/javascript">
	function mapModalClose() {
		$("#modal_map").attr("style", "display:none");
	}
</script>

<script type="text/javascript">

function writeSubmit() {

	console.log($("#title").val);

	console.log($("#summernote").val);
	
	if($("#title").val()!=null && $("#title").val()!=''
			&& $("#summernote").val()!=null && $("#summernote").val()!='') {
		
		$("#writeSubmit").submit();
		
	} else {
		
		alert("제목 또는 내용을 입력해주세요.");
	}
	
}

</script>


<script type="text/javascript">
$(document).ready(function() {
	$('#summernote').summernote({
		height: 600,
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


</body>
</html>