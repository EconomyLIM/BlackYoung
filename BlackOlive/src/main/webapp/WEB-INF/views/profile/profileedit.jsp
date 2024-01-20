<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/inc/include.jspf"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



	<div id="Contents">
		<div class="reviewer-profile-wrap clrfix">
			
			
			<div class="reviewer-profile-info profile-top-reviewer-v1 ">
				
				
       	
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
			
			<div class="reviewer-profile-content">
			
				<!-- reviewer-profile-content__header :: 프로필 수정 시작 -->
				<div class="reviewer-profile-content__header">
					<div>프로필 수정</div>
				</div>
				<!-- reviewer-profile-content__header :: 프로필 수정 끝 -->
				<!-- reviewer-profile-content__body :: 프로필 본문 시작 -->
				<form id="addInfoForm" action="" method="POST"><!-- form은 레이아웃에 영향이 가지 않습니다.-->
					<div class="reviewer-profile-content__body">
						<!-- 기본 프로필 :: 시작 -->
						<div class="reviewer-update first-section">
						
							<p class="reviewer-update__tit">기본 프로필</p>
							<ul class="reviewer-update__content">
								<li>
									<div class="reviewer-update__head">프로필 이미지</div>
									<div class="reviewer-update__data">
										<div class="review-preview-img">
											<canvas id="canvas" style="display:none;"></canvas>
											<input type="hidden" id="fileName" name="fileName">
											<input type="hidden" id="appxFilePathNm" name="appxFilePathNm" value="2023/11/06/1699251894483.png">
											<input type="hidden" id="appxFileNm" name="appxFileNm" value="1699251894483.png">
											<input type="hidden" id="useYn" name="useYn" value="Y">
											<div id="previewImgArea" class="review-preview-img__area">
												
													
														<span id="thumbnail" class="reviewer-profile-img--active" style="background-image: ${ profile.profileImg } display: none;"><span class="review-text-hidden">프로필 사진</span></span>
													
												
											</div>
											<%-- 회원 이미지 업로드 부분 --%>
											<div class="review-preview-img__btns"><!-- 이미지 업로드 / 취소 버튼 -->
												<label for="thumbnailFile"><span class="review-text-hidden">파일 업로드</span></label>
												<input id="thumbnailFile" type="file" accept="image/*">
												<button id="thumbnailClearBtn" type="button"><span class="review-text-hidden">취소</span></button>
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="reviewer-update__head">닉네임</div>
									<div class="reviewer-update__data" style="display: flex;">
                                        <div class="nickname-wrapper">
                                            <input id="nicknameInput" class="reviewer-update-input" type="text" name="mbrNickNm" value="${ profile.nickname }" placeholder="닉네임을 설정해 주세요.">
                                            <p id="nicknameInfo" class="txtinfo">이름보다는 별명을 적어주세요</p>
                                            <span id="nicknameStatus" class="validation-check--status valid" style="display:none">사용 가능한 닉네임입니다</span>
                                        </div>
										<button id="nicknameCheckBtn" type="button" class="validation-check-btn" style="margin-left: 8px;">중복확인</button>
									</div>
								</li>
								<li>
									<div class="reviewer-update__head">소개</div>
									<div class="reviewer-update__data">
										<input type="hidden" id="introVal">
										<textarea id="intro" class="reviewer-update-textarea" name="slfIntro" placeholder="소개 글을 적어주세요 (공백제외, 특수문자포함)">${ profile.profileContent }</textarea>
										<!-- 비속어시 활성화 ::  validation-check--status invalid 추가 <textarea class="reviewer-update-textarea validation-check--status invalid" placeholder="소개 글을 적어주세요 (공백제외, 특수문자포함)" onkeyup="checkTextLength(this)" onkeydown=""></textarea> -->
										<div class="reviewer-update-textarea--status">
                                            <div class="txtInfo">개인정보를 남기지 않게 조심해 주세요</div>
											<div class="numbers-length--wrap">
												<span id="currIntroSize" class="numbers-length__first">3</span><span id="maxIntroSize" class="numbers-length__second">100</span>
											</div>
                                            <span id="introStatus" style="display:none; margin-top: 8px" class="validation-check--status invalid">비속어가 포함되어 있습니다.</span>
										</div>
										<p><span></span><span></span></p>
									</div>
								</li>
							</ul>
							

<script>

//서버에서 전송된 피부톤, 피부타입, 피부고민, 관심 카테고리를 가져와서 CHECKED 속성을 부여하는 스크립트

$(document).ready(function() {

	var finding1 = $("ul#skinTypeList :input").filter(function () {
		return $(this).val() === '${ profile.skintypeId }'
	})
	
	finding1.addClass("checked");
	

	var finding2 = $("ul#skinToneList :input").filter(function () {
		return $(this).val() === '${ profile.skintoneId }'
	})
	
	finding2.addClass("checked");
	
	alert(finding.val())		
	//.prop("checked", true);
	 
	 let a = $("ul#skinTypeList").find("input[name=skin_type1]").parent().prop("checked", true);
	alert(a)
	
})

</script>
							
							
						</div>
						<!-- 기본 프로필 :: 끝 -->
						<!-- 나의 피부 컨디션 & 관심 카테고리 :: 시작 -->
						<div class="reviewer-update second-section">
							<p class="reviewer-update__tit">나의 피부 컨디션&amp;관심 카테고리</p>
							<p class="reviewer-update__subtit">나와 비슷한 피부 컨디션을 가진 고객의 리뷰와 나에게 딱 맞는 상품을 모아볼 수 있어요</p>
							<div class="reviewer-update__content">
								<!-- 현재 사용 하는 마크업 그대로 가져와서 변경했습니다. id, value값은 현재와 동일합니다 -->
								<div class="skin_choice_box">
									<div class="innerBox">
										<dl class="type_box verti">
											<dt>피부 타입</dt>
											<dd>
												<ul class="radius_box_list clrfix" id="skinTypeList">

													<%-- 이미 선택된 속성은 checked 부여 --%>
													
														
															<li>
																<input type="radio" id="skinType지성" name="skin_type1" value="STY_00000001">
																<label for="skinType지성">지성</label>
															</li>
														
													
														
															<li>
																<input type="radio" id="skinType건성" name="skin_type1" value="STY_00000002">
																<label for="skinType건성">건성</label>
															</li>
														
													
														
															<li>
																<input type="radio" id="skinType복합성" name="skin_type1" value="STY_00000003">
																<label for="skinType복합성">복합성</label>
															</li>
														
													
														
															<li>
																<input type="radio" id="skinType민감성" name="skin_type1" value="STY_00000004">
																<label for="skinType민감성">민감성</label>
															</li>
														
													
														
															<li>
																<input type="radio" id="skinType약건성" name="skin_type1" value="STY_00000005">
																<label for="skinType약건성">약건성</label>
															</li>
														
													
														
															<li>
																<input type="radio" id="skinType트러블성" name="skin_type1" value="STY_00000006">
																<label for="skinType트러블성">트러블성</label>
															</li>
														
													
														
															<li>
																<input type="radio" id="skinType중성" name="skin_type1" value="STY_00000007">
																<label for="skinType중성">중성</label>
															</li>
													
												</ul>
											</dd>
										</dl>
									</div>
									<div class="innerBox">
										<dl class="type_box verti">
											<dt>피부 톤</dt>
											<dd>
												<ul class="radius_box_list clrfix" id="skinToneList">
													
													
														
															<li>
																<input type="radio" id="skinTone쿨톤" name="skin_type2" value="STO_00000001">
																<label for="skinTone쿨톤">쿨톤</label>
															</li>
														
													
														
															<li>
																<input type="radio" id="skinTone웜톤" name="skin_type2" value="STO_00000002" >
																<label for="skinTone웜톤">웜톤</label>
															</li>
														
													
														
															<li>
																<input type="radio" id="skinTone봄웜톤" name="skin_type2" value="STO_00000003">
																<label for="skinTone봄웜톤">봄웜톤</label>
															</li>
														
													
														
															<li>
																<input type="radio" id="skinTone여름쿨톤" name="skin_type2" value="STO_00000004">
																<label for="skinTone여름쿨톤">여름쿨톤</label>
															</li>
														
													
														
															<li>
																<input type="radio" id="skinTone가을웜톤" name="skin_type2" value="STO_00000005">
																<label for="skinTone가을웜톤">가을웜톤</label>
															</li>
														
													
														
															<li>
																<input type="radio" id="skinTone겨울쿨톤" name="skin_type2" value="STO_00000006">
																<label for="skinTone겨울쿨톤">겨울쿨톤</label>
															</li>
														
													
												</ul>
											</dd>
										</dl>
									</div>
									<div class="innerBox">
										<dl class="type_box verti">
											<dt>피부 고민<span class="stxt">복수선택 가능</span></dt>
											<dd>
												<ul id="skinTrobleList" class="radius_box_list clrfix">
													
															
															<li>
																<input type="checkbox" id="skinTrouble잡티" name="skin_type3" value="STR_00000001">
																<label for="skinTrouble잡티">잡티</label>
															</li>
															<!-- checked사용후 초기화 -->
															
														
													
															
															<li>
																<input type="checkbox" id="skinTrouble미백" name="skin_type3" value="STR_00000002">
																<label for="skinTrouble미백">미백</label>
															</li>
															<!-- checked사용후 초기화 -->
															
														
															
															<li>
																<input type="checkbox" id="skinTrouble주름" name="skin_type3" value="STR_00000003">
																<label for="skinTrouble주름">주름</label>
															</li>
															<!-- checked사용후 초기화 -->
															
														
													
																
															
															<li>
																<input type="checkbox" id="skinTrouble각질" name="skin_type3" value="STR_00000004">
																<label for="skinTrouble각질">각질</label>
															</li>
															<!-- checked사용후 초기화 -->
															
														
															
															<li>
																<input type="checkbox" id="skinTrouble트러블" name="skin_type3" value="STR_00000005">
																<label for="skinTrouble트러블">트러블</label>
															</li>
															<!-- checked사용후 초기화 -->
															
														
													
															
															<li>
																<input type="checkbox" id="skinTrouble블랙헤드" name="skin_type3" value="STR_00000006">
																<label for="skinTrouble블랙헤드">블랙헤드</label>
															</li>
															<!-- checked사용후 초기화 -->
															
														
																
															
															<li>
																<input type="checkbox" id="skinTrouble피지과다" name="skin_type3" value="STR_00000007">
																<label for="skinTrouble피지과다">피지과다</label>
															</li>
															<!-- checked사용후 초기화 -->
															
														
													
																
															
															<li>
																<input type="checkbox" id="skinTrouble민감성" name="skin_type3" value="STR_00000008">
																<label for="skinTrouble민감성">민감성</label>
															</li>
															<!-- checked사용후 초기화 -->
															
														
													
																
															
															<li>
																<input type="checkbox" id="skinTrouble모공" name="skin_type3" value="STR_00000009">
																<label for="skinTrouble모공">모공</label>
															</li>
															<!-- checked사용후 초기화 -->
															
														
															
															<li>
																<input type="checkbox" id="skinTrouble탄력" name="skin_type3" value="STR_00000010">
																<label for="skinTrouble탄력">탄력</label>
															</li>
															<!-- checked사용후 초기화 -->
															
														
															
															<li>
																<input type="checkbox" id="skinTrouble홍조" name="skin_type3" value="STR_00000011">
																<label for="skinTrouble홍조">홍조</label>
															</li>
															<!-- checked사용후 초기화 -->
															
														
													
														
															
															
															<li>
																<input type="checkbox" id="skinTrouble아토피" name="skin_type3" value="STR_00000012">
																<label for="skinTrouble아토피">아토피</label>
															</li>
															<!-- checked사용후 초기화 -->
															
														
																	
																
															
															<li>
																<input type="checkbox" id="skinTrouble다크서클" name="skin_type3" value="STR_00000013">
																<label for="skinTrouble다크서클">다크서클</label>
															</li>
															<!-- checked사용후 초기화 -->
															
														
													
												</ul>
											</dd>
										</dl>
									</div>
									<div class="innerBox">
										<dl class="type_box verti">
											<dt>관심 카테고리<span class="stxt">복수 선택 가능</span></dt>
											<dd>
												<ul id="personalCategoryList" class="radius_box_list clrfix">
													
														<li>
															<input type="checkbox" id="personalCatogory스킨케어" value="INT_00000001" name="skin_type4">
															<label for="personalCatogory스킨케어">스킨케어</label>
														</li>
													
														<li>
															<input type="checkbox" id="personalCatogory마스크팩" value="INT_00000002" name="skin_type4" >
															<label for="personalCatogory마스크팩">마스크팩</label>
														</li>
													
														<li>
															<input type="checkbox" id="personalCatogory클렌징" value="INT_00000003" name="skin_type4">
															<label for="personalCatogory클렌징">클렌징</label>
														</li>
													
														<li>
															<input type="checkbox" id="personalCatogory선케어" value="INT_00000004" name="skin_type4">
															<label for="personalCatogory선케어">선케어</label>
														</li>
													
														<li>
															<input type="checkbox" id="personalCatogory더모 코스메틱" value="INT_00000005" name="skin_type4">
															<label for="personalCatogory더모 코스메틱">더모 코스메틱</label>
														</li>
													
														<li>
															<input type="checkbox" id="personalCatogory메이크업" value="INT_00000006" name="skin_type4">
															<label for="personalCatogory메이크업">메이크업</label>
														</li>
													
														<li>
															<input type="checkbox" id="personalCatogory네일" value="INT_00000007" name="skin_type4">
															<label for="personalCatogory네일">네일</label>
														</li>
													
														<li>
															<input type="checkbox" id="personalCatogory바디케어" value="INT_00000008" name="skin_type4">
															<label for="personalCatogory바디케어">바디케어</label>
														</li>
													
														<li>
															<input type="checkbox" id="personalCatogory헤어케어" value="INT_00000009" name="skin_type4">
															<label for="personalCatogory헤어케어">헤어케어</label>
														</li>
													
														<li>
															<input type="checkbox" id="personalCatogory향수/디퓨저" value="INT_00000010" name="skin_type4">
															<label for="personalCatogory향수/디퓨저">향수/디퓨저</label>
														</li>
													
														<li>
															<input type="checkbox" id="personalCatogory미용소품" value="INT_00000011" name="skin_type4">
															<label for="personalCatogory미용소품">미용소품</label>
														</li>
													
														<li>
															<input type="checkbox" id="personalCatogory남성" value="INT_00000012" name="skin_type4">
															<label for="personalCatogory남성">남성</label>
														</li>
													
														<li>
															<input type="checkbox" id="personalCatogory구강/건강용품" value="INT_00000013" name="skin_type4">
															<label for="personalCatogory구강/건강용품">구강/건강용품</label>
														</li>
													
														<li>
															<input type="checkbox" id="personalCatogory여성/위생용품" value="INT_00000014" name="skin_type4">
															<label for="personalCatogory여성/위생용품">여성/위생용품</label>
														</li>
													
														<li>
															<input type="checkbox" id="personalCatogory건강식품" value="INT_00000015" name="skin_type4">
															<label for="personalCatogory건강식품">건강식품</label>
														</li>
													
														<li>
															<input type="checkbox" id="personalCatogory푸드" value="INT_00000016" name="skin_type4">
															<label for="personalCatogory푸드">푸드</label>
														</li>
													
														<li>
															<input type="checkbox" id="personalCatogory라이프/홈" value="INT_00000017" name="skin_type4">
															<label for="personalCatogory라이프/홈">라이프/홈</label>
														</li>
													
														<li>
															<input type="checkbox" id="personalCatogory반려동물" value="INT_00000018" name="skin_type4">
															<label for="personalCatogory반려동물">반려동물</label>
														</li>
													
												</ul>
											</dd>
										</dl>
									</div>
								</div>
							</div>
						</div>
						<!-- 나의 피부 컨디션 & 관심 카테고리 :: 끝 -->
						<!-- 공개 설정 :: 시작 -->
						<div class="reviewer-update last-section">
							<p class="reviewer-update__tit">공개 설정</p>
							<div class="reviewer-update-control">
								<ul>
                                    <li>
                                        <input type="hidden" name="profileImageConsentYn" value="N">
                                        <input type="hidden" name="hasProfileImageYn" value="N">
                                        
                                        <%-- 체크여부에 따라 hidden속성의 value가 Y || N --%>
                                        <input type="checkbox" id="profileImageConsentYn" title="프로필 사진 수집 동의 (필수)" checked="checked">
                                        <label for="profileImageConsentYn">프로필 사진 수집 동의 (필수)</label>
                                        <table class="reviewer-update-control__tbl">
                                            <caption>프로필 사진 수집 동의 (필수)</caption>
                                            <colgroup>
                                                <col style="width:33.3%;">
                                                <col style="width:33.3%;">
                                                <col style="width:33.3%;">
                                            </colgroup>
                                            <thead>
                                            <tr style="text-align: center;">
                                                <th scope="col">수집 항목</th>
                                                <th scope="col">수집 및 이용 목적</th>
                                                <th scope="col">보유 및 이용 기간</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>프로필 사진</td>
                                                <td>올리브영 서비스 내 개인 프로필 사진 정보 활용 목적</td>
                                                <td><u><strong>고객의 프로필 사진 삭제 혹은 또는 탈퇴 후 30일 이내</strong></u></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <p class="description">프로필 사진의 경우, 개인정보로 취급하고 있어 등록 시 동의가 필요합니다. 본 수집 동의에 거부를 할 수 있으나, 미동의 시 프로필 사진 저장 및 활용이 제한될 수 있습니다.</p>
                                    </li>
                                    <li>
                                        <input type="hidden" name="sensitiveInfoOpenYn" value="N">
                                        <input type="checkbox" id="sensitiveInfoOpenYn" title="피부 민감정보 수집 동의 (필수)" checked="checked">
                                        <label for="sensitiveInfoOpenYn">피부 민감정보 수집 동의 (필수)</label>
                                        <table class="reviewer-update-control__tbl">
                                            <caption>피부 민감정보 수집 동의 (필수)</caption>
                                            <colgroup>
                                                <col style="width:33.3%;">
                                                <col style="width:33.3%;">
                                                <col style="width:33.3%;">
                                            </colgroup>
                                            <thead>
                                            <tr style="text-align: center;">
                                                <th scope="col">수집 항목</th>
                                                <th scope="col">수집 및 이용 목적</th>
                                                <th scope="col">보유 및 이용 기간</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><u><strong>피부 컨디션 정보 (피부 타입, 피부 톤, 피부 고민) 및 관심 카테고리 중 실제 선택한 정보</strong></u></td>
                                                <td>셔터 팔로워 추천 및 상품 리뷰 시 해당 수집 항목 활용 서비스 제공</td>
                                                <td><u><strong>회원 탈퇴 후 30일 이내 또는 피부 컨디션 정보 수집 동의 철회 시까지</strong></u></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <p class="description">위 피부 정보에 대한 수집을 거부할 수 있으나, 거부 시 피부 정보의 저장 및 활용에 제한될 수 있습니다.</p>
                                    </li>
                                    <li>
                                        <input type="hidden" name="addInfoAgrYn" value="N">
                                        <input type="checkbox" id="addInfoAgrYn" title="큐레이션 서비스 마케팅 활용 동의 (선택)">
                                        <label for="addInfoAgrYn">큐레이션 서비스 마케팅 활용 동의 (선택)</label>
                                        <table class="reviewer-update-control__tbl">
                                            <caption>큐레이션 서비스 마케팅 활용 동팅의 (선택)</caption>
                                            <colgroup>
                                                <col style="width:33.3%;">
                                                <col style="width:33.3%;">
                                                <col style="width:33.3%;">
                                            </colgroup>
                                            <thead>
                                            <tr style="text-align: center;">
                                                <th scope="col">수집 항목</th>
                                                <th scope="col">수집 및 이용 목적</th>
                                                <th scope="col">보유 및 이용 기간</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><u><strong>피부 컨디션 정보(피부 타입, 피부 톤, 피부 고민) 및 관심 카테고리 중 실제 선택한 정보</strong></u></td>
                                                <td>수집된 피부 컨디션 정보 및 관심 카테고리 기반 맞춤형 상품 추천, 서비스 추천 등의 안내 및 이를 기반한 마케팅 활동</td>
                                                <td><u><strong>회원 탈퇴 후 30일 이내 또는 본 서비스 동의 철회 시까지</strong></u></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <p class="description">회원은 본 서비스 이용 동의에 대한 거부를 할 수 있으며, 미동의 시 본 서비스에 대한 혜택을 받으실 수 없습니다.</p>
                                    </li>

									<li>
										<input type="hidden" name="profileOpenYnVal" value="N">
										<input type="checkbox" id="profileOpenYnVal" title="프로필 비공개" checked="checked">
										
										<label for="profileOpenYnVal">프로필 비공개</label>
										<p>비공개로 설정할 경우, 고객님의 프로필 이미지, 컬렉션, 랭킹, 누적 리뷰 정보 등이 공개되지 않습니다.</p>
									</li>
									<li>
										<input type="hidden" name="addInfoOpenYnVal" value="N">
										<input type="checkbox" id="addInfoOpenYnVal" title="나의 피부 컨디션 &amp; 관심 카테고리 정보 비공개" checked="checked">
										<label for="addInfoOpenYnVal">나의 피부 컨디션&amp;관심 카테고리 정보 비공개</label>
										<p>비공개로 설정하실 경우 고객님의 피부타입, 피부톤, 피부고민, 관심 카테고리 정보가 공개되지 않습니다.</p>
									</li>

								</ul>
								<button type="button" id="myConditionSaveBtn" class="reviewer-button reviewer-button--save" data-attr="리뷰어프로필^저장하기^저장하기">저장하기</button>
							</div>
						</div>
						<!-- 공개 설정 :: 끝 -->
					</div>
				</form>
				<!-- reviewer-profile-content__body :: 프로필 본문 끝 -->
				
			</div>
			<!-- reviewer-profile-content :: 우측 레이아웃 :: 끝 -->
		</div>
		
	</div>






<script>
	
	$("button#myConditionSaveBtn").on("click", function () {
		location.href = "/profile/myprofile";
	})
</script>



