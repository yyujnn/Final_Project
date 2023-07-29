<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="no-js">

<head>
    <!-- Basic Page Needs
        ================================================== -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="icon" href="resources/images/ht_favicon.png">
    <title>혈압 검사 결과</title>
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
    <link rel="stylesheet" href="resources/css/style4.css">
    <link rel="stylesheet" href="resources/css/style5.css">
    <link rel="stylesheet" href="resources/css/circle.css">
    <link rel="stylesheet" href="resources/css/copybtn.css">
	

	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-straight/css/uicons-solid-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
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
                        <h1 style="text-align: left; font-weight: bold;">혈압 검사 결과</h1>
                        <!-- <div class="test_card" style="display: inline-block; width: 50%; border-radius: 8px;">
                            <div class="test_list">
                                <div class="test_btn_group" style="display: flex; flex-direction: column; ">

                                     <img src="https://cdn.pixabay.com/photo/2021/11/05/11/24/heart-6771075_1280.png" style="border-radius: 8px;" alt=""> 
                                     <video muted autoplay loop>
                                        <source src="resources/images/ecgtest.mp4" type="video/mp4">
                                    </video>  
                                </div>
                            </div>
                        </div> -->

                        <!-- multistep form -->
                        <div id="msform">
                            <!-- progressbar -->
                            <ul id="progressbar">
                                <li class="active">혈압 데이터 입력</li>
                                <li class="active">검사 결과 확인</li>
                                <li>건강 기록</li>
                            </ul>
                            <!-- fieldsets -->
                        </div>


                        <div class="card_result_pre">
                        <div class="capture">
                            <div class="ECG-body">
                                <h2 class="ECG-title"><img src="resources/images/checkmark.png" alt=""> 혈압 검사 결과 확인하기 </h2>
                                <p class="subtitle-des">일정 시간에 2~3일 간격으로 아침, 저녁 2회씩 측정을 권장해 드립니다.</p>
                                <div class="Blood_pressure_input">
                                    <span class="subtitle-des_ef">측정일시 : <fmt:formatDate value="${health.input_date}" pattern="yyyy.MM.dd HH:mm" /></span>
                                </div>
                            </div>
                            <div class="container_chart">

                                <div class="col-sm-6 ">
                                    <div>
                                        <h4 class="subtitle">수축기 혈압</h4>
                                    </div>
                                    <div class="health-main">
                                        <div class="skill">
                                            <div class="outer" id="outerL">
                                                <div class="inner">
                                                    <div id="number">
                                                        <p id="bp_high">${health.bp_high }</p>
                                                        <br><span class="result_1">●</span>
                                                        <p id="high_result">${bpHighResult.resultText}</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="160px"
                                                height="160px">
                                                <defs>
                                                    <linearGradient id="GradientColor">
                                                        <stop offset="0%" stop-color="#e91e63" />
                                                        <stop offset="100%" stop-color="#673ab7" />
                                                    </linearGradient>
                                                </defs>
                                                <circle class="${bpHighResult.cssCircle}" cx="80" cy="80" r="70" stroke-linecap="round" />
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 ">
                                    <div>
                                        <h4 class="subtitle">이완기 혈압</h4>
                                    </div>
                                    <div class="health-main">
                                        <div class="skill">
                                            <div class="outer" id="outerR">
                                                <div class="inner">
                                                    <div id="number1">
                                                        <p id="bp_low">${health.bp_low}</p>
                                                        <br><span class="result_1">●</span>
                                                        <p id="low_result">${bpLowResult.resultText}</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="160px"
                                                height="160px">
                                                <defs>
                                                    <linearGradient id="GradientColor">
                                                        <stop offset="0%" stop-color="#e91e63" />
                                                        <stop offset="100%" stop-color="#673ab7" />
                                                    </linearGradient>
                                                </defs>
                                                <circle class="${bpLowResult.cssCircle}" cx="80" cy="80" r="70" stroke-linecap="round" />
                                            </svg>
                                        </div>

                                    </div>
                                </div>
                            </div>
                          </div>
                            
                            
                            
                            <div class="container_ECG_record">
                                <div class="Blood_pressure_info">
                                    <span class="pressure_info1"> <span class="result_1">● </span> 정상 </span>
                                    <span class="pressure_info2"> <span class="result_3">● </span> 저혈압 </span>
                                    <span class="pressure_info3"> <span class="result_2">● </span> 고혈압 </span>
                                </div>
                                <span id="ECG_test">
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
                            
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
    
    <section class="works works-fit">
        <div class="container">
            <h2 class="subtitle">고혈압과 저혈압의 차이점 </h2>

            <br>
            <div class="Blood_pressure_diff">
                <img class="Blood_pressure_diff_img" src="resources/images/bloodpredif.png" alt="">
            </div>
            <br>
            <div class="row">
                <div class="container">
                    <h2 class="subtitle">혈압 관리에 대해서</h2>
                    <br><br>
                </div>
                <div class="iframebox">
                    <div class="col-sm-6">
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/RjkD77zbMUM"
                            title="YouTube video player" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                            allowfullscreen></iframe>
                    </div>


                    <div class="col-sm-6">
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/LzHMy2ScdhA"
                            title="YouTube video player" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                            allowfullscreen></iframe>

                    </div>
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
    <script>


        /* 수축기 혈압 숫자 
        counter == 입력받은 수축기 혈압
        }, 15 <- 퍼센테이지 딜레이 / 숫자가 낮으면 빠르게 느리면 천천히 숫자 카운트가 오름
        혹시 결과 분석 분류가 정상이 아니면 else문 span 태크 뒤에 글자를 변경해야한다.
        */
        let number = document.getElementById("number");
        let bp_highElement = document.getElementById("bp_high");
        let bp_high = parseInt(bp_highElement.innerHTML); // bp_high 값을 숫자로 변환
        let high_result = document.getElementById("high_result").innerText;
        console.log("수축기 결과", high_result);
        let counter = 0;
        let intervalId = setInterval(() => {
            if (counter == bp_high) { // bp_high 값을 사용하여 숫자 카운트 중지
                clearInterval(intervalId); // 타이머 중지
            } else {
                counter += 1;
                let resultText = high_result;
                if (high_result === "건강") {
                    resultText = "정상";
                    number.innerHTML = counter + "<br>" + "<span>●</span> " + resultText;
                    let span = number.querySelector("span");
                    span.classList.add("result_1");
                } else {
                    number.innerHTML = counter + "<br>" + "<span>●</span> " + resultText;
                    let span = number.querySelector("span");
                    switch (high_result) { // high_result 값에 따라서 클래스를 추가
                        case "저혈압":
                            span.classList.add("result_3");
                            break;
                        case "고혈압":
                            span.classList.add("result_2");
                            break;
                        default:
                            break;
                    }
                }
            }
        }, 15);


        /* 이완기 혈압 숫자 
        counter1 == 입력받은 이완기 혈압
        }, 15 <- 퍼센테이지 딜레이 / 숫자가 낮으면 빠르게 느리면 천천히 숫자 카운트가 오름
        */

        let number1 = document.getElementById("number1");
        let bp_lowElement = document.getElementById("bp_low");
        let bp_low = parseInt(bp_lowElement.innerHTML); // bp_high 값을 숫자로 변환
        let low_result = document.getElementById("low_result").innerText;
        console.log("이완기 결과", low_result);

        let counter1 = 0;
        let intervalId1 = setInterval(() => {
            if (counter1 == bp_low) { // bp_low 값을 사용하여 숫자 카운트 중지
                clearInterval(intervalId1); // 타이머 중지
            } else {
                counter1 += 1;
                let resultText = low_result;
                if (low_result === "건강") {
                    resultText = "정상";
                    number1.innerHTML = counter1 + "<br>" + "<span>●</span> " + resultText;
                    let span = number1.querySelector("span");
                    span.classList.add("result_1");
                } else {
                    number1.innerHTML = counter1 + "<br>" + "<span>●</span> " + resultText;
                    let span = number1.querySelector("span");
                    switch (low_result) { // low_result 값에 따라서 클래스를 추가
                        case "저혈압":
                            span.classList.add("result_3");
                            break;
                        case "고혈압":
                            span.classList.add("result_2");
                            break;
                        default:
                            break;
                    }
                }
            }
        }, 15);

     // 화면 캡쳐 기능
        $(function(){
            $("#ECG_test").on("click", function(){ // 버튼을 누르면 페이지로드 - captureArea(div)영역 캡쳐 - var image에 이미지 url을 담음 - <a>, id=downloadLink 인 href속성에 링크 담음 - <a>텍스트 눌렀을때 다운로드
                
                // 효과를 추가할 요소
                const outerL = document.querySelector("#outerL");
                const outerR = document.querySelector("#outerR");

                // 캡쳐되는 요소에 border 효과를 추가
                outerL.style.border = "6px solid rgba(0, 0, 70, 0.1)";
                outerR.style.border = "6px solid rgba(0, 0, 70, 0.1)";
                
                
                // 캡쳐 전에 scale을 2로 설정한다.
                html2canvas(document.querySelector(".capture"), { scale: 2 }).then(canvas => {
                    saveAs(canvas.toDataURL('image/png'),"혈압결과.png");
                    
                     // 캡쳐가 끝난 후에 다시 그림자 스타일 제거
                     outerL.style.border  = "";
                     outerR.style.border  = "";

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