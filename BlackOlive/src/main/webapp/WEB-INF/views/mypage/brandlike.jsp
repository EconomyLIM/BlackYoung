<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/inc/include.jspf" %>
				
					<div class="title-area linezero">
						<h2 class="tit">좋아요</h2>
					</div>
				     
				     
					<ul class="comm1sTabs mgzero">
						<li><a href="<%= contextPath%>/mypage/productlike" class="movePrdWish">상품</a></li>
						<li class="on"><a>브랜드</a></li>
					</ul>
					
					 <c:set value="${ brandVO }" var="blike" />
					
					<div class="result-common">
						<span class="num">
							<strong>전체 <em>${ fn:length(blike) }</em>개</strong>
						</span>
						
						<button type="button" class="all-delete">전체 삭제</button>
						
					</div>
					
						<div class="brand_like_list">
							
							<ul class="inner clrfix" id="brand_area">
														
								<c:choose>
									<c:when test="${ not empty brandVO }">
										<c:forEach items="${ brandVO }" var="bl">
											<li>
													<div class="option">
														<p class="opt">
															<a href="<%-- 브랜드 상세 페이지 --%>" class="link moveBrandShop" value="A003377" data-ref-onlbrndcd="${ bl.brandId }">
																${ bl.brandName }
															</a>
														</p>
														<p class="txt">좋아요 <span>${ bl.brandLike }</span>
															<button type="button" class="btnlike" data-ref-onlbrndcd="${ bl.brandId }"> 좋아요</button>
														</p>
													</div>	
													<p class="ban_brand">
														<a href="<%-- 브랜드 상세보기 페이지 --%>" class="moveBrandShop" value="A003377" data-ref-onlbrndcd="A003377">
															
															
																
																<img onerror="this.src='https://static.oliveyoung.co.kr/pc-static-root/image/temp/img_brand_no.jpg'" src="${ bl.brandDisplaySrc }" alt="${ bl.brandName }">
															
															
															
														</a>
													</p>
											</li>
										</c:forEach>
									</c:when>
									<c:otherwise>
									<li class="nodata"><p>좋아요 브랜드가 없습니다.</p>	</li>
									</c:otherwise>
								</c:choose>
									
											
									
														
								
								
							</ul>
						</div>
					



			

	<div class="pageing">
	
	
		
			
		<strong title="현재 페이지">1</strong>
			
			
		
	
	
	</div>

<script>
//좋아요 상품 하나 삭제
$("button.btnlike").on("click", function() {
	var result = confirm("좋아요 브랜드를 삭제하시겠습니까?")
	let deleteType = 1;
	let pdispId = null;
	if (result) {
		brandId = $(this).attr("data-ref-onlbrndcd");
		var url = '<%= contextPath %>/mypage/brandlike' + '?deleteType=' + encodeURIComponent(deleteType) + '&brandId=' + encodeURIComponent(brandId);
		location.href = url;
	} 
});

//좋아요 전체 상품 삭제
$("button.all-delete").on("click", function() {
	var result = confirm("정말 삭제하시겠습니까?")
	let deleteType = 2;
	let pdispId = null;
	if (result) {
		var url = '<%= contextPath %>/mypage/brandlike' + '?deleteType=' + encodeURIComponent(deleteType) + '&productId=';
		location.href = url;
	} 
})
	
	history.replaceState({}, null, location.pathname); 

</script>

				
</body>
</html>