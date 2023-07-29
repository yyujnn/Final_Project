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
    <title>Login</title>
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
    <link rel="stylesheet" href="resources/css/login.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .ion-ios-flask-outline,
		.ion-ios-lightbulb-outline,
		.ion-ios-americanfootball-outline,
		.ion-ios-keypad-outline,
		.ion-ios-barcode-outline{
			  display: inline-block;
			  margin-top: 25px; 
			}
    </style>

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


	<section id="blog-full-width" style="background-color: #f7f8fa; ">

	<section >
		<br>
    </section><!--/#Page header-->

    <section>


        <div class="container">
            <section id="formHolder">

                <div class="row">

                    <!-- Brand Box -->
                    <div class="col-sm-6 brand">
                        <video muted autoplay loop>
                            <source src="resources/images/loginvid2.mp4" type="video/mp4">
                        </video>
                        <div class="heading">
                            <h3 class="login_header">HearTrack</h3>
                            <p>Only for your health</p>
                        </div>

                        <div class="success-msg">
                            <p>회원가입 완료! <br> 지금 바로 다양한 콘텐츠를 <br> 무제한으로 즐겨보세요.</p>
                            <a href="#" class="profile">바로가기</a>
                        </div>
                    </div>


                    <!-- Form Box -->
                    <div class="col-sm-6 form">

                        <!-- Login Form -->
                        <div class="login form-peice ">
                            <form class="login-form" action="${cpath}/loginProcess" method="post">
                                <div>
                                    <p class="sinup_form_header">로그인</p>
                                    <br>
                                </div>
                                <div class="form-group">
                                    <label for="loginemail">아이디 입력</label>
                                    <input type="text" name="user_id" id="loginemail" required>
                                </div>

                                <div class="form-group">
                                    <label for="loginPassword">비밀번호 입력</label>
                                    <input type="password" name="user_pw" id="loginPassword" required>
                                </div>
                                <div class="CTA CTA2">
                                    <button class="btn" type="submit"><span>로그인</span></button>
                                    <a href="#" class="switch">회원가입하기</a>
                                </div>
                            </form>
                            <div class="login_icon_group">
                                <p>SNS 간편 로그인</p>
                                <button class="icon_btn">
                                    <img class="login_icon" src="resources/images/네이버.png" alt="">
                                </button>
                                <span>|</span>
                                <button class="icon_btn">
                                    <img class="login_icon" src="resources/images/카카오.png" alt="">
                                </button>
                            </div>
                        </div><!-- End Login Form -->


                        <!-- Signup Form -->
                        <div class="signup form-peice switched">
                            <form class="signup-form" action="${cpath}/join" method="post">
                                <div>
                                    <p class="sinup_form_header">회원 가입</p>
                                </div>
                               
									
									    <div class="form-group">
										        <label for="name">아이디 입력</label>
										        <input type="text" name="user_id" id="id" class="id" style="margin-right:5px;" check_result="fail" required>
										        <span class="error"></span>
								 			<div class="form-group_check">
	                                        	<button type="button" id="idck" onclick="id_overlap_check()" >중복 확인</button>
											    <img src="resources/images/bluecheck.png" id="id_check_sucess" style="display: none; width: 25px; height: 25px;">
	                                    	</div>
									    </div>
									
								
                                <div class="form-group">
                                    <label for="password">비밀번호 입력</label>
                                    <input type="password" name="user_pw" id="password" class="pass">
                                    <span class="error"></span>
                                </div>

                              
                                <div class="form-group">
                                    <label for="name">이름 입력</label>
                                    <input type="text" name="user_name" id="name" class="name">
                                </div>

                                <div class="form-group">
                                    <label for="name">나이 입력</label>
                                    <input type="number" name="user_age" id="age" class="age">
                                </div>
                                <div class="form-group select">
                                    <label for="name">성별 선택</label>
                                    <div class="select_group">
                                        <input type="radio" id="select" name="user_gender" value="여"><label for="select">남성</label>
                                        <input type="radio" id="select2" name="user_gender" value="남"><label for="select2">여성</label>
                                    </div>
                                </div>



                                <div class="CTA">
                                    <button class="btn" type="submit" onclick="idck_confirm()"><span>회원가입</span></button>
                                    <a href="#" class="switch">로그인</a>
                                </div>
                            </form>
                        </div><!-- End Signup Form -->
                    </div>
                </div>

            </section>



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
    
    <script type="text/javascript">
	   

	    function idck_confirm(){
	    	
	    	if ($('#id').attr("check_result") == "fail"){
		        alert("아이디 중복체크를 해주시기 바랍니다.");
		        $('#id').focus();
		        return false;
		      }
	    }
    
	    function id_overlap_check() {
			
	    	// 중복확인 하고 아이디 수정하면 다시 체크 이미지 -> 중복확인 버튼으로
	    	// check_result를 fail로 = 제출이 불가하도록
	        //$('#id').change(function () {
	          $('#id').on('input', function() {
           	  $('#id_check_sucess').hide(); // 체크이미지 다시 숨김
	          $('#idck').show(); // 중복확인 버튼 다시 띄우기
	          $('#id').attr("check_result", "fail"); // input 태그 check_result를 fail로
	        })

			// 아무 값도 입력하지 않고 중복 확인 눌렀을때 - alert 만 띄움
	        if ($('#id').val() == '') {
	          alert('아이디를 입력해주세요.')
	          return;
	        }
			
	    	// 사용자가 id로 입력한 값 
	        //var id_overlap_input = document.querySelector('input[name="user_id"]');
	        var id_overlap_input = document.querySelector('#id');
			console.log("input value >> ",id_overlap_input.value);
	        
			$.ajax({
	          url: "idcheck",
	          data: {
	            user_id: id_overlap_input.value
	          },
	          datatype: 'json',
	          success: function (data) {
	        	  
	            console.log("controller 에서 넘어온>> ",data['overlap']); // 겹쳤을때 fail 이라고 뜸
	            if (data['overlap'] == "fail") {
	              alert("이미 존재하는 아이디 입니다.");
	              id_overlap_input.focus();
	              return;
	            } else {
	              alert("사용가능한 아이디 입니다.");
	              $('#id').attr("check_result", "success");
	              $('#id_check_sucess').show();
	              $('#idck').hide();
	              return;
	            }
	          }
	        });
	      }
			                
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
    
    <!--login js-->
    <script src="resources/js/login.js"></script>
   
</body>

</html>