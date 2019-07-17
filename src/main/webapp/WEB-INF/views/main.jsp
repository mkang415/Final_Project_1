<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="format-detection" content="telephone=no">
    <meta name="author" content="webstoryboy">
    <meta name="description" content=".">
    <meta name="keywords" content=" 동영상 이미지도해볼까,이미지 슬라이드">
    <title> 푸터 영역</title>

    <!-- css -->
    <link rel="stylesheet" href="/resources/assets/css/reset05.css">
    <link rel="stylesheet" href="/resources/assets/css/mainstyle.css">
    <link rel="stylesheet" href=/resources/assets/css/swiper.css>
    
    <!-- 파비콘 -->
    <link rel="shortcut icon" href="/resources/assets/icons/favicon.ico">
    <link rel="apple-touch-icon-precomposed" href="/resources/assets/icons/favicon_72.png" />
    <link rel="apple-touch-icon-precomposed" sizes="96x96" href="/resources/assets/icons/favicon_96.png" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/resources/assets/icons/favicon_144.png" />
    <link rel="apple-touch-icon-precomposed" sizes="192x192" href="/resources/assets/icons/favicon_192.png" />
    
    <!-- 페이스북 메타 태그 -->
    <meta property="og:title" content="final 사이트 만들기" />
    <meta property="og:url" content="https://github.com/webstoryboy/megabox2019" />
    <meta property="og:image" content="https://webstoryboy.github.io/megabox2019/mega.jpg" />
    <meta property="og:description" content="final사이트" />
   
    <!-- 트위터 메타 태그 -->
    <meta name="twitter:card" content="summary">
    <meta name="twitter:title" content="final사이트 만들기">
    <meta name="twitter:url" content="https://github.com/webstoryboy/megabox2019/">
    <meta name="twitter:image" content="https://webstoryboy.github.io/megabox2019/mega.jpg">
    <meta name="twitter:description" content="final사이트 ">
    
    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">
    
    <!-- HTLM5shiv ie6~8 -->
    <!--[if lt IE 9]> 
      <script src="assets/js/html5shiv.min.js"></script>
      <script type="text/javascript">
         alert("현재 브라우저는 지원하지 않습니다. 크롬 브라우저를 추천합니다.!");
      </script>
   <![endif]-->

</head>
<body>
    
    <header id="header">
        <div class="container">
            <div class="row">
                <div class="header clearfix">
                    <h1>
                        <a href="#">
<!--                             <em><img src="/resources/assets/img/logo.png" alt="MEGABOX"></em> -->
<!--                             <strong><img src="/resources/assets/img/logo-sub.png" alt="LIFE THEATER"></strong> -->
                        </a>    
                    </h1>
                    <nav id="mNav">
                        <h2 class="ir_so">전체메뉴</h2>
                        <a href="#" class="ham"><span></span></a>
                    </nav>
                    <nav class="nav">
                        <ul class="clearfix">
<!--                             <li><a href="#">스토어</a></li> -->
<!--                             <li><a href="#">이벤트</a></li> -->
<!--                             <li><a href="#">로그인</a></li> -->
                        </ul>
                    </nav>    
                </div>
            </div>
        </div>
    </header>
    <!-- //header -->
    
    <!-- banner -->
    <section id="banner">
    	<h2 class="ir_so">다이어리 사진</h2>
    	<div class="banner_menu">
    		<div class="container">
    			<div class="row">
    				<div class="bm_left">
    					<ul>
    						<li class="line"><a href="/notice/list">공지사항</a></li>
    					    <li><a href="#">마이페이지</a></li>
<!--     						<li><a href="#">클래식</a></li> -->
    					</ul>	
    				</div>
    				<div class="bm_right">
<!--     					<ul> -->
<!--     						<li><a href="#">고객센터</a></li> -->
<!--     					    <li><a href="#">멤버쉽</a></li> -->
<!--     					</ul> -->
    					 <ul>
    						<li class="white"><a href="/member/login">로그인</a></li>
    						<li class="purple"><a href="/member/join">회원가입</a></li>
    					</ul>			
    					
    				</div>
    			</div>	
    		</div>
    	</div>	
    	<div class="slider">
        		<!-- Slides -->
    	<div class="swiper-container">
    	    <div class="swiper-wrapper">
        		<div class="swiper-slide co1">
        			<div class="container">
                            <div class="row">
                                <h3>메인이당</h3>
                                <p>다이어리 </p>
                            </div>
                        </div>
        			</div>
        		<div class="swiper-slide co2">Slide 2</div>
        		<div class="swiper-slide co3">Slide 3</div>	
    		</div>
    		
    		   	<div class="swiper-pagination"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
    	</div>
    </div>	
    	
   	
    </section>
    <!-- //banner -->
    
    
     
    
    <!-- 자바스크립트 라이브러리 -->
    <script src="/resources/assets/js/jquery.min_1.12.4.js"></script>
    <script src="/resources/assets/js/modernizr-custom.js"></script>
    <script src="/resources/assets/js/ie-checker.js"></script>
    <script src="/resources/assets/js/swiper.min.js"></script>
    <script src="/resources/assets/js/iframe_api.js"></script>
    <script src="/resources/assets/js/movie.js"></script>
    
     <script type="text/javascript">
     var swiper = new Swiper('.swiper-container',{
    	  pagination: {
    		    el: '.swiper-pagination',
    		    type: 'bullets',
    		  },
    		  
         navigation: {
             nextEl: '.swiper-button-next',
             prevEl: '.swiper-button-prev',
         },
         autoplay: {
             delay: 5000,
         },
     });
    </script>

</body>
</html>