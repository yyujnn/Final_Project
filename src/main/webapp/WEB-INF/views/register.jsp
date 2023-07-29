<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html class="no-js">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="icon" href="resources/images/ht_favicon.png">
    <title>글작성</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="resources/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/plugins/ionicons/ionicons.min.css">
    <link rel="stylesheet" href="resources/plugins/animate-css/animate.css">
    <link rel="stylesheet" href="resources/plugins/slider/slider.css">
    <link rel="stylesheet" href="resources/plugins/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="resources/plugins/owl-carousel/owl.theme.css">
    <link rel="stylesheet" href="resources/plugins/facncybox/jquery.fancybox.css">
    <link rel="stylesheet" href="resources/css/community.css">
    <link rel="stylesheet" href="resources/css/style7.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

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
                        <img src="resources/images/logo.png" alt="" stlye="width : 130px" !important>
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

    <section id="blog-full-width" style="background-color: #fcfcfc; ">
        <div class="container">
            <div class="row">
                <div class="col-md-4" style="width : 20%" !important>
                    <div class="sidebar">
                        
                        <div class="author widget" style="background-color: #fff; margin-bottom: 10px">
                            <img class="img-responsive" src="resources/images/profile_img.png.webp">
                            <div class="author-body text-center">
                                <div class="author-img">
                                   
                                    <%-- 여성인 경우 --%>
									<c:if test="${userInfo.user_gender eq '여'}">
									  <img src="resources/images/woman.png">
									</c:if>
									
									<%-- 남성인 경우 --%>
									<c:if test="${userInfo.user_gender eq '남'}">
									  <img src="resources/images/man.png">
									</c:if>
                                </div>
                                <div class="author-bio">
                                    <h4>${userInfo.user_name}</h4>
                                    <p>Discover the joy of a healthy, happy life!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    				
						                	
                	
                </div>
                
               
                <div class="col-md-4" style="width : 50%;" !important>
                
                <article class="wow fadeInDown" style="margin-top:60px; padding-bottom: 80px;">
	                <section id="feature" style="padding-top : 20px">
	                <form action="${cpath}/registerForm" methon="post">
	                        <div class="container">
	                            <div class="container_ECG_record" style="width : 50%;">
	                                <span class="subtitle">게시글 쓰기</span>
	                				
					                  
	                
	                            </div>
	                            
	                            <div>
	                                <div class="Blood_pressure_input add_write_section">
	                                   
	                                        <p class="subtitle-des_ef1 pressure_input"><strong>내용 입력</strong></p>
	                                        <textarea class="pressure_input text_ar" name="content" id="" cols="30" rows="10"></textarea>
	                                   
	                                </div>
	                            </div>
	                            <div class="container">
	                            
	                          
	                                        <div class="artboard" >
                                        <div class="button_add">
                                            <div class="links">
                                                <span>
                                                    <div class="checks etrans">
                                                        <input type="radio" id="add_ECG" value="ecg" name="check">
                                                        <label for="add_ECG">ECG</label>
                                                    </div>
                                                  
                                                    <div class="checks etrans">
                                                        <input type="radio" id="add_Sug" value="bs" name="check" >
                                                        <label for="add_Sug">혈당</label>
                                                    </div>
                                                    
                                                     <div class="checks etrans">
                                                       <input type="radio" id="add_Pre" value="bp" name="check" >
                                                       <label for="add_Pre">혈압</label>
                                                   </div>
                                                </span>
                                                <div class="overlay"><a>나의 건강정보 공유하기</a></div>
                                            </div>
                                            
                                            
                                        </div>
                                        
                                    </div>
	                                 
	                            	
	                                <div class="health_Card">
	                                    <div class="card-container">
	                                    
		                                    <div class="card_fr">
		                                        <div class="front">
		                                            <div class="subtitle-des_healthcard">
		                                            <img src="resources/images/ecg_com_icon.png" alt=""> <strong>ECG</strong> 검사 결과는 <span class="subtitle-des_ef">
		                                                ${empty LatestEcg.resultsText ? '결과없음' : LatestEcg.resultsText}이고 
		                                                <span style="color: rgb(255, 118, 140);">♥ </span>  ${empty LatestEcg.hr ? '결과없음' : LatestEcg.hr}  bpm입니다.
		                                            <br> <div class="wr_card_date">
		                                              <span class="wr_card_date_1"><fmt:formatDate value="${LatestEcg.input_date}" pattern="yyyy년 MM월 dd일 a h:mm" />
		                                             </span>
                               						 </div>
		                                            </div>
		                                        </div>
		                                        <img class = "test1" src="resources/images/com_ecg.png" alt=""> 
		                                    </div>
		                                </div>
		                                <div class="card-container">
		                                    <div class="card_fr">
		                                        <div class="front">
		                                            <div class="subtitle-des_healthcard">
		                                                <img src="resources/images/혈당아이콘.png" alt=""> 나의 공복혈당은 <span class="subtitle-des_ef">
		                                                    ${empty LatestBs.bs_emp ? '-' : LatestBs.bs_emp}mg/dL
		                                                </span>이고, 식후혈당은 <span class="subtitle-des_ef"> ${empty LatestBs.bs_ful ? '-' : LatestBs.bs_ful}mg/dL </span> 입니다.
		                                                <br> <div class="wr_card_date">
		                                                <span class="wr_card_date_1">
		                                                	<fmt:formatDate value="${LatestBs.input_date}" pattern="yyyy년 MM월 dd일 a h:mm" />
		                                                </span>
                               						 </div>
		                                                
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                <div class="card-container">
		                                    <div class="card_fr">
		                                        <div class="front">
		                                            <div class="subtitle-des_healthcard">
		                                                <img src="resources/images/혈압아이콘.png" alt=""> 나의 최고혈압은 <span class="subtitle-des_ef">
		                                                   ${empty LatestBp.bp_high ? '-' : LatestBp.bp_high}mmHg
		                                                </span>이고, 최저혈압은 <span class="subtitle-des_ef"> ${empty LatestBp.bp_low ? '-' : LatestBp.bp_low}mmHg </span> 입니다.
		                                                <br> <div class="wr_card_date">
		                                                <span class="wr_card_date_1"><fmt:formatDate value="${LatestBp.input_date}" pattern="yyyy년 MM월 dd일 a h:mm" />
		                                            	</span>
                               						 </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                
	                                    
	                                </div>
					                <button type="submit" style="position: absolute; right: 5%; background-color: #1875FF; opacity: 0.9; color: white; background-size: cover; padding: 15px 35px; font-size: 16px; line-height: 1em; text-transform: uppercase; letter-spacing: normal; border-radius: 8px; box-shadow:  0 2px 5px 0 rgba(0, 0, 0, 0.04), 0 2px 10px 0 rgba(0, 0, 0, 0.06); border: 0px; font-weight: bold;">등 록</button> 
					               
	                            </div>
	                            </form>
	                    </section>
                      </article>
                 
                </div>
                <!-- Sidebar -->
                <div class="col-md-4" style="width : 30%;" !important>
                    <div class="sidebar">
                        <div class="categories widget">
                            <h3 class="widget-head">카테고리</h3>
                            <ul>
                                <li>
								    <a href="#" onclick = "location.href='${cpath}/choose'">◼ 공지사항</a>
								</li>
								<li>
								    <a href="#" onclick="location.href='${cpath}/base'">◼ 일반</a>
								</li>
								<li>
								    <a href="#"  onclick="location.href='${cpath}/community'">◼ 모두 보기</a>
								    <!-- 'all' 값을 전달하여 모든 게시글을 보여주도록 처리 -->
								</li>
   
                            </ul>
                        </div>
                        <div class="recent-post widget">
                            <h3>최근 게시물</h3>
                            <ul>
                                <li>
                                    <a href="community">${comlist[0].content}</a><br>
                                    <time><fmt:formatDate pattern="yyyy년 MM월 dd일 a h시 mm분" value="${comlist[0].input_date}" /></time>
                                </li>
                                <li>
                                    <a href="community">${comlist[1].content}</a><br>
                                    <time><fmt:formatDate pattern="yyyy년 MM월 dd일 a h시 mm분" value="${comlist[1].input_date}" /></time>
                                </li>
                                <li>
                                    <a href="community">${comlist[2].content}</a><br>
                                    <time><fmt:formatDate pattern="yyyy년 MM월 dd일 a h시 mm분" value="${comlist[2].input_date}" /></time>
                                   
                                </li>

                            </ul>

                        </div>
                        
                        

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
    </footer>

    <!-- Template Javascript Files
	================================================== -->
    <!-- jquery -->
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

    <script src="resources/js/community.js"></script>

</body>

</html>