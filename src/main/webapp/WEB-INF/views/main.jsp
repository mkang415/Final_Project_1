<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 
    
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
    <link rel="stylesheet" href="/resources/assets/css/MainCss5.css">
    <link rel="stylesheet" href=/resources/assets/css/swiper.css>
    
    <!-- 파비콘 -->
<!--     <link rel="shortcut icon" href="/resources/assets/icons/favicon.ico"> -->
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
                        <a href="/main">
                            <em><img src="/resources/assets/img/GoodDiary-logo.png" alt="MEGABOX" ></em>
<!--                             <strong><img src="/resources/assets/img/GoodDiary-logo.png" alt="LIFE THEATER"></strong> -->
                        </a>    
                    </h1>
                    <nav id="mNav">
                        <h2 class="ir_so">전체메뉴</h2>
                        <a href="#" class="ham"><span></span></a>
                    </nav>
                    <nav class="nav">
                        <ul class="clearfix">
                            <li><a href="/notice/list">공지사항</a></li>

                            <li><a href="/member/mypage">마이페이지</a></li>
                            <li><a href="/ledger/ledger">가계부</a></li>
                            <li><a href="/diary">다이어리</a></li>
                            <li><a href="/board/freelist">자유게시판</a></li>
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
<!--     						<li class="line"><a href="/notice/list">공지사항</a></li> -->
<!--     					    <li><a href="#">마이페이지</a></li> -->
<!--     						<li><a href="#">클래식</a></li> -->
    					</ul>	
    				</div>
    				<div class="bm_right">
<!--     					<ul> -->
<!--     						<li><a href="#">고객센터</a></li> -->
<!--     					    <li><a href="#">멤버쉽</a></li> -->
<!--     					</ul> -->
    					 <ul>
    					 <c:if test="${empty login }">
    						<li class="white"><a href="/member/login">로그인</a></li>
       					</c:if>
       					
       					<c:if test="${login }">
       						<li class="white"><a href="/member/logout">로그아웃</a></li>    						
    					</c:if>
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
                                <h3>메인</h3>
                                <p>다이어리 </p>
                            </div>
                        </div>
        			</div>

        		<div class="swiper-slide co2">
        		      <div class="container">
                           <div class="row">
                                <h3>가계부 기능</h3>
                                <p>가계부 </p>
                            </div>
                        </div>	
        			</div>
  
        		<div class="swiper-slide co3">
        		        		      <div class="container">
                           <div class="row">
                                <h3>여행일정</h3>
                                <p>여행일정공유</p>
                            </div>
                        </div>	
        			</div>	
    		</div>
    		
    		   	<div class="swiper-pagination"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
    	</div>
    </div>	
    	
   	
    </section>
    <!-- //banner -->
     <section id="help">
        <div class="container" style="top:100px; margin-left:100px; width:1500px;">
            <div class="row">
                <div class="help clearfix">
                    <article class="help_box1" style="width:600px;">
                        <h3><em></em></h3>
                        <div class="notice">
                            <ul>
                                <li class="active"><a href="#">공지사항</a>
                                    <ul>
                                    <c:forEach items="${list }" var="i">
                                        <li>
                                            <dl>
                                                <dt><strong class="bar">${i.title }</strong> <em><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd" /></em></dt>
                                                <dd style="text-overflow: ellipsis;">${i.content }</dd>
                                            </dl>            
                                        </li>
                                   </c:forEach>

                                    </ul>
                                </li>
                                <li><a href="#">자유게시판</a>
                                    <ul>
                                        <li>
                                            <dl>
                                                <dt><strong class="bar">자유게시판</strong> <em>2019.07.22</em></dt>
                                                <dd>자유게시판이다</dd>
                                            </dl>            
                                        </li>
                                        <li>
                                            <dl>
                                                <dt><strong class="bar">자유게시판</strong> <em>2019.07.22</em></dt>
                                                <dd>자유게시판이다</dd>
                                            </dl>
                                        </li>
                                        <li>
                                            <dl>
                                                <dt><strong class="bar">자유게시판</strong> <em>2019.07.22</em></dt>
                                                <dd>자유게시판이다 </dd>
                                            </dl>
                                        </li>
                                        <li>
                                            <dl>
                                                <dt><strong class="bar">자유게시판</strong> <em>2019.07.22</em></dt>
                                                <dd>자유게시판이다</dd>
                                            </dl>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </article>
                	
                	<article class="help_box2" style="width:600px; margin-left:160px;">
                	<h3></h3>
                	<div class="service" style="height:390px;">
                		<ul>
                		<li>
                			<a href="/ledger/ledger">
                				<span class="img_svg" style="width:100px;">
                					<img src="/resources/assets/img/accounting.png"><img>
                				</span>
                				<strong>가계부</strong>
                			</a>
                		</li>
  						<li><a href="">
  								<span class="img_svg" style="width:100px;">
                  					<img src="/resources/assets/img/agendas.png"><img>
              					</span>
                				<strong>다이어리</strong>
                		
  							</a>
  						</li>              		

  						<li><a href="/memo/list">
  								<span class="img_svg" style="width:100px; margin-left:111px;">
                					<img src="/resources/assets/img/note-book.png"><img>
                				</span>
                				<strong>메모</strong>
                		
  							</a>
  						</li>              		

  						<li><a href="/qna/newlist">
  								<span class="img_svg" style="width:100px;">
                					<img src="/resources/assets/img/question.png"><img>
                				</span>
                				<strong>Q&A</strong>
                		
  							</a>
  						</li>              		
                		
                		</ul>
                	
                	
                	</div>
                	
                	</article>
                		</div>
                    </div>
                 </div>
            
             </section>
    
    
    
    
   
    
    
    
    <!-- 유튜브 api -->
    <section id="new">
        <div class="container" style="width:1400px;">
            <div class="row">
                <div class="new">
                    <h2><em></em></h2>
                    <div class="new_left" style="bottom: 30px;">
                        <div class="play" id="showTrailer" data-youtube="jyoqkm9tZ08">
                            <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            viewBox="0 0 120 120" style="enable-background:new 0 0 120 120;" xml:space="preserve">
                                <circle class="st0" cx="60" cy="60.4" r="56"/>
                                <path class="st1" d="M81,65.4c4.8-2.8,4.8-7.2,0-10L53.5,39.6c-4.8-2.8-8.7-0.5-8.7,5v31.7c0,5.5,3.9,7.8,8.7,5L81,65.4z"/>
                            </svg>
                        </div>
                    </div>
    
                    </div>
                </div>
            </div>
      
    </section>
   
       <footer id="footer">
        <div id="footer_sns">
            <div class="container">
                <div class="footer_sns">
                    <ul>
                        <li class="icon s1"><a href="#"><span class="ir_pm">트위터</span></a></li>
                        <li class="icon s2"><a href="#"><span class="ir_pm">페이스북</span></a></li>
                        <li class="icon s3"><a href="#"><span class="ir_pm">인스타그램</span></a></li>
                        <li class="icon s4"><a href="#"><span class="ir_pm">구글 플레이</span></a></li>
                        <li class="icon s5"><a href="#"><span class="ir_pm">아이폰 앱스토어</span></a></li>
                    </ul>    
                    <div class="tel">
                        <a href="#">ARS <em>02-999-9999</em></a>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer_infor">
            <div class="container">
                <div class="row">
                    <div class="footer_infor">
<!--                         <h2><img src="assets/img/logo_footer.png" alt="megabox"></h2> -->
                        <ul>
                            <li><a href="#">회사소개</a></li>
                            <li><a href="#">채용정보</a></li>
                            <li><a href="#">제휴/광고/부대사업 문의</a></li>
                            <li><a href="#">이용약관</a></li>
                            <li><a href="#">개인정보처리방침</a></li>
                            <li><a href="#">고객센터</a></li>
                            <li><a href="#">윤리경영</a></li>
                        </ul>
                        <address>
                            <p>서울특별시 노원구 월계2동 <br><span class="bar2">대표자명 : 강민규, 강현지, 김영현, 박재현, 석진엽 </span> <br><span class="bar2">사업자등록번호 211-86-59478</span> 
                            	통신판매업신고번호 제 833호</p>
                            <p>Copyright 2019 by kyungdongHighSchoolGerrard Inc. All right reserved</p>
                        </address>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- //footer -->
  
  
    
        <!-- 트레일러 -->
    <aside role="complementary" id="blackout" class="overlay">
        <div id="trailerModal" class="modal">
            <div id="trailer"></div><!-- YouTube 플레이어로 대체되는 부분 -->
        </div>
        <button id="hideTrailer" class="modal_close">닫기</button>
    </aside>
    
     
     
     
    
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
     
     
     //공지사항 탭 메뉴
     var tabMenu = $(".notice");

     //컨텐츠 내용을 숨겨주세요!
     tabMenu.find("ul > li > ul").hide();
     tabMenu.find("li.active > ul").show();

     function tabList(e){
         e.preventDefault();       //#의 기능을 차단
         var target = $(this);
         target.next().show().parent("li").addClass("active").siblings("li").removeClass("active").find("ul").hide();
         //버튼을 클릭하면 ~ div를 보여주고
         //부모의 li 태그에 클래스 추가하고
         //형제의 li 태그에 클래스 제거하고
         //제거한 자식의 div 태그를 숨겨줌 
     }

     tabMenu.find("ul > li > a").click(tabList).focus(tabList);
     
    </script>

</body>
</html>