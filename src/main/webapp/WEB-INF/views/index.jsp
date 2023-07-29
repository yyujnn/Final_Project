<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html class="no-js">



<head>
    <!-- Basic Page Needs
        ================================================== -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="icon" href="resources/images/ht_favicon.png">
    <title>hearTrack</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <!-- Mobile Specific Metas
        ================================================== -->
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- Template CSS Files
        ================================================== -->
    <!-- Twitter Bootstrs CSS -->
    <link rel="stylesheet" href="resources/plugins/bootstrap/bootstrap.min.css">
    <!-- Ionicons Fonts Css -->
    <link rel="stylesheet" href="resources/plugins/ionicons/ionicons.min.css">
    <!-- animate css -->
    <link rel="stylesheet" href="resources/plugins/animate-css/animate.css">
    <!-- Hero area slider css-->
    <link rel="stylesheet" href="resources/plugins/slider/slider.css">
    <!-- owl craousel css -->
    <link rel="stylesheet" href="resources/plugins/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="resources/plugins/owl-carousel/owl.theme.css">
    <!-- Fancybox -->
    <link rel="stylesheet" href="resources/plugins/facncybox/jquery.fancybox.css">
    <!-- template main css file -->
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/style2.css">
    <!-- 병원 찾기 css 파일 -->
	<link rel="stylesheet"href="resources/plugins/findHospital/findHospital.css">
    
   
  
</head>

<body>


    <!--
        ==================================================
        Header Section Start
        ================================================== -->
    <header id="top-bar" class="navbar-fixed-top animated-header">
        <div class="container">
            <div class="navbar-header">
                <!-- responsive nav button -->
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- /responsive nav button -->

                <!-- logo -->
                <div class="navbar-brand">
                    <a href="index">
                        <img src="resources/images/logo.png" alt="">
                    </a>
                </div>
                <!-- /logo -->
            </div>
         
            <!-- main menu -->
            <nav class="collapse navbar-collapse navbar-right" role="navigation">
                <div class="main-menu">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="index">Home</a>
                        </li>
                        
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">검사하기<span
                                    class="caret"></span></a>
                            <div class="dropdown-menu">
                                <ul>
                                    <li><a href="ecgCheck">심전도 검사</a></li>
                                    <li><a href="bpCheck">혈압 검사</a></li>
                                    <li><a href="bsCheck">혈당 검사</a></li>
                                </ul>
                            </div>
                        </li>
                        
                        
                        <li><a href="healthRecord">건강기록</a></li>
                        <li><a href="community">커뮤니티</a></li>

                        <li>
                        	<% if (session.getAttribute("user_id") != null && session.getAttribute("user_id").equals("admin1")) { %>
                        		<li class="dropdown">
		                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">관리자 메뉴<span class="caret"></span></a>
		                            <div class="dropdown-menu">
		                                <ul>
		                                    <li><a href="adminEcg">관리자페이지 이동</a></li>
		                                    <li><a href="logout">로그아웃</a></li>
		                                </ul>
		                            </div>
		                        </li>
						    <% } else if (session.getAttribute("user_id") != null) { %>
						        <a href="logout">로그아웃</a>
						    <% } else { %>
						        <a href="login">로그인</a>
						    <% } %>
						</li>

                    </ul>
                </div>
            </nav>
            <!-- /main nav -->
        </div>
    </header>
    
    
	





    <!--
==================================================
Slider Section Start
================================================== -->
    <section id="hero-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="block wow fadeInUp" data-wow-delay=".3s">
                        <!-- Slider -->
                        <section class="cd-intro">
                            <h1 class="wow fadeInUp animated cd-headline slide" data-wow-delay=".4s">
                                <span>내 건강이 궁금하다면?</span><br>
                                <span class="cd-words-wrapper">
                                    <b class="is-visible">부정맥</b>
                                    <b>혈압</b>
                                    <b>혈당</b>
                                </span>
                            </h1>
                        </section> <!-- cd-intro -->
                        <!-- /.slider -->
                        <h2 class="wow fadeInUp animated" data-wow-delay=".6s">
                            공간을 넘어 건강을 디자인하다. <br> 당신, 오직 당신을 위한 특별한 AI 헬스케어 서비스를 만나보세요.
                        </h2>
                        <a class="btn-lines dark light wow fadeInUp animated smooth-scroll btn btn-default btn-green"
                            data-wow-delay=".9s" href="#about" data-section="#works">바로가기</a>

                    </div>
                </div>
            </div>
        </div>
    </section><!--/#main-slider-->

    <!--
==================================================
Portfolio Section Start
================================================== -->
    <section id="works" class="works" style = "background-color : #fff !important;">
        <div class="container">
            <div class="section-heading">
                <h1 class="title wow fadeInDown" data-wow-delay=".3s" style="font-weight: bold !important;">건강 체크하기</h1>
                <p class="wow fadeInDown" data-wow-delay=".5s">
                   <strong> AI로 건강 관리의 시작과 끝을 편하게 </strong> 
                </p>
            </div>
            <div class="row">
                <div class="col-sm-4 col-xs-12">
                    <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms"
                        data-wow-delay="0ms">
                        <div class="img-wrapper">
                            <img src="https://s3.ap-northeast-2.amazonaws.com/img.kormedi.com/news/article/__icsFiles/artimage/2018/04/22/c_km601/shutterstock_164107829_pressure_540.jpg"
                                class="img-responsive" alt="this is a title">
                            <div class="overlay">
                                <div class="buttons">
                                    <!-- <a rel="gallery" class="fancybox" href="images/portfolio/item-1.jpg">Demo</a> -->
                                    <a href="bpCheck">바로가기</a>
                                </div>
                            </div>
                        </div>
                        <figcaption>
                            <h4>
                                <a href="bpCheck">
                                    <strong>혈압</strong>
                                </a>
                            </h4>
                            <p>
                                혈압정상수치와 고혈압, 저혈압 기준
                            </p>
                        </figcaption>
                    </figure>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <figure class="wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="300ms">
                        <div class="img-wrapper">
                            <img src="https://health.chosun.com/site/data/img_dir/2019/05/15/2019051501821_0.jpg"
                                class="img-responsive" alt="this is a title">
                            <div class="overlay">
                                <div class="buttons">
                                    <a href="ecgCheck">바로가기</a>
                                </div>
                            </div>
                        </div>
                        <figcaption>
                            <h4>
                                <a href="ecgCheck">
                                     <strong> ECG</strong>
                                </a>
                            </h4>
                            <p>
                                심전도(ECG)와 검사로 알 수 있는 병
                            </p>
                        </figcaption>
                    </figure>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <figure class="wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="300ms">
                        <div class="img-wrapper">
                            <img src="https://www.newsworks.co.kr/news/photo/201511/9233_2335_4818.jpg"
                                class="img-responsive" alt="">
                            <div class="overlay">
                                <div class="buttons">
                                    <a href="bsCheck">바로가기</a>
                                </div>
                            </div>
                        </div>
                        <figcaption>
                            <h4>
                                <a href="bsCheck">
                                    <strong> 혈당</strong>
                                </a>
                            </h4>
                            <p>
                                혈당 낮으면 안심? 정상 수치여도 확인해야 한다.
                            </p>
                        </figcaption>
                    </figure>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <figure class="wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="600ms">
                        <div class="img-wrapper">
                            <img src="https://www.hotelrestaurant.co.kr/data/photos/20230312/art_16794736753188_c8f722.jpg"
                                class="img-responsive" alt="">
                            <div class="overlay">
                                <div class="buttons">
                                    <a href="community">바로가기</a>
                                </div>
                            </div>
                        </div>
                        <figcaption>
                            <h4>
                                <a href="community">
                                    <strong> 커뮤니티</strong>
                                </a>
                            </h4>
                            <p>
                                당신과 우리만 아는 이야기
                            </p>
                        </figcaption>
                    </figure>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <figure class="wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="900ms">
                        <div class="img-wrapper">
                            <img src="https://www.aleris.no/49497d/siteassets/aleris.no/artikler/kampanjebilder/bmi-kalkulator-overvekt2.jpg"
                                class="img-responsive" alt="">
                            <div class="overlay">
                                <div class="buttons">
                                    <a target="_blank" href="https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=bmi&oquery=bmi%EA%B2%80%EC%82%AC%ED%95%98%EA%B8%B0&tqi=i7BqHsp0J1sssPf0lUossssstE4-119845">바로가기</a>
                                </div>
                            </div>
                        </div>
                        <figcaption>
                            <h4>
                                <a href="https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=bmi&oquery=bmi%EA%B2%80%EC%82%AC%ED%95%98%EA%B8%B0&tqi=i7BqHsp0J1sssPf0lUossssstE4-119845">
                                    <strong> BMI</strong>
                                </a>
                            </h4>
                            <p>
                                연령별 비만율(BMI) 알아보기
                            </p>
                        </figcaption>
                    </figure>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <figure class="wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="1200ms">
                        <div class="img-wrapper">
                            <img src="https://developers.kakaomobility.com/_nuxt/img/img_api4.507c175.png"
                                class="img-responsive" alt="">
                            <div class="overlay">
                                <div class="buttons">
                                   <a class="btn-lines dark light wow fadeInUp animated smooth-scroll btn btn-default btn-green" style="background-color: transparent; border-color: #fff; color: #fff;"
                            data-wow-delay=".9s" href="#contact-section" data-section="#contact-section">바로가기</a>
                                </div>
                            </div>
                        </div>
                        <figcaption>
                            <h4>
                                <a href="#contact-section">
                                
                                    <strong> 나에게 가장 가까운 병원은?</strong>
                                </a>
                            </h4>
                            <p>
                                현재 설정된 위치를 기준으로 주변 병원들이 검색됩니다
                            </p>
                        </figcaption>
                    </figure>
                </div>
            </div>
        </div>
    </section> <!-- #works -->
    <!--
==================================================
About Section Start
================================================== -->
    <section id="about" style = "background-color : #fcfcfc !important;">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="block wow fadeInLeft" data-wow-delay=".3s" data-wow-duration="500ms">
                        <h2 class="hearTrack_header">
                            HearTrack은?
                        </h2>
                        <p>
                            HearTrack은 '공간을 뛰어넘는 의료 서비스를 제공하는 사회'를 <br> 만들어 간다는 기본 목표와 세계 속의 이정표가 되자는 소망으로 <br> 만들어진 한국
                            고유의 브랜드입니다.
                        </p>
                        <p>
                            HearTrack is a unique Korean brand created with the basic goal of <br> creating a society
                            that provides medical services beyond space <br> and the hope of becoming a landmark in the
                            world.
                        </p>
                    </div>

                </div>
                <div class="col-md-6 col-sm-6">
                    <div class="block wow fadeInRight" data-wow-delay=".3s" data-wow-duration="500ms">
                        <img src="https://cdn.pixabay.com/photo/2020/08/03/09/39/medical-5459630_1280.png" alt="" style="opacity: 0.9;">
                    </div>
                </div>
            </div>
        </div>
    </section> <!-- /#about -->
    
    
    
    
    
    <section id="contact-section">
      <!--  지도 들어온 부분이에요 -->
      <div class="container">
         <div class="row">
            <div class="col-xl-12 col-lg-12 col-md-10 col-12">
               <div class="block">
                  <h2 class="subtitle wow fadeInDown" data-wow-duration="500ms"
                     data-wow-delay=".3s">가까운 병원 찾기</h2>
                  <div class="contact-form">
                     <div class="map_wrap">
                        <div id="map">
                           <!-- 지도가 넣어지는 부분  -->
                        </div>
                        <ul id="category">
                           <!-- 카테고리 선택 박스(지도 위에 생성) -->
                           <li id="HP8" data-order="2"><span
                              class="category_bg pharmacy"></span>병원</li>
                           <li id="PM9" data-order="1"><span class="category_bg mart"></span>약국</li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-md-6"></div>
         </div>
         <div class="row address-details"></div>
      </div>
   </section>
    <!--
==================================================
Portfolio Section Start
================================================== -->

     <section id="feature" style = "background-color : #fcfcfc !important;">
        <div class="container">
            <div class="section-heading">
                <h1 class="title wow fadeInDown" data-wow-delay=".3s">자주 묻는 질문 <span class="top6">TOP6</span></h1>
                <p class="wow fadeInDown" data-wow-delay=".5s">
                   <strong> 이용하시는데 고민인 부분이 있으신가여? </strong> <br> 궁금한 부분을 해결해드리기 위해 자주 묻는 질문을 준비하였습니다
                </p>
            </div>
            <div class="row">
                <div class="col-md-4 col-lg-4 col-xs-12">
                    <div class="media wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="300ms">
                        <div class="media-left">
                            <div class="icon">
                                <i class="ion-ios-flask-outline"></i>
                            </div>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading"> <strong> 내 건강기록은 어디에?</strong></h4>
                            <p>화면 우측 상단 <a href="healthRecord">건강기록</a>에서 <br> 입력하셨던 기록을 확인할 수 있습니다</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-lg-4 col-xs-12">
                    <div class="media wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="600ms">
                        <div class="media-left">
                            <div class="icon">
                                <i class="ion-ios-lightbulb-outline"></i>
                            </div>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading"><strong> 서비스 이용 부담 금액은?</strong></h4>
                            <p><span class="subtitle-des_ef">모든 서비스</span>는 로그인 이용자 <br> <span class="subtitle-des_ef"> 모두 무료</span>로 서비스를 이용할 수 있습니다</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-lg-4 col-xs-12">
                    <div class="media wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="900ms">
                        <div class="media-left">
                            <div class="icon">
                                <i class="ion-ios-lightbulb-outline"></i>
                            </div>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading"><strong> 개인정보와 건강정보 처리는?</strong></h4>
                            <p><a href="">개인정보</a>와 <a href="healthRecord">건강정보</a>는 이용약관에 <br> 의거하여 처리 및 보호하고 있습니다 </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-lg-4 col-xs-12">
                    <div class="media wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="1200ms">
                        <div class="media-left">
                            <div class="icon">
                                <i class="ion-ios-americanfootball-outline"></i>
                            </div>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading"><strong>측정기기가 없을때는?</strong></h4>
                            <p><a href="">하티브 몰+</a>에서 합리적인 가격으로 <br> 여러분들은 제품을 만나볼 수 있습니다</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-lg-4 col-xs-12">
                    <div class="media wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="1500ms">
                        <div class="media-left">
                            <div class="icon">
                                <i class="ion-ios-keypad-outline"></i>
                            </div>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading"><strong> 제휴 문의</strong></h4>
                            <p>담당자 <a href="">메일</a>을 통해 연락 주시면 <br> 확인 후 곧 연락 드리겠습니다.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-lg-4 col-xs-12">
                    <div class="media wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="1800ms">
                        <div class="media-left">
                            <div class="icon">
                                <i class="ion-ios-barcode-outline"></i>
                            </div>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading"> <strong>고객센터</strong></h4>
                            <p>추가적인 다른 질문들은 <br> <a href="">고객센터</a>를 통해 해결해 드리겠습니다</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> <!-- /#feature -->
    
    


    <!--
            ==================================================
            Call To Action Section Start
            ================================================== -->
    <section id="call-to-action">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="block">
                        <h2 class="title wow fadeInDown" data-wow-delay=".3s" data-wow-duration="500ms">나를 위한  <strong> 만족도 조사</strong>
                            </h1>
                            <p class="wow fadeInDown" data-wow-delay=".5s" data-wow-duration="500ms">당신이 경험한 이야기를 우리에게
                                나누어 주세요.<br>우리는 당신의 이야기로 더욱 만족스러운 서비스를 제공 드릴 것을 약속드립니다</p>
                            <a href="https://forms.gle/JH1Ya6SnKUn6boTA6" target='_blank'
                                class="btn btn-default btn-contact wow fadeInDown" data-wow-delay=".7s"
                                data-wow-duration="500ms">참여하기</a>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!--
            ==================================================
            Footer Section Start
            ================================================== -->
    <footer id="footer">
        <div class="container">
            <div class="col-md-8">
                <p class="copyright">Copyright &copy; <span>
                        <script>document.write(new Date().getFullYear())</script>
                    </span> HearTrack All Rights Reserved.
                </p>
                <p><a href="">개인정보 처리방침</a> | <a href="">이용약관</a></p>
            </div>
            <div class="col-md-4">
                <!-- Social Media -->
                <ul class="social">
                    <li>
                        <a href="http://wwww.fb.com/themefisher" class="Facebook">
                            <i class="ion-social-facebook"></i>
                        </a>
                    </li>
                    <li>
                        <a href="http://wwww.twitter.com/themefisher" class="Twitter">
                            <i class="ion-social-twitter"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="Linkedin">
                            <i class="ion-social-linkedin"></i>
                        </a>
                    </li>
                    <li>
                        <a href="http://wwww.fb.com/themefisher" class="Google Plus">
                            <i class="ion-social-googleplus"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </footer> <!-- /#footer -->

    <!-- Template Javascript Files
	================================================== -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3e7cb70f9c48437e990466f77a203571&libraries=services"></script>
    <!-- jquery -->
    <script src="resources/plugins/jQurey/jquery.min.js"></script>
    <!-- Form Validation -->
    <script src="resources/plugins/form-validation/jquery.form.js"></script>
    <script src="resources/plugins/form-validation/jquery.validate.min.js"></script>
    <!-- owl carouserl js -->
    <script src="resources/plugins/owl-carousel/owl.carousel.min.js"></script>
    <!-- bootstrap js -->
    <script src="resources/plugins/bootstrap/bootstrap.min.js"></script>
    <!-- wow js -->
    <script src="resources/plugins/wow-js/wow.min.js"></script>
    <!-- slider js -->
    <script src="resources/plugins/slider/slider.js"></script>
    <!-- Fancybox -->
    <script src="resources/plugins/facncybox/jquery.fancybox.js"></script>
    <!-- template main js -->
    <script src="resources/js/main.js"></script>
    <!-- 병원 찾기 js -->
    <script src="resources/plugins/findHospital/findHospital.js"></script>
</body>

</html>