<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/inc/include.jspf" %>

<script>
	// google analytics 사용안함 처리했을 때 ga function이 없어서 에러나던 부분 처리.
	window.ga = function() {
	}
</script>
<script type="text/javascript">
<script type="text/javascript">
var digitalData={
		page:{
			pageInfo:{
				pageName:"[P]회원^비밀번호 변경^비밀번호 변경 완료",
				siteType:"P",
				LayerPageName:"",
				searchKeywords:"",
				searchResult_account:"",
				searchType:""
						}
				},
		user:{
			loginStatus:"logged in",
			custID:"2b2fda3471a6d3a1880397dffeff6bd6",
			level:"10"
			},
		shop:{
			location:"",
			brand:"",
			name:""
			},
		consult:{
			type:""
			},
		myshop:{
			name:"",
			brand:""
			},
		click:{
			track:""
		},
		order:{
			productName:"",
			payment_method:"",
			ordertype:"",
			auto_charging_basis_amount:"",
			auto_charging_date:"",
			auto_charging_price:"",
			cancel_amount:"",
			price:""
		}
	};
</script>
	<!-- contents -->
	<div id="contentsWrap">
		<div id="contents">
			<div class="location_wrap">
				<div class="location"><a href="https://www.cjone.com/cjmweb/main.do" class="home"><span class="haze">홈</span></a><a href="https://www.cjone.com/cjmweb/member/change-passwd.do" class="now"><span>비밀번호 변경</span></a></div>
			</div>
			<div class="cont_header">
				<h1 class="h1_tit">비밀번호 변경</h1>
				<p class="h_desc">고객님의 소중한 정보를 보호하기 위하여 새로운 비밀번호로 변경 후 서비스를 이용해 주세요.</p>
			</div>
			<div class="cont_area">
				<div class="login_sec">
		
						<div class="regi_complete">
							<span class="bg chk"></span>
							<p class="h2_tit"><em class="em">회원정보가 수정</em>되었습니다.</p>
							<p class="h_desc">잠시 후 올리브영 페이지로 이동됩니다. [바로가기] 버튼을 클릭하시면 바로 이동됩니다.</p>
							<div class="btn_center">
								<a href="<%=contextPath %>/mypage/usermodify" class="btn btn_em" title="올리브영 웹사이트">바로가기</a>
							</div>
							<script type="text/javascript">
				    	  		setTimeout(() => {
				    	  			window.location.href="<%=contextPath %>/mypage/usermodify";
								},5000); 
			                 </script>	
						</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //contents -->