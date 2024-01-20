<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/inc/include.jspf"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


		

	
<div id="Contents">

	<div class="reviewer-profile-wrap clrfix">
           
<div class="reviewer-profile-info profile-top-reviewer-v1  ">
       	
       	
	<div class="top-reviewer-inner">
                  
                 <!-- 탑리뷰어언서 UI추가 -->
              <div class="top-reviewer-profile">
                  <div class="profile-top-content">
                  
                      <div class="thum">
                          <img src="${ profile.profileImg }" class="profileThum_s" alt="프로필 이미지" onerror="common.errorProfileImg(this);">
                      </div>

                      <div class="new-profile-info">
                          <!-- 등급 rate_01, rate_02, rate_03, rate_04, rate_05 -->
                          <div class="user-id-area rate_05">
                              
                                  
                                  
                                      <!--[D] 나의 프로필 닉네임 노출 on 클래스 -->
                                      <p class="id my-profile on">
                                          <strong>${ profile.nickname }</strong>
                                          <span class="badge-img">
                                              <span class="blind">멤버십 등급별 이미지</span>
                                          </span>
                                      </p>
                                  
                              
                          </div>

                          <div class="profile-badge on">
                              
                              
                          </div>
                      </div>
                  </div>
                  <div class="profile-info-content">
                      
                          <div class="profile-keyword-area">
                              
                                  
                                  
                                  <ul class="profile-keyword-list on">
                                      
                                        <c:choose>
                                        	<c:when test="${ not empty profile.skintypeId }">
                                        		      
                                         		<li class="list-item">${ profile.skintypeName }</li>
                                           
                                               <li class="list-item">${ profile.skintoneName }</li>
                                           	
                                           	<c:choose>
                                            	<c:when test="${ fn:length(troubleVO) >= 2 }">
                                            		<c:forEach items="${ troubleVO }" var="trouble" begin="0" end="2">
                                                  <li class="list-item">${ trouble.skintroubleName }</li>
                                                  
                                                 </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                	<c:forEach items="${ troubleVO }" var="trouble">
                                                	<li class="list-item">${ trouble.skintroubleName }</li>
                                                	</c:forEach>
                                                	<c:forEach items="${ categoryVO }" var="category" begin="0" end="1">
                                                	<li class="list-item">${ category.interestName }</li>		                                                    	
                                                	</c:forEach>
                                               	</c:otherwise>
                                               </c:choose>
                                        	</c:when>
                                        	<c:otherwise>
                                         	<a href="${pageContext.request.contextPath}/profile/profileedit" class="nickname-text on" data-attr="리뷰어프로필^피부컨디션^피부타입을 설정해주세요">
                                           피부타입을 설정해주세요
                                       	</a>
                                        	</c:otherwise>
                                        </c:choose>  
                                            
                                  </ul>
                              
                          </div>
                      

                              <p class="top-reviewer-info on">
                                  
                                  ${ profile.profileContent }
                                      
                                      <br>
                                  
                              </p>
                          
                      
                  </div>
              </div>
              <!-- // 탑리뷰어언서 UI추가 -->
              
                  <ul class="reviewer-profile-info__bottom reviewer-data-info">
                      <li class="reviewer-data-info__list">
                          <span id="recommedCnt" class="num">
                              
                                  
                                    ${ profile.reviewLikeTotal }
                                  
                                  
                              
                          </span>
                          <span class="txt">도움</span>
                      </li>
                      <li class="reviewer-data-info__list">
                          <a href="#" class="button-follower">
                              <span class="num" id="followerCount">
                                  ${ profile.follower }
                              </span>
                              <span class="txt">팔로워</span>
                          </a>
                      </li>
                      <li class="reviewer-data-info__list">
                          <a href="#" class="button-follower">
                              <span class="num" id="followingCount">
                                  ${ profile.following }
                              </span>
                              <span class="txt">팔로잉</span>
                          </a>
                      </li>
                  </ul>
               
          </div>


    	
          <div class="reviewer-profile-button-area">
              
                  <!-- [D] 프로필 수정 노출 on 클래스 -->
                  <div class="user-edit-area on">
                      <!-- 프로필 수정 버튼 추가 :: 수정 페이지에서는 버튼 사라짐 :: 시작 -->
                      <a href="${pageContext.request.contextPath}/profile/profileedit" class="reviewer-button reviewer-button--update" onclick="">프로필 수정</a>
                      <!-- 프로필 수정 버튼 추가 :: 끝 -->
                      <button type="button" class="btn-user-graph" onclick="" data-attr="리뷰어프로필^나의리뷰활동^나의활동내역">
                          <span class="blind">나의 리뷰 활동 버튼</span>
                          <%-- 리뷰 활동을 확인하는 모달창을 띄우는 스크립트 --%>
                      </button>
                  </div>
              
          </div>
          
          
      </div>

      <!-- reviewer-profile-info :: 리뷰어 프로필 끝 -->

      <!-- 누적리뷰영역 -->
       <%-- 
          
          <div class="reviewer-profile-content">


                  <div class="reviewer-profile-content__header">
                      <div>
                          누적 리뷰 <span>
                          
                           <!-- 누적 리뷰 개수 -->
                          
                      </span>
                      </div>
                      <div class="select-order">
                          <button type="button" class="select-order__selected">최근작성순</button>
                          <ul class="select-order__list-wrap" id="reviewSort">
                              <li class="select-order__list" data-value="01" data-attr="리뷰어프로필^리뷰필터^높은도움순">높은도움순</li>
                              <li class="select-order__list" data-value="02" data-attr="리뷰어프로필^리뷰필터^낮은도움순">낮은도움순</li>
                              <li class="select-order__list select-order__list--active" data-value="03" data-attr="리뷰어프로필^리뷰필터^최근작성순">최근작성순</li>
                              <li class="select-order__list" data-value="04" data-attr="리뷰어프로필^리뷰필터^별점높은순">별점높은순</li>
                              <li class="select-order__list" data-value="05" data-attr="리뷰어프로필^리뷰필터^낮은별점순">낮은별점순</li>
                          </ul>
                      </div>
                  </div>

                  <!-- reviewer-profile-content__body :: 누적리뷰 리스트 시작 -->
                  <div class="reviewer-profile-content__body" id="reviewerGdasList">
                      
                      
                  <!-- 처음 약 10개 로딩, 그 이후 스크롤시 ajax로 10개 더 불러오기 -->
                          
                      <div class="rw-box">
                          
                          
                              
                              
                                  <a href="<!-- 리뷰한 상품 상세로 이동 -->" onclick="mypage.gdasList.moveGoodsDetailReview('A000000181612','리뷰어프로필_리뷰상품', {t_page: _isMyProfilePageYN === 'Y' ? '내프로필' : '리뷰어프로필', t_click: '리뷰탭_상품상세', goodsNo: 'A000000181612', goodsname: '[브라이언 PICK] 마르시끄 링클 리페어 팔자 주름패치 36개'})" class="rw-box__link" data-attr="리뷰어프로필^리뷰상품^상품클릭">
                              
                              <div class="rw-box-figure">
                                  <div class="rw-box-figure__img">
                                      
                                      
                                          <img src="<!-- 상품표시이미지 -->" alt="<!-- 상품표시명 -->" onerror="common.errorImg(this);">
                                      
                                  </div>
                                  <div class="rw-box-figcaption">
                                      
                                      <p class="rw-box-figcaption__brand"><!-- 브랜드명 --></p>
                                      
                                      <p class="rw-box-figcaption__name"><!-- 상품표시명 --></p>
                                      
                                  </div>
                              </div>
                          </a>
                          
                          
                          
                          <a href="<!-- 리뷰 상세보기 모달창 -->" class="rw-box__link" onclick="mypage.reviewerInfo.goReviewDetail('24597496')" data-attr="리뷰어프로필^더보기^더보기">
                              <div class="rw-box__first-line">
                                  <span class="review_point">
                                  <!-- 별점에 따른 표시 스크립트 -->
                                      <span class="point" style="width:100%">5점만점에 5점</span>
                                  
                                  </span>
                                  <span class="review_point_text">
                                      <span>작성일자 <!-- 작성일자 --></span>
                                      
                                      
                                          <span class="ico_offlineStore"><!-- 구매위치(매장,온라인...) --></span>
                                      
                                      
                                  </span>
                              </div>
                               

                              <div class="rw-box__second-line">
                                  <!-- 구매 태그 -->
                                      <span>재구매</span>
                                  
                                  
                                  
                                      <span>한달이상사용</span>
                                  
                              </div>
                                  
                              <p class="rw-box__description">
							<!-- 리뷰 내용 -->
							</p>
				                              
                          </a>
                          
                              <div class="review_tag">
                                  <!-- 리뷰 태그 -->
                                      <span>팔자패치</span>
                                  
                                      <span>나이트</span>
                                  
                              </div>
                          
                          
                          
                          <div class="rw-box__bottom">
                              <div class="rw-box__help">
                                  
                                 
                                 
                                     <button type="button" class="common-event-help unlike" id="profile_gdas_24597496" onclick="goods.gdas.setRecommGdasToggle('24597496','N', {t_page: '리뷰어프로필', t_click: '리뷰어프로필_도움이돼요', gdas_seq: '24597496', goodsNo: 'A000000181612', goodsname: '[브라이언 PICK] 마르시끄 링클 리페어 팔자 주름패치 36개'}, 'profile_');">
                                         <span>도움이 돼요</span>
                                         <span class="num">
                                         
                                             
                                             <!-- 리뷰 도움 개수 -->
                                         
                                         </span>
                                     </button>
                                 
                                 
                             
                                  <input type="hidden" name="recommCnt_24597496" value="<!-- 리뷰 도움 개수 -->">
                              </div>
                              
                              
                                  <button type="button" class="rw-box__help-btn" data-attr="리뷰어프로필^신고하기^신고하기" onclick="mypage.reviewerInfo.goDclPop('24597496', 'A000000181612', '001', 'N', {t_page: '리뷰어프로필', t_click: '리뷰탭_리뷰신고하기', gdas_seq: '24597496', goodsNo: 'A000000181612', goodsname: '[브라이언 PICK] 마르시끄 링클 리페어 팔자 주름패치 36개'});">신고하기</button>
                              
                          </div>
                          
                      </div>
                        
                          
                  </div>
                  <!-- reviewer-profile-content__body :: 누적리뷰 리스트 끝 -->
              </div>
          
            --%>
            <!-- 누적리뷰영역 -->
        </div>

        
</div>


