<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.review_stat.type2 .point.pt5 {
    background-position: 0 -70px;
}
.review_stat.type2 .point {
    display: inline-block;
    margin-top: 2px;
    width: 78px;
    height: 14px;
    text-indent: -9999px;
    background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_review_point2.png) right 0/100% auto no-repeat;
    vertical-align: top;
}
</style>
					<!-- [D] 리뷰작성 영역 제거 review-write-delete 클래스 추가 -->
					<div id="ajax">
						<div class="product_rating_area review-write-delete">
							<div class="inner clrfix">
								<div class="grade_img">
									<p class="img_face">
										<c:set var="integerPart"
											value="" />
										<span class="grade grade${integerPart}"></span> <em> <c:if
												test="${reviewScore.averagegrade < 3}">최저</c:if> <c:if
												test="${reviewScore.averagegrade >= 3 && reviewScore.averagegrade < 4}">보통</c:if>
											<c:if test="${reviewScore.averagegrade >= 4}">최고</c:if>
										</em>
									</p>
									<!-- grade5 : 최고, grade4 : 좋음, grade3 : 보통, grade2 : 별로, grade1 : 나쁨  -->
								</div>
								<div class="star_area">
									<p class="total">
										총 <em>${reviewcnt }</em>건
									</p>
									<!-- ## 리뷰 고도화 2차 ## 리뷰 전체 건수(본상품+연관상품) -->
									<p class="num">
										<strong>${reviewScore.averagegrade }</strong><span>점</span>
									</p>
									<ul class="star_list">


										<c:forEach begin="1" end="${reviewScore.averagegrade}"
											varStatus="loop">
											<li><span class="rating"></span><img
												src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
										</c:forEach>

										<c:set var="decimalPart"
											value="${reviewScore.averagegrade mod 1 }" />

										<c:if test="${decimalPart gt 0 }">
											<li><span class="rating"
												style="width:${decimalPart*100}%;"></span><img
												src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
										</c:if>

										<c:forEach begin="1" end="${5 - reviewScore.averagegrade}"
											varStatus="loop">
											<li><span class="rating" style="width: 0%;"></span><img
												src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
										</c:forEach>
									</ul>
								</div>
								<div class="graph_area">
									<ul class="graph_list">
										<li><span class="per">${reviewScore.grade5Ratio }%</span>
											<div class="graph">
												<span style="height: ${reviewScore.grade5Ratio }%;"></span>
											</div> <span class="txt">5점</span></li>


										<li><span class="per">${reviewScore.grade4Ratio }%</span>
											<div class="graph">
												<span style="height: ${reviewScore.grade4Ratio }%;"></span>
											</div> <span class="txt">4점</span></li>


										<li><span class="per">${reviewScore.grade3Ratio }%</span>
											<div class="graph">
												<span style="height: ${reviewScore.grade3Ratio }%;"></span>
											</div> <span class="txt">3점</span></li>


										<li><span class="per">${reviewScore.grade2Ratio }%</span>
											<div class="graph">
												<span style="height: ${reviewScore.grade2Ratio }%;"></span>
											</div> <span class="txt">2점</span></li>


										<li><span class="per">${reviewScore.grade1Ratio }%</span>
											<div class="graph">
												<span style="height: ${reviewScore.grade1Ratio }%;"></span>
											</div> <span class="txt">1점</span></li>
									</ul>
								</div>

							</div>
						</div>


						<!--평균별점집계 end-->

						<!-- 만족도결과 start-->
						<!-- <h3 class="tit_type poll_tit">고객 만족도</h3> -->
						<!-- ## 리뷰 고도화 1차 ## -->
						<div class="poll_all clrfix">
							<dl class="poll_type2 type3">
								<dt>
									<span>피부타입</span>
								</dt>
								<dd>
									<ul class="list">
										<li><span class="txt">건성에 좋아요</span>
											<div class="graph">
												<span style="width: ${reviewScore.grade13Ratio }%;"></span>
											</div> <em class="per" data-value="19">${reviewScore.grade13Ratio }%</em></li>
										<li><span class="txt">복합성에 좋아요</span>
											<div class="graph">
												<span style="width: ${reviewScore.grade12Ratio }%;"></span>
											</div> <em class="per" data-value="60">${reviewScore.grade12Ratio }%</em></li>
										<li><span class="txt">지성에 좋아요</span>
											<div class="graph">
												<span style="width: ${reviewScore.grade11Ratio }%;"></span>
											</div> <em class="per" data-value="21">${reviewScore.grade11Ratio }%</em></li>


									</ul>
								</dd>
							</dl>
							<dl class="poll_type2 type3">
								<dt>
									<span>피부고민</span>
								</dt>
								<dd>
									<ul class="list">
										<li><span class="txt">보습에 좋아요</span>
											<div class="graph">
												<span style="width: ${reviewScore.grade23Ratio }%;"></span>
											</div> <em class="per" data-value="21">${reviewScore.grade23Ratio }%</em></li>
										<li><span class="txt">진정에 좋아요</span>
											<div class="graph">
												<span style="width: ${reviewScore.grade22Ratio }%;"></span>
											</div> <em class="per" data-value="79">${reviewScore.grade22Ratio }%</em></li>
										<li><span class="txt">주름/미백에 좋아요</span>
											<div class="graph">
												<span style="width: ${reviewScore.grade21Ratio }%;"></span>
											</div> <em class="per" data-value="1">${reviewScore.grade21Ratio }%</em></li>
									</ul>
								</dd>
							</dl>
							<dl class="poll_type2 type3">
								<dt>
									<span>자극도</span>
								</dt>
								<dd>
									<ul class="list">
										<li><span class="txt">자극없이 순해요</span>
											<div class="graph">
												<span style="width: ${reviewScore.grade33Ratio }%;"></span>
											</div> <em class="per" data-value="76">${reviewScore.grade33Ratio }%</em></li>
										<li><span class="txt">보통이에요</span>
											<div class="graph">
												<span style="width: ${reviewScore.grade32Ratio }%;"></span>
											</div> <em class="per" data-value="24">${reviewScore.grade32Ratio }%</em></li>
										<li><span class="txt">자극이 느껴져요</span>
											<div class="graph">
												<span style="width: ${reviewScore.grade31Ratio }%;"></span>
											</div> <em class="per" data-value="1">${reviewScore.grade31Ratio }%</em></li>
									</ul>
								</dd>
							</dl>
						</div>
						<!-- 만족도결과 end-->
					</div>
					<!-- 여기까지 -->
					<!-- ## 리뷰 고도화 1차 ## 정렬 항목 변경 Start -->

					<!-- 연관상품 포함 건수 있는 경우 표시 -->

					<div class="cate_align_box prodLine review_N2" id="searchType">
						<!-- ## 리뷰고도화 2차 ## 클래스 "review_N2" 추가-->
						<div class="align_sort">
							<!-- 리뷰 고도화 1차 : 항목 변경 -->
							<ul id="gdasSort">
							<c:out value="${gdasSort}"></c:out>
								<li class="is-layer <c:if test='${gdasSort eq 0}'> on</c:if>"><a href="javascript:;"
									data-value="0" data-sort-type-code="useful"
									data-attr="상품상세^리뷰정렬^유용한순">유용한순</a>
									<button type="button" class="btn-open-layer">
										<span>자세히 보기</span>
									</button>
									<div class="comment-layer">리뷰의 글자수, '도움이 돼요'수 , 등록된 사진,
										최신 작성일등을 점수화하여 올리브영이 추천하는 리뷰를 정렬합니다.</div></li>
								<li class = "<c:if test='${gdasSort eq 1}'> on</c:if>" ><a href="javascript:;" data-value="1"
									data-sort-type-code="help" data-attr="상품상세^리뷰정렬^도움순">도움순</a></li>
								<li <c:if test="${gdasSort eq 2}">class = "on"</c:if>><a href="javascript:;" data-value="2"
									data-sort-type-code="latest" data-attr="상품상세^리뷰정렬^최신순">최신순</a></li>
							</ul>
							<!-- // 리뷰 고도화 1차 : 항목 변경 -->
						</div>

						<!--## 리뷰고도화 2차 ## 추가 S -->
						<div class="review_N2 checkbox_wrap">
							<input type="checkbox" name="searchType" id="searchType_1"
								<c:if test="${searchType_1 eq 'Y'}">checked="checked"</c:if> value="100" data-attr="상품상세^리뷰검색필터_유형^포토리뷰"><label>포토리뷰</label>
						</div>
						<div class="review_N2 checkbox_wrap">
							<input type="checkbox" name="searchType" id="searchType_2"
								checked="checked" value="200" data-attr="상품상세^리뷰검색필터_유형^일반리뷰"><label>일반리뷰</label>
						</div>
						<div class="review_N2 checkbox_wrap">
							<input type="checkbox" name="searchType" id="searchType_3"
								checked="checked" value="50" data-attr="상품상세^리뷰검색필터_유형^올영체험단"><label>체험단</label>
						</div>
						<!-- ## 리뷰고도화 2차 ## 추가 E -->

						<!-- 오프라인 리뷰 -->
						<input type="hidden" name="showFilter" id="showFilter" value="Y">
						<div class="align_filter ">
							<!-- ## 리뷰고도화 2차 ## 제거 -->
							<!-- 리뷰 고도화 1차 : 삭제 <select class="selbox type01" title="정렬 옵션을 선택하세요.">
				<option selected="selected">전체 구매</option>
				<option>온라인몰 구매</option>
				<option>매장 구매</option>
			</select>-->
							<!-- ## 리뷰고도화 2차 ## 제거 -->
							<button type="button" class="btnOption" id="filterBtn"
								onclick="goods.gdas.filter.getFilter();"
								data-attr="상품상세^리뷰검색필터^리뷰 검색 필터">리뷰 검색 필터</button>
							<!-- ## 리뷰고도화 2차 ## 텍스트 변경 -->
							<!-- 맞춤필터 설정 시 on 클래스 활성화 처리 -->
						</div>
						<!-- //오프라인 리뷰 -->
					</div>

					<!-- 상품평 등록제한 카테고리 안내 문구 -->
					<!-- ## 리뷰 고도화 1차 ## 정렬 항목 변경 END -->
					<!-- 사진탭 start-->
					<!-- <h3 class="tit_type thum_tit">리뷰 이미지</h3 -->
					<!-- ## 리뷰 고도화 1차 ##  -->
					<div class="review_thum">
						<ul class="inner clrfix">
							<c:set var="i" value="${0 }" />
							<c:forEach items="${reviewlistall }" var="imglist"
								varStatus="outloop">

								<c:forEach items="${imglist.reviewimg }" var="img" varStatus="Loop">
									<c:if test="${i < 7}">
										<li><a href="javascript:;"
											data-attr="상품상세^포토모아보기^포토 클릭^1"> <span> <!-- ## 리뷰 고도화 1차 ## onload , errorResizeImg -->
													<img src="${img.reviewImgSrc }" class="thum"
													data-value="${img.reviewId }" alt="" data-state="">
											</span>

										</a></li>

									</c:if>
									<c:set var="i" value="${i+1 }" />
									<c:if test="${i eq 7 }">
										<li class="more">
											<!-- ## 리뷰 고도화 1차 ## --> <a href="javascript:;" class="more"
											data-attr="상품상세^포토모아보기^포토더보기"> <span> <!-- ## 리뷰 고도화 1차 ## -->
													<span><em>더보기</em></span> <!-- ## 리뷰 고도화 1차 ## onload , errorResizeImg -->
													<img src="${img.reviewImgSrc }" class="thum"
													data-value="23722172_2" alt="" data-state="">
											</span>

										</a>
										</li>
									</c:if>
								</c:forEach>

							</c:forEach>


						</ul>
					</div>
					<!-- 사진탭 end-->

					<!-- 상품평 등록제한 카테고리 안내 문구 -->
					<!-- ## 리뷰 고도화 1차 ## -->

					<!-- ## 리뷰 고도화 1차 ## -->
					<!-- 상품평 등록제한 카테고리 안내 문구 -->
					<div class="reviewCate" id="gdasRecommKeyword" style="">
						<ul id="ul_recommKeyword">
							<li class="li_keyword on" data-keyword="ALL"><a href="#"
								data-attr="상품상세^추천키워드^전체">추천 키워드 전체</a></li>
							<li class="li_keyword" data-keyword="고보습,보습,보습감,보습력"><a
								href="#" data-attr="상품상세^추천키워드^보습력">#보습력</a></li>
							<li class="li_keyword"
								data-keyword="가려운,가려울,가려움,가려움증,각질제거,간지러운,간지러울,간지러움,간지럼,갈라짐,강력,강력한,강화,개선,거품목욕,광채,광택,그라데이션,그림자,글로시,글로시한,냄새제거,냉감,노폐물제거,눈화장,도자기,드라마틱,드라마틱한,딥클렌징,땀억제,롱래쉬,롱앤컬,릴렉스,모공관리,모공커버,무광,물광,미백,반짝반짝,발그레,백탁,번쩍,번쩍번쩍,보정,보호,블러,빛나는,생기,소독,속광,수정용,수정화장,스머지,스케일링,스타일링,안정,억제,얼굴색,열감,영양,영양감,영양공급,예방,완화,워터프루프,유광,유리알광택,유분제거,유수분밸런스,윤곽,윤광,음영,입체감,자연광,자외선,자외선차단,자외선차단기능,장벽,장벽강화,재생,제거,제모,주름개선,진정,진정효과,충전,컬링,케어,코쉐딩,쿨링,쿨링감,큐티클,탄력,탈취,톤업,플럼핑,피부결,피부보호,피지관리,피지제거,픽싱,항균,항산화,회복"><a
								href="#" data-attr="상품상세^추천키워드^사용효과">#사용효과</a></li>
							<li class="li_keyword" data-keyword="수분,수분감,수분공급,촉촉,촉촉이,촉촉한,촉촉함"><a
								href="#" data-attr="상품상세^추천키워드^수분감">#수분감</a></li>
							<li class="li_keyword" data-keyword="순하,순한,자극,자극적"><a
								href="#" data-attr="상품상세^추천키워드^자극도">#자극도</a></li>
							<li class="li_keyword"
								data-keyword="가방,간편,간편히,대용량,뚜껑,무자극,무펄,분사,분사력,비건,스틱,스틱타입,스틱형,스프레이,스프레이타입,스프레이형,안개,안개분사,약산성,약알칼리성,여행,여행용,올인원,위생적,일회용,주머니,튜브,튜브타입,튜브형,트래블용,패드,펌핑,펌핑타입,펌핑형,핸드백,휴대,휴대성,휴대용"><a
								href="#" data-attr="상품상세^추천키워드^제품특징">#제품특징</a></li>
							<li class="li_keyword"
								data-keyword="거품형,고체,고체타입,꾸덕,꾸덕꾸덕,꾸덕한,끈적끈적,라이트,라이트한,리퀴드,물토너,묽은,묽은제형,버블,버블타입,벨벳,알갱이,액상,액체,연고,워터리,입자,점성,제형,젤리,젤타입,질감,쫀득쫀득,쫀쫀,쫀쫀하,쫀쫀한,크리미한,텍스처,파우더타입,폭신,폭신폭신"><a
								href="#" data-attr="상품상세^추천키워드^제형">#제형</a></li>
							<li class="li_keyword"
								data-keyword="가렵,각질,간지러워,간지럽,개기름,개털,건선,건조,건조함,겨땀,고민,고민거리,곱슬,극건성,극손상,근육통,기름기,기름진,기미,노폐물,노화,다크서클,다크써클,다한증,두드러기,드름,따가운,땀냄새,땀띠,머리숱,모공,목주름,무좀,발냄새,뱀살,뱃살,부스스,부시시,분비물,붓기,블랙헤드,비듬,뾰루지,새치,셀룰라이트,속건조,손상,손상모,습진,아토피,아토피성,악건성,악취,알레르기,암내,여드름,여드름성,요철,울긋불긋,유분,잔머리,잔주름,잡티,좁쌀,좁쌀여드름,주근깨,주름,증상,지성두피,질염,찝찝,칸디다,칸디다균,탈모,트러블,팔자주름,푸석,푸석푸석,피로감,피부염,피지,피지들,홍조,화농성,화이트헤드,흉터,흔적"><a
								href="#" data-attr="상품상세^추천키워드^피부고민">#피부고민</a></li>
						</ul>
					</div>

					<!-- 상품평 리스트 start -->
					<div class="review_list_wrap">
						<ul class="inner_list" id="gdasList">
							<c:set var="i" value="${0 }" />
							<c:forEach items="${reviewlist }" var="review">

								<c:set var="i" value="${i + 1 }" />
								<li>
									<div class="info">
										<div class="user clrfix">
											<a href="javascript:;"
												onclick="goods.gdas.hadleClickProductDetailReviewerProfile('QjdncktGcWptUk5vclBWbnM2NkN6QT09', { t_page: '상품상세', t_click: '리뷰어_리뷰어프로필', t_profile_name: '글리스', t_review_rank_name: '19'})"
												data-attr="상품상세^리뷰어프로필^프로필이미지 또는 닉네임 클릭"> <img
												src="https://image.oliveyoung.co.kr/uploads/images/mbrProfile/2023/11/04/1699105876598.png"
												style="display: none;">
												<div class="thum">
													<span class="bg"></span> <img src="${review.profileImg }"
														class="profileThum_s"
														style="background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/my_picture_base.jpg) no-repeat 0 0; background-size: 60px">
												</div>
											</a>
											<!--## 리뷰 고도화 1차 ## : top, id 위치 변경 및 마크업 변경 -->
											<p class="info_user">
												<a href="javascript:;" class="id"
													onclick="goods.gdas.hadleClickProductDetailReviewerProfile('QjdncktGcWptUk5vclBWbnM2NkN6QT09', { t_page: '상품상세', t_click: '리뷰어_리뷰어프로필', t_profile_name: '글리스', t_review_rank_name: '19'})"
													data-attr="상품상세^리뷰어프로필^프로필이미지 또는 닉네임 클릭">${review.nickname }</a>
												<!--## 리뷰 고도화 1차 ## :  탑리뷰어 라운지로 이동시킴 -->
												<a href="javascript:;"
													onclick="goods.gdas.handleClickTopReviewer({t_page: '상품상세', t_click: '리뷰어_탑리뷰어순위', t_review_rank_name: '19'})"
													class="top" data-attr="상품상세^랭킹순위^순위클릭">TOP ${i }</a>
											</p>
											<!--## 리뷰 고도화 2차 ## : 명성리뷰어 -->
											<p class="tag">
												<!--피부 컨디션이 -->
												<!--<strong _tmplitem="143" >-->
												<!-- ## 리뷰 고도화 1차 ## : 위치 변경 및 마크업 변경 -->
												<span>${review.skintypeName }</span> <span>${review.skintoneName}</span>
												<c:forEach items="${review.skinTrouble }" var="skintrb">
															<span>${skintrb.skintroubleName }</span>
														
												</c:forEach>
												<!--</strong>-->
											</p>
											<!--## 리뷰 고도화 1차 ## : 재구매/한달사용 리뷰 -->
											<div class="badge"></div>
										</div>
									</div>
									<div class="review_cont">
										<div class="score_area">
											<span class="review_point"><span class="point"
												style="width: ${review.reviewGrade*20 }%">5점만점에
													${review.reviewGrade }점</span></span> <span class="date">${review.reviewRegdate }</span>
										</div>
										<!--## 리뷰 고도화 1차 ## 위치변경 -->
										<!--## 리뷰 고도화 1차 ## 위치변경 -->
										<!--## 리뷰 고도화 1차 ## 위치변경 -->
										<div class="poll_sample">
											<dl class="poll_type1">
												<dt>
													<span>피부타입</span>
												</dt>
												<dd>
													<span class="txt"> <c:choose>
															<c:when test="${review.reviewPoll1 eq 3 }">
													건성에 좋아요
												</c:when>
															<c:when test="${review.reviewPoll1 eq 2 }">
													복합성에 좋아요
												</c:when>
															<c:when test="${review.reviewPoll1 eq 1 }">
													지성에 좋아요
												</c:when>

														</c:choose>

													</span>
												</dd>
											</dl>
											<dl class="poll_type1">
												<dt>
													<span>피부고민</span>
												</dt>
												<dd>
													<span class="txt"> <c:choose>
															<c:when test="${review.reviewPoll2 eq 3 }">
													보습에 좋아요
												</c:when>
															<c:when test="${review.reviewPoll2 eq 2 }">
													진정에 좋아요
												</c:when>
															<c:when test="${review.reviewPoll2 eq 1 }">
													주름/미백에 좋아요
												</c:when>

														</c:choose>
													</span>
												</dd>
											</dl>
											<dl class="poll_type1">
												<dt>
													<span>자극도</span>
												</dt>
												<dd>
													<span class="txt"> <c:choose>
															<c:when test="${review.reviewPoll3 eq 3 }">
													자극없이 순해요
												</c:when>
															<c:when test="${review.reviewPoll3 eq 2 }">
													보통이에요
												</c:when>
															<c:when test="${review.reviewPoll3 eq 1 }">
													자극이 느껴져요
												</c:when>

														</c:choose>
													</span>
												</dd>
											</dl>
										</div>
										<!--## 리뷰 고도화 1차 ## 위치변경 -->
										<div class="txt_inner">${review.reviewContent }</div>
										<!-- ## 리뷰 고도화 1차 ## : 태그 추가 -->
										<div class="review_tag">
											<span>어성초토너</span> <span>보습토너</span> <span>진정토너</span>
										</div>
										<div class="review_thum type1">
											<ul class="inner clrfix">
												<c:forEach items="${review.reviewimg }" var="img">
													

														
															<li><a href="javascript:;" data-attr="상품상세^포토리뷰^포토 클릭^1"><span><img
																		src="${img.reviewImgSrc }" data-value="23082403_1"
																		class="thum" alt=""></span></a></li>
														

												</c:forEach>
											</ul>
										</div>
										<div class="rw-photo-slide" style="display: none">
											<div>
												<img
													src="https://image.oliveyoung.co.kr/uploads/images/gdasEditor/2023/10/22/1697938427930.png">
											</div>
										</div>
										<!--## 리뷰 고도화 2차 ## 연관상품 -->
										<p class="txt_beauty">※ 해당 리뷰는 원칙적으로 기본 상품이 동일한 단품 사용 후
											작성된 것이며,개별 상품에 따라 용량 내지 일부 구성(1+1, 기획상품 등)이 상이할 수 있음을 안내드립니다.</p>
										<!--## 리뷰 고도화 1차 ## 위치변경 및 삭제-->
										<!-- ## 리뷰 고도화 1차 ##  : 리뷰제한 카테고리 일경우 안보이게 -->
										<div class="recom_area">
											<button type="button" class="btn_recom " id="gdas_23082403"
												onclick="goods.gdas.setRecommGdasToggle('23082403',  'N', {t_page: '상품상세', t_click: '상품상세_도움이돼요', t_profile_name: '글리스', t_review_rank_name: '19'});"
												data-attr="상품상세^도움이돼요^도움이돼요">
												이 리뷰가 도움이 돼요! <span class="num" data-attr="상품상세^도움이돼요^도움이돼요">
													${review.reviewLike } </span>
											</button>
											<input type="hidden" name="recommCnt_23082403" value="30">
										</div>
										<button type="button" class="btn_dec"
											onclick="goods.gdas.goGdasReportPop('23082403', 'A000000147339', '001', 'N', {t_page: '상품상세', t_click: '상품상세_리뷰신고하기', gdas_seq: '23082403'});"
											data-attr="상품상세^신고하기^신고하기">신고하기</button>
									</div>
								</li>

							</c:forEach>
						</ul>
					</div>
					<!-- pageing start -->
					<div class="pageing" id="<%=request.getParameter("productDisplayId")%>">
						<c:if test="${pDto.prev }">
							<a class="prev" href="javascript:;" data-page-no="1">이전 10
								페이지</a>
						</c:if>
						<c:forEach var="i" begin="${pDto.start }" end="${pDto.end }"
							step="1">
							<c:choose>
								<c:when test="${i eq pDto.currentPage}">
									<strong title="현재 페이지">${i}</strong>
									<%-- <a class="active" href="#">${i }</a> --%>
								</c:when>
								<c:otherwise>
									<a href="javascript:;">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pDto.next }">
							<a class="next" href="javascript:;" data-page-no="21">다음 10
								페이지</a>
						</c:if>
						<!-- <strong title="현재 페이지">1</strong> -->
					</div>
				</div>
				<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
			<script>
			 $(".pageing a").on("click",function(){
				 event.preventDefault(); // 앵커의 기본 동작을 막습니다.
				
				 let currentPage = $(this).text()
				 let productId = $(".prd_option_box.box_select > a").attr("id");
				 let productDisplayId = $("#goodsNo").val();
				 let gdasSort = $("#gdasSort li.on > a").attr("data-value")
				 //alert(currentpage+"/"+pro_id+"/"+displ+"/"+type)
				 
				 let data = {
					 currentPage: currentPage,
					 productId: productId,
					 gdasSort: gdasSort,
					 productDisplayId: productDisplayId
				    };
				 
				 $.ajax({
						url: "/getReview",
						data:data,
						cache: false,
						success:function( response ) {
				              $("#review").empty();
				              $("#review").append( response );
					           		              
				          }
				        , error		: function() {
				            alert( '서버 데이터를 가져오지 못했습니다. 다시 확인하여 주십시오.' );
				        }
					})
					
					
				 
			 })
			 
			 
		$("#gdasSort li a").on("click",function(){
		 $("#gdasSort li").removeClass("on")
		 $(this).closest("li").addClass("on")
		 let gdasSort = $(this).attr("data-value")
		 let productId = $(".prd_option_box.box_select > a").attr("id");
		 let productDisplayId = $("#goodsNo").val();
		 
		 
		 let data = {
				 productId: productId,
				 gdasSort: gdasSort,
			 	productDisplayId: productDisplayId
		    };
		 $.ajax({
				url: "/getReview",
				data:data,
				cache: false,
				success:function( response ) {
		              $("#review").empty();
		              $("#review").append( response );
		          }
		        , error		: function() {
		            alert( '서버 데이터를 가져오지 못했습니다. 다시 확인하여 주십시오.' );
		        }
			})
			
			
	 })
	 
	  $("#searchType_1").on("click",function(){
		  let searchType1 = ''
		 if ($(this).is(':checked')) {
			searchType1 = 'Y'
		}else{
			searchType1 = 'N'
		}
		
		 let gdasSort = $("#gdasSort li.on > a").attr("data-value")
		 let productId = $(".prd_option_box.box_select > a").attr("id");
		 let productDisplayId = $("#goodsNo").val();
		 alert(searchType1)
		 
		 let data = {
				 productId: productId,
				 gdasSort: gdasSort,
			 	productDisplayId: productDisplayId,
			 	searchType1: searchType1
		    };
		 $.ajax({
				url: "/getReview",
				data:data,
				cache: false,
				success:function( response ) {
		              $("#review").empty();
		              $("#review").append( response );
		          }
		        , error		: function() {
		            alert( '서버 데이터를 가져오지 못했습니다. 다시 확인하여 주십시오.' );
		        }
			})
	 })
	 
	 $(function(){
$(".more").click(function(){
			$("#layerWrap850.photo").show()
		})
		$(".photo li").click(function(){
			var index = $(".photo li").index($(this));
			let reviewId = $(this).find("img").data("value")
			var productDisplayId = $("#goodsNo").val();
			let productId = $(".prd_option_box.box_select > a").attr("id");
			console.log(index);
			
			let data = {
					reviewId: reviewId,
					 index: index,
					 productDisplayId: productDisplayId,
					 productId: productId
				    };
				 
					
					$.ajax({
						url: "/reviewimgpopup",
						data:data,
						cache: false,
						success:function( response ) {
							 $(".photo").hide()
							 
				              $("#layerWrap850:not(.photo)").empty();
				              $("#layerWrap850:not(.photo)").append( response );
				              popupCenter($('#layerWrap850:not(.photo)'));
				              $("#layerWrap850:not(.photo)").show()
				              
				     		
				                         
				          }
				        , error		: function() {
				            alert( '서버 데이터를 가져오지 못했습니다. 다시 확인하여 주십시오.' );
				        }
					})
		})
		
		 $(".ButtonClose.photoClose").click(function(){
		 $(".photo").hide()
	 })
	 })
	$(function(){
		$(document).on("click", ".review_thum:not(.type1) > .inner.clrfix li:not(.more)", function() {
		 let reviewId = $(this).find("img").data("value")
		 var index = $(".review_thum > .inner.clrfix li").index($(this));
		 var productDisplayId = $("#goodsNo").val();
		 let productId = $(".prd_option_box.box_select > a").attr("id");
		 console.log(index)
		 
		 let data = {
				 reviewId: reviewId,
				 index: index,
				 productDisplayId: productDisplayId,
				 productId: productId
			    };
			 
				
				$.ajax({
					url: "/reviewimgpopup",
					data:data,
					cache: false,
					success:function( response ) {
						$("#layerWrap850:not(.photo)").empty();
			              $("#layerWrap850:not(.photo)").append( response );
			              popupCenter($('#layerWrap850:not(.photo)'));
			              $("#layerWrap850:not(.photo)").show()
			     		 
			              console.log("t: "+index)  		              
			          }
			        , error		: function() {
			            alert( '서버 데이터를 가져오지 못했습니다. 다시 확인하여 주십시오.' );
			        }
				})
		 //alert(value)
				
	 })
	 
	 $(".ButtonClose").click(function(){
		 $("#layerWrap850:not(.photo)").empty()
	 })
							})
							
							
							
	$(function(){

		
		 $(".ButtonClose.photoClose").click(function(){
		 $(".photo").hide()
	 })
	 })
	 
	 function slide(index) {
			$('.slider-nav').slick('slickGoTo', index);
		}
			</script>
		