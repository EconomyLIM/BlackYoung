<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/inc/include.jspf" %>

		<!--contents-->
		<div id="contentsWrap">
			<div id="contents">
				<!--title-->

				<div class="location_wrap">
					<div class="location">
						<a href="/" class="home"><span class="haze">홈</span></a>
						<a href="join/joinCheck" class="now"><span>회원가입</span></a>
					</div>
				</div>

				<div class="cont_header">
					<h1 class="h1_tit">회원가입</h1>
					<p class="h_desc">라이프스타일 멤버십 CJ ONE! 외식, 쇼핑, 엔터테인먼트 서비스를 한 장의 카드로 즐기세요~</p>
				</div>
				
				<!--title-->
				<div class="cont_area">
					<div class="member_join uni">
						<!--step-->
						<div class="step_join">
							<ul class="col4">
								<li class="step1">본인인증 <span class="haze">진행 완료</span><span
									class="line"></span></li>
								<li class="step2">약관동의 <span class="haze">진행 완료</span><span
									class="line"></span></li>
								<li class="step3 on">회원정보 입력 <span class="haze">진행 중</span><span
									class="line"></span></li>
								<li class="step4">가입완료 <span class="haze">진행 전</span></li>
							</ul>
						</div>

						<!--//step-->
						<div class="member_data">
							<h2 class="haze">회원정보 입력</h2>
							<div class="member_info">
								<form id="formJoin" name="formJoin" method="post" action="">
									<div class="table_header">
										<h3 class="h3_tit">기본정보</h3>
										<div class="info">
											<p class="msg_mandatory"
												style="background-image: url('https://www.cjone.com/cjmweb/images/common/ico_mandatory.png'); background-repeat: no-repeat; background-position: 20px 29px;">
												<span class="haze">"필수"</span>표시는 필수 입력 항목입니다.
											</p>
										</div>
									</div>
									<div class="table_col">
										<table>
											<caption>회원기본정보 입력 표로 회원정보 이름, 아이디, 비밀번호, 비밀번호 확인,
												생년월일, 휴대전화, 이메일을 나타냅니다.</caption>
											<colgroup>
												<col class="title">
												<col class="body">
											</colgroup>
											<tbody>
												<tr class="input">
													<th scope="row" class="mandatory"
														style="background-image: url('https://www.cjone.com/cjmweb/images/common/ico_mandatory.png'); background-repeat: no-repeat; background-position: 20px 29px;">
														<label for="input_member_name"><span class="haze">"필수"</span>
															이름</label>
													</th>
													<td><span class="input_txt">
													<input type="text" name ="userName"	readonly="" value="${userName}" class="text readonly member_name"
															id="input_member_name"></span>
													<!-- 에러시 .error 클래스 추가 --></td>
												</tr>
												<tr class="input">
													<th scope="row" class="mandatory"
														style="background-image: url('https://www.cjone.com/cjmweb/images/common/ico_mandatory.png'); background-repeat: no-repeat; background-position: 20px 29px;">
														<label for="mbr_id"><span class="haze">"필수"</span>
															아이디</label>
													</th>
													<td>
														<div class="input_group">
															<span class="input_txt w250"><input type="text"
																class="text" title="사용 할 영문 아이디 명 입력"
																placeholder="아이디를 입력해주세요." name="userId" id="mbr_id"
																maxlength="12" value=""></span>

															<button type="button" class="btn btn_search" id="btnIdCheck">중복확인</button>
															<p class="msg_info em " id="alert_mbr_id"></p>
														</div>
														<p class="msg_desc">CGV,CJ온스타일 등 기존의 CJ ONE 제휴 브랜드
															회원님의 경우는 기존에 사용하고 계신 아이디가 새롭게 생성하신 통합 아이디로 변경됩니다.</p>
													</td>
												</tr>
												<tr class="input">
													<th scope="row" class="mandatory" 	style="background-image: url('https://www.cjone.com/cjmweb/images/common/ico_mandatory.png'); background-repeat: no-repeat; background-position: 20px 29px;"><label for="pwd"><span
															class="haze">"필수"</span> 비밀번호</label></th>
													<td>
														<div class="input_group">
															<span class="input_txt w250"><input
																type="password" class="text" placeholder="비밀번호를 입력해주세요."
																name="userPassword" id="pwd" maxlength="50"></span> <span
																class="pwd_lv" id="alert_pwd_strength"></span>
															<p class="msg_info em hide" id="msg_pwd">비밀번호는 영문자,
																숫자, 특수문자 모두 최소 1가지 이상 조합한 8~12자리이어야 합니다.</p>
														</div>
														<p class="msg_desc">
															영문자, 숫자,특수문자 조합하여 8~12자리, 아이디와 4자리이상 동일,반복 문자숫자 불가<br>사용
															가능 특수 문자 : !"#$%&amp;'()*+,-./:;&lt;=&gt;?@[]^_`{|}~
														</p>
													</td>
												</tr>
												<tr class="input">
													<th scope="row" class="mandatory"
														style="background-image: url('https://www.cjone.com/cjmweb/images/common/ico_mandatory.png'); background-repeat: no-repeat; background-position: 20px 29px;">
														<label for="pwd_check"><span class="haze">"필수"</span>
															비밀번호 확인</label>
													</th>
													<td>
														<div class="input_group">
															<span class="input_txt"><input type="password"
																class="text" placeholder="비밀번호를 재입력해주세요."
																name="pwd_check" id="pwd_check" maxlength="50"></span>
															<p class="msg_info em hide" id="msg_pwd_check">비밀번호와 비밀번호 확인이 일치하지 않습니다.</p>
														</div>
													</td>
												</tr>
												<tr class="input">
													<th scope="row" class="mandatory"
														style="background-image: url('https://www.cjone.com/cjmweb/images/common/ico_mandatory.png'); background-repeat: no-repeat; background-position: 20px 29px;">
														<label for="birth_yy"> <span class="haze">"필수"</span>생년월일</label>
													</th>
													<td>
														<div class="birthday_select">
															<span class="select w120 " data-skin="form"> 
															<select title="생년월일 중 년 선택" id="birth_yy" name="birth_yy" >
																	[<option value="">년</option>,
																	<option value="2023">2023</option>,
																	<option value="2022">2022</option>,
																	<option value="2021">2021</option>,
																	<option value="2020">2020</option>,
																	<option value="2019">2019</option>,
																	<option value="2018">2018</option>,
																	<option value="2017">2017</option>,
																	<option value="2016">2016</option>,
																	<option value="2015">2015</option>,
																	<option value="2014">2014</option>,
																	<option value="2013">2013</option>,
																	<option value="2012">2012</option>,
																	<option value="2011">2011</option>,
																	<option value="2010">2010</option>,
																	<option value="2009">2009</option>,
																	<option value="2008">2008</option>,
																	<option value="2007">2007</option>,
																	<option value="2006">2006</option>,
																	<option value="2005">2005</option>,
																	<option value="2004">2004</option>,
																	<option value="2003">2003</option>,
																	<option value="2002">2002</option>,
																	<option value="2001">2001</option>,
																	<option value="2000">2000</option>,
																	<option value="1999">1999</option>,
																	<option value="1998">1998</option>,
																	<option value="1997">1997</option>,
																	<option value="1996">1996</option>,
																	<option value="1995">1995</option>,
																	<option value="1994">1994</option>,
																	<option value="1993">1993</option>,
																	<option value="1992">1992</option>,
																	<option value="1991">1991</option>,
																	<option value="1990">1990</option>,
																	<option value="1989">1989</option>,
																	<option value="1988">1988</option>,
																	<option value="1987">1987</option>,
																	<option value="1986">1986</option>,
																	<option value="1985">1985</option>,
																	<option value="1984">1984</option>,
																	<option value="1983">1983</option>,
																	<option value="1982">1982</option>,
																	<option value="1981">1981</option>,
																	<option value="1980">1980</option>,
																	<option value="1979">1979</option>,
																	<option value="1978">1978</option>,
																	<option value="1977">1977</option>,
																	<option value="1976">1976</option>,
																	<option value="1975">1975</option>,
																	<option value="1974">1974</option>,
																	<option value="1973">1973</option>,
																	<option value="1972">1972</option>,
																	<option value="1971">1971</option>,
																	<option value="1970">1970</option>,
																	<option value="1969">1969</option>,
																	<option value="1968">1968</option>,
																	<option value="1967">1967</option>,
																	<option value="1966">1966</option>,
																	<option value="1965">1965</option>,
																	<option value="1964">1964</option>,
																	<option value="1963">1963</option>,
																	<option value="1962">1962</option>,
																	<option value="1961">1961</option>,
																	<option value="1960">1960</option>,
																	<option value="1959">1959</option>,
																	<option value="1958">1958</option>,
																	<option value="1957">1957</option>,
																	<option value="1956">1956</option>,
																	<option value="1955">1955</option>,
																	<option value="1954">1954</option>,
																	<option value="1953">1953</option>,
																	<option value="1952">1952</option>,
																	<option value="1951">1951</option>,
																	<option value="1950">1950</option>,
																	<option value="1949">1949</option>,
																	<option value="1948">1948</option>,
																	<option value="1947">1947</option>,
																	<option value="1946">1946</option>,
																	<option value="1945">1945</option>,
																	<option value="1944">1944</option>,
																	<option value="1943">1943</option>,
																	<option value="1942">1942</option>,
																	<option value="1941">1941</option>,
																	<option value="1940">1940</option>,
																	<option value="1939">1939</option>,
																	<option value="1938">1938</option>,
																	<option value="1937">1937</option>,
																	<option value="1936">1936</option>,
																	<option value="1935">1935</option>,
																	<option value="1934">1934</option>,
																	<option value="1933">1933</option>,
																	<option value="1932">1932</option>,
																	<option value="1931">1931</option>,
																	<option value="1930">1930</option>,
																	<option value="1929">1929</option>,
																	<option value="1928">1928</option>,
																	<option value="1927">1927</option>,
																	<option value="1926">1926</option>,
																	<option value="1925">1925</option>,
																	<option value="1924">1924</option>,
																	<option value="1923">1923</option>,
																	<option value="1922">1922</option>,
																	<option value="1921">1921</option>,
																	<option value="1920">1920</option>,
																	<option value="1919">1919</option>,
																	<option value="1918">1918</option>,
																	<option value="1917">1917</option>,
																	<option value="1916">1916</option>,
																	<option value="1915">1915</option>,
																	<option value="1914">1914</option>,
																	<option value="1913">1913</option>,
																	<option value="1912">1912</option>,
																	<option value="1911">1911</option>,
																	<option value="1910">1910</option>,
																	<option value="1909">1909</option>,
																	<option value="1908">1908</option>,
																	<option value="1907">1907</option>,
																	<option value="1906">1906</option>,
																	<option value="1905">1905</option>,
																	<option value="1904">1904</option>,
																	<option value="1903">1903</option>,
																	<option value="1902">1902</option>,
																	<option value="1901">1901</option>,
																	<option value="1900">1900</option>]
															</select>
															</span>
															<span class="symbol">년</span> <span
																class="select w70 " data-skin="form"> <select
																title="생년월일 중 월 선택" class="narrow" id="birth_mm"
																name="birth_mm">
																	[<option value="">월</option>,
																	<option value="01">01</option>,
																	<option value="02">02</option>,
																	<option value="03">03</option>,
																	<option value="04">04</option>,
																	<option value="05">05</option>,
																	<option value="06">06</option>,
																	<option value="07">07</option>,
																	<option value="08">08</option>,
																	<option value="09">09</option>,
																	<option value="10">10</option>,
																	<option value="11">11</option>,
																	<option value="12">12</option>]
															</select>
															</span>
															<span class="symbol">월</span> <span
																class="select w70 " data-skin="form"> <select
																title="생년월일 중 일 선택" class="narrow" id="birth_dd"
																name="birth_dd">
																	<option value="">일</option>,
																	<option value="01">01</option>,
																	<option value="02">02</option>,
																	<option value="03">03</option>,
																	<option value="04">04</option>,
																	<option value="05">05</option>,
																	<option value="06">06</option>,
																	<option value="07">07</option>,
																	<option value="08">08</option>,
																	<option value="09">09</option>,
																	<option value="10">10</option>,
																	<option value="11">11</option>,
																	<option value="12">12</option>,
																	<option value="13">13</option>,
																	<option value="14">14</option>,
																	<option value="15">15</option>,
																	<option value="16">16</option>,
																	<option value="17">17</option>,
																	<option value="18">18</option>,
																	<option value="19">19</option>,
																	<option value="20">20</option>,
																	<option value="21">21</option>,
																	<option value="22">22</option>,
																	<option value="23">23</option>,
																	<option value="24">24</option>,
																	<option value="25">25</option>,
																	<option value="26">26</option>,
																	<option value="27">27</option>,
																	<option value="28">28</option>]
															</select>
															</span>
															<span class="symbol">일</span>
														</div>
														<p class="msg_desc">
															설정하신 생일을 기준으로 <em>15일 전</em> 생일쿠폰이 발행됩니다.
														</p>
													</td>
				
		
												</tr>
												<tr class="input">
													<th scope="row" class="mandatory"
														style="background-image: url('https://www.cjone.com/cjmweb/images/common/ico_mandatory.png'); background-repeat: no-repeat; background-position: 20px 29px;">
														<label for="mob_no_1"><span class="haze">"필수"</span>	휴대전화번호</label>
														<input type="hidden" id="userTel" name="userTel" value="">
													</th>
													<td><span class="input_txt mob_no">
															 <input type="text" name="mob_no"id="mob_no" value="">
													</span>
														<p class="msg_desc">주문 및 배송, 쿠폰, 이벤트 정보 등을 제공 받으실 수 있습니다.</p></td>
												</tr>
												<tr class="input">
													<th scope="row" class="mandatory"
														style="background-image: url('https://www.cjone.com/cjmweb/images/common/ico_mandatory.png'); background-repeat: no-repeat; background-position: 20px 29px;">
														<label for="email_addr1"><span class="haze">"필수"</span>이메일</label>
													</th>
													<td>
														<div class="email_write">
															<span class="input_txt w110" data-skin="form"> 
															<input type="text" class="text small" title="이메일 아이디 입력"
																name="email_addr1" id="email_addr1" value=""
																placeholder="이메일 아이디" data-format="email"
																autocomplete="off">
															</span> 
															<span class="symbol">@</span>
															<span class="input_txt w110"> <input type="text"
																class="text small" title="이메일 도메인 입력" name="email_addr2"
																id="email_addr2" value="" placeholder="이메일 도메인"
																data-format="email" autocomplete="off">
															</span> 
															
															<span class="select w100" data-skin="form">
																<select title="이메일 도메인 선택" name="email_addr_opt"
																id="email_addr_opt" data-control="emailSelector" > 
																	<option value="">직접입력</option>
																	<option value="naver.com" selected="selected">네이버</option>
																	<option value="hanmail.net">한메일</option>
																	<option value="nate.com">네이트</option>
																	<option value="gmail.com">지메일</option>
															</select>
															</span>
															<p class="msg_info em hide" id="alert_email_addr">이메일주소를 다시 확인해주세요.</p>		
														</div>
														<p class="msg_desc">이메일 주소 입력 시 사용 가능 특수 문자 : - . _</p>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="table_header choice">
									</tbody>
									</table>
									</div>
									<div class="btn_sec">
										<button type="button" class="btn" id="btncancel">취소</button>
										<button type="button" class="btn btn_em" id="btnok">등록</button>
									</div>
									<div class="box_gray box_btm">
										<dl class="box_info">
											<dt>이용안내</dt>
											<dd>
												<ul class="bul_list">
													<li class="dot_arr">CJ ONE 회원가입 후에도 각 제휴 브랜드 웹사이트에서 통합
														아이디를 사용하여 로그인 하시려면, 각 브랜드 웹사이트의 이용약관에 대한 동의를 거친 후에 이용
														가능합니다.</li>
													<li class="dot_arr">개인정보 수집 및 활용 동의 (선택)에 거부한 회원님은 마케팅
														정보 수신을 받으실 수 없습니다.</li>
												</ul>
											</dd>
										</dl>
									</div>
							<input type="hidden" id="popupDataGender" name="userGender" value ="${userGender}"/>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--//contents-->
<script>
//아이디 중복체크
	 
	 $(function () {
		$("#btnIdCheck").on("click", function () {
			let userId = $("#mbr_id").val();
			if(userId==""){
				alert("아이디를 입력해주세요.");
				 $("#mbr_id").focus();
				return false;
			}
			//console.log(`>userId = \${userId}`);
			$.ajax({
				url: "/selectUserId"
				, dataType: "text"
				, type:"POST"
				, data: {userId:userId
					, "${_csrf.parameterName}" :"${_csrf.token}"}
				, cache: false
				, success: function (data) {
					//alert(data);
					if (data ==="Y" ) {
						alert("이미 사용중인 아이디입니다. 다른 아이디를 입력해주세요.");
						$("#alert_mbr_id").text("이미 사용중인 아이디입니다. 다른 아이디를 입력해주세요.");
						 $("#mbr_id").trigger("focus");
					} else {
						alert("사용가능한 아이디입니다.");
						$("#alert_mbr_id").text("사용가능한 아이디입니다.");
						$("#pwd").trigger("focus");
					
					}
				}
				, error: function (xhr, errorType) {
					alert(errorType);
				}
			});
		});
	}); 

$(function () {
     $('#mbr_id').keydown(function(event) {
     	if ( event.which == 13 ){
     		$("#btnIdCheck").click();	
     	}
     });	
});
</script>
<script>
$('#new_pwd_check').keydown(function(event) {
	if (event.keyCode == 13) chkPwd();
});

//패스워드 강도 체크  
$("#pwd").on("change", function () {
var inputVal = $("#pwd").val();	
var length = inputVal.length;
	if ( length >15) {
		$("#pwd").focus();
		$("#msg_pwd").removeClass("hide");
		$("#msg_pwd").text("강도 : 강함");
	} else if ( length >13) {
		$("#msg_pwd").text("강도 : 적정");
	}  else if (length >9) {
		$("#msg_pwd").text('강도 : 약함'); 
	}  else{
       	$("#msg_pwd").text("강도 : 매우약함");
   }
});

	
	//비밀번호 체크
	function chkPwd() {
		var userpwd = $("#pwd").val();
		var userckpwd = $("#pwd_check").val();
		var userid = $("#mbr_id").val();
		var pwdPattern = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,12}$/;
		var num = userpwd.search(/[0-9]/g);
		var eng = userpwd.search(/[a-z]/ig);
		var spe = userpwd.search(/[!"#$%&'()*+,-./:;<=>?@[]^_`{|}~]/gi);
		
		if (userpwd.length<8 || userpwd.length>12) {
			alert("영문자, 숫자, 특수문자 모두 최소 1가지 이상 조합하여 8~12자리로 설정 가능합니다.");
			$("#msg_pwd").removeClass("hide");
			$("#pwd").focus();
			return false;
		} else if ((num < 0 && eng < 0) || (eng < 0 && spe < 0)
				|| (spe < 0 && num < 0)) {
			alert("영문자, 숫자, 특수문자 모두 최소 1가지 이상 조합하여 8~12자리로 설정 가능합니다.");
			$("#msg_pwd").removeClass("hide");
			$("#pwd").focus();
			return false;
		} else if (/(\w)\1\1\1/.test(userpwd)) {
			alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
			$("#msg_pwd").removeClass("hide");
			$("#pwd").focus();
			return false;
		} else if (userpwd.search(userid) > -1) {
			alert("비밀번호 설정 시 아이디와 4자리 이상 동일한 문자 또는 숫자를 사용할 수 없습니다.");
			$("#msg_pwd").removeClass("hide");
			$("#pwd").focus();
			return false;
		} else if ( userpwd !=userckpwd){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			$("#msg_pwd_check").removeClass("hide");
			$("#pwd").focus();
			return false;
		}
		return true;
	}

</script>
<script>
	//생년월일
	var sel;
	var str = "${userBirth}";
	var gender = "${userGender}";
	const result1 = str.substr(0, 2);
	const result2 = str.substr(2, 2);
	const result3 = str.substr(4, 2);
	var birthYear;
	if ( gender === "1" || gender === "2"){
		birthYear= 1900+ Number(result1) ;
	} else if ( gender === "3" || gender === "4" ){
		birthYear= 2000+ Number(result1) ; 
	}
	
	sel = $("#birth_yy");
	var selYYvalue = birthYear;

	sel.find("option[value='" + selYYvalue + "']").prop("selected", true);

	sel = $("#birth_mm");
	var selMMvalue = result2;

	sel.find("option[value='" + selMMvalue + "']").prop("selected", true);

	sel = $("#birth_dd");
	var selDDvalue = result3;

	sel.find("option[value='" + selDDvalue + "']").prop("selected", true);
	
</script>

<script>
//이메일 도메인옵션
	$("#email_addr2").val($("#email_addr_opt").val());
	$("#email_addr_opt").change(function() {
		$("#email_addr2").val($("#email_addr_opt").val());
	});
</script>
<script>
	//휴대전화번호 마스킹처리
	var str = "${userTel}";
	
	const rs1=str.substr(0,3);		
	const rs2=str.substr(3,4);		
	const rs3=str.substr(7,4);	
	let str1 = rs1;
	let str2 = rs2;
	let str3 = rs3;

	let strAll = str1+ str2.replace(str2, '****') +str3;
		$("#mob_no").val(strAll);
		$("#userTel").val(str1+"-"+str2+"-"+str3);
	</script>

<script>
	//회원가입취소
	$("#btncancel").on("click", function () {
		alert("회원가입을 취소하시겠습니까?");
		location.href = `${pageContext.request.contextPath}/join/joinCheck`;
	});
	//회원가입
	$("#btnok").on("click", function() {
		if ( chkPwd() ) {
			if($("#mbr_id").val()==""){
				alert("아이디를 입력해주세요.");
				 $("#mbr_id").focus();
				return false;
			}
			if($("#pwd").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#pwd").focus();
				return false;
			}
			if($("#email_addr1").val()==""){
				alert("이메일을 입력해주세요.");
				$("#email_addr1").focus();
				return false;
			}
			if($("#email_addr2").val()==""){
				alert("도메인을 입력해주세요.");
				$("#email_addr2").focus();
				return false;
			}
		alert("회원가입이 완료되었습니다.");
		$("#formJoin").attr("action","/join/joinOk").submit();
		}
	});

</script>