<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/inc/include.jspf" %>

<script>
	// google analytics 사용안함 처리했을 때 ga function이 없어서 에러나던 부분 처리.
	window.ga = function() {
	}
</script>
<script type="text/javascript">
	var digitalData = {
		page : {
			pageInfo : {
				pageName : "[P]회원^회원정보 수정^수정정보 입력^수정완료",
				siteType : "P",
				LayerPageName : "",
				searchKeywords : "",
				searchResult_account : "",
				searchType : ""
			}
		},
		user : {
			loginStatus : "logged in",
			custID : "2b2fda3471a6d3a1880397dffeff6bd6",
			level : "10"
		},
		shop : {
			location : "",
			brand : "",
			name : ""
		},
		consult : {
			type : ""
		},
		myshop : {
			name : "",
			brand : ""
		},
		click : {
			track : ""
		},
		order : {
			productName : "",
			payment_method : "",
			ordertype : "",
			auto_charging_basis_amount : "",
			auto_charging_date : "",
			auto_charging_price : "",
			cancel_amount : "",
			price : ""
		}
	};
</script>

		<!--contents-->
		<div id="contentsWrap">
			<form name="form1" id="form1" method="post"
				action="/usermodify/info_modification_ok">
				<input type="hidden" name="coopco_cd" id="coopco_cd" value="7030" />
				<input type="hidden" name="brnd_cd" id="brnd_cd" value="3000" /> <input
					type="hidden" name="mcht_no" id="mcht_no" value="3000" /> <input
					type="hidden" name="coop_return_url" id="coop_return_url"
					value="https://www.oliveyoung.co.kr/store/mypage/getMktReceiptInfo.do?refresh=Y" />
				<input type="hidden" name="join_coopco_list" id="join_coopco_list"
					value="" /> <input type="hidden" id="under_14" name="under_14"
					value="" />
			</form>
			<div id="contents">
				<div class="location_wrap">
					<div class="location">
						<a href="#" class="home"><span
							class="haze">홈</span></a><a
							href="/usermodify/pwdCheck" class="now"><span>회원정보 수정</span></a>
					</div>
				</div>
				<div class="cont_header">
					<h1 class="h1_tit">회원정보 수정</h1>
					<p class="h_desc">회원님의 소중한 정보를 안전하게 관리하세요.</p>
				</div>
				<div class="cont_area">
					<div class="mypage_sec">
						<div class="regi_complete">
							<span class="bg face_type2"></span>
							<p class="h2_tit">회원님의 정보가 수정되었습니다.</p>
							<p class="fc_gray">잠시 후 올리브영 페이지로 이동됩니다. [바로가기] 버튼을 클릭하시면 바로
								이동됩니다.</p>

							<div class="btn_center">


								<a href="<%=contextPath %>/mypage/usermodify"
									class="btn btn_em" title="올리브영 웹사이트">바로가기</a>
								<script type="text/javascript">
									setTimeout(() => {
				    	  				window.location.href="<%=contextPath %>/mypage/usermodify";
									}, 5000); 
								</script>
							</div>
						</div>
						<!--banner type a-->
						<div class="banner_sec">

							<!--banner type a-->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--//컨텐츠-->
