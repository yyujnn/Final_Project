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
    <title>커뮤니티</title>
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
    <link rel="stylesheet" href="resources/css/style7_com.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
	
	// 페이지 로딩이 완료된 후 실행
	  $(document).ready(function() {
	    // 카테고리 선택 시 동작할 함수
	    function filterCategory(category) {
	      // 모든 게시글을 숨김 처리
	      $(".blog-content").hide();
	      // 선택한 카테고리에 해당하는 게시글만 보여줌
	      $(".blog-content[data-category='" + category + "']").show();
	    }

	    // 카테고리 선택 링크 클릭 이벤트 처리
	    $(".category-link").click(function() {
	      var selectedCategory = $(this).data("category");
	      filterCategory(selectedCategory);
	    });

	    // '모두 보기' 클릭 시 모든 게시글 보여주기
	    $(".show-all").click(function() {
	      $(".blog-content").show();
	    });
	  });
	
    // 댓글
    var user_id = '${userInfo.user_id}'; // 로그인 되어있는 user_id

	 // [함수] 초기 댓글 리스트 가져옴
	 function getInitialComments() {
	   // ajax 요청을 통해 초기 댓글 리스트 가져오기
	   $.ajax({
	     url: 'getComments',
	     success: function (res) {
	       console.log(res);  // select all 해온 댓글리스트 commRes (+user_name)
	
	       // 리스트순서를 돌며, 
	       for (var i = 0; i < res.length; i++) {
	         var comm = res[i]; // [i]번 순서의 댓글 객체 1개
	         var p_num = comm.p_num; // 반복문을 통해 숫자 p_num 하나씩 가져온다.
	         var commlistDiv = $('div[id="comment-list-' + p_num + '"]'); // 해당하는 댓글추가할 <div>
	
	         var comment = document.createElement("div"); // 변수 comment = div를 생성.
	         comment.className = "comment"; // className = comment
	         comment.innerHTML = "<span class='comment-user'>" + res[i].user_name + ": </span> " + res[i].content; // innerHTML = 유저아이디 : + [내용] 으로 이뤄짐
	
	         //console.log(comment)
	         commlistDiv.append(comment); // 만든 div를 append
	       }
	
	     },
	     error: function (xhr, status, error) {
	       console.log('에러!');
	     }
	   });
	 }
	
	
	
	 // [함수] 조회해온 댓글리스트를(=res) 화면단에 띄움
	 function addComment(p_num, res) { // 변수 p_num 과 조회한 Arraylist res
	   // "comment-input-" + p_num : 각각의 게시글에 해당하는 입력창의 id 
	   var commentInput = document.getElementById("comment-input-" + p_num); // <input>선택
	   var commentList = document.getElementById("comment-list-" + p_num); // 댓글이 추가될 위치 선택
	
	   if (commentInput.value !== "") { // input 비어있지 않을때
	
	     for (let i = 0; i < res.length; i++) {
	
	       var comment = document.createElement("div"); // 변수 comment = div를 생성.
	       comment.className = "comment"; // className = comment
	       comment.innerHTML = "<span class='comment-user'>" + res[i].user_name + ": </span> " + res[i].content; // innerHTML = 유저아이디 : + [내용] 으로 이뤄짐
	       commentList.appendChild(comment); // 만든 div를 append
	       commentInput.value = ""; // 해당하는 input 창 clean 
	     }
	   }
	   var commentButton = document.getElementById("comment-button-" + p_num);     // 해당게시글의 버튼 선택
	   commentButton.style.color = "rgb(199, 235, 245)";         // 댓글 추가 후 버튼 색상 초기화
	 }
	
	
	
	 // [document ready event]
	 $(function () {
	   getInitialComments(); // document load 후 초기 댓글 띄우기
	
	   $('.review_upload').on('click', function () {
	
	     var rvbtn = $(this);
	     var id = rvbtn.attr('id');
	     var p_num = id.replace('comment-button-', '');
	     var content = $('input[id="comment-input-' + p_num + '"]').val();
	
	
	     console.log('p_num >>', p_num);
	     console.log('content >>', content);
	     console.log('user_id >>', user_id);
	
	     $.ajax({
	       url: 'commentReg',
	       method: 'POST',
	       dataType: 'json',
	       data: {
	         content: content,
	         p_num: p_num,
	         user_id: user_id
	       },
	       success: function (res) { // res 로 받을 것 = p_num 으로 보내준 값에 해당하는 content, user_name
	
	         console.log(res);
	
	         //해당 댓글 추가란 비우기
	         $('div[id="comment-list-' + p_num + '"]').empty();
	
	         addComment(p_num, res);
	
	
	       },
	       error: function (xhr, status, error) {
	         console.log('에러!');
	       }
	     });
	   });
	 });
</script>

<style type="text/css">
	.subtitle-des{
		text-align: center;
	}
</style>

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
                    
                    	<a href="register" class="button_ECG btnPush_ECG">등록하기</a>
                	
                </div>
                
               
                <div class="col-md-4" style="width : 50%;" !important>
                
                
                <!-- 게시글 반복문 !!!!!!!! -->
                <c:forEach items="${comlist}" var="com" varStatus="loop" >
                 
                 <article id="post-${com.p_num}"class="wow fadeInDown" data-wow-delay=".3s" data-wow-duration="500ms"
                        style="margin-top: ${loop.first ? '60px' : '0'};" data-category="${com.category}">
                        <div class="blog-content">
                            <div style="display: flex; align-items: center;">
                               
                            	 <%-- 여성인 경우 --%>
								<c:if test="${com.user.user_gender eq '여'}">
									<img class="user-icon"  src="resources/images/woman.png">
								</c:if>
									
								<%-- 남성인 경우 --%>
								<c:if test="${com.user.user_gender eq '남'}">
									<img class="user-icon"  src="resources/images/man.png">
								</c:if>
                                
                                <h3 class="blogpost-title">${com.user.user_name}</h3>
                            </div>
                            <div class="blog-meta">
                                <span><fmt:formatDate pattern="yyyy년 MM월 dd일 a h:mm" value="${com.input_date}" /></span>
                            </div>
                            <p> ${com.content}</p>
                            <div class="blog-post-image">
                                <c:choose>
							    <c:when test="${com.ecg_num != null}">
							        <div class="card-container">
							            <div class="card_fr">
							                <div class="front">
							                    <div class="subtitle-des_healthcard">
							                        <img src="resources/images/ecg_com_icon.png" alt=""> <strong>ECG</strong> <span class="subtitle-des_ef">
							                            ${com.ecg.resultsText}이고
							                             <span style="color: rgb(255, 118, 140);">♥ </span>  ${com.ecg.hr} bpm입니다.
							                        <br> <div class="wr_card_date">
		                                              <span class="wr_card_date_1"><fmt:formatDate value="${com.ecg.input_date}" pattern="yyyy년 MM월 dd일 a h:mm" />
							                   		 </span>
                               					 </div>
							                   
							                    </div>
							                </div>
							            </div>
							        </div>
							    </c:when>
							    <c:when test="${com.h_num != null}">
							    	<c:set var="bp_high" value="${com.health.bp_high}" />
        							<c:set var="bs_emp" value="${com.health.bs_emp}" />
        
							    
							       <c:if test="${bp_high == 0}">
							            <!-- 출력할 혈당 카드 -->
							            <div class="card-container">
							                <div class="card_fr">
							                    <div class="front">
							                        <div class="subtitle-des_healthcard">
							                            <img src="resources/images/혈당아이콘.png" alt=""> 나의 공복혈당은 <span class="subtitle-des_ef">
							                                ${com.health.bs_emp}mg/dL
							                            </span>이고, 식후혈당은 <span class="subtitle-des_ef">${com.health.bs_ful}mg/dL</span> 입니다.
							                            <br><div class="wr_card_date">
		                                                <span class="wr_card_date_1"> <fmt:formatDate value="${com.health.input_date}" pattern="yyyy년 MM월 dd일 a h:mm" />
							                         	</span>
                               						 </div>
		                                                
							                        </div>
							                    </div>
							                </div>
							            </div>
							        </c:if>
							        <c:if test="${bs_emp == 0}">
							            <!-- 출력할 혈압 카드 -->
							            <div class="card-container">
							                <div class="card_fr">
							                    <div class="front">
							                        <div class="subtitle-des_healthcard">
							                            <img src="resources/images/혈압아이콘.png" alt=""> 나의 최고혈압은 <span class="subtitle-des_ef">
							                                ${com.health.bp_high}mmHg
							                            </span>이고, 최저혈압은 <span class="subtitle-des_ef">${com.health.bp_low}mmHg</span> 입니다.
							                            <br> <div class="wr_card_date">
		                                              <span class="wr_card_date_1"><fmt:formatDate value="${com.health.input_date}" pattern="yyyy년 MM월 dd일 a h:mm" />
							                        	</span>
                               						 </div>
							                        </div>
							                    </div>
							                </div>
							            </div>
							        </c:if>
							        
							        
							    </c:when>
							    <c:otherwise>
							    
							    </c:otherwise>
							</c:choose>

                                
                            </div>
                            
                            
                            
                            <!-- 좋아요 댓글  -->

							<div style="display: flex; align-items: center;">
						        <span class="like-btn" data-p-num="${com.p_num}"></span>
						        <button class="spBubble">
						          <i class="xi-speech-o xi-2x" style="color:  #667887;"></i>
						        </button>
						    </div>

                            <div class="like-count"> 
                                <span id="like-count-${com.p_num}">좋아요 ${com.likes}개</span>
                            </div>


                            <hr style="border: 0.5px solid rgb(213, 213, 213);">

                            <div id="comment-list-${com.p_num}" class="comment-list">
                            		<!-- 새로 댓글이 생성되는 자리 -->
                            </div>

                            <div class="comment-section">
                            <ul>
                                <li>
                                <img class="smile" src="resources/images/smile.png" alt="smile">
                                </li>
                            </ul>
                            <input id="comment-input-${com.p_num}" class="input_review" type="text" oninput="inputReview(${com.p_num})" placeholder="댓글 달기..." >
							<button id="comment-button-${com.p_num}" class="review_upload" >게시</button>

                            </div>
                           

                        </div>
                    </article>
 
                    <div style="background-color: #fcfcfc; height: 10px;"></div>
                   
                 </c:forEach>
                 
                  <!-- 게시글 반복문 끝 !! -->
                 
                  
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
                                    <span class="recent">${comlist[0].content}</span><br>
                                    <time><fmt:formatDate pattern="yyyy년 MM월 dd일 a h시 mm분" value="${comlist[0].input_date}" /></time>
                                </li>
                                <li>
                                    <span class="recent">${comlist[1].content}</span><br>
                                    <time><fmt:formatDate pattern="yyyy년 MM월 dd일 a h시 mm분" value="${comlist[1].input_date}" /></time>
                                </li>
                                <li>
                                    <span class="recent">${comlist[2].content}</span><br>
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