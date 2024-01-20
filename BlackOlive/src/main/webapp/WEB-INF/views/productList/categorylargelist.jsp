<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://static.oliveyoung.co.kr/pc-static-root/js/common/publish/jquery.mCustomScrollbar.concat.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<div id="Container">
	<!-- #Contents -->
	<div id="Contents">

		<!-- 카테고리 메인 -->
		<div class="ct-main">

			<!-- menu -->
			<div class="ct-menu">
				<p class="ct-heading">${currentCategoryNameDTO.name }</p>

				<ul class="list">

					<c:if test="${not empty categoryMidList}">
						<c:forEach items="${categoryMidList}" var="cml">
							<li><a
								href="/store/display?dispCapno=${cml.categoryLargeId}${cml.categoryMidId}&sort=1">
									<span>${cml.categoryMidName}</span>
							</a></li>
						</c:forEach>
					</c:if>

				</ul>
			</div>
			<!-- // menu -->

			<!-- content -->
			<div class="ct-content-wrapper">
				<!-- 원배너 -->
				<div class="ct-content bg-white">
					<div class="ct-theme">
						<p class="ct-tit"></p>
						<div id="ctTheme">
									<div data-slick-index="-5" aria-hidden="true" style="width: 158px;"  tabindex="-1">
										<a
											href="https://www.oliveyoung.co.kr/store/planshop/getPlanShopDetail.do?dispCatNo=500000102240016&amp;trackingCd=Cat10000010001_Planshop3_PROD&amp;t_page=카테고리관&amp;t_click=원배너&amp;t_banner_name=클린뷰티(상시)&amp;t_number=3"
											onclick="categoryShop.detail.setBindWlogEvent('cbanner', '3');categoryShop.detail.catagoryBannerAmplitude('카테고리관_원배너 클릭','카테고리관','원배너','클린뷰티(상시)','3');"
											data-attr="카테고리관^스킨케어_원배너^클린뷰티(상시)^3" data-trk="Drawer/"
											tabindex="-1"> <span class="img"> <img
												src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/222/9148069470258164643.png"
												alt="클린뷰티(상시)" onerror="common.errorCrcImg(this);">
										</span>
											<p>클린뷰티</p>
										</a>
									</div>
									<div data-slick-index="-4" aria-hidden="true" style="width: 158px;" tabindex="-1">
										<a
											href="https://www.oliveyoung.co.kr/store/planshop/getPlanShopDetail.do?dispCatNo=500000102700122&amp;trackingCd=Cat10000010001_Planshop3_PROD&amp;t_page=카테고리관&amp;t_click=원배너&amp;t_banner_name=보습크림&amp;t_number=4"
											onclick="categoryShop.detail.setBindWlogEvent('cbanner', '4');categoryShop.detail.catagoryBannerAmplitude('카테고리관_원배너 클릭','카테고리관','원배너','보습크림','4');"
											data-attr="카테고리관^스킨케어_원배너^보습크림^4" data-trk="Drawer/"
											tabindex="-1"> <span class="img"> <img
												src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/222/5034368343874615711.png"
												alt="보습크림" onerror="common.errorCrcImg(this);">
										</span>
											<p>보습크림</p>
										</a>
									</div>
									<div data-slick-index="-3"
										aria-hidden="true" style="width: 158px;" tabindex="-1">
										<a
											href="https://www.oliveyoung.co.kr/store/display/getMCategoryList.do?dispCatNo=1000001000100150001&amp;trackingCd=Cat10000010001_Planshop3_PROD&amp;t_page=카테고리관&amp;t_click=원배너&amp;t_banner_name=크림&amp;t_number=5"
											onclick="categoryShop.detail.setBindWlogEvent('cbanner', '5');categoryShop.detail.catagoryBannerAmplitude('카테고리관_원배너 클릭','카테고리관','원배너','크림','5');"
											data-attr="카테고리관^스킨케어_원배너^크림^5" data-trk="Drawer/"
											tabindex="-1"> <span class="img"> <img
												src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/222/3299869691912686679.png"
												alt="크림" onerror="common.errorCrcImg(this);">
										</span>
											<p>크림</p>
										</a>
									</div>
									<div data-slick-index="-2"
										aria-hidden="true" style="width: 158px;" tabindex="-1">
										<a
											href="https://www.oliveyoung.co.kr/store/display/getMCategoryList.do?dispCatNo=1000001000100140001&amp;trackingCd=Cat10000010001_Planshop3_PROD&amp;t_page=카테고리관&amp;t_click=원배너&amp;t_banner_name=에센스/세럼&amp;t_number=6"
											onclick="categoryShop.detail.setBindWlogEvent('cbanner', '6');categoryShop.detail.catagoryBannerAmplitude('카테고리관_원배너 클릭','카테고리관','원배너','에센스/세럼','6');"
											data-attr="카테고리관^스킨케어_원배너^에센스/세럼^6" data-trk="Drawer/"
											tabindex="-1"> <span class="img"> <img
												src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/222/3620212376996424421.png"
												alt="에센스/세럼" onerror="common.errorCrcImg(this);">
										</span>
											<p>에센스</p>
										</a>
									</div>
									<div data-slick-index="-1"
										aria-hidden="true" style="width: 158px;" tabindex="-1">
										<a
											href="https://www.oliveyoung.co.kr/store/display/getMCategoryList.do?dispCatNo=1000001000100130001&amp;trackingCd=Cat10000010001_Planshop3_PROD&amp;t_page=카테고리관&amp;t_click=원배너&amp;t_banner_name=스킨/토너&amp;t_number=7"
											onclick="categoryShop.detail.setBindWlogEvent('cbanner', '7');categoryShop.detail.catagoryBannerAmplitude('카테고리관_원배너 클릭','카테고리관','원배너','스킨/토너','7');"
											data-attr="카테고리관^스킨케어_원배너^스킨/토너^7" data-trk="Drawer/"
											tabindex="-1"> <span class="img"> <img
												src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/222/6622854359597009754.jpeg"
												alt="스킨/토너" onerror="common.errorCrcImg(this);">
										</span>
											<p>토너</p>
										</a>
									</div>
									<div
										data-slick-index="0" aria-hidden="false" style="width: 158px;"
										tabindex="-1" role="option" aria-describedby="slick-slide10">
										<a
											href="https://www.oliveyoung.co.kr/store/planshop/getPlanShopDetail.do?dispCatNo=500000102700135&amp;trackingCd=Cat10000010001_Planshop3_PROD&amp;t_page=카테고리관&amp;t_click=원배너&amp;t_banner_name=12월 올영P!CK&amp;t_number=1"
											onclick="categoryShop.detail.setBindWlogEvent('cbanner', '1');categoryShop.detail.catagoryBannerAmplitude('카테고리관_원배너 클릭','카테고리관','원배너','12월 올영P!CK','1');"
											data-attr="카테고리관^스킨케어_원배너^12월 올영P!CK^1" data-trk="Drawer/"
											tabindex="0"> <span class="img"> <img
												src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/222/1784784164426166233.png"
												alt="12월 올영P!CK" onerror="common.errorCrcImg(this);">
										</span>
											<p>12월 올영P!CK</p>
										</a>
									</div>
									<div data-slick-index="1"
										aria-hidden="false" style="width: 158px;" tabindex="-1"
										role="option" aria-describedby="slick-slide11">
										<a
											href="https://www.oliveyoung.co.kr/store/planshop/getPlanShopDetail.do?dispCatNo=500000102700083&amp;trackingCd=Cat10000010001_Planshop3_PROD&amp;t_page=카테고리관&amp;t_click=원배너&amp;t_banner_name=슬로우에이징(상시)&amp;t_number=2"
											onclick="categoryShop.detail.setBindWlogEvent('cbanner', '2');categoryShop.detail.catagoryBannerAmplitude('카테고리관_원배너 클릭','카테고리관','원배너','슬로우에이징(상시)','2');"
											data-attr="카테고리관^스킨케어_원배너^슬로우에이징(상시)^2" data-trk="Drawer/"
											tabindex="0"> <span class="img"> <img
												src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/222/3459724246642428058.JPG"
												alt="슬로우에이징(상시)" onerror="common.errorCrcImg(this);">
										</span>
											<p>슬로우에이징</p>
										</a>
									</div>
									<div data-slick-index="2"
										aria-hidden="false" style="width: 158px;" tabindex="-1"
										role="option" aria-describedby="slick-slide12">
										<a
											href="https://www.oliveyoung.co.kr/store/planshop/getPlanShopDetail.do?dispCatNo=500000102240016&amp;trackingCd=Cat10000010001_Planshop3_PROD&amp;t_page=카테고리관&amp;t_click=원배너&amp;t_banner_name=클린뷰티(상시)&amp;t_number=3"
											onclick="categoryShop.detail.setBindWlogEvent('cbanner', '3');categoryShop.detail.catagoryBannerAmplitude('카테고리관_원배너 클릭','카테고리관','원배너','클린뷰티(상시)','3');"
											data-attr="카테고리관^스킨케어_원배너^클린뷰티(상시)^3" data-trk="Drawer/"
											tabindex="0"> <span class="img"> <img
												src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/222/9148069470258164643.png"
												alt="클린뷰티(상시)" onerror="common.errorCrcImg(this);">
										</span>
											<p>클린뷰티</p>
										</a>
									</div>
									<div data-slick-index="3"
										aria-hidden="false" style="width: 158px;" tabindex="-1"
										role="option" aria-describedby="slick-slide13">
										<a
											href="https://www.oliveyoung.co.kr/store/planshop/getPlanShopDetail.do?dispCatNo=500000102700122&amp;trackingCd=Cat10000010001_Planshop3_PROD&amp;t_page=카테고리관&amp;t_click=원배너&amp;t_banner_name=보습크림&amp;t_number=4"
											onclick="categoryShop.detail.setBindWlogEvent('cbanner', '4');categoryShop.detail.catagoryBannerAmplitude('카테고리관_원배너 클릭','카테고리관','원배너','보습크림','4');"
											data-attr="카테고리관^스킨케어_원배너^보습크림^4" data-trk="Drawer/"
											tabindex="0"> <span class="img"> <img
												src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/222/5034368343874615711.png"
												alt="보습크림" onerror="common.errorCrcImg(this);">
										</span>
											<p>보습크림</p>
										</a>
									</div>
									<div data-slick-index="4"
										aria-hidden="false" style="width: 158px;" tabindex="-1"
										role="option" aria-describedby="slick-slide14">
										<a
											href="https://www.oliveyoung.co.kr/store/display/getMCategoryList.do?dispCatNo=1000001000100150001&amp;trackingCd=Cat10000010001_Planshop3_PROD&amp;t_page=카테고리관&amp;t_click=원배너&amp;t_banner_name=크림&amp;t_number=5"
											onclick="categoryShop.detail.setBindWlogEvent('cbanner', '5');categoryShop.detail.catagoryBannerAmplitude('카테고리관_원배너 클릭','카테고리관','원배너','크림','5');"
											data-attr="카테고리관^스킨케어_원배너^크림^5" data-trk="Drawer/"
											tabindex="0"> <span class="img"> <img
												src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/222/3299869691912686679.png"
												alt="크림" onerror="common.errorCrcImg(this);">
										</span>
											<p>크림</p>
										</a>
									</div>
									<div  data-slick-index="5"
										aria-hidden="true" style="width: 158px;" tabindex="-1"
										role="option" aria-describedby="slick-slide15">
										<a
											href="https://www.oliveyoung.co.kr/store/display/getMCategoryList.do?dispCatNo=1000001000100140001&amp;trackingCd=Cat10000010001_Planshop3_PROD&amp;t_page=카테고리관&amp;t_click=원배너&amp;t_banner_name=에센스/세럼&amp;t_number=6"
											onclick="categoryShop.detail.setBindWlogEvent('cbanner', '6');categoryShop.detail.catagoryBannerAmplitude('카테고리관_원배너 클릭','카테고리관','원배너','에센스/세럼','6');"
											data-attr="카테고리관^스킨케어_원배너^에센스/세럼^6" data-trk="Drawer/"
											tabindex="-1"> <span class="img"> <img
												src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/222/3620212376996424421.png"
												alt="에센스/세럼" onerror="common.errorCrcImg(this);">
										</span>
											<p>에센스</p>
										</a>
									</div>
									<div data-slick-index="6"
										aria-hidden="true" style="width: 158px;" tabindex="-1"
										role="option" aria-describedby="slick-slide16">
										<a
											href="https://www.oliveyoung.co.kr/store/display/getMCategoryList.do?dispCatNo=1000001000100130001&amp;trackingCd=Cat10000010001_Planshop3_PROD&amp;t_page=카테고리관&amp;t_click=원배너&amp;t_banner_name=스킨/토너&amp;t_number=7"
											onclick="categoryShop.detail.setBindWlogEvent('cbanner', '7');categoryShop.detail.catagoryBannerAmplitude('카테고리관_원배너 클릭','카테고리관','원배너','스킨/토너','7');"
											data-attr="카테고리관^스킨케어_원배너^스킨/토너^7" data-trk="Drawer/"
											tabindex="-1"> <span class="img"> <img
												src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/222/6622854359597009754.jpeg"
												alt="스킨/토너" onerror="common.errorCrcImg(this);">
										</span>
											<p>토너</p>
										</a>
									</div>
									<div  data-slick-index="7"
										aria-hidden="true" style="width: 158px;" tabindex="-1">
										<a
											href="https://www.oliveyoung.co.kr/store/planshop/getPlanShopDetail.do?dispCatNo=500000102700135&amp;trackingCd=Cat10000010001_Planshop3_PROD&amp;t_page=카테고리관&amp;t_click=원배너&amp;t_banner_name=12월 올영P!CK&amp;t_number=1"
											onclick="categoryShop.detail.setBindWlogEvent('cbanner', '1');categoryShop.detail.catagoryBannerAmplitude('카테고리관_원배너 클릭','카테고리관','원배너','12월 올영P!CK','1');"
											data-attr="카테고리관^스킨케어_원배너^12월 올영P!CK^1" data-trk="Drawer/"
											tabindex="-1"> <span class="img"> <img
												src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/222/1784784164426166233.png"
												alt="12월 올영P!CK" onerror="common.errorCrcImg(this);">
										</span>
											<p>12월 올영P!CK</p>
										</a>
									</div>
									<div  data-slick-index="8"
										aria-hidden="true" style="width: 158px;" tabindex="-1">
										<a
											href="https://www.oliveyoung.co.kr/store/planshop/getPlanShopDetail.do?dispCatNo=500000102700083&amp;trackingCd=Cat10000010001_Planshop3_PROD&amp;t_page=카테고리관&amp;t_click=원배너&amp;t_banner_name=슬로우에이징(상시)&amp;t_number=2"
											onclick="categoryShop.detail.setBindWlogEvent('cbanner', '2');categoryShop.detail.catagoryBannerAmplitude('카테고리관_원배너 클릭','카테고리관','원배너','슬로우에이징(상시)','2');"
											data-attr="카테고리관^스킨케어_원배너^슬로우에이징(상시)^2" data-trk="Drawer/"
											tabindex="-1"> <span class="img"> <img
												src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/222/3459724246642428058.JPG"
												alt="슬로우에이징(상시)" onerror="common.errorCrcImg(this);">
										</span>
											<p>슬로우에이징</p>
										</a>
									</div>
									<div  data-slick-index="9"
										aria-hidden="true" style="width: 158px;" tabindex="-1">
										<a
											href="https://www.oliveyoung.co.kr/store/planshop/getPlanShopDetail.do?dispCatNo=500000102240016&amp;trackingCd=Cat10000010001_Planshop3_PROD&amp;t_page=카테고리관&amp;t_click=원배너&amp;t_banner_name=클린뷰티(상시)&amp;t_number=3"
											onclick="categoryShop.detail.setBindWlogEvent('cbanner', '3');categoryShop.detail.catagoryBannerAmplitude('카테고리관_원배너 클릭','카테고리관','원배너','클린뷰티(상시)','3');"
											data-attr="카테고리관^스킨케어_원배너^클린뷰티(상시)^3" data-trk="Drawer/"
											tabindex="-1"> <span class="img"> <img
												src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/222/9148069470258164643.png"
												alt="클린뷰티(상시)" onerror="common.errorCrcImg(this);">
										</span>
											<p>클린뷰티</p>
										</a>
									</div>
									<div  data-slick-index="10"
										aria-hidden="true" style="width: 158px;" tabindex="-1">
										<a
											href="https://www.oliveyoung.co.kr/store/planshop/getPlanShopDetail.do?dispCatNo=500000102700122&amp;trackingCd=Cat10000010001_Planshop3_PROD&amp;t_page=카테고리관&amp;t_click=원배너&amp;t_banner_name=보습크림&amp;t_number=4"
											onclick="categoryShop.detail.setBindWlogEvent('cbanner', '4');categoryShop.detail.catagoryBannerAmplitude('카테고리관_원배너 클릭','카테고리관','원배너','보습크림','4');"
											data-attr="카테고리관^스킨케어_원배너^보습크림^4" data-trk="Drawer/"
											tabindex="-1"> <span class="img"> <img
												src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/222/5034368343874615711.png"
												alt="보습크림" onerror="common.errorCrcImg(this);">
										</span>
											<p>보습크림</p>
										</a>
									</div>
									<div data-slick-index="11"
										aria-hidden="true" style="width: 158px;" tabindex="-1">
										<a
											href="https://www.oliveyoung.co.kr/store/display/getMCategoryList.do?dispCatNo=1000001000100150001&amp;trackingCd=Cat10000010001_Planshop3_PROD&amp;t_page=카테고리관&amp;t_click=원배너&amp;t_banner_name=크림&amp;t_number=5"
											onclick="categoryShop.detail.setBindWlogEvent('cbanner', '5');categoryShop.detail.catagoryBannerAmplitude('카테고리관_원배너 클릭','카테고리관','원배너','크림','5');"
											data-attr="카테고리관^스킨케어_원배너^크림^5" data-trk="Drawer/"
											tabindex="-1"> <span class="img"> <img
												src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/222/3299869691912686679.png"
												alt="크림" onerror="common.errorCrcImg(this);">
										</span>
											<p>크림</p>
										</a>
									</div>
							
							<!-- div태그 끝나는 곳 -->
						</div>
					</div>
				</div>

				<!-- // 원배너 -->
				<!-- 롤링 대배너 -->

				<div class="ct-content bg-white">

					<div class="ct-top-banner type2">
						<div class="banner-list">
									<div class="img"
										data-slick-index="0" aria-hidden="false"
										style="width: 790px; position: relative; left: 0px; top: 0px; z-index: 999; opacity: 1;"
										tabindex="-1" role="option" aria-describedby="slick-slide00">
										<a
											href="https://www.oliveyoung.co.kr/store/planshop/getPlanShopDetail.do?dispCatNo=500000102700137&amp;trackingCd=Cat10000010001_Planshop1_1_PROD&amp;t_page=카테고리관&amp;t_click=롤링배너&amp;t_banner_name=겨울 민감피부에 닥터자르트&amp;t_number=1"
											onclick="javascript:categoryShop.detail.setBindWlogEvent('rlbanner', '1');categoryShop.detail.catagoryBannerAmplitude('카테고리관_롤링배너 클릭','카테고리관','롤링배너','겨울 민감피부에 닥터자르트','1');"
											data-attr="카테고리관^스킨케어_롤링배너^겨울 민감피부에 닥터자르트^1"
											data-trk="Drawer/" tabindex="0"> <img
											src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/148/1044499114777522823.jpg"
											alt="겨울 민감피부에 닥터자르트">
											<div class="banner-detail">
												<div class="txt">
													<p class="copy">겨울 민감피부에 닥터자르트</p>
													<p class="sub-copy">#엔하이픈 포토네컷 혜택</p>
												</div>
											</div>
										</a>
									</div>


						<!--  -->
						</div>

					</div>


				</div>

				<!-- // 롤링 대배너 -->
				<!-- 롤링띠배너 -->

				<div class="ct-content bg-gray ct-banner">
					<div class="ct-content-banner">
						<div class="slide_list">

							<div class="slide">
								<a
									href="https://www.oliveyoung.co.kr/store/planshop/getPlanShopDetail.do?dispCatNo=500000102700138&amp;trackingCd=Cat10000010001_Planshop2_1_PROD&amp;t_page=카테고리관&amp;t_click=롤링띠배너&amp;t_banner_name=아이소이 잡티세럼 #11년간 1등&amp;t_number=1"
									onclick="categoryShop.detail.setBindWlogEvent('rtbanner', '1');categoryShop.detail.catagoryBannerAmplitude('카테고리관_롤링띠배너 클릭','카테고리관','롤링띠배너','아이소이 잡티세럼 #11년간 1등','1');"
									data-attr="카테고리관^스킨케어_롤링띠배너^아이소이 잡티세럼 #11년간 1등^1"
									data-trk="Drawer/"> <img
									src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/329/3944167845271916853.jpg"
									alt="아이소이 잡티세럼 #11년간 1등"> <span>아이소이 잡티세럼 #11년간 1등</span>
								</a>
							</div>



						</div>
						<!-- 12/9 마크업 변경 -->
						<div class="banner_arrow" style="display: none;">
							<button type="button" data-role="none" class="slick_arrow_prev"
								aria-label="Previous" role="button">이전</button>
							<button type="button" data-role="none" class="slick_arrow_next"
								aria-label="Next" role="button">다음</button>

							<span class="paging"></span>

							<button type="button" role="button"
								class="slick_autoplay slick_pause">
								<span>정지</span>
							</button>
							<button type="button" role="button"
								class="slick_autoplay slick_play" style="display: none">
								<span>재생</span>
							</button>
						</div>
					</div>
				</div>

				<!-- // 롤링띠배너 -->
				<!-- 랭킹 -->

				<div class="ct-content bg-white">
					<div class="ct-best">
						<p class="ct-tit">${currentCategoryNameDTO.name}의BEST만 모아봤어요</p>
						<div class="col-wrap">

							<div class="col ct-tab-wrap">
								<div class="ct-tab">
									<span class="is-active" id="brandTabBtn"><a href="javascript:;"><span>브랜드</span></a></span>
									<span class="" id="productTabBtn"><a href="javascript:;"><span>상품</span></a></span>
								</div>

								<div class="detail" id="brandTab" style="display: block;">
									<div class="ct-brand">
										<a
											href="javascript:common.link.moveBrandShop('A000730', 'Cat10000010001_Brandrank_PROD','',{ t_page: '카테고리관', t_click: '랭킹BEST상품브랜드_브랜드랭킹',t_brand_name:'아이소이',t_number:'1'});"
											class="item"
											onclick="javascript:categoryShop.detail.setBindWlogEvent('rank_brand', '1');"
											data-attr="카테고리관^스킨케어_랭킹BEST상품브랜드_브랜드랭킹^아이소이"> <span
											class="num">1</span> <span class="img"><img
												src="https://image.oliveyoung.co.kr/uploads/images/onlBrandMgmt/2021/6/5587431630231725724.jpg"
												onerror="common.errorCrcImg(this);"></span>
										<!-- 브랜드 로고 없을 경우 -->
											<p class="txt">아이소이</p>
											<p class="link-txt">
												<span>브랜드관 가기!</span>
											</p>
										</a> <a
											href="javascript:common.link.moveBrandShop('A002820', 'Cat10000010001_Brandrank_PROD','',{ t_page: '카테고리관', t_click: '랭킹BEST상품브랜드_브랜드랭킹',t_brand_name:'토리든',t_number:'2'});"
											class="item"
											onclick="javascript:categoryShop.detail.setBindWlogEvent('rank_brand', '2');"
											data-attr="카테고리관^스킨케어_랭킹BEST상품브랜드_브랜드랭킹^토리든"> <span
											class="num">2</span> <span class="img"><img
												src="https://image.oliveyoung.co.kr/uploads/images/onlBrandMgmt/2022/7/3087277194835917059.jpg"
												onerror="common.errorCrcImg(this);"></span>
										<!-- 브랜드 로고 없을 경우 -->
											<p class="txt">토리든</p>
											<p class="link-txt">
												<span>브랜드관 가기!</span>
											</p>
										</a> <a
											href="javascript:common.link.moveBrandShop('A002474', 'Cat10000010001_Brandrank_PROD','',{ t_page: '카테고리관', t_click: '랭킹BEST상품브랜드_브랜드랭킹',t_brand_name:'에스트라',t_number:'3'});"
											class="item"
											onclick="javascript:categoryShop.detail.setBindWlogEvent('rank_brand', '3');"
											data-attr="카테고리관^스킨케어_랭킹BEST상품브랜드_브랜드랭킹^에스트라"> <span
											class="num">3</span> <span class="img"><img
												src="https://image.oliveyoung.co.kr/uploads/images/onlBrandMgmt/2020/12/58144562832857706.jpg"
												onerror="common.errorCrcImg(this);"></span>
										<!-- 브랜드 로고 없을 경우 -->
											<p class="txt">에스트라</p>
											<p class="link-txt">
												<span>브랜드관 가기!</span>
											</p>
										</a> <a
											href="javascript:common.link.moveBrandShop('A001873', 'Cat10000010001_Brandrank_PROD','',{ t_page: '카테고리관', t_click: '랭킹BEST상품브랜드_브랜드랭킹',t_brand_name:'브이티',t_number:'4'});"
											class="item"
											onclick="javascript:categoryShop.detail.setBindWlogEvent('rank_brand', '4');"
											data-attr="카테고리관^스킨케어_랭킹BEST상품브랜드_브랜드랭킹^브이티"> <span
											class="num">4</span> <span class="img"><img
												src="https://image.oliveyoung.co.kr/uploads/images/onlBrandMgmt/2021/1/4277267980401306810.jpg"
												onerror="common.errorCrcImg(this);"></span>
										<!-- 브랜드 로고 없을 경우 -->
											<p class="txt">브이티</p>
											<p class="link-txt">
												<span>브랜드관 가기!</span>
											</p>
										</a> <a
											href="javascript:common.link.moveBrandShop('A002756', 'Cat10000010001_Brandrank_PROD','',{ t_page: '카테고리관', t_click: '랭킹BEST상품브랜드_브랜드랭킹',t_brand_name:'라운드랩',t_number:'5'});"
											class="item"
											onclick="javascript:categoryShop.detail.setBindWlogEvent('rank_brand', '5');"
											data-attr="카테고리관^스킨케어_랭킹BEST상품브랜드_브랜드랭킹^라운드랩"> <span
											class="num">5</span> <span class="img"><img
												src="https://image.oliveyoung.co.kr/uploads/images/onlBrandMgmt/2020/12/8461360608481023208.jpg"
												onerror="common.errorCrcImg(this);"></span>
										<!-- 브랜드 로고 없을 경우 -->
											<p class="txt">라운드랩</p>
											<p class="link-txt">
												<span>브랜드관 가기!</span>
											</p>
										</a>

									</div>
								</div>

								<div class="detail" id="productTab" style="display: none;">
									<div class="ct-product" id="mRnkGoodsSec">

										<div class="item">
											<a
												href="/store/display"
												data-attr="카테고리관^스킨케어_랭킹BEST상품브랜드_상품랭킹^[2023어워즈/9년연속수상] 아이소이 잡티세럼 20ml 트리플 어워즈 한정기획"><span
												class="num">1</span><span class="img goodsList"
												data-ref-goodsno="A000000192651"
												data-ref-dispcatno="10000010001" data-ref-itemno="001"
												name="Cat10000010001_Prodrank"
												onclick="categoryShop.detail.setBindWlogEvent('rank_goods', '1')"
												idx="1"><img
													src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019265109ko.jpg?l=ko"
													alt="[2023어워즈/9년연속수상] 아이소이 잡티세럼 20ml 트리플 어워즈 한정기획"
													onerror="common.errorImg(this);"></span>
											<p class="txt">
													<span class="prd-name goodsList"
														data-ref-goodsno="A000000192651"
														data-ref-dispcatno="10000010001" data-ref-itemno="001"
														name="Cat10000010001_Prodrank"
														onclick="categoryShop.detail.setBindWlogEvent('rank_goods', '1')"
														idx="1">[2023어워즈/9년연속수상] 아이소이 잡티세럼 20ml 트리플 어워즈
														한정기획</span>
												</p>
												<p class="price">
													<span class="price-1">88,500<span>원</span></span><span
														class="price-2">40,280<span>원</span></span>
												</p>
												<p></p></a>
											<button class="btn_zzim jeem"
												data-ref-goodsno="A000000192651"
												data-ref-goodsnm="[2023어워즈/9년연속수상] 아이소이 잡티세럼 20ml 트리플 어워즈 한정기획"
												data-ref-goodsbrand="아이소이"
												data-ref-goodscategory="기초화장품>스킨케어>에센스"
												data-ref-goodstype="" data-ref-goodstrackingno=""
												data-ref-cornernm="">
												<span>찜하기전</span>
											</button>

										</div>

										<div class="item">
											<a
												href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000192784&amp;dispCatNo=10000010001&amp;trackingCd=Cat10000010001_Prodrank&amp;t_page=카테고리관&amp;t_click=랭킹BEST상품브랜드_상품상세&amp;t_number=2"
												data-attr="카테고리관^스킨케어_랭킹BEST상품브랜드_상품랭킹^[2023어워즈] 토리든 다이브인 세럼 70ml 어워즈 한정기획 (+40ml+10ml+밸런스풀세럼 2ml*5ea)"><span
												class="num">2</span><span class="img goodsList"
												data-ref-goodsno="A000000192784"
												data-ref-dispcatno="10000010001" data-ref-itemno="001"
												name="Cat10000010001_Prodrank"
												onclick="categoryShop.detail.setBindWlogEvent('rank_goods', '2')"
												idx="2"><img
													src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019278423ko.jpg?l=ko"
													alt="[2023어워즈] 토리든 다이브인 세럼 70ml 어워즈 한정기획 (+40ml+10ml+밸런스풀세럼 2ml*5ea)"
													onerror="common.errorImg(this);"></span>
											<p class="txt">
													<span class="prd-name goodsList"
														data-ref-goodsno="A000000192784"
														data-ref-dispcatno="10000010001" data-ref-itemno="001"
														name="Cat10000010001_Prodrank"
														onclick="categoryShop.detail.setBindWlogEvent('rank_goods', '2')"
														idx="2">[2023어워즈] 토리든 다이브인 세럼 70ml 어워즈 한정기획
														(+40ml+10ml+밸런스풀세럼 2ml*5ea)</span>
												</p>
												<p class="price">
													<span class="price-1">42,000<span>원</span></span><span
														class="price-2">29,400<span>원</span></span>
												</p>
												<p></p></a>
											<button class="btn_zzim jeem"
												data-ref-goodsno="A000000192784"
												data-ref-goodsnm="[2023어워즈] 토리든 다이브인 세럼 70ml 어워즈 한정기획 (+40ml+10ml+밸런스풀세럼 2ml*5ea)"
												data-ref-goodsbrand="토리든"
												data-ref-goodscategory="기초화장품>스킨케어>에센스"
												data-ref-goodstype="" data-ref-goodstrackingno=""
												data-ref-cornernm="">
												<span>찜하기전</span>
											</button>

										</div>

										<div class="item">
											<a
												href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000183731&amp;dispCatNo=10000010001&amp;trackingCd=Cat10000010001_Prodrank&amp;t_page=카테고리관&amp;t_click=랭킹BEST상품브랜드_상품상세&amp;t_number=3"
												data-attr="카테고리관^스킨케어_랭킹BEST상품브랜드_상품랭킹^[아랑Pick] VT 리들샷 100 에센스 50ml"><span
												class="num">3</span><span class="img goodsList"
												data-ref-goodsno="A000000183731"
												data-ref-dispcatno="10000010001" data-ref-itemno="001"
												name="Cat10000010001_Prodrank"
												onclick="categoryShop.detail.setBindWlogEvent('rank_goods', '3')"
												idx="3"><img
													src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0018/A00000018373104ko.jpg?l=ko"
													alt="[아랑Pick] VT 리들샷 100 에센스 50ml"
													onerror="common.errorImg(this);"></span>
											<p class="txt">
													<span class="prd-name goodsList"
														data-ref-goodsno="A000000183731"
														data-ref-dispcatno="10000010001" data-ref-itemno="001"
														name="Cat10000010001_Prodrank"
														onclick="categoryShop.detail.setBindWlogEvent('rank_goods', '3')"
														idx="3">[아랑Pick] VT 리들샷 100 에센스 50ml</span>
												</p>
												<p class="price">
													<span class="price-1">32,000<span>원</span></span><span
														class="price-2">28,800<span>원</span></span>
												</p>
												<p></p></a>
											<button class="btn_zzim jeem"
												data-ref-goodsno="A000000183731"
												data-ref-goodsnm="[아랑Pick] VT 리들샷 100 에센스 50ml"
												data-ref-goodsbrand="브이티"
												data-ref-goodscategory="기초화장품>스킨케어>에센스"
												data-ref-goodstype="" data-ref-goodstrackingno=""
												data-ref-cornernm="">
												<span>찜하기전</span>
											</button>

										</div>

										<div class="item">
											<a
												href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000192385&amp;dispCatNo=10000010001&amp;trackingCd=Cat10000010001_Prodrank&amp;t_page=카테고리관&amp;t_click=랭킹BEST상품브랜드_상품상세&amp;t_number=4"
												data-attr="카테고리관^스킨케어_랭킹BEST상품브랜드_상품랭킹^[2023어워즈] 구달 청귤 비타C 잡티케어 세럼 50ml 어워즈 한정기획 (50ml+50ml리필)"><span
												class="num">4</span><span class="img goodsList"
												data-ref-goodsno="A000000192385"
												data-ref-dispcatno="10000010001" data-ref-itemno="001"
												name="Cat10000010001_Prodrank"
												onclick="categoryShop.detail.setBindWlogEvent('rank_goods', '4')"
												idx="4"><img
													src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019238512ko.jpg?l=ko"
													alt="[2023어워즈] 구달 청귤 비타C 잡티케어 세럼 50ml 어워즈 한정기획 (50ml+50ml리필)"
													onerror="common.errorImg(this);"></span>
											<p class="txt">
													<span class="prd-name goodsList"
														data-ref-goodsno="A000000192385"
														data-ref-dispcatno="10000010001" data-ref-itemno="001"
														name="Cat10000010001_Prodrank"
														onclick="categoryShop.detail.setBindWlogEvent('rank_goods', '4')"
														idx="4">[2023어워즈] 구달 청귤 비타C 잡티케어 세럼 50ml 어워즈 한정기획
														(50ml+50ml리필)</span>
												</p>
												<p class="price">
													<span class="price-1">43,000<span>원</span></span><span
														class="price-2">29,900<span>원</span></span>
												</p>
												<p></p></a>
											<button class="btn_zzim jeem"
												data-ref-goodsno="A000000192385"
												data-ref-goodsnm="[2023어워즈] 구달 청귤 비타C 잡티케어 세럼 50ml 어워즈 한정기획 (50ml+50ml리필)"
												data-ref-goodsbrand="구달"
												data-ref-goodscategory="기초화장품>스킨케어>에센스"
												data-ref-goodstype="" data-ref-goodstrackingno=""
												data-ref-cornernm="">
												<span>찜하기전</span>
											</button>

										</div>

										<div class="item">
											<a
												href="https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000192633&amp;dispCatNo=10000010001&amp;trackingCd=Cat10000010001_Prodrank&amp;t_page=카테고리관&amp;t_click=랭킹BEST상품브랜드_상품상세&amp;t_number=5"
												data-attr="카테고리관^스킨케어_랭킹BEST상품브랜드_상품랭킹^[2023어워즈/짱큰짱구톡] 닥터지 레드블레미쉬 클리어 수딩 크림 70ml 1+1 어워즈 한정기획(+짱구톡)"><span
												class="num">5</span><span class="img goodsList"
												data-ref-goodsno="A000000192633"
												data-ref-dispcatno="10000010001" data-ref-itemno="001"
												name="Cat10000010001_Prodrank"
												onclick="categoryShop.detail.setBindWlogEvent('rank_goods', '5')"
												idx="5"><img
													src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019263307ko.jpg?l=ko"
													alt="[2023어워즈/짱큰짱구톡] 닥터지 레드블레미쉬 클리어 수딩 크림 70ml 1+1 어워즈 한정기획(+짱구톡)"
													onerror="common.errorImg(this);"></span>
											<p class="txt">
													<span class="prd-name goodsList"
														data-ref-goodsno="A000000192633"
														data-ref-dispcatno="10000010001" data-ref-itemno="001"
														name="Cat10000010001_Prodrank"
														onclick="categoryShop.detail.setBindWlogEvent('rank_goods', '5')"
														idx="5">[2023어워즈/짱큰짱구톡] 닥터지 레드블레미쉬 클리어 수딩 크림 70ml
														1+1 어워즈 한정기획(+짱구톡)</span>
												</p>
												<p class="price">
													<span class="price-1">38,000<span>원</span></span><span
														class="price-2">29,900<span>원</span></span>
												</p>
												<p></p></a>
											<button class="btn_zzim jeem"
												data-ref-goodsno="A000000192633"
												data-ref-goodsnm="[2023어워즈/짱큰짱구톡] 닥터지 레드블레미쉬 클리어 수딩 크림 70ml 1+1 어워즈 한정기획(+짱구톡)"
												data-ref-goodsbrand="닥터지"
												data-ref-goodscategory="기초화장품>스킨케어>크림" data-ref-goodstype=""
												data-ref-goodstrackingno="" data-ref-cornernm="">
												<span>찜하기전</span>
											</button>

										</div>


										<a
											href="https://www.oliveyoung.co.kr/store/main/getBestList.do?dispCatNo=900000100100001&amp;fltDispCatNo=10000010001&amp;pageIdx=1&amp;rowsPerPage=8&amp;t_page=카테고리관&amp;t_click=랭킹BEST상품브랜드_인기상품더보기"
											class="ct-link-arrow"> <span>스킨케어 베스트상품 더보기</span>
										</a>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
				<!-- 상품(자동) -->

				<div class="ct-content bg-white">
					<div class="ct-best-product">
						<p class="ct-tit">${currentCategoryNameDTO.name}에서 많이 본 상품이에요</p>

						<div class="ct-curation-wrap">
							<div>
							
							<c:if test="${not empty productList}">
								<c:forEach var="i" varStatus="outerLoop" begin="1" end="5">
									<ul class="cate_prd_list no_line">
										<c:set var="innerLoopBegin" value="${(outerLoop.index - 1) * 4}" />
										<c:set var="innerLoopEnd" value="${(outerLoop.index * 4) -1}" />
										<c:forEach items="${productList}" var="pdl" begin="${innerLoopBegin}" end="${innerLoopEnd}"
							varStatus="innerLoop">
							
										<li class="flag">
											<a href="/store/goods?productDisplayId=${pdl.productDisplayId}" class="prd_info goodsList" data-goodsNo="${pd.productDisplayId}">
												<span class="prd_thumb">
													<img alt="이미지 준비중입니다." src="${pdl.productDisplaySrc}">
												</span>
												<div class="prd_name">
													<p class="tx_name">
														${pdl.productDisplayName}
													</p>
													 </div>
												 <p class="prd_price">
												 	<c:if test="${pdl.minprice eq pdl.afterprice }">
												 		<span class="tx_cur">
															<span class="tx_num">${pdl.afterprice}</span>원
														</span>
												 	</c:if>
												 	<c:if test="${pdl.minprice ne pdl.afterprice}">
												 		<span class="tx_org">
															<span class="tx_num">${pdl.minprice}</span>원
														</span>
														<span class="tx_cur">
															<span class="tx_num">${pdl.afterprice }</span>원
														</span>
												 	</c:if>
												 </p>
												 <p class="prd_flag">
												 	<c:if test="${pdl.discountflag eq 1 }">
												 		<span class="icon_flag sale">세일</span>
												 	</c:if>
												 	<c:if test="${pdl.couponflag eq 1 }">
												 		<span class="icon_flag coupon">쿠폰</span>
												 	</c:if>
												 	<c:if test="${pdl.todaypickupflag eq 1 }">
												 		<span class="icon_flag delivery">오늘드림</span>
												 	</c:if>
												 </p>
											</a>
											<c:if test="${pdl.productLikeState eq 1}">
											
											</c:if>
											<button class="btn_zzim jeem <c:if test='${pml.productLikeState eq 1}'> on </c:if>" data-goodsno="${pdl.productDisplayId}">
											<c:if test='${pml.productLikeState eq 1}'> <span>찜하기후</span> </c:if>
											<c:if test='${pml.productLikeState ne 1}'> <span>찜하기전</span> </c:if>
											</button>

										<button type="button" class="btnbag"
											onclick=""
											data-goods-no="${pdl.productDisplayId}">장바구니 담기</button>
										</li>
										
										</c:forEach>
									</ul>
								</c:forEach>
							</c:if>

							</div>
						</div>

					</div>
				</div>


			</div>
			<!-- // content -->

		</div>
		<!-- 카테고리 메인 -->

	</div>
	<!-- //#Contents -->
</div>

<script>
/* 좋아요 버튼 스크립트 */
$(function() {
	$('.btn_zzim.jeem').on("click", function() {
		let productLikeBtn = $(this);
		let productDisplayId = $(this).data("goodsno");
		
		toggleLikeItemStatus(productLikeBtn, productDisplayId);
		
	}) // .btn_zzim.jeem func close
	
	function toggleLikeItemStatus(productLikeBtn, productDisplayId) {
		
		$.ajax({
			url: "/productLikeToggle",
			method:"GET",
			cache:false,
			
			data:{
				productDisplayId:productDisplayId
				},
			success: function (result) {
				if (result === "true" ) {
					console.log('success : toggleLikeStatus:'+result);
					$(".layerAlim.zzimOn.wishPrd").show();
					$(".layerAlim.zzimOn.wishPrd").fadeOut(2000);   
					
					 $(productLikeBtn).addClass("on");
	            } else {
	            	console.log('false : toggleLikeStatus: ' + result);
	            	$(".layerAlim.zzimOff.wishPrd").show();
	            	$(".layerAlim.zzimOff.wishPrd").fadeOut(2000);
	                $(productLikeBtn).removeClass("on");
	            } //if
			}, error : function (xhr, data, textStatus) {
				if (xhr.status == 401) {
	                   alert("로그인 후 이용가능 합니다.");
	                         window.location.href = "/auth/login";   
	               }else{
	                    alert("서버 에러") 
	               }
	        } // success , error
		}) // ajax
		} // toggleLikeItemStatus
	
}) // ready function

</script>

 <!-- 좋아요 버튼 눌렀을 때 나오는 팝업(등록)  -->
 <div class="layerAlim zzimOn wishPrd" style="display: none;">
		<span class="icon"></span>
		<p class="one">
			<strong>좋아요</strong>
		</p>
	</div>
 <!-- 좋아요 버튼 눌렀을 때 나오는 팝업(삭졔) -->
	<div class="layerAlim zzimOff wishPrd" style="display: none;">
		<span class="icon"></span>
		<p class="one">
			<strong>좋아요</strong>
		</p>
	</div>
	
<script>
/* 중간에 있는 브랜드 상품 클릭 시 */
function changeState(event, number) {
	event.preventDefault();
} // changeState

$(document).ready(function () {
    $("#brandTabBtn a").click(function () {
        showTab('brand');
    });

    $("#productTabBtn a").click(function () {
        showTab('product');
    });
});

function showTab(tabName) {
    // 모든 탭을 숨김
    $(".detail").hide();

    // 모든 탭에서 'is-active' 클래스 제거
    $(".ct-tab span").removeClass("is-active");

    // 선택한 탭을 표시
    $("#" + tabName + "Tab").show();

    // 클릭한 탭에 'is-active' 클래스 추가
    $("#" + tabName + "TabBtn").addClass("is-active");
}


</script>
<!-- Slick 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<script>

$(function () {
	$('#ctTheme').slick({
		slidesToShow: 5,
		slidesToScroll: 3
		}); 
})
</script>