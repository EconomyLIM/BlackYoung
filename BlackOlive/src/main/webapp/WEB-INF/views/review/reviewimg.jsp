<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<div class="photo_detail" id="photoDetail">
		<div class="review_summary photo" id="photoDetail">
			<div class="user clrfix  ">
				<a href="javascript:;"
					onclick="goods.gdas.handleClickReviewPhotoDetailReviewerProfile('aTJNaDhBM0V5QStaeWYrWXdXaWFPZz09', {t_page: '포토상세', t_click: '리뷰포토상세_리뷰어프로필', t_profile_name: 'Mizthecat', goodsNo: 'A000000190051', goodsname: '[윈터 PICK] 마몽드 포어 슈링커 바쿠치올 크림 60ml 단독기획 (+30ml 추가증정)', t_review_rank_name: '1172'});"
					data-attr="상품상세^포토상세^리뷰어프로필클릭"> <img
					src="https://image.oliveyoung.co.kr/uploads/images/mbrProfile/2023/07/31/1690732966938.png"
					onerror="common.errorProfileImg(this);" style="display: none;"
					onload="common.onLoadProfileImg(this, 60);">
					<div class="thum">
						<span class="bg"></span> <img
							src="${reviewDTO.profileImg }"
							class="profileThum_s"
							style="background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/my_picture_base.jpg) no-repeat 0 0; background-size: 60px">
					</div>
				</a>
				<p class="info_user">
					<a href="javascript:;"
						onclick="goods.gdas.handleClickReviewPhotoDetailReviewerProfile('aTJNaDhBM0V5QStaeWYrWXdXaWFPZz09', {t_page: '포토상세', t_click: '리뷰포토상세_리뷰어프로필', t_profile_name: 'Mizthecat', goodsNo: 'A000000190051', goodsname: '[윈터 PICK] 마몽드 포어 슈링커 바쿠치올 크림 60ml 단독기획 (+30ml 추가증정)', t_review_rank_name: '1172'});"
						class="id" data-attr="상품상세^포토상세^리뷰어프로필클릭">${reviewDTO.nickname }</a>
					<a href="javascript:;"
						onclick="goods.gdas.handleClickTopReviewer({t_page: '포토상세', t_click: '리뷰포토상세_탑리뷰어순위', t_review_rank_name: '1172'})"
						class="top">TOP 1172</a>
				</p>
				<!-- 리뷰 고도화 2차 추가 S-->
				<!-- 리뷰 고도화 2차 추가 E-->
				<p class="tag">
					<span>${reviewDTO.skintypeName }</span> <span>${reviewDTO.skintoneName }</span> 
					
													<c:forEach items="${reviewDTO.skinTrouble }" var="skintrb">
														
												<span>${skintrb.skintroubleName }</span>
												
												</c:forEach>
												
				</p>
			</div>
			<div class="score_area addOY">
				<span class="review_point"><span class="point"
					style="width: ${reviewDTO.reviewGrade * 20}%">5점만점에
						${reviewDTO.reviewGrade}점</span></span> <span class="date">${reviewDTO.reviewRegdate}</span>
				<span class="ico_oyGroup">체험단</span>
			</div>
			<div class="txt_inner">${reviewDTO.reviewContent}</div>
			<div class="review_tag"></div>
			<p class="txt_beauty">* 본 상품 후기는 체험단으로 선정되어 CJ올리브영으로부터 위 상품을 무료로
				제공받아 작성한 것입니다.</p>
			<div class="poll_sample">
				<dl class="poll_type1">
					<dt>
						<span>피부타입</span>
					</dt>
					<dd>
						<span class="txt"> <c:choose>
								<c:when test="${reviewDTO.reviewPoll1 eq 3 }">
													건성에 좋아요
												</c:when>
								<c:when test="${reviewDTO.reviewPoll1 eq 2 }">
													복합성에 좋아요
												</c:when>
								<c:when test="${reviewDTO.reviewPoll1 eq 1 }">
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
								<c:when test="${reviewDTO.reviewPoll2 eq 3 }">
													보습에 좋아요
												</c:when>
								<c:when test="${reviewDTO.reviewPoll2 eq 2 }">
													진정에 좋아요
												</c:when>
								<c:when test="${reviewDTO.reviewPoll2 eq 1 }">
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
								<c:when test="${reviewDTO.reviewPoll3 eq 3 }">
													자극없이 순해요
												</c:when>
								<c:when test="${reviewDTO.reviewPoll3 eq 2 }">
													보통이에요
												</c:when>
								<c:when test="${reviewDTO.reviewPoll3 eq 1 }">
													자극이 느껴져요
												</c:when>

							</c:choose>
						</span>
					</dd>
				</dl>
			</div>
		</div>
	</div>
