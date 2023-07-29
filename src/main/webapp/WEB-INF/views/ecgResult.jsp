<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="no-js">

<head>
    <!-- Basic Page Needs
        ================================================== -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="icon" href="resources/images/ht_favicon.png">
    <title>심전도 검사 결과</title>
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
	<link rel="stylesheet" href="resources/css/style5.css">
	<link rel="stylesheet" href="resources/css/copybtn.css">
	
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-straight/css/uicons-solid-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
</head>

<body>
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
						    <% if (session.getAttribute("user_id") != null) { %>
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



    <section class="portfolio-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="portfolio-content" style="text-align: center;">
                        <h2 style="text-align: left; font-weight: bold;">심전도 검사</h2>
                        <!-- multistep form -->
                        <div id="msform">
                            <!-- progressbar -->
                            <ul id="progressbar">
                                <li class="active">ECG 파일 첨부</li>
                                <li class="active">검사 결과 확인</li>
                                <li>건강 기록</li>
                            </ul>
                            <!-- fieldsets -->
                        </div>

                        <div class="container_result">
                            <div class="container_ECG_record">
                                <span class="subtitle">ECG 검사 결과</span>
                                <span id = "ECG_test">
                                    <a href="" class="button">
                                        <ul>
                                            <li><i class="fi fi-ss-copy-alt"></i> <strong> 결과 복사</strong></li>
                                            <li> <strong> 이미지 복사 중</strong></li>
                                            <li> <strong> 복사 완료</strong></li>
                                        </ul>
                                        <div>
                                            <svg viewBox="0 0 24 24"></svg>
                                        </div>
                                    </a>
                                </span>
                            </div>
                            <br>
                            <div class="ECG_record">
                                <div class="col-sm-9">
                                <!-- <img class="ECG_record_IMG"
                                        src="resources/images/ecgGraph/${LatestEcg.image_name}.png" />  -->
                                <img class="ECG_record_IMG" src="<c:url value='/image/${LatestEcg.image_name}.png' />" /> 
                                </div>
                                <div class="col-sm-3 ECG_Result">
                                    <table class="ecg_result_table">
                                        <th>${userInfo.user_name}님 </th>
                                        <th><span style="color: rgb(255, 118, 140);">♥ </span> ${LatestEcg.hr}bpm</th>
                                    </table>
                                    <br>
                                    <table class="ecg_result_table">
                                        <thead>
                                            <tr>
                                                <th>내용</th>
                                                <th>결과</th>
                                            </tr>
                                        </thead>
                                        <tr>
                                            <td>검사날짜</td>
                                            <td><fmt:formatDate value="${LatestEcg.input_date}" pattern="yyyy-MM-dd"/> </td>
                                        </tr>
                                        <tr>
	                                        <td>검사결과</td>
	                                         <td><span class="${cssClass}">● </span> ${LatestEcg.resultsText}</td>
                                        <tr>
                                            <td></td>
                                            <td><span> </span></td>
                                        </tr>
                                      
                                        </tr>
                                        <tr>
                                            <td>PR interval</td>
                                            <td><span>${LatestEcg.pr} </span>ms</td>
                                        </tr>
                                        <tr>
                                            <td>QRS duration</td>
                                            <td><span>${LatestEcg.qrs} </span>ms</td>
                                        </tr>
                                        <tr>
                                            <td>QT interval</td>
                                            <td><span>${LatestEcg.qt} </span>ms</td>
                                        </tr>
                                        <tr>
                                            <td>QTc interval</td>
                                            <td><span>${LatestEcg.qtc} </span>ms</td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><span> </span></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        </div>
    </section>

    <section class="works works-fit">
        <div class="container ECG_background_img">
            <h2 class="subtitle">심전도 검사 관련 </h2>
            <p class="subtitle-des"><br>- 검사 전날에는 <span class="subtitle-des_ef">과로나 스트레스를</span>받지 않도록 합니다 <br> -
                검사를 방해할 수 있는 <span class="subtitle-des_ef">귀금속 제품을 제거하고</span> 검사를 받습니다. <br> - 검사 도중에는<span
                    class="subtitle-des_ef"> 말이나 과한 행동을</span>
                하지 않도록 주의해야 합니다. <br> -  <span class="subtitle-des_ef"> 각질이나 털이</span> 많을 경우 검사에 오류가 생길 수 있습니다.
            </p>
            <br>
            <h2 class="subtitle">검사결과 주의사항 </h2>
            <p class="subtitle-des"><br>- 심전도상의 경미한 이상이 모두 <span class="subtitle-des_ef">이상소견</span>인 것은 아닙니다. <br> -
                장초음파, 24시간 활동성 심전도등의 <span class="subtitle-des_ef">정밀 검사가 필요</span> 할 수 있습니다. <br> - 부정맥이<span
                    class="subtitle-des_ef"> 의심되나 진단되지 않는 경우</span>
                24시간 활동성 <span class="subtitle-des_ef"> </span>심전도 검사가 필요합니다
            </p>
            <br>
            <br>
            <br>
            <br>
            <div class="row">
                <div class="container">
                    <h2 class="subtitle">부정맥의 종류</h2>
                    <br><br>
                </div>
                <div class="col-sm-3">
                    <figure class="wow fadeInLeft animated portfolio-item animated ECG_type_card"
                        data-wow-duration="300ms" data-wow-delay="0ms"
                        style="visibility: visible; animation-duration: 300ms; -webkit-animation-duration: 300ms; animation-delay: 0ms; -webkit-animation-delay: 0ms; animation-name: fadeInLeft; -webkit-animation-name: fadeInLeft;">
                        <div class="img-wrapper">
                            <img src="resources/images/맥박/심방세동.png" class="img-responsive" alt="portfolio items">
                        </div>
                        <figcaption class="figcaption_top">
                            <h4>
                                <a href="#" style="font-weight: bold;">
                                    심방세동
                                </a>
                            </h4>
                            <p class="subtitle-des">
                                <span style="color: red;">♥</span> 불규칙한 맥박
                            </p>
                        </figcaption>
                    </figure>
                </div>
                <div class="col-sm-3">
                    <figure class="wow fadeInLeft animated animated ECG_type_card" data-wow-duration="300ms"
                        data-wow-delay="300ms"
                        style="visibility: visible; animation-duration: 300ms; -webkit-animation-duration: 300ms; animation-delay: 300ms; -webkit-animation-delay: 300ms; animation-name: fadeInLeft; -webkit-animation-name: fadeInLeft;">
                        <div class="img-wrapper">
                            <img src="resources/images/맥박/서맥.png" class="img-responsive" alt="portfolio items">
                        </div>
                        <figcaption class="figcaption_top">
                            <h4>
                                <a href="#" style="font-weight: bold;">
                                    서맥성
                                </a>
                            </h4>
                            <p class="subtitle-des">
                                <span style="color: red;">♥</span> 1분 60회 미만
                            </p>
                        </figcaption>
                    </figure>
                </div>

                <div class="col-sm-3">
                    <figure class="wow fadeInLeft animated animated ECG_type_card" data-wow-duration="300ms"
                        data-wow-delay="600ms"
                        style="visibility: visible; animation-duration: 300ms; -webkit-animation-duration: 300ms; animation-delay: 300ms; -webkit-animation-delay: 300ms; animation-name: fadeInLeft; -webkit-animation-name: fadeInLeft;">
                        <div class="img-wrapper">
                            <img src="resources/images/맥박/빈맥.png" class="img-responsive" alt="">
                        </div>
                        <figcaption class="figcaption_top">
                            <h4>
                                <a href="#" style="font-weight: bold;">
                                    빈맥성
                                </a>
                            </h4>
                            <p class="subtitle-des">
                                <span style="color: red;">♥</span> 1분 100회 이상
                            </p>
                        </figcaption>
                    </figure>
                </div>

                <div class="col-sm-3">
                    <figure class="wow fadeInLeft animated animated ECG_type_card" data-wow-duration="300ms"
                        data-wow-delay="900ms"
                        style="visibility: visible; animation-duration: 300ms; -webkit-animation-duration: 300ms; animation-delay: 600ms; -webkit-animation-delay: 600ms; animation-name: fadeInLeft; -webkit-animation-name: fadeInLeft;">
                        <div class="img-wrapper">
                            <img src="resources/images/맥박/조기박동.png" class="img-responsive" alt="">
                        </div>
                        <figcaption class="figcaption_top">
                            <h4>
                                <a href="#" style="font-weight: bold;">
                                    조기박동
                                </a>
                            </h4>
                            <p class="subtitle-des">
                                <span style="color: red;">♥</span> 엇박자로 뛰는 맥박
                            </p>
                        </figcaption>
                    </figure>
                </div>

            </div>
        </div>
    </section>



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
                            <a href="https://forms.gle/JH1Ya6SnKUn6boTA6"
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
                        <script>
                            document.write(new Date().getFullYear())
                        </script>
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
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
    
    <script type="text/javascript">
 // 화면 캡쳐 기능
    $(function(){
        $("#ECG_test").on("click", function(){ // 버튼을 누르면 페이지로드 - captureArea(div)영역 캡쳐 - var image에 이미지 url을 담음 - <a>, id=downloadLink 인 href속성에 링크 담음 - <a>텍스트 눌렀을때 다운로드
            
            
            // 캡쳐 전에 scale을 2로 설정한다.
            html2canvas(document.querySelector(".ECG_record"), { scale: 2 }).then(canvas => {
                saveAs(canvas.toDataURL('image/png'),"ECG 결과.png");
                

                // 캡쳐가 끝난 후에 다시 scale을 원래대로 돌려놓는다.
                resetScale();
            });
        });

        function saveAs(uri, filename) {    
            // 캡쳐된 파일을 이미지 파일로 내보낸다.
            var link = document.createElement('a');
            if (typeof link.download === 'string') { 
                link.href = uri;
                link.download = filename;
                document.body.appendChild(link);
                link.click(); 
                document.body.removeChild(link);
            } else {
                window.open(uri);
            }
        }

        function resetScale() {
            // 캡쳐 전으로 scale을 원래대로 돌려놓는다.
            document.body.style.webkitTransform = "";
            document.body.style.mozTransform = "";
            document.body.style.msTransform = "";
            document.body.style.oTransform = "";
            document.body.style.transform = "";
        }
        });
    </script>

    <!-- Template Javascript Files
	================================================== -->
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
    <script src="resources/js/copybtn.js"></script> 
</body>

</html>