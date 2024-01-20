<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/inc/include.jspf"%>
	<div class="mypage-lnb">
		<ul>
			<li><h2>마이 쇼핑</h2>
				<ul>
					<li class="subMenu">
						<a href="${pageContext.request.contextPath}/mypage/orderdelivery"
							mymenuid="0101"
							data-ref-linkurl="${pageContext.request.contextPath}/mypage/orderdelivery"
							data-attr="마이페이지^메뉴^주문/배송 조회" data-tracking-name="주문배송조회 클릭"
							data-tracking-properties="t_page=마이페이지&amp;t_click=주문배송조회">주문/배송
								조회</a>
					</li>
					<li class="subMenu">
						<a href="${pageContext.request.contextPath}<%-- 취소/반품/교환 내역 페이지 --%>"
							mymenuid="0102"
							data-ref-linkurl="https://www.oliveyoung.co.kr/store/mypage/getOrderCancelList.do"
							data-attr="마이페이지^메뉴^취소/반품/교환 내역"
							data-tracking-name="취소반품교환내역 클릭"
							data-tracking-properties="t_page=마이페이지&amp;t_click=취소반품교환내역">취소/반품/교환
						내역</a>
					</li>
					<li class="subMenu">
						<a href="${pageContext.request.contextPath}<%-- 거래증빙서류 확인 --%>"
							mymenuid="0103"
							data-ref-linkurl="https://www.oliveyoung.co.kr/store/mypage/getDealList.do"
							data-attr="마이페이지^메뉴^거래증빙서류 확인"
							data-tracking-properties="t_page=마이페이지&amp;t_click=거래증빙서류확인">거래증빙서류
								확인</a>
					</li>
				</ul>
				<ul class="line">
					<li class="subMenu">
						<a href="${pageContext.request.contextPath}/basket"
							mymenuid="0201"
							data-ref-linkurl="https://www.oliveyoung.co.kr/store/cart/getCart.do"
							data-attr="마이페이지^메뉴^장바구니"
							data-tracking-properties="t_page=마이페이지&amp;t_click=장바구니">장바구니</a>
					</li>
					<li class="subMenu">
						<a href="${pageContext.request.contextPath}/mypage/productlike"
							mymenuid="0202"
							data-ref-linkurl="https://www.oliveyoung.co.kr/store/mypage/getWishList.do"
							data-attr="마이페이지^메뉴^좋아요"
							data-tracking-properties="t_page=마이페이지&amp;t_click=좋아요">좋아요</a>
					</li>
					<li class="subMenu">
						<a href="${pageContext.request.contextPath}<%-- 재입고알림 페이지 --%>"
							mymenuid="0203"
							data-ref-linkurl="https://www.oliveyoung.co.kr/store/mypage/getReWhsgList.do"
							data-attr="마이페이지^메뉴^재입고 알림" data-tracking-name="재입고알림 클릭"
							data-tracking-properties="t_page=마이페이지&amp;t_click=재입고알림">재입고
								알림</a>
					</li>
				</ul>
				<ul class="line">
					<li class="subMenu">
						<a href="${pageContext.request.contextPath}<%-- 기프트카드 페이지 --%>"
							mymenuid="0300"
							data-ref-linkurl="https://www.oliveyoung.co.kr/store/myGiftCard/getMyGiftCard.do"
							data-attr="마이페이지^메뉴^기프트카드" data-tracking-name="기프트카드 클릭"
							data-tracking-properties="t_page=마이페이지&amp;t_click=마이월렛_기프트카드">기프트카드</a>
					</li>
					<li class="subMenu">
						<a href="${pageContext.request.contextPath}<%-- CJONE포인트 페이지 --%>"
							mymenuid="0301"
							data-ref-linkurl="https://www.oliveyoung.co.kr/store/mypage/getCJOnePointInfo.do"
							data-attr="마이페이지^메뉴^CJ ONE 포인트"
							data-tracking-name="CJONE포인트 클릭"
							data-tracking-properties="t_page=마이페이지&amp;t_click=CJONE포인트">
							CJ ONE 포인트</a>
					</li>
					<li class="subMenu">
						<a href="${pageContext.request.contextPath}<%-- 쿠폰 페이지 --%>"
							mymenuid="0302"
							data-ref-linkurl="https://www.oliveyoung.co.kr/store/mypage/getCouponList.do"
							data-attr="마이페이지^메뉴^쿠폰"
							data-tracking-properties="t_page=마이페이지&amp;t_click=쿠폰">쿠폰</a>
					</li>
					<li class="subMenu">
						<a href="${pageContext.request.contextPath}<%-- 예치금 페이지 --%>"
							mymenuid="0303"
							data-ref-linkurl="https://www.oliveyoung.co.kr/store/mypage/getDepositList.do"
							data-attr="마이페이지^메뉴^예치금"
							data-tracking-properties="t_page=마이페이지&amp;t_click=마이월렛_예치금">예치금</a>
					</li>

				</ul>
				</li>
			<li>
			<h2>마이 활동</h2>
				<ul>
					<li class="subMenu"><a href="${pageContext.request.contextPath}/counselor/personalAskList"
						mymenuid="0401"
						data-ref-linkurl="${pageContext.request.contextPath}/counselor/personalAskList"
						data-attr="마이페이지^메뉴^1:1문의내역" data-tracking-name="1대1문의 클릭"
						data-tracking-properties="t_page=마이페이지&amp;t_click=문의현황_1대1문의">1:1문의내역</a></li>

					<c:set var="revc" value="${ requestScope.userRevCount }" />
					<li class="subMenu"><a href=" ${pageContext.request.contextPath}/mypage/reviewwrite"
						mymenuid="0402"
						data-ref-linkurl="https://www.oliveyoung.co.kr/store/mypage/getGdasList.do"
						data-attr="마이페이지^메뉴^리뷰"
						data-tracking-properties="t_page=마이페이지&amp;t_click=리뷰">리뷰 (<span
							class="num_review" id="_gdasPossibleTotCnt">${ sideVO }</span>)<img
							src="https://static.oliveyoung.co.kr/pc-static-root/image/comm/icon_lnb_new2.png"
							class="new" id="_newGdasPossible" style="display: none;"
							alt="신규 리뷰 작성"></a></li>
					<li class="subMenu"><a href=" ${pageContext.request.contextPath}/mypage/productQnA"
						mymenuid="0403"
						data-ref-linkurl="https://www.oliveyoung.co.kr/store/mypage/getGoodsQnaList.do"
						data-attr="마이페이지^메뉴^상품Q&amp;A내역" data-tracking-name="상품QnA 클릭"
						data-tracking-properties="t_page=마이페이지&amp;t_click=문의현황_상품QnA">상품Q&amp;A내역</a></li>
					<li class="subMenu"><a href=" ${pageContext.request.contextPath}<%-- 이벤트 참여 페이지 --%>"
						mymenuid="0404"
						data-ref-linkurl="https://www.oliveyoung.co.kr/store/mypage/getMyEventList.do"
						data-attr="마이페이지^메뉴^이벤트 참여 현황" data-tracking-name="이벤트참여현황 클릭"
						data-tracking-properties="t_page=마이페이지&amp;t_click=이벤트참여현황">이벤트
							참여 현황</a></li>

					<li class="subMenu"><a href=" ${pageContext.request.contextPath}<%-- 체험단리뷰 페이지 --%>"
						mymenuid="0405"
						data-ref-linkurl="https://www.oliveyoung.co.kr/store/mypage/getMyOllyoungList.do"
						data-attr="마이페이지^메뉴^올영체험단 리뷰"
						data-tracking-properties="t_page=마이페이지&amp;t_click=올영체험단리뷰">체험단
							리뷰</a></li>
				</ul></li>
			<li><h2>마이 정보</h2>
				<ul>
					<li class="subMenu"><a href="${pageContext.request.contextPath}/mypage/usermodify"
						mymenuid="0501" data-ref-linkurl="${pageContext.request.contextPath}/mypage/usermodify"
						data-attr="마이페이지^메뉴^회원정보 수정"
						data-tracking-properties="t_page=마이페이지&amp;t_click=회원정보수정">회원정보
							수정</a></li>
					<li class="subMenu"><a href="${pageContext.request.contextPath}<%-- 배송지/환불계좌 페이지 --%>"
						mymenuid="0502"
						data-ref-linkurl="https://www.oliveyoung.co.kr/store/mypage/getDeliveryInfo.do"
						data-attr="마이페이지^메뉴^배송지/환불계좌" data-tracking-name="배송지환불계좌 클릭"
						data-tracking-properties="t_page=마이페이지&amp;t_click=배송지환불계좌">배송지/환불계좌</a></li>
					<li class="subMenu"><a href="${pageContext.request.contextPath}<%-- 관심매장 페이지 --%>"
						mymenuid="0505"
						data-ref-linkurl="https://www.oliveyoung.co.kr/store/store/getStoreMain.do?tabType=favorTab"
						data-attr="마이페이지^메뉴^관심 매장 관리" data-tracking-name="관심매장 클릭"
						data-tracking-properties="t_page=마이페이지&amp;t_click=관심매장">관심
							매장 관리</a></li>

					<li class="subMenu"><a href="${pageContext.request.contextPath}<%-- 회원탈퇴 페이지 --%>"
						mymenuid="0504"
						data-ref-linkurl="https://www.oliveyoung.co.kr/store/mypage/custInfoOut.do"
						data-attr="마이페이지^메뉴^회원탈퇴"
						data-tracking-properties="t_page=마이페이지&amp;t_click=회원탈퇴">회원탈퇴</a></li>
				</ul></li>
		</ul>
	</div>
