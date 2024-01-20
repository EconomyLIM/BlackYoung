<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="i" varStatus="outerLoop" begin="1" end="5">

<c:set var="innerLoopBegin"
													value="${(outerLoop.index - 1) * 4}" />
												<c:set var="innerLoopEnd"
													value="${(outerLoop.index * 4) -1}" />

<li class="slide_list">
							<c:forEach items="${pdList }" var="pli"
															begin="${innerLoopBegin}" end="${innerLoopEnd}"
															varStatus="innerLoop">
							<div class="box">
								<a
									href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000145579&amp;dispCatNo=90000010001&amp;egcode=a016_a016&amp;egrankcode=15&amp;t_page=홈&amp;t_click=큐레이션1_더보기_상품상세&amp;t_number=6"
									class="item a_detail" data-ref-goodsno="A000000145579"
									data-egrank="15" data-egcode="a016_a016"
									data-attr="장바구니^추천상품팝업^라운드랩 자작나무 수분크림 (본품80ml+20ml 추가 증정)"
									data-impression="null"
									data-tracking-param="t_page=홈&amp;t_click=큐레이션1_더보기_상품상세&amp;t_number=6"
									onclick="javascript:common.wlog(&quot;home_curation1_more_prod&quot;);common.wlog(&quot;undefined&quot;);common.link.moveGoodsDetailCuration(&quot;A000000145579&quot;, &quot;undefined&quot;,&quot;home_curation1_more_prod&quot; , &quot;pc_main_01_c&quot;,&quot;a016_a016&quot; ,&quot;15&quot; ,&quot;Home_Curation1_More&quot;,&quot;t_page=홈&amp;t_click=큐레이션1_더보기_상품상세&amp;t_number=6&quot;); return false;"
									name="Home_Curation1_More"><span class="thumb_flag best">베스트</span><span
									class="thumImg"><img
										src="${pli.productDisplaySrc } "
										alt="라운드랩 자작나무 수분크림 (본품80ml+20ml 추가 증정)"
										class="mCS_img_loaded"></span>
									<div class="prd_name">
										<p class="tx_name">${pli.productDisplayName}</p>
									</div>
									<p class="prd_price">
										<span class="tx_org"><span class="tx_num">${pli.minprice}</span>원
										</span><span class="tx_cur"><span class="tx_num">${pli.afterprice }</span>원
										</span>
									</p>
									<p class="prd_flag">
																		<c:if test="${pli.discountflag eq 1 }">
																			<span class="icon_flag sale">세일</span>
																		</c:if>
																		<c:if test="${pli.couponflag eq 1 }">
																			<span class="icon_flag coupon">쿠폰</span>
																		</c:if>
																		<c:if test="${pli.presentflag eq 1 }">
																			<span class="icon_flag gift">증정</span>
																		</c:if>
																		<c:if test="${pli.todaypickupflag eq 1}">
																			<span class="icon_flag delivery">오늘드림</span>
																		</c:if>
																	</p></a>
								<button class="btn_zzim jeem" data-ref-goodsno="A000000145579"
									data-rccode="pc_main_01_c">
									<span>찜하기전</span>
								</button>
								<button type="button" class="btnbag2"
									onclick="common.gf_regCart(this); return false;"
									data-goods-no="A000000145579" data-item-no="001"
									data-rccode="pc_main_01_c">장바구니 담기</button>

							</div>
</c:forEach>
							
							
						</li>
</c:forEach>