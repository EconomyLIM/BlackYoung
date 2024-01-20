<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/inc/include.jspf"%>

		<!-- contents -->
		<div id="contentsWrap">
			<form name="form1" id="form1" method="post" action="/usermodify/info_modification_ok">

				<div id="contents">
					<!-- location -->
					<div class="location_wrap">
						<div class="location">
							<a href="<%=contextPath%>/mypage/usermodify" class="home"><span
								class="haze">홈</span></a>
							<a href="<%=contextPath%>/mypage/usermodify" class="now"><span>회원정보
									수정</span></a>
						</div>
					</div>
					<!-- //location -->

					<div class="cont_header">
						<h1 class="h1_tit">회원정보 수정</h1>
						<p class="h_desc">회원님의 소중한 정보를 안전하게 관리하세요.</p>
					</div>
					<div class="cont_area">
						<div class="mypage_sec">
							<div class="member_info">
								<!-- 기본정보 -->
								<div class="table_header">
									<h3 class="h3_tit">기본정보</h3>
									<div class="info">
									</div>
								</div>
								<div class="table_col">
									<table>
										<caption>회원기본정보 입력 표로 회원정보 이름, 아이디, 비밀번호, 비밀번호 확인,
											생년월일, 휴대전화, 이메일을 나타냅니다.</caption>
										<colgroup>
											<col style="width: 25%">
											<col>
										</colgroup>
										<tbody>

											<tr class="input">
												<th scope="row">이름</th>
												<td>
													<div class="input_group">
														<span id="hg_nm_area" name = "username">
														 <c:choose>
															<c:when test= "${not empty newName}">
																${newName}
															</c:when>
															<c:otherwise>
																${userDto.userName}
															</c:otherwise>
														</c:choose>
														</span>
														<a href="#" class="btn btn_sm" id="lnChangeName">
														<span class="arr">변경하기</span></a>
													</div>
													<p class="msg_desc">이름은 "개명"한 경우에만 변경 가능합니다.</p>
												</td>
											</tr>

											<tr>
												<th scope="row">아이디</th>
												<td><span id="mbr_id_area" name="userId">${userDto.userId}</span></td>
											</tr>

											<tr class="input">
												<th scope="row"><label for="birth_yy">생년월일</label></th>
												<td>
													<div class="birthday_select" id="birthday_select"
														style="display: none">
														<span class="select w120 hide" data-skin="form"></span>
												
														<span class="symbol">년</span> 
														<span class="select w70 hide" data-skin="form"></span>
														<div class="select_wrap w70"
															style="background-color: rgb(235, 235, 228)">
														</div>
														<span class="symbol">월</span> 
														<span class="select w70 hide" data-skin="form"></span>
													
														<span class="symbol">일</span> 
									
													</div>
													<div class="birthday_select" id="birthday_default"
														style="display: block">
														****<span class="symbol">년</span> **<span class="symbol">월</span>
														**<span class="symbol">일</span>
													</div>
													<p class="msg_desc">
														설정하신 생일을 기준으로 <em class="em">15일 전</em> 생일쿠폰이 발행됩니다.<br>
														단, 쿠폰 브랜드별로 기준이 상이할 수 있으니, 'CJ ONE &gt; CJ ONE 소개 &gt;
														생일축하 쿠폰'에서 상세 기준을 확인해주세요.
													</p>
												</td>
											</tr>
											<tr class="input">
												<th scope="row"><label for="mob_no_1">휴대전화번호</label></th>
												<td>
													<div>
														<span class="input_txt w100 phon_write" id="mobileNoInfo" name="userTel">
 														
 														<c:choose>
														<c:when test= "${not empty newTel}">
																${newTel}
															</c:when>
															<c:otherwise>
																${userDto.userTel}
															</c:otherwise>
														</c:choose> 
														
														</span>
								
															<a href="<%=contextPath%>/usermodify/name_update" class="btn btn_sm">
															<span class="arr">변경하기</span></a>
													</div>
													<p class="msg_desc">
														휴대전화번호는 본인 인증된 정보로 자동 적용 됩니다.<br>휴대전화번호로 주문, 배송, 쿠폰,
														이벤트 정보 등을 제공 받으실 수 있습니다.
													</p>
												</td>
											</tr>
											<tr class="input">
												<th scope="row"><label for="email_addr1">이메일</label></th>
												<td>
													<div class="email_write" style="width: 415px">
														<span class="input_txt w110" data-skin="form"> <input
															type="text" class="text small" title="이메일 아이디 입력"
															placeholder="이메일 아이디" data-format="email"
															name="email_addr1" id="email_addr1" value=""
															autocomplete="off">
														</span> <span class="symbol">@</span> <span
															class="input_txt w110"> <input type="text"
															class="text small" title="이메일 도메인 입력"
															placeholder="이메일 도메인" data-format="email"
															name="email_addr2" id="email_addr2" value=""
															autocomplete="off">
														</span> <span class="select w100 " data-skin="form">
														<select title="이메일 도메인 선택" data-control="emailSelector"
															name="email_addr_opt" id="email_addr_opt">
																<option value="0">직접입력</option>
																<option value="naver.com">네이버</option>
																<option value="hanmail.net">한메일</option>
																<option value="nate.com">네이트</option>
																<option value="gmail.com">지메일</option>
														</select>
														</span>
						
																<div class="scroll ui_scrollbar">
																	<span class="bg_top"></span> <span class="bg bg_mid"
																		style="display: none;"></span> <span class="bg_btm"></span>
																</div>
															</div>
														</div>
													</div>
													<p class="msg_desc">이메일 주소 입력 시 사용 가능 특수 문자 : - . _</p>
												</td>
											</tr>

											<tr>
												<th scope="row">카카오 로그인</th>
												<td><label class="switch"> <input
														type="checkbox" onclick="getKakaoToken();" id="kakaosync"
														name="kakaosync" value="N"> <span
														class="slider round"></span>
												</label>
													<p class="msg_desc">카카오 로그인의 사용 여부를 설정할 수 있으며, 카카오 로그인
														사용 여부는 바로 반영됩니다.</p></td>
											</tr>

											<tr class="input">
												<th scope="row"><label for="pwd">비밀번호</label></th>
												<td>
													<div>
														<div class="input_group" data-handler="trPwdCheck">
															<span class="input_txt w250"> <input
																type="password" class="text" placeholder="비밀번호를 입력해주세요."
																maxlength="50" name="userPassword" id="pwd"></span> <span
																class="msg_desc" id="alert_pwd_strength"></span>
															<p id="msg_pwd" class="msg_info em hide">비밀번호는 영문자,
																숫자,특수문자 모두 최소 1가지 이상 조합한 8~12자리이어야 합니다.</p>
															<p id="msg_pwdAbcd" class="msg_info em hide"
																style="display: none;">
																<em>4자리 이상 반복되는 문자와 숫자(1234, 4321, abcd, dcba 등)는
																	사용 불가합니다.</em>
															</p>
															<p id="msg_pwdNull" class="msg_info em hide"
																style="display: none;">
																<em>비밀번호는 영문자, 숫자,특수문자 모두 최소 1가지 이상 조합한 8~12자리이어야
																	합니다.</em>
															</p>
															<p id="msg_pwdId" class="msg_info em hide"
																style="display: none;">
																<em>비밀번호 설정 시 아이디와 4자리 이상 동일한 문자 또는 숫자를 사용할 수 없습니다.</em>
															</p>
														</div>
														<div class="btn_wrap change_pw hide" id="btn_chg_pw"
															data-handler="trPwdCheck" style="display: none;">
															<button type="button" class="btn btn_sm on"
																data-control="toggle" data-handler-target="trPwdCheck">
																<span class="arr">변경하기</span>
															</button>
														</div>
														<div class="msg_desc" data-handler="trPwdCheck">
															<ul class="bul_list sub_txt">
																<li class="dot_arr">영문자, 숫자, 특수문자 조합하여 8~12자리어야
																	합니다.</li>
																<li class="dot_arr">아이디와 4자리 이상 동일하거나, 4자리 이상 반복되는
																	문자와 숫자는 사용이 불가합니다.</li>
																<li class="dot_arr">사용 가능 특수문자:
																	!"#$%&amp;'()*+,-./:;&lt;=&gt;?@[]^_`{|}~</li>
																<!-- 사용 가능 특수문자 -->
															</ul>
														</div>
													</div>
												</td>
											</tr>
											<tr class="input new_pw" id="trPwdCheck"
												data-handler="trPwdCheck">
												<th scope="row" class="hide"><label for="pwd_check">비밀번호
														확인</label></th>
												<td class="hide">
													<div class="input_group">
														<span class="input_txt w250"><input type="password"
															class="text" placeholder="비밀번호를 재입력해주세요." maxlength="50"
															name="pwd_check" id="pwd_check"></span>
														<p id="msg_pwd_check" class="msg_info em hide">비밀번호와
															비밀번호 확인이 일치하지 않습니다.</p>

													</div>
												</td>
											</tr>

										</tbody>
									</table>
								</div>
								<!-- //기본정보 -->

								<!-- 정보제공 동의여부 -->
								<div class="table_header choice">
									<h3 class="h3_tit">정보제공 동의여부</h3>
								</div>
								<div class="list_accordion faq_list agreement_sec">
									<ul data-control="accordion">


										<!-- CJ ONE 개인정보 수집 및 활용 동의 -->

										<li>
											<p class="question_wrap">
												<button type="button" class="toggleBtn" data-handler-target="cj_gatherAgree">													<span class="title">홍보 및 마케팅을 위한 개인정보 수집 및 활용 동의
														(선택)</span> <span class="btn" data-handler="toggleText">열기</span>
												</button>
											</p>
											<div class="answer_wrap">
												<div class="item_box first">
													<div class="cont">
														<div class="polViewnew">
															<table border="1" cellspacing="0" cellpadding="0"
																style="width: 100%">
																<caption>개인정보 수집 및 활용 동의(선택)의 설명을 알려주는 표로써, 수집
																	목적, 수집 항목, 보유 기간으로 구성되어 있습니다.</caption>
																<thead>
																	<tr>
																		<th style="width: 40%">수집 목적</th>
																		<th style="width: 30%">수집 항목</th>
																		<th style="width: 30%">보유 기간</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>
																			<ul>
																				<li
																					style="font-size: 17px; font-weight: bold; text-decoration: underline;">상품
																					또는 서비스의 홍보 및 마케팅 활동(사은/판촉행사 등 각종 이벤트 및 행사 관련 정보안내,
																					제반 이벤트/프로모션 활동, 당사 및 제휴사 상품/서비스 안내 및 권유)</li>
																			</ul>
																		</td>
																		<td>
																			<ul>
																				<li>- 이메일주소, 휴대전화번호, 단말식별번호(단말기 아이디), PUSH 토큰</li>
																			</ul>
																		</td>
																		<td
																			style="text-align: center; font-size: 17px; font-weight: bold; text-decoration: underline;">회원
																			탈퇴 후 30일까지</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>

													<div class="agreement_choose">
														<span class="radio_btn" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<!-- 선택 시 on클래스 추가 --> <a href="#"> <span
																class="haze">미동의<span>미선택됨</span></span> <!-- input이 checked상태면 선택됨, 아니면 미선택됨 -->
														</a><span class="hide"><span class="haze">미동의<span>선택불가</span></span></span>
															<input type="radio" id="agr30_N" name="agr30" value="N"
															class="chk"> <label for="agr30_N">미동의</label>
														</span> <span class="radio_btn on" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">동의<span>선택됨</span></span>
																<!-- input이 checked상태면 선택됨, 아니면 미선택됨 -->
														</a><span class="hide"><span class="haze">동의<span>선택불가</span></span></span>
															<input type="radio" id="agr30_Y" name="agr30" value="Y"
															class="chk" checked="checked"> <label
															for="agr30_Y">동의</label>
														</span>
													</div>
												</div>
											</div>
										</li>

										<li>
											<p class="question_wrap">
												<button type="button" class="toggleBtn">
													<span class="title">스탬프 서비스 이용을 위한 개인정보 수집 및 활용 동의
														(선택)</span> <span class="btn" data-handler="toggleText">열기</span>
												</button>
											</p>
											<div class="answer_wrap">
												<div class="item_box first">
													<div class="cont">
														<div class="polViewnew">
															<table border="1" cellspacing="0" cellpadding="0"
																style="width: 100%">
																<caption>스탬프 이용을 위한 개인정보 수집 및 활용 동의로 수집주체, 수집
																	목적, 수집 항목, 보유기간을 나타내는 표입니다.</caption>
																<thead>
																	<tr>
																		<th scope="col">수집주체</th>
																		<th scope="col">수집 목적</th>
																		<th scope="col">수집 항목</th>
																		<th scope="col">보유기간</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td
																			style="font-size: 17px; font-weight: bold; text-decoration: underline;">CJ
																			ONE및 스템프 서비스가 제휴된 제휴사</td>
																		<td
																			style="font-size: 17px; font-weight: bold; text-decoration: underline;">e-스탬프
																			서비스 제공 및 혜택 제공</td>
																		<td>상품명(서비스명), 상품분류명, 구매/이용 수량, 구매/이용일시</td>
																		<td
																			style="font-size: 17px; font-weight: bold; text-decoration: underline;">회원
																			탈퇴 후 30일 까지 또는 해당 서비스 동의 철회시까지</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>

													<div class="agreement_choose">
														<span class="radio_btn" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<!-- 선택 시 on클래스 추가 --> <a href="#"> <span
																class="haze">미동의<span>미선택됨</span></span> <!-- input이 checked상태면 선택됨, 아니면 미선택됨 -->
														</a><span class="hide"><span class="haze">미동의<span>선택불가</span></span></span>
															<input type="radio" id="agr40_N" name="agr40" value="N"
															class="chk"> <label for="agr40_N">미동의</label>
														</span> <span class="radio_btn on" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">동의<span>선택됨</span></span>
																<!-- input이 checked상태면 선택됨, 아니면 미선택됨 -->
														</a><span class="hide"><span class="haze">동의<span>선택불가</span></span></span>
															<input type="radio" id="agr40_Y" name="agr40" value="Y"
															class="chk" checked="checked"> <label
															for="agr40_Y">동의</label>
														</span>
													</div>
												</div>
											</div>
										</li>


										<!-- CJ ONE 제 3자 정보제공 동의 -->

										<li>
											<p class="question_wrap">
												<button type="button" class="toggleBtn">
													<span class="title">CJ ONE 제 3자 정보제공 동의(선택)</span> <span
														class="btn" data-handler="toggleText">열기</span>
												</button>
											</p>
											<div class="answer_wrap">



												<div class="item_box first">




													<h4 class="h5_tit">CJ 기프트카드 서비스 이용약관</h4>


													<div class="cont clause_box" tabindex="0">
														<div id="polView">
															<div class="polViewnew">
																<p>
																	<strong>제1조(목적)</strong><br> 이 약관은 CJ올리브네트웍스(이하
																	"발행사" 라 함)가 발행하는 "전자상품권", "모바일상품권" 및 "쿠폰"(이하 "상품권")의 구매
																	및 이용과 관련하여, "발행사", "구매자" 및 "사용자"의 권리, 의무 등에 관한 사항을 정함을
																	목적으로 한다.
																</p>
																<br>
																<p>
																	<strong>제2조(용어의 정의)<a name="pol02"></a></strong>
																</p>
																<ol class="polviewol">
																	<li><span class="space">①</span>"상품권": "발행사"가
																		전자금융거래법을 근거로 하여 발행하는 선불전자지급수단으로서, 이전 가능한 금전적 가치가 전자적
																		방법으로 저장되어 발행된 증표 또는 그 증표에 관한 정보이며, 재화 또는 용역을 구입하고 그
																		대가를 지급하는데 사용되는 것을 말한다.</li>
																	<li><span class="space">②</span>"전자상품권": 금액 등이 전자적
																		장치(전자카드 등)에 저장된 "상품권"을 말한다.</li>
																	<li><span class="space">③</span>"모바일상품권": 금액 등이 전자
																		정보로 기록되어 있음이 기재된 증표가 모바일기기에 저장되고 제시함으로서 사용 가능한 "상품권"을
																		말한다.</li>
																	<li><span class="space">④</span>"쿠폰": 사용처에서 판매하는
																		일정한 상품을 교환권 형태로 사용자에게 선물하고, 이 교환권을 사용자가 해당 사용처에서 연계된
																		상품으로 교환할 수 있는 "상품권"을 말한다.</li>
																	<li><span class="space">⑤</span>"구매자": "발행사"에서
																		발행하는 "상품권"을 구매하는 고객을 말한다.</li>
																	<li><span class="space">⑥</span>"사용자": 직접 구매하거나 양도
																		받은 "상품권"을 물품대금 결제수단으로 사용하는 고객을 말한다.</li>
																	<li><span class="space">⑦</span>"가맹점": "발행사"와
																		가맹계약을 맺고 "사용자"가 "상품권" 사용시 원장에 표시된 금액에 해당하는 재화 또는 용역을
																		제공할 의무를 가진 자를 말한다.</li>
																	<li><span class="space">⑧</span>"제휴 위탁사": "발행사"와
																		계약을 맺고, "발행사"의 의무를 대신하여 환불, 판매, 회수를 대행하는 자를 말한다.</li>
																	<li><span class="space">⑨</span>"판매처": "발행사"와 계약을
																		맺고, "발행사"의 의무를 대신하여 판매를 대행하는 자를 말한다.</li>
																	<li><span class="space">⑩</span>"단말기": 전자적 장치로서
																		"상품권"을 전자적 방법으로 저장하거나, 전자정보를 기록하는 장치를 말한다.</li>
																</ol>
																<p>&nbsp;</p>
																<br>
																<p>
																	<strong>제3조(구매 및 인증)<a name="pol03"></a></strong>
																</p>
																<ol class="polviewol">
																	<li><span class="space">①</span>"상품권"은 "발행사" 또는
																		"제휴 위탁사"가 판매를 위탁한 "판매처"에서 구입할 수 있다.</li>
																	<li><span class="space">②</span>"상품권"은 "제휴 위탁사"와
																		합의하여 현금, 직불카드, 신용카드 등으로 선택적으로 구매할 수 있다. 다만, 신용카드 및
																		직불카드 구매한도는 여신전문금융업법 시행규칙에서 정하는 범위 내로 제한될 수 있다.</li>
																	<li><span class="space">③</span>"상품권"의 최초 "구매자"는
																		구매 시 "상품권" 활성화(Activation)를 위한 인증을 받아야 한다.</li>
																	<li><span class="space">④</span>"발행사" 또는 "제휴 위탁사"는
																		상품권 시스템을 통하여 "상품권" 원장 데이터의 유효성을 검증하고, 인증에 대한 결과를
																		"구매자"에게 고지(인증번호 부여 또는 영수증 제공)하여야 한다.</li>
																</ol>
																<p>&nbsp;</p>
																<br>
																<p>
																	<strong>제4조(권종 및 충전)<a name="pol04"></a></strong>
																</p>
																<ol class="polviewol">
																	<li><span class="space">①</span>"상품권"은 아래 각호의 유형으로
																		구분한다.<br> &nbsp;1."충전형" : "상품권" 내에 금전적 가치를 충전하여
																		사용하는 방식을 의미한다.<br> &nbsp;2."권종형" : "상품권"의 금전적 가치가
																		발행 시점부터 기재되어 정해진 것을 말한다. "권종형"은 권면금액을 구분하여 발행한다.<br>
																		&nbsp;3."물품교환권" : "상품권"을 특정 재화와 교환하는 방식으로 사용되는 것을 말한다.</li>
																	<li><span class="space">②</span>"충전형"은 권면 금액에 관계
																		없이, "구매자"가 자유롭게 금액을 추가하여 구매 할 수 있으며, "기명식"은 200만원,
																		"무기명식"은 50만원으로 한도를 제한 한다. 다만, 전자금융거래법 제23조에 근거 및 구매자
																		편의를 고려하여 충전한도를 하향하여 변경 할 수 있다.</li>
																	<li><span class="space">③</span>"발행사" 또는 "제휴 위탁사"는
																		"단말기"을 통하여 "상품권"의 충전금액 및 데이터의 유효성을 검증하고, 충전에 대한 결과를
																		구매자에게 고지(인증번호 부여 또는 영수증 제공)하여야 한다.</li>
																</ol>
																<p>&nbsp;</p>
																<br>
																<p>
																	<strong>제5조(사용 및 양도)<a name="pol05"></a></strong>
																</p>
																<ol class="polviewol">
																	<li><span class="space">①</span>"상품권"은 "충전형",
																		"권종형"은 잔액의 범위 내에서 이용횟수의 제한 없이 일시불 구매방법으로 "발행사"와
																		"가맹점"에서 사용할 수 있다.</li>
																	<li><span class="space">②</span>"상품권"의 "구매자"는 이를
																		타인에게 양도할 수 있으며, 이를 양수 받아 사용하는 사용자도 가맹점에서 전항의 방법으로 이용할
																		수 있으며, 재 양도할 수 있다. 단, "모바일상품권"의 경우 수신자 변경 후 양도 할 수 있다.</li>
																</ol>
																<p>&nbsp;</p>
																<br>
																<p>
																	<strong>제6조(사용의 제한)<a name="pol06"></a></strong>
																</p>
																<ol class="polviewol">
																	<li><span class="space">①</span>"상품권"은 다음의 경우에 사용이
																		제한 될 수 있다.<br> &nbsp;1."상품권" 구매 시 인증(Activation)을
																		받지 않은 경우<br> &nbsp;2.해당 "상품권"의 잔액이 이용하고자 하는 금액보다
																		적은 경우<br> &nbsp;3."상품권"이 사용중지 상태인 경우<br>
																		&nbsp;4.전산시스템의 오류, 통신 불능, 단말기의 고장 등 "상품권"의 사용을 위한 유효성을
																		검증 할 수 없는 경우</li>
																	<li><span class="space">②</span>"상품권"이 위, 변조 또는 기타
																		부정하게 발행된 경우, 잔액에 관계없이 "발행사"는 "사용자"의 "상품권"의 사용을 제한 할 수
																		있다.</li>
																	<li><span class="space">③</span>"상품권"을 불법할인, 현금융통
																		등의 방법으로 사용하여서는 안되며, 그러한 경우 "사용자"는 그 책임의 전부 또는 일부를 부담할
																		수 있다.</li>
																</ol>
																<p>&nbsp;</p>
																<br>
																<p>
																	<strong>제7조 (거래내용의 확인)<a name="pol07"></a></strong>
																</p>
																<ol class="polviewol">
																	<li><span class="space">①</span>"발행사"는 "사용자"의 요청이
																		있는 경우, 관련법령에서 정한 보존기간(전자금융거래법 시행령 제12조 제1항 참조) 내의 거래에
																		대해서는 거래내용을 확인해주어야 하며, 서면(전자문서를 제외한다.)으로 제공할 것을 요청하는
																		경우에는 그 요청을 받은 날부터 2주 이내에 거래내용에 관한 서면을 교부하여야 한다. 다만,
																		전자적 장치의 운영장애, 그 밖의 사유로 거래내용을 확인하게 할 수 없는 때에는 인터넷 등을
																		이용하여 즉시 그 사유를 알리고, 그 사유가 종료된 때부터 "사용자"가 거래내용을 확인할 수
																		있도록 하여야 한다.</li>
																	<li><span class="space">②</span>"발행사"는 "사용자"에게
																		거래내용을 서면으로 제공할 것을 요청 받은 경우 전자적 장치의 운영장애, 그 밖의 사유로
																		거래내용을 제공할 수 없는 때에는 그 "사용자"에게 즉시 이를 알려야 한다. 이 경우 법
																		제7조제2항의 거래내용에 관한 서면의 교부기간을 산정함에 있어서 전자적 장치의 운영장애, 그 밖의
																		사유로 거래내용을 제공할 수 없는 기간은 산입하지 아니한다.</li>
																	<li><span class="space">③</span>"사용자"는 거래내용을 서면으로
																		제공받고자 하는 경우에는 발행사의 고객센터(전화번호:1577-8888)로 신청하여야 한다.</li>
																</ol>
																<br>
																<p>
																	<strong>제8조 (오류의 정정 등)<a name="pol08"></a></strong>
																</p>
																<ol class="polviewol">
																	<li><span class="space">①</span>"사용자"는 전자금융거래에 오류가
																		있음을 안 때에는 그 발행자에게 이에 대한 정정을 요구할 수 있다.</li>
																	<li><span class="space">②</span>"발행사"는 제1항의 규정에 따른
																		오류의 정정요구를 받은 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날부터 2주 이내에
																		오류의 원인과 처리 결과를 문서로 알려야 하며, 다만, "사용자"가 요청하면 전화 또는 전자우편
																		등의 방법으로 알릴 수 있다.</li>
																	<li><span class="space">③</span>"발행사"는 스스로 전자금융거래에
																		오류가 있음을 안 때에는 이를 즉시 조사하여 처리한 후 오류가 있음을 안 날부터 2주 이내에
																		오류의 원인과 처리 결과를 전항과 같은 방법으로 "사용자"에게 알려야 한다.</li>
																</ol>
																<p>&nbsp;</p>
																<br>
																<p>
																	<strong>제9조(유효기간)<a name="pol09"></a></strong>
																</p>
																<ol class="polviewol">
																	<li><span class="space">①</span>"상품권"의 유효기간은
																		구매시점("권종형"은 최초구매일자, "충전형"은 최종충전일)으로부터 5년이며, 유효기간이 경과한
																		카드로 결제 및 환불, 교환은 할 수 없다. 단, 이벤트 및 행사를 통하여 무상 제공된
																		"상품권"은 별도 표기된 유효기간으로 정한다.</li>
																	<li><span class="space">②</span>"사용자"는 유효기간 내에는
																		연장을 요청할 수 있으며 특별한 사유가 없는 경우 유효기간이 연장된다. 단, 이벤트, 행사 등을
																		통해 무상으로 양도받은 "상품권"은 연장 할 수 없다.</li>
																	<li><span class="space">③</span>"발행사"는 "사용자"에게
																		"상품권"의 유효기간 만료 30일 전 통지를 포함하여 3회 이상 유효기간 도래에 대해 알려야
																		한다.</li>
																</ol>
																<p>&nbsp;</p>
																<br>
																<p>
																	<strong>제10조(구매 취소의 방법)<a name="pol10"></a></strong>
																</p>
																<ol class="polviewol">
																	<li><span class="space">①</span>"구매자"는 전자금융거래법
																		제13조제1항 각 호의 규정에 따라 지급의 효력이 발생하기 전까지 거래지시를 철회할 수 있으나,
																		대량으로 처리하는 거래 또는 예약에 따른 거래 등의 경우에는 사전 고지를 통하여 거래지시의
																		철회시기를 달리 정할 수 있다.</li>
																	<li><span class="space">②</span>구매한 "상품권"은 현금으로
																		반환되지 않는다. 다만, "구매자"가 "상품권"을 사용하지 않거나, 포장 등의 상태가 양호한
																		경우에는 "발행사"가 정한 일정 기간 내에서 판매 취소 할 수 있다. 다만, "발행사"는 취소
																		기한을 구매시점에 "구매자"에게 "판매처"에서 사전에 고지하여야 한다.</li>
																	<li><span class="space">③</span>"충전권" "상품권"의 재충전
																		취소 요청 시 취소요청 금액이 잔액보다 적을 경우, 취소 요청을 제한 한다.</li>
																</ol>
																<p>&nbsp;</p>
																<br>
																<p>
																	<strong>제11조("상품권"의 환급)<a name="pol11"></a></strong><br>
																	다음 각 호의 어느 하나에 해당하는 경우에는 "상품권"에 기록된 잔액의 전부를 현금으로 환급 받을
																	수 있다.
																</p>
																<ol class="polviewol">
																	<li><span class="space">①</span>"구매자" 또는 "사용자"는 다음
																		각 호의 어느 하나에 해당하는 경우에는 "상품권"에 기록된 잔액의 전부를 현금으로 환급 받을 수
																		있다.<br> &nbsp;1.천재지변 등의 사유로 가맹점이 재화 또는 용역을 제공하기
																		곤란하여 "상품권"을 사용하지 못하게 된 경우<br> &nbsp;2."상품권"의 결함으로
																		"가맹점"이 재화 또는 용역을 제공하지 못하는 경우<br> &nbsp;3."상품권"의
																		금액("권종형"의 경우 권면금액, "충전형"의 경우 최종충전시점에 기재된 금액)의
																		60%이상(1만원 이하 "상품권"의 경우 80%이상) 소진 시 그 잔액에 대해서는 현금으로 환불
																		받을 수 있다. 단 환불 금액은 구매액을 기준으로 사용 비율에 따라 계산하여 남은 비율의 금액을
																		환불한다. 단, 이벤트, 행사 등을 통해 무상제공(무료, 이벤트 등)받은 "상품권"의 경우에는
																		환불을 받을 수 없다.<br> &nbsp;4.기타 "발행사"가 본 서비스를 중단하는 것을
																		사전에 통지한 경우</li>
																	<li><span class="space">②</span>계좌이체의 방식으로 환불을 요청
																		받은 경우 환불금액은 제반 비용을(계좌이체 실비) 공제한 후 입금된다.</li>
																</ol>
																<p>&nbsp;</p>
																<br>
																<p>
																	<strong>제12조("상품권"의 분실과 도난 책임)<a name="pol12"></a></strong>
																</p>
																<ol class="polviewol">
																	<li><span class="space">①</span>"상품권"의 소유자가 "상품권"
																		관리소홀로 인한 분실 혹은 도용 시 충전 금액에 대한 책임은 "사용자"에게 있다.</li>
																	<li><span class="space">②</span>"발행사"가 전항의 소유자로부터
																		"상품권"의 분실이나 도난 등의 통지를 받았으며 해당 "상품권" 번호 및 현재 소지자의 신분이
																		확인될 경우, "발행사"는 해당 "상품권"의 사용을 정지 할 수 있다. 다만, 그 때부터 제3자가
																		그 "상품권"을 사용함으로 인하여 전항의 소유자에게 발생한 손해를 배상할 책임을 진다.</li>
																	<li><span class="space">③</span>"발행사"는 정지된 "상품권"에
																		대하여 "상품권" 소유자의 요청에 따라 해당금액만큼 잔액을 환불해주거나 다른 "상품권"으로
																		대체하여 제공한다. 이 경우, "발행사"는 이에 따라 발생하는 수수료를 요청자에게 부담하게 할 수
																		있다.</li>
																</ol>
																<p>&nbsp;</p>
																<br>
																<p>
																	<strong>제13조(위조나 변조 시 책임)<a name="pol13"></a></strong>
																</p>
																<ol class="polviewol">
																	<li><span class="space">①</span>"발행사"는 "상품권"의 위조나
																		변조로 발생한 사고, 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여
																		"사용자"에게 손해가 발생한 경우에는 그 손해를 배상할 책임을 진다.</li>
																	<li><span class="space">②</span>"사용자"는 다음 각호의 사유가
																		발생하는 경우 제1항의 규정에 불구하고 금융기관 또는 전자금융업자가 그 책임의 전부 또는 일부를
																		"사용자"가 부담하도록 할 수 있음을 확인한다.<br> &nbsp;1.사고 발생에 있어서
																		"사용자"의 전자금융거래법 시행령 제8조에서 규정 한 고의나 중대한 과실이 있는 경우로서 그
																		책임의 전부 또는 일부를 "사용자"의 부담으로 할 수 있다는 취지의 약정을 미리 이용자와 체결한
																		경우<br> &nbsp;2.법인(「중소기업기본법」제2조 제2항에 의한 소기업을
																		제외한다)인 "사용자"에게 손해가 발생한 경우로 "발행사"가 사고를 방지하기 위하여 보안절차를
																		수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우</li>
																</ol>
																<p>&nbsp;</p>
																<br>
																<p>
																	<strong>제14조 (약관의 명시와 변경통지 등)<a name="pol14"></a></strong>
																</p>
																<ol class="polviewol">
																	<li><span class="space">①</span>"발행사"는 "사용자"와
																		전자금융거래의 계약을 체결함에 있어서 약관을 명시하여야 하고, 이용자의 요청이 있는 경우에는
																		금융위원회가 정하는 방법에 따라 그 약관의 사본을 교부하고 그 약관의 내용을 설명하여야 한다.</li>
																	<li><span class="space">②</span>"발행사"는 제1항의 규정을
																		위반하여 계약을 체결한 때에는 당해 약관의 내용을 계약의 내용으로 주장할 수 없다.</li>
																	<li><span class="space">③</span>"발행사"는 약관을 변경하는
																		때에는 변경되는 약관의 시행일 1월 전에 금융위원회가 정하는 방법에 따라 이를 게시하고
																		"사용자"에게 통지하여야 한다. 다만, 법령의 개정으로 인하여 긴급하게 약관을 변경하는 때에는
																		금융위원회가 정하는 방법에 따라 이를 즉시 게시하고 이용자에게 통지하여야 한다.</li>
																	<li><span class="space">④</span>"사용자"는 제3항의 규정에 따른
																		약관의 변경내용이 게시되거나 통지된 후부터 변경되는 약관의 시행일 전까지 전자금융거래의 계약을
																		해지할 수 있다. 전단의 기간 안에 "사용자"가 약관의 변경내용에 대하여 이의를 제기하지 아니하는
																		경우에는 약관의 변경을 승인한 것으로 본다.</li>
																</ol>
																<p>&nbsp;</p>
																<br>
																<p>
																	<strong>제15조(신용정보의 제공/이용 등)<a name="pol15"></a></strong>
																</p>
																<ol class="polviewol">
																	<li><span class="space">①</span>"발행사"는 이 계약과 관련하여
																		취득한 회원의 신용정보를 관련 법률에 정한 바에 따라 엄격히 관리해야 하며 회원이 제공/활용에
																		동의한 경우에는 회원이 동의한 범위 내에서 신용정보집중기관, 신용정보업자, 신용정보제공, 이용자,
																		제휴업체와 정보를 교환하여 이용할 수 있다. 다만, 회원이 해지한 이후에는 관련 법령이 정하는 바
																		이외에는 이용하지 않는다.</li>
																	<li><span class="space">②</span>"가맹점"과 "사용자" 간에
																		"상품권"거래로 인하여 분쟁이 발생하였을 경우, "발행사"는 "사용자"의 정보를 "가맹점"에게
																		제공할 수 있으며, "사용자"는 "가맹점"의 정보를 요구할 수 있다.</li>
																</ol>
																<p>&nbsp;</p>
																<br>
																<p>
																	<strong>제16조(위반시의 책임)<a name="pol16"></a></strong><br>
																	&nbsp;"발행사"와 "사용자"는 이 약관을 위반함으로써 발생하는 책임을 각자가 부담하며, 이로
																	인하여 상대방에게 손해를 입힌 경우에는 이를 배상하여야 한다.
																</p>
																<br>
																<p>
																	<strong>제17조(이 약관에서 정하지 아니한 사항)<a name="pol17"></a></strong><br>
																	&nbsp;이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 관계법령 또는 일반 상
																	관례에 따른다.
																</p>
																<br>
																<p>
																	<strong>제18조(지급보증)<a name="pol18"></a></strong><br>
																</p>
																<ol class="polviewol">
																	<li><span class="space">①</span>"발행사"에서 발행하는
																		"상품권"은 충전 금액 전액에 대하여 전자상거래(결제수단) 보증보험증권에 가입되어 있다.('23년
																		2분기 마감기준 12,549,621,280원*110%) "발행사"에서 발행하는 "상품권"은
																		전자금융업법의 적용을 받으며 지급보증 또는 피해보상보험계약에 대하여 책임과 의무가 있고,
																		지급보증은 전자적으로 등록된 금액에 등록된 바에 따른다.</li>
																	<li><span class="space">②</span>"발행사"는 전월말 기준
																		"상품권"의 전체 충전 금액 중 10분의 1에 해당하는 금액을 제외하고 직접 운용(이하 "운용대상
																		선불충전금")할 수 있다.</li>
																	<li><span class="space">③</span>"발행사"는 "운용대상
																		선불충전금"을 다음 각 호의 자산("안전자산")으로만 운용할 수 있다.<br>
																		&nbsp;1. 국채, 지방채<br> &nbsp;2. 정부, 지방자치단체,
																		금융회사(예금자보호법 제2조 제1호의 부보금융회사)가 지급보증한 채무증권<br>
																		&nbsp;3. 우체국 예치<br> &nbsp;4. 은행의 예금 또는 양도성 예금증서<br>
																		&nbsp;5. 은행이 발행한 채권 중 후순위채권 및 주식관련채권 이외의 채권<br>
																		&nbsp;6. 한국주택금융공사가 채권유동화계획에 따라 발행한 주택저당증권<br>
																		&nbsp;7. 특수채증권(법률에 의해 직접 설립된 법인이 발행한 채권)<br>
																		&nbsp;8. 환매조건부 채권(다만, 대상증권은 국채, 지방채 등 안전자산(1종)에 속한 채권에
																		한함)<br> &nbsp;9. 당해 신탁업자에 대한 대출채권(다만, 금액의 규모 또는
																		시간의 제약으로 인하여 다른 방법으로 운용할 수 없는 경우에 한함)<br>
																		&nbsp;10. 복수의 기업신용평가기관에 의해 AAA등급으로 분류된 회사채(다만, 집중투자로
																		인한 위험을 방지하기 위하여 전체 운용금액 중 ①동일 법인이 발행한 회사채에 대해서는 100분의
																		5를, ②동일 계열기업군(「독점규제 및 공정거래에 관한 법률」제2조제2호의 규정에 의한
																		기업집단)에 속하는 기업이 발행한 회사채에 대해서는 100분의 10을 초과하여 투자할 수 없음)<br>
																		&nbsp;11. 자본시장과 금융투자업에 관한 법률(제229조제5호)에 따른 단기금융집합투자기구의
																		집합투자증권(MMF)</li>
																</ol>
																<p>&nbsp;</p>
																<br>
																<p>
																	<strong>제19조(착오송금)<a name="pol19"></a></strong><br>
																</p>
																<ol class="polviewol">
																	<li><span class="space">①</span>"구매자"가 착오로 연락처 또는
																		전화번호 등을 잘못 기재하거나 입력하여 수취인에게 선물하기를 이용하여 선불전자지급수단 등의 자금이
																		이동(이하 "착오송금"이라 함) 된 경우, "발행사"에 통지하여 "발행사"를 통해 수취인에게
																		연락하여 착오 송금액 반환을 요청할 수 있다.</li>
																	<li><span class="space">②</span>"발행사"는 수취인에 대한 연락
																		사실, 수취인의 반환의사 유무, 수취인이 반환의사가 없는 경우 그 사유 등 "구매자" 요청사항에
																		대한 처리결과 또는 관련 처리 진행상황을 "구매자"가 전항의 "착오송금" 발생사실을 회사에 통지한
																		날로부터 15일 이내에 "구매자"에게 알려야 한다.</li>
																	<li><span class="space">③</span>"발행사"를 통한 착오송금 반환
																		요청에도 수취인이 반환하지 않는 경우, "구매자"는 「예금자보호법」 제5장(착오송금 반환지원)에
																		따라 예금보험공사에 착오송금 반환지원 제도 이용을 신청할 수 있다.(개정 「예금자보호법」 시행일인
																		’21.7.6. 이후 발생한 착오송금에 대해 신청 가능) 단, 연락처를 통한 송금, SNS회원간
																		송금 거래 등 예금보험공사가 수취인의 실지명의를 취득할 수 없는 거래는 반환지원 신청이 제한된다.</li>
																	<li><span class="space">④</span>"발행사"는 예금보험공사가
																		착오송금 반환지원 업무의 원활한 수행을 위해 "발행사"에 착오송금 수취인의 반환불가 사유,
																		연락처, 착오송금 발생 현황 등의 자료를 요청하는 경우 정당한 사유가 없으면 이에 따라야 한다.</li>
																	<li><span class="space">⑤</span>"구매자"가 예금보험공사를 통해
																		착오송금 반환지원을 신청한 내역이 다음 각 호에 해당하는 경우 관련 법령에 따라 예금보험공사의
																		지원 절차가 중단될 수 있다.<br> &nbsp;1. "구매자"가 거짓이나 부정한
																		방법으로 반환지원을 신청한 경우<br> &nbsp;2. 착오송금이 아님이 객관적인 자료로
																		확인되는 경우<br> &nbsp;3. 신청일 이전 반환 지원을 신청한 착오송금과 관련된
																		소송 등이 진행 중이거나 완료된 경우<br> &nbsp;4. 그 밖에 예금보험위원회가
																		인정하는 경우</li>
																</ol>
																<p>&nbsp;</p>
																<br>
																<p>
																	<strong>제20조(관할법원)<a name="pol20"></a></strong><br>
																	&nbsp;이 약관에 따른 거래에 관하여 분쟁이 발생한 경우에는 민사소송법상의 관할법원의 규정에
																	따른다.
																</p>
																<br>
																<p>
																	<strong>※ 최종개정일자 : 2023. 07. 14</strong><br>
																	&nbsp;
																</p>
															</div>
														</div>
													</div>
													<!--20200903 기프트 카드 이용 약관 수정-->

													<p style="padding-top: 8px;">※ 이용자는 기프트카드 서비스 이용약관에 대한
														동의를 거부할 권리가 있으나, 미 동의시 서비스 이용이 불가능합니다.</p>

													<!--//20200903 기프트 카드 이용 약관 수정-->
													<div class="agreement_choose">
														<span class="radio_btn on" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<!-- 선택 시 on클래스 추가 --> <a href="#"> <span
																class="haze">미동의<span>선택됨</span></span> <!-- input이 checked상태면 선택됨, 아니면 미선택됨 -->
														</a><span class="hide"><span class="haze">미동의<span>선택불가</span></span></span>
															<input type="radio" id="agr38_N" name="agr38" value="N"
															class="chk" checked="checked"> <label
															for="agr38_N">미동의</label>
														</span> <span class="radio_btn" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">동의<span>미선택됨</span></span>
																<!-- input이 checked상태면 선택됨, 아니면 미선택됨 -->
														</a><span class="hide"><span class="haze">동의<span>선택불가</span></span></span>
															<input type="radio" id="agr38_Y" name="agr38" value="Y"
															class="chk"> <label for="agr38_Y">동의</label>
														</span>
													</div>
												</div>
												<div class="item_box">
													<h4 class="h5_tit">멤버십 연동을 위한 제3자 정보제공 동의</h4>
													<div class="clause_box">
														<table border="1" cellspacing="0" cellpadding="0"
															style="width: 100%">
															<caption
																style="position: absolute; top: 0; left: 0; color: #fff; font-size: 0px; line-height: 0;">멤버십
																연동을 위한 제3자 개인정보 제공 동의로 제공받는 자, 제공 목적, 제공하는 항목, 보유 및
																이용기간에 대한 안내입니다.</caption>
															<colgroup>
																<col style="width: 20%">
																<col style="width: 25%">
																<col style="width: 25%">
																<col style="width: 30%">
															</colgroup>
															<thead>
																<tr>
																	<th scope="col" style="background-color: #fff">제공받는
																		자</th>
																	<th scope="col" style="background-color: #fff">제공
																		목적</th>
																	<th scope="col" style="background-color: #fff">제공하는
																		항목</th>
																	<th scope="col" style="background-color: #fff">보유
																		및 이용기간</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<th scope="row"
																		style="font-weight: bold; border-collapse: collapse; font-size: 17px; text-decoration: underline; background-color: #fff">NICE정보통신(주)</th>
																	<td
																		style="font-weight: bold; border-collapse: collapse; font-size: 17px; text-decoration: underline; background-color: #fff">기프트카드
																		정산 및 고객 안내/CS 처리</td>
																	<td
																		style="border-collapse: collapse; background-color: #fff">회원번호
																	</td>
																	<td
																		style="font-weight: bold; border-collapse: collapse; font-size: 17px; text-decoration: underline; background-color: #fff">CJ
																		ONE 회원 탈퇴 또는 제 3자 제공 동의 철회 시 까지</td>
																</tr>
															</tbody>
														</table>
													</div>
													<!--20200903 기프트 카드 이용 약관 수정-->

													<!--//20200903 기프트 카드 이용 약관 수정-->
													<div class="agreement_choose">
														<span class="radio_btn on" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<!-- 선택 시 on클래스 추가 --> <a href="#"> <span
																class="haze">미동의<span>선택됨</span></span> <!-- input이 checked상태면 선택됨, 아니면 미선택됨 -->
														</a><span class="hide"><span class="haze">미동의<span>선택불가</span></span></span>
															<input type="radio" id="agr39_N" name="agr39" value="N"
															class="chk" checked="checked"> <label
															for="agr39_N">미동의</label>
														</span> <span class="radio_btn" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">동의<span>미선택됨</span></span>
																<!-- input이 checked상태면 선택됨, 아니면 미선택됨 -->
														</a><span class="hide"><span class="haze">동의<span>선택불가</span></span></span>
															<input type="radio" id="agr39_Y" name="agr39" value="Y"
															class="chk"> <label for="agr39_Y">동의</label>
														</span>
													</div>
												</div>

											</div>
										</li>
						
										<!-- 옴니 서비스 약관 -->
										<li>
											<p class="question_wrap">
												<button type="button" class="">
													<span class="title">CJ 옴니서비스 이용약관</span> <span class="btn"
														data-handler="toggleText">열기</span>
												</button>
												<!-- 클릭 시 열기 텍스트를 닫기로 변경 -->
											</p>
											<div class="answer_wrap agreement_clause">
												<!-- 안내문 -->
												<div class="cont clause_box"
													style="margin-top: 40px; padding: 20px; border: 1px solid #ddd;">
													<p>본인은 CJ 옴니서비스 이용을 위하여 아래와 같이 본인의 정보를 제3자에게 제공하는 것에
														동의합니다.</p>
													<p style="margin-top: 10px;">씨제이제일제당㈜, 씨제이대한통운㈜,
														씨제이이엔엠㈜, 씨제이올리브영㈜, 씨제이올리브네트웍스㈜, 씨제이씨지브이㈜, 씨제이푸드빌㈜, ㈜티빙(이하,
														총칭하여 “CJ” 또는 "CJ계열사")는 CJ가 보유한 다양한 온-오프라인 채널간 유기적 연계를 통해
														다양한 고객 맞춤 서비스를 제공하고 CJ 고객의 서비스 만족도를 보다 더 향상시키기 위하여 다음과 같이
														CJ 계열사에게 회원의 개인정보를 상호 제공(공유)ㆍ활용하고자 합니다. 동의하시는 경우 옴니서비스와 함께
														CJ가 제공하는 상품/서비스에 대하여 보다 더 만족스러운 경험을 느끼실 수 있습니다.</p>
													<p style="margin-top: 10px; font-weight: bold;">[제공 목적]</p>
													<ul>
														<li>1) 각 CJ계열사의 고유 상품/서비스 제공, 유지, 개선, 고도화, 최적화 및 신규
															상품/서비스 개발</li>
														<li>2) 각 CJ계열사 보유 온-오프라인 채널 간 연계 및 통합을 통한 다양한 서비스 개발,
															제공, 유지, 개선, 고도화 및 최적화</li>
														<li>3) 상품/서비스 이용실적 통계/분석, 시장조사, 인구통계학적 분석, 데이터 분석을
															기반으로 한 이용자 간 관계 형성, 고객 성향 분석 및 이를 통한 고객별 맞춤 상품/서비스 개발 및
															제공</li>
														<li>4) 고객만족서비스(CS)개선 및 고객과의 커뮤니케이션 능력 향상</li>
														<li>5) 상품/서비스 정보 제공 및 홍보, 경품/사은행사 등 이벤트 참여 기회 제공, 쿠폰,
															할인 및 우대 혜택 제공 등 마케팅 및 프로모션 목적</li>
														<li>6) 고객 정보 보호 강화를 위한 외부 침입, 해킹, 악용사례, 보안위험, 기술적 문제
															등 감지, 예방 및 대응책 수립</li>
														<li>7) 위 각 호의 목적을 위한 CJ계열사의 보유 데이터의 수집, 저장, 연계, 연동,
															결합, 조합, 분해, 분석, 가공, 편집, 추출, 가명화, 비식별화, 기타 다양한 방법의 처리 및 이를
															통한 새로운 데이터 생성, 인공지능 및 빅데이터 기술 개발</li>
													</ul>
													<p style="margin-top: 10px; font-weight: bold;">[제공 및
														활용기간]</p>
													<p>제공에 동의하신 정보는 동의를 철회하거나 서비스이용 종료 시 파기합니다. 다만, 관련 법령상
														특정 항목 보유기간이 제한된 경우에는 그에 따릅니다.</p>
													<p style="margin-top: 10px; font-weight: bold;">[동의거부]</p>
													<p>
														모든 동의는 옴니서비스 제공 및 고객 만족 향상을 위한 선택 동의 사항으로 회원은 개인정보의 제공에 대한
														동의를 거부할 수 있습니다.<br>거부하시는 경우 관련 이벤트 및 프로모션 등 참여가 제한될 수
														있으나 CJ ONE 멤버십 서비스 이용에는 영향을 미치지 않습니다.
													</p>
													<p style="margin-top: 10px;">본 서비스는 만14세 이상의 CJ ONE회원에
														한하여 이용이 가능합니다.</p>
													<p style="margin-top: 10px;">아래 제공에 동의하신 경우, 본인이 가입한 각
														서비스의 가입 시점부터 본 동의 시점까지의 정보도 제공항목에 포함됩니다.</p>
													<p style="margin-top: 10px;">CJ올리브네트웍스는 아래 각
														정보제공회사(CJ계열사)로부터 아래 개인정보 제공 관련 동의 수령/철회/관리업무를 위탁처리합니다.</p>
												</div>
												<!--// 안내문 -->







												<div class="item_box">
													<h4 class="h5_tit">CJ제일제당㈜의 개인정보 제공 동의 (선택)</h4>
													<div class="cont clause_box"
														style="padding: 20px; border: 1px solid #ddd;">
														<div id="polView">
															<p>본인은 아래 본인의 정보를 다음과 같이 제3자에게 제공함에 동의합니다.</p>
															<p>씨제이제일제당㈜, 씨제이대한통운㈜, 씨제이이엔엠㈜, 씨제이올리브영㈜,
																씨제이올리브네트웍스㈜, 씨제이씨지브이㈜, 씨제이푸드빌㈜, ㈜티빙(이하, 총칭하여 “CJ” 또는
																"CJ계열사")는 CJ가 보유한 다양한 온-오프라인 채널간 유기적 연계를 통해 다양한 고객 맞춤
																서비스를 제공하고 CJ 고객의 서비스 만족도를 보다 더 향상시키기 위하여 다음과 같이 CJ 계열사에게
																회원의 개인정보를 상호 제공(공유)ㆍ활용하고자 합니다. 동의하시는 경우 옴니서비스와 함께 CJ가
																제공하는 상품/서비스에 대하여 보다 더 만족스러운 경험을 느끼실 수 있습니다.</p>
															<!-- 20230112 수정 -->
															<table border="1" cellspacing="0" cellpadding="0"
																style="margin-top: 10px; width: 100%">
																<caption>CJ제일제당의 개인정보제공 동의로 제공자, 제공받는자, 제공 항목,
																	제공 목적, 제공 및 활용기간을 나타내는 표입니다.</caption>
																<colgroup>
																	<col style="width: 20%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">제공자</th>
																		<td style="font-size: 14px;">CJ제일제당㈜</td>
																	</tr>
																	<tr>
																		<th scope="row">제공받는자</th>
																		<td style="font-size: 17px; font-weight: bold">CJ대한통운㈜,
																			CJ이엔엠㈜, CJ올리브영㈜, CJ올리브네트웍스㈜, CJ씨지브이㈜, CJ푸드빌㈜, ㈜티빙</td>
																		<!-- 20230112 수정 -->
																	</tr>
																	<tr>
																		<th scope="row">제공 항목</th>
																		<td style="font-size: 14px;">인적정보[성명, 생년월일, 성별,
																			CI, CI연계값, DI], 기록정보[푸시토큰, 마케팅수신동의 정보], 서비스
																			이용내용[구매정보(상품정보, 결제금액, 구매일자), 배송주소, 프로모션/이벤트 이용정보] 및 위
																			정보와 CJ계열사 항목 정보를 결합, 분석, 추출하여 생성된 정보</td>
																		<!-- 20230112 수정 -->
																	</tr>
																	<tr>
																		<th scope="row">제공 목적</th>
																		<td style="font-size: 17px; font-weight: bold">
																			1) 각 CJ계열사의 고유 상품/서비스 제공, 유지, 개선, 고도화, 최적화 및 신규
																			상품/서비스 개발<br> 2) 각 CJ계열사 보유 온-오프라인 채널 간 연계 및 통합을
																			통한 다양한 서비스 개발, 제공, 유지, 개선, 고도화 및 최적화<br> 3)
																			상품/서비스 이용실적 통계/분석, 시장조사, 인구통계학적 분석, 데이터 분석을 기반으로 한
																			이용자 간 관계 형성, 고객 성향 분석 및 이를 통한 고객별 맞춤 상품/서비스 개발 및 제공<br>
																			4) 고객만족서비스(CS)개선 및 고객과의 커뮤니케이션 능력 향상<br> 5)
																			상품/서비스 정보 제공 및 홍보, 경품/사은행사 등 이벤트 참여 기회 제공, 쿠폰, 할인 및
																			우대 혜택 제공 등 마케팅 및 프로모션 목적<br> 6) 고객 정보 보호 강화를 위한
																			외부 침입, 해킹, 악용사례, 보안위험, 기술적 문제 등 감지, 예방 및 대응책 수립<br>
																			7) 위 각 호의 목적을 위한 CJ계열사의 보유 데이터의 수집, 저장, 연계, 연동, 결합,
																			조합, 분해, 분석, 가공, 편집, 추출, 가명화, 비식별화, 기타 다양한 방법의 처리 및 이를
																			통한 새로운 데이터 생성, 인공지능 및 빅데이터 기술 개발
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">제공 및 활용기간</th>
																		<td style="font-size: 17px; font-weight: bold">제공에
																			동의하신 정보는 동의를 철회하거나 서비스이용 종료 시 파기합니다. 다만, 관련 법령상 특정 항목
																			보유기간이 제한된 경우에는 그에 따릅니다.</td>
																	</tr>
																	<tr>
																		<th scope="row">동의거부</th>
																		<td style="font-size: 14px;">모든 동의는 옴니서비스 제공 및 고객
																			만족 향상을 위한 선택 동의 사항으로 회원은 개인정보의 제공에 대한 동의를 거부할 수 있습니다.<br>거부하시는
																			경우 옴니서비스 등 목적에 명시된 일부 서비스 이용이 제한될 수 있으나 그 외 서비스에 대한
																			회원가입 등 기타 서비스 이용은 가능합니다.
																		</td>
																	</tr>
																</tbody>
															</table>
															<p style="margin-top: 10px;">
																본 서비스는 만14세 이상의 CJ ONE회원에 한하여 이용이 가능합니다.<br> <span
																	style="font-weight: bold; font-size: 17px">본 정보
																	제공에 동의하신 경우, 본인이 가입한 각 서비스의 가입 시점부터 본 동의 시점까지의 정보도
																	제공항목에 포함됩니다.</span><br> CJ올리브네트웍스는 정보제공회사(CJ계열사)로부터 본
																개인정보 제공 관련 동의 수령/철회/관리업무를 위탁처리합니다.
															</p>
														</div>
													</div>
													<ul class="bul_list">
														<li class="dot_arr">모든 동의는 옴니서비스 제공 및 고객 만족 향상을 위한 선택
															동의 사항으로 회원은 개인정보의 제공에 대한 동의를 거부할 수 있으며, 거부하시는 경우 관련 이벤트 및
															프로모션 등 참여가 제한될 수 있으나 CJ ONE 멤버십 서비스 이용에는 영향을 미치지 않습니다.</li>
													</ul>
													<div class="radio_agreement">
														<span class="radio_btn on" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">미동의<span>선택됨</span></span>
														</a><span class="hide"><span class="haze">미동의<span>선택불가</span></span></span>
															<input type="radio" class="chk" id="omniagreeN1070606040"
															name="omniagree1070606040" checked="checked" value="">
															<label for="omniagreeN1070606040"><span
																class="ico"></span>미동의</label>
														</span> <span class="radio_btn case" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">동의<span>미선택됨</span></span>
														</a><span class="hide"><span class="haze">동의<span>선택불가</span></span></span>
															<input type="radio" class="chk" id="omniagreeY1070606040"
															name="omniagree1070606040" value="10|7060|6040">
															<label for="omniagreeY1070606040"><span
																class="ico"></span>동의</label>
														</span>
													</div>
												</div>







												<div class="item_box">
													<h4 class="h5_tit">CJ대한통운㈜의 개인정보 제공 동의 (선택)</h4>
													<div class="cont clause_box"
														style="padding: 20px; border: 1px solid #ddd;">
														<div id="polView">
															<p>본인은 아래 본인의 정보를 다음과 같이 제3자에게 제공함에 동의합니다.</p>
															<p>씨제이제일제당㈜, 씨제이대한통운㈜, 씨제이이엔엠㈜, 씨제이올리브영㈜,
																씨제이올리브네트웍스㈜, 씨제이씨지브이㈜, 씨제이푸드빌㈜, ㈜티빙(이하, 총칭하여 “CJ” 또는
																"CJ계열사")는 CJ가 보유한 다양한 온-오프라인 채널간 유기적 연계를 통해 다양한 고객 맞춤
																서비스를 제공하고 CJ 고객의 서비스 만족도를 보다 더 향상시키기 위하여 다음과 같이 CJ 계열사에게
																회원의 개인정보를 상호 제공(공유)ㆍ활용하고자 합니다. 동의하시는 경우 옴니서비스와 함께 CJ가
																제공하는 상품/서비스에 대하여 보다 더 만족스러운 경험을 느끼실 수 있습니다.</p>
															<!-- 20230112 수정 -->
															<table border="1" cellspacing="0" cellpadding="0"
																style="margin-top: 10px; width: 100%">
																<caption>CJ대한통운㈜의 개인정보제공 동의로 제공자, 제공받는자, 제공
																	항목, 제공 목적, 제공 및 활용기간을 나타내는 표입니다.</caption>
																<colgroup>
																	<col style="width: 20%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">제공자</th>
																		<td style="font-size: 14px;">CJ대한통운㈜</td>
																	</tr>
																	<tr>
																		<th scope="row">제공받는자</th>
																		<td style="font-size: 17px; font-weight: bold">CJ제일제당㈜,
																			CJ이엔엠㈜, CJ올리브영㈜, CJ올리브네트웍스㈜, CJ씨지브이㈜, CJ푸드빌㈜, ㈜티빙</td>
																		<!-- 20230112 수정 -->
																	</tr>
																	<tr>
																		<th scope="row">제공 항목</th>
																		<td style="font-size: 14px;">발송고객번호, 송하인 정보(귀하가
																			송하인인 경우; 송하인명, 송하인휴대폰번호), 수하인 정보(귀하가 수하인인 경우; 수하인주소,
																			수하인명, 수하인휴대폰번호), 운송장번호, 집하일자, 배송일자, 품목명</td>
																	</tr>
																	<tr>
																		<th scope="row">제공 목적</th>
																		<td style="font-size: 17px; font-weight: bold">
																			1) 각 CJ계열사의 고유 상품/서비스 제공, 유지, 개선, 고도화, 최적화 및 신규
																			상품/서비스 개발<br> 2) 각 CJ계열사 보유 온-오프라인 채널 간 연계 및 통합을
																			통한 다양한 서비스 개발, 제공, 유지, 개선, 고도화 및 최적화 <br> 3)
																			상품/서비스 이용실적 통계/분석, 시장조사, 인구통계학적 분석, 데이터 분석을 기반으로 한
																			이용자 간 관계 형성, 고객 성향 분석 및 이를 통한 고객별 맞춤 상품/서비스 개발 및 제공<br>
																			4) 고객만족서비스(CS)개선 및 고객과의 커뮤니케이션 능력 향상<br> 5)
																			상품/서비스 정보 제공 및 홍보, 경품/사은행사 등 이벤트 참여 기회 제공, 쿠폰, 할인 및
																			우대 혜택 제공 등 마케팅 및 프로모션 목적<br> 6) 고객 정보 보호 강화를 위한
																			외부 침입, 해킹, 악용사례, 보안위험, 기술적 문제 등 감지, 예방 및 대응책 수립<br>
																			7) 위 각 호의 목적을 위한 CJ계열사의 보유 데이터의 수집, 저장, 연계, 연동, 결합,
																			조합, 분해, 분석, 가공, 편집, 추출, 가명화, 비식별화, 기타 다양한 방법의 처리 및 이를
																			통한 새로운 데이터 생성, 인공지능 및 빅데이터 기술 개발
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">제공 및 활용기간</th>
																		<td style="font-size: 17px; font-weight: bold">제공에
																			동의하신 정보는 동의를 철회하거나 서비스이용 종료 시 파기합니다. 다만, 관련 법령상 특정 항목
																			보유기간이 제한된 경우에는 그에 따릅니다.</td>
																	</tr>
																	<tr>
																		<th scope="row">동의거부</th>
																		<td style="font-size: 14px;">모든 동의는 옴니서비스 제공 및 고객
																			만족 향상을 위한 선택 동의 사항으로 회원은 개인정보의 제공에 대한 동의를 거부할 수 있습니다.<br>거부하시는
																			경우 옴니서비스 등 목적에 명시된 일부 서비스 이용이 제한될 수 있으나 그 외 서비스에 대한
																			회원가입 등 기타 서비스 이용은 가능합니다.
																		</td>
																	</tr>
																</tbody>
															</table>
															<p style="margin-top: 10px;">
																본 서비스는 만14세 이상의 CJ ONE회원에 한하여 이용이 가능합니다.<br> <span
																	style="font-weight: bold; font-size: 17px">본 정보
																	제공에 동의하신 경우, 본인이 가입한 각 서비스의 가입 시점부터 본 동의 시점까지의 정보도
																	제공항목에 포함됩니다.</span><br> CJ올리브네트웍스는 정보제공회사(CJ계열사)로부터 본
																개인정보 제공 관련 동의 수령/철회/관리업무를 위탁처리합니다.
															</p>
														</div>
													</div>
													<ul class="bul_list">
														<li class="dot_arr">모든 동의는 옴니서비스 제공 및 고객 만족 향상을 위한 선택
															동의 사항으로 회원은 개인정보의 제공에 대한 동의를 거부할 수 있으며, 거부하시는 경우 관련 이벤트 및
															프로모션 등 참여가 제한될 수 있으나 CJ ONE 멤버십 서비스 이용에는 영향을 미치지 않습니다.</li>
													</ul>
													<div class="radio_agreement">
														<span class="radio_btn on" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">미동의<span>선택됨</span></span>
														</a><span class="hide"><span class="haze">미동의<span>선택불가</span></span></span>
															<input type="radio" class="chk" id="omniagreeN1071301301"
															name="omniagree1071301301" checked="checked" value="">
															<label for="omniagreeN1071301301"><span
																class="ico"></span>미동의</label>
														</span> <span class="radio_btn case" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">동의<span>미선택됨</span></span>
														</a><span class="hide"><span class="haze">동의<span>선택불가</span></span></span>
															<input type="radio" class="chk" id="omniagreeY1071301301"
															name="omniagree1071301301" value="10|7130|1301">
															<label for="omniagreeY1071301301"><span
																class="ico"></span>동의</label>
														</span>
													</div>
												</div>







												<div class="item_box">
													<h4 class="h5_tit">CJ이엔엠㈜의 개인정보 제공 동의 (선택)</h4>
													<div class="cont clause_box"
														style="padding: 20px; border: 1px solid #ddd;">
														<div id="polView">
															<p>본인은 아래 본인의 정보를 다음과 같이 제3자에게 제공함에 동의합니다.</p>
															<p>씨제이제일제당㈜, 씨제이대한통운㈜, 씨제이이엔엠㈜, 씨제이올리브영㈜,
																씨제이올리브네트웍스㈜, 씨제이씨지브이㈜, 씨제이푸드빌㈜, ㈜티빙(이하, 총칭하여 “CJ” 또는
																"CJ계열사")는 CJ가 보유한 다양한 온-오프라인 채널간 유기적 연계를 통해 다양한 고객 맞춤
																서비스를 제공하고 CJ 고객의 서비스 만족도를 보다 더 향상시키기 위하여 다음과 같이 CJ 계열사에게
																회원의 개인정보를 상호 제공(공유)ㆍ활용하고자 합니다. 동의하시는 경우 옴니서비스와 함께 CJ가
																제공하는 상품/서비스에 대하여 보다 더 만족스러운 경험을 느끼실 수 있습니다.</p>
															<!-- 20230112 수정 -->
															<table border="1" cellspacing="0" cellpadding="0"
																style="margin-top: 10px; width: 100%">
																<caption>CJ이엔엠㈜의 개인정보제공 동의로 제공자, 제공받는자, 제공 항목,
																	제공 목적, 제공 및 활용기간을 나타내는 표입니다.</caption>
																<colgroup>
																	<col style="width: 20%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">제공자</th>
																		<td style="font-size: 14px;">CJ이엔엠㈜</td>
																	</tr>
																	<tr>
																		<th scope="row">제공받는자</th>
																		<td style="font-size: 17px; font-weight: bold">CJ제일제당㈜,
																			CJ대한통운㈜, CJ올리브영㈜, CJ올리브네트웍스㈜, CJ씨지브이㈜, CJ푸드빌㈜, ㈜티빙</td>
																		<!-- 20230112 수정 -->
																	</tr>
																	<tr>
																		<th scope="row">제공 항목</th>
																		<td style="font-size: 14px;">인적정보[성명, 생년월일, 성별,
																			연계정보(CI, CI연계값, DI), 주소, 이동전화번호, 이메일 , 아이디],
																			단말정보(모델명, 기기번호, OS 등), 기록정보[접속로그(IP 포함), 쿠키,
																			서비스이용기록(로그인, 동의 여부, 조회 이력 등)], 서비스 이용 내용[구매내역(상품명,
																			금액, 방송편성정보 등), 결제정보(수단, 내역, 사용처 등), 배송정보, 상담정보, 광고
																			전송·반응 정보, 프로모션/이벤트 이용 정보, 이용자 입력 정보] 및 위 정보와 CJ계열사 항목
																			정보를 결합, 분석, 추출하여 생성된 정보</td>
																	</tr>
																	<tr>
																		<th scope="row">제공 목적</th>
																		<td style="font-size: 17px; font-weight: bold">
																			1) 각 CJ계열사의 고유 상품/서비스 제공, 유지, 개선, 고도화, 최적화 및 신규
																			상품/서비스 개발<br> 2) 각 CJ계열사 보유 온-오프라인 채널 간 연계 및 통합을
																			통한 다양한 서비스 개발, 제공, 유지, 개선, 고도화 및 최적화<br> 3)
																			상품/서비스 이용실적 통계/분석, 시장조사, 인구통계학적 분석, 데이터 분석을 기반으로 한
																			이용자 간 관계 형성, 고객 성향 분석 및 이를 통한 고객별 맞춤 상품/서비스 개발 및 제공<br>
																			4) 고객만족서비스(CS)개선 및 고객과의 커뮤니케이션 능력 향상<br> 5)
																			상품/서비스 정보 제공 및 홍보, 경품/사은행사 등 이벤트 참여 기회 제공, 쿠폰, 할인 및
																			우대 혜택 제공 등 마케팅 및 프로모션 목적<br> 6) 고객 정보 보호 강화를 위한
																			외부 침입, 해킹, 악용사례, 보안위험, 기술적 문제 등 감지, 예방 및 대응책 수립 <br>
																			7) 위 각 호의 목적을 위한 CJ계열사의 보유 데이터의 수집, 저장, 연계, 연동, 결합,
																			조합, 분해, 분석, 가공, 편집, 추출, 가명화, 비식별화, 기타 다양한 방법의 처리 및 이를
																			통한 새로운 데이터 생성, 인공지능 및 빅데이터 기술 개발
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">제공 및 활용기간</th>
																		<td style="font-size: 17px; font-weight: bold">제공에
																			동의하신 정보는 동의를 철회하거나 서비스이용 종료 시 파기합니다. 다만, 관련 법령상 특정 항목
																			보유기간이 제한된 경우에는 그에 따릅니다.</td>
																	</tr>
																	<tr>
																		<th scope="row">동의거부</th>
																		<td style="font-size: 14px;">모든 동의는 옴니서비스 제공 및 고객
																			만족 향상을 위한 선택 동의 사항으로 회원은 개인정보의 제공에 대한 동의를 거부할 수 있습니다.<br>거부하시는
																			경우 옴니서비스 등 목적에 명시된 일부 서비스 이용이 제한될 수 있으나 그 외 서비스에 대한
																			회원가입 등 기타 서비스 이용은 가능합니다.
																		</td>
																	</tr>
																</tbody>
															</table>
															<p style="margin-top: 10px;">
																본 서비스는 만14세 이상의 CJ ONE회원에 한하여 이용이 가능합니다.<br> <span
																	style="font-weight: bold; font-size: 17px">본 정보
																	제공에 동의하신 경우, 본인이 가입한 각 서비스의 가입 시점부터 본 동의 시점까지의 정보도
																	제공항목에 포함됩니다.</span><br> CJ올리브네트웍스는 정보제공회사(CJ계열사)로부터 본
																개인정보 제공 관련 동의 수령/철회/관리업무를 위탁처리합니다.
															</p>
														</div>
													</div>
													<ul class="bul_list">
														<li class="dot_arr">모든 동의는 옴니서비스 제공 및 고객 만족 향상을 위한 선택
															동의 사항으로 회원은 개인정보의 제공에 대한 동의를 거부할 수 있으며, 거부하시는 경우 관련 이벤트 및
															프로모션 등 참여가 제한될 수 있으나 CJ ONE 멤버십 서비스 이용에는 영향을 미치지 않습니다.</li>
													</ul>
													<div class="radio_agreement">
														<span class="radio_btn on" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">미동의<span>선택됨</span></span>
														</a><span class="hide"><span class="haze">미동의<span>선택불가</span></span></span>
															<input type="radio" class="chk" id="omniagreeN1070404070"
															name="omniagree1070404070" checked="checked" value="">
															<label for="omniagreeN1070404070"><span
																class="ico"></span>미동의</label>
														</span> <span class="radio_btn case" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">동의<span>미선택됨</span></span>
														</a><span class="hide"><span class="haze">동의<span>선택불가</span></span></span>
															<input type="radio" class="chk" id="omniagreeY1070404070"
															name="omniagree1070404070" value="10|7040|4070">
															<label for="omniagreeY1070404070"><span
																class="ico"></span>동의</label>
														</span>
													</div>
												</div>







												<div class="item_box">
													<h4 class="h5_tit">CJ올리브영㈜의 개인정보 제공 동의 (선택)</h4>
													<div class="cont clause_box"
														style="padding: 20px; border: 1px solid #ddd;">
														<div id="polView">
															<p>본인은 아래 본인의 정보를 다음과 같이 제3자에게 제공함에 동의합니다.</p>
															<p>씨제이제일제당㈜, 씨제이대한통운㈜, 씨제이이엔엠㈜, 씨제이올리브영㈜,
																씨제이올리브네트웍스㈜, 씨제이씨지브이㈜, 씨제이푸드빌㈜, ㈜티빙(이하, 총칭하여 “CJ” 또는
																"CJ계열사")는 CJ가 보유한 다양한 온-오프라인 채널간 유기적 연계를 통해 다양한 고객 맞춤
																서비스를 제공하고 CJ 고객의 서비스 만족도를 보다 더 향상시키기 위하여 다음과 같이 CJ 계열사에게
																회원의 개인정보를 상호 제공(공유)ㆍ활용하고자 합니다. 동의하시는 경우 옴니서비스와 함께 CJ가
																제공하는 상품/서비스에 대하여 보다 더 만족스러운 경험을 느끼실 수 있습니다.</p>
															<!-- 20230112 수정 -->
															<table border="1" cellspacing="0" cellpadding="0"
																style="margin-top: 10px; width: 100%">
																<caption>CJ올리브영㈜의 개인정보제공 동의로 제공자, 제공받는자, 제공
																	항목, 제공 목적, 제공 및 활용기간을 나타내는 표입니다.</caption>
																<colgroup>
																	<col style="width: 20%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">제공자</th>
																		<td style="font-size: 14px;">CJ올리브영㈜</td>
																	</tr>
																	<tr>
																		<th scope="row">제공받는자</th>
																		<td style="font-size: 17px; font-weight: bold">CJ제일제당㈜,
																			CJ대한통운㈜, CJ이엔엠㈜, CJ올리브네트웍스㈜, CJ씨지브이㈜, CJ푸드빌㈜, ㈜티빙</td>
																		<!-- 20230112 수정 -->
																	</tr>
																	<tr>
																		<th scope="row">제공 항목</th>
																		<td style="font-size: 14px;">인적정보[이름 , 생년월일, 성별,
																			연계정보(CI연계값), 휴대전화번호, 이메일, 아이디, 회원등급, 가입일시, 마케팅수신동의],
																			서비스 이용 내용[상품 또는 서비스 구매내역(상품카테고리, 상품ID, 상품명, 구매수량,
																			구매금액, 구매일자, 매장정보), 상품구매내역(기준년월, 기준일자, 상품코드/명, 매장코드/명,
																			브랜드코드/명, 상품대/중/소분류, 매출수량, 매출금액, 구매취소일시), 결제정보(기준일자,
																			매장코드, 결제수단, 결제구분, 결제시간대, 상품수량, 결제금액, 제휴카드할인금액,
																			포인트부여금액) 및 위 정보와 CJ계열사 항목 정보를 결합, 분석, 추출하여 생성된 정보</td>
																		<!-- 20230112 수정 -->
																	</tr>
																	<tr>
																		<th scope="row">제공 목적</th>
																		<td style="font-size: 17px; font-weight: bold">
																			1) 각 CJ계열사의 고유 상품/서비스 제공, 유지, 개선, 고도화, 최적화 및 신규
																			상품/서비스 개발<br> 2) 각 CJ계열사 보유 온-오프라인 채널 간 연계 및 통합을
																			통한 다양한 서비스 개발, 제공, 유지, 개선, 고도화 및 최적화<br> 3)
																			상품/서비스 이용실적 통계/분석, 시장조사, 인구통계학적 분석, 데이터 분석을 기반으로 한
																			이용자 간 관계 형성, 고객 성향 분석 및 이를 통한 고객별 맞춤 상품/서비스 개발 및 제공<br>
																			4) 고객만족서비스(CS)개선 및 고객과의 커뮤니케이션 능력 향상<br> 5)
																			상품/서비스 정보 제공 및 홍보, 경품/사은행사 등 이벤트 참여 기회 제공, 쿠폰, 할인 및
																			우대 혜택 제공 등 마케팅 및 프로모션 목적<br> 6) 고객 정보 보호 강화를 위한
																			외부 침입, 해킹, 악용사례, 보안위험, 기술적 문제 등 감지, 예방 및 대응책 수립<br>
																			7) 위 각 호의 목적을 위한 CJ계열사의 보유 데이터의 수집, 저장, 연계, 연동, 결합,
																			조합, 분해, 분석, 가공, 편집, 추출, 가명화, 비식별화, 기타 다양한 방법의 처리 및 이를
																			통한 새로운 데이터 생성, 인공지능 및 빅데이터 기술 개발
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">제공 및 활용기간</th>
																		<td style="font-size: 17px; font-weight: bold">제공에
																			동의하신 정보는 동의를 철회하거나 서비스이용 종료 시 파기합니다. 다만, 관련 법령상 특정 항목
																			보유기간이 제한된 경우에는 그에 따릅니다.</td>
																	</tr>
																	<tr>
																		<th scope="row">동의거부</th>
																		<td style="font-size: 14px;">모든 동의는 옴니서비스 제공 및 고객
																			만족 향상을 위한 선택 동의 사항으로 회원은 개인정보의 제공에 대한 동의를 거부할 수 있습니다.<br>거부하시는
																			경우 옴니서비스 등 목적에 명시된 일부 서비스 이용이 제한될 수 있으나 그 외 서비스에 대한
																			회원가입 등 기타 서비스 이용은 가능합니다.
																		</td>
																	</tr>
																</tbody>
															</table>
															<p style="margin-top: 10px;">
																본 서비스는 만14세 이상의 CJ ONE회원에 한하여 이용이 가능합니다.<br> <span
																	style="font-weight: bold; font-size: 17px">본 정보
																	제공에 동의하신 경우, 본인이 가입한 각 서비스의 가입 시점부터 본 동의 시점까지의 정보도
																	제공항목에 포함됩니다.</span><br> CJ올리브네트웍스는 정보제공회사(CJ계열사)로부터 본
																개인정보 제공 관련 동의 수령/철회/관리업무를 위탁처리합니다.
															</p>
														</div>
													</div>
													<ul class="bul_list">
														<li class="dot_arr">모든 동의는 옴니서비스 제공 및 고객 만족 향상을 위한 선택
															동의 사항으로 회원은 개인정보의 제공에 대한 동의를 거부할 수 있으며, 거부하시는 경우 관련 이벤트 및
															프로모션 등 참여가 제한될 수 있으나 CJ ONE 멤버십 서비스 이용에는 영향을 미치지 않습니다.</li>
													</ul>
													<div class="radio_agreement">
														<span class="radio_btn on" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">미동의<span>선택됨</span></span>
														</a><span class="hide"><span class="haze">미동의<span>선택불가</span></span></span>
															<input type="radio" class="chk" id="omniagreeN1070303000"
															name="omniagree1070303000" checked="checked" value="">
															<label for="omniagreeN1070303000"><span
																class="ico"></span>미동의</label>
														</span> <span class="radio_btn case" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">동의<span>미선택됨</span></span>
														</a><span class="hide"><span class="haze">동의<span>선택불가</span></span></span>
															<input type="radio" class="chk" id="omniagreeY1070303000"
															name="omniagree1070303000" value="10|7030|3000">
															<label for="omniagreeY1070303000"><span
																class="ico"></span>동의</label>
														</span>
													</div>
												</div>







												<div class="item_box">
													<h4 class="h5_tit">CJ올리브네트웍스㈜의 개인정보 제공 동의 (선택)</h4>
													<div class="cont clause_box"
														style="padding: 20px; border: 1px solid #ddd;">
														<div id="polView">
															<p>본인은 아래 본인의 정보를 다음과 같이 제3자에게 제공함에 동의합니다.</p>
															<p>씨제이제일제당㈜, 씨제이대한통운㈜, 씨제이이엔엠㈜, 씨제이올리브영㈜,
																씨제이올리브네트웍스㈜, 씨제이씨지브이㈜, 씨제이푸드빌㈜, ㈜티빙(이하, 총칭하여 “CJ” 또는
																"CJ계열사")는 CJ가 보유한 다양한 온-오프라인 채널간 유기적 연계를 통해 다양한 고객 맞춤
																서비스를 제공하고 CJ 고객의 서비스 만족도를 보다 더 향상시키기 위하여 다음과 같이 CJ 계열사에게
																회원의 개인정보를 상호 제공(공유)ㆍ활용하고자 합니다. 동의하시는 경우 옴니서비스와 함께 CJ가
																제공하는 상품/서비스에 대하여 보다 더 만족스러운 경험을 느끼실 수 있습니다.</p>
															<!-- 20230112 수정 -->
															<table border="1" cellspacing="0" cellpadding="0"
																style="margin-top: 10px; width: 100%">
																<caption>CJ올리브네트웍스㈜의 개인정보제공 동의로 제공자, 제공받는자, 제공
																	항목, 제공 목적, 제공 및 활용기간을 나타내는 표입니다.</caption>
																<colgroup>
																	<col style="width: 20%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">제공자</th>
																		<td style="font-size: 14px;">CJ올리브네트웍스㈜</td>
																	</tr>
																	<tr>
																		<th scope="row">제공받는자</th>
																		<td style="font-size: 17px; font-weight: bold">CJ제일제당㈜,
																			CJ대한통운㈜, CJ이엔엠㈜, CJ올리브영㈜, CJ씨지브이㈜, CJ푸드빌㈜, ㈜티빙</td>
																		<!-- 20230112 수정 -->
																	</tr>
																	<tr>
																		<th scope="row">제공 항목</th>
																		<td style="font-size: 14px;">인적정보[성명, 생년월일, 성별,
																			CI, 전화번호, 이메일주소, 아이디, CJONE회원 카드번호], 가입정보[가입일시, 가입채널,
																			마케팅수신동의], 서비스이용내용[포인트 적립/이용기록, 이벤트 정보(이벤트 응모 및 당첨내역),
																			광고전송/반응정보, 매장방문정보 등] 및 위 정보와 CJ계열사 항목 정보를 결합, 분석,
																			추출하여 생성된 정보</td>
																	</tr>
																	<tr>
																		<th scope="row">제공 목적</th>
																		<td style="font-size: 17px; font-weight: bold">
																			1) 각 CJ계열사의 고유 상품/서비스 제공, 유지, 개선, 고도화, 최적화 및 신규
																			상품/서비스 개발<br> 2) 각 CJ계열사 보유 온-오프라인 채널 간 연계 및 통합을
																			통한 다양한 서비스 개발, 제공, 유지, 개선, 고도화 및 최적화<br> 3)
																			상품/서비스 이용실적 통계/분석, 시장조사, 인구통계학적 분석, 데이터 분석을 기반으로 한
																			이용자 간 관계 형성, 고객 성향 분석 및 이를 통한 고객별 맞춤 상품/서비스 개발 및 제공<br>
																			4) 고객만족서비스(CS)개선 및 고객과의 커뮤니케이션 능력 향상<br> 5)
																			상품/서비스 정보 제공 및 홍보, 경품/사은행사 등 이벤트 참여 기회 제공, 쿠폰, 할인 및
																			우대 혜택 제공 등 마케팅 및 프로모션 목적<br> 6) 고객 정보 보호 강화를 위한
																			외부 침입, 해킹, 악용사례, 보안위험, 기술적 문제 등 감지, 예방 및 대응책 수립<br>
																			7) 위 각 호의 목적을 위한 CJ계열사의 보유 데이터의 수집, 저장, 연계, 연동, 결합,
																			조합, 분해, 분석, 가공, 편집, 추출, 가명화, 비식별화, 기타 다양한 방법의 처리 및 이를
																			통한 새로운 데이터 생성, 인공지능 및 빅데이터 기술 개발
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">제공 및 활용기간</th>
																		<td style="font-size: 17px; font-weight: bold">제공에
																			동의하신 정보는 동의를 철회하거나 서비스이용 종료 시 파기합니다. 다만, 관련 법령상 특정 항목
																			보유기간이 제한된 경우에는 그에 따릅니다.</td>
																	</tr>
																	<tr>
																		<th scope="row">동의거부</th>
																		<td style="font-size: 14px;">모든 동의는 옴니서비스 제공 및 고객
																			만족 향상을 위한 선택 동의 사항으로 회원은 개인정보의 제공에 대한 동의를 거부할 수 있습니다.<br>거부하시는
																			경우 옴니서비스 등 목적에 명시된 일부 서비스 이용이 제한될 수 있으나 그 외 서비스에 대한
																			회원가입 등 기타 서비스 이용은 가능합니다.
																		</td>
																	</tr>
																</tbody>
															</table>
															<p style="margin-top: 10px;">
																본 서비스는 만14세 이상의 CJ ONE회원에 한하여 이용이 가능합니다.<br> <span
																	style="font-weight: bold; font-size: 17px">본 정보
																	제공에 동의하신 경우, 본인이 가입한 각 서비스의 가입 시점부터 본 동의 시점까지의 정보도
																	제공항목에 포함됩니다.</span><br> CJ올리브네트웍스는 정보제공회사(CJ계열사)로부터 본
																개인정보 제공 관련 동의 수령/철회/관리업무를 위탁처리합니다.
															</p>
														</div>
													</div>
													<ul class="bul_list">
														<li class="dot_arr">모든 동의는 옴니서비스 제공 및 고객 만족 향상을 위한 선택
															동의 사항으로 회원은 개인정보의 제공에 대한 동의를 거부할 수 있으며, 거부하시는 경우 관련 이벤트 및
															프로모션 등 참여가 제한될 수 있으나 CJ ONE 멤버십 서비스 이용에는 영향을 미치지 않습니다.</li>
													</ul>
													<div class="radio_agreement">
														<span class="radio_btn on" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">미동의<span>선택됨</span></span>
														</a><span class="hide"><span class="haze">미동의<span>선택불가</span></span></span>
															<input type="radio" class="chk" id="omniagreeN1072402401"
															name="omniagree1072402401" checked="checked" value="">
															<label for="omniagreeN1072402401"><span
																class="ico"></span>미동의</label>
														</span> <span class="radio_btn case" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">동의<span>미선택됨</span></span>
														</a><span class="hide"><span class="haze">동의<span>선택불가</span></span></span>
															<input type="radio" class="chk" id="omniagreeY1072402401"
															name="omniagree1072402401" value="10|7240|2401">
															<label for="omniagreeY1072402401"><span
																class="ico"></span>동의</label>
														</span>
													</div>
												</div>







												<div class="item_box">
													<h4 class="h5_tit">CJ씨지브이㈜의 개인정보 제공 동의 (선택)</h4>
													<div class="cont clause_box"
														style="padding: 20px; border: 1px solid #ddd;">
														<div id="polView">
															<p>본인은 아래 본인의 정보를 다음과 같이 제3자에게 제공함에 동의합니다.</p>
															<p>씨제이제일제당㈜, 씨제이대한통운㈜, 씨제이이엔엠㈜, 씨제이올리브영㈜,
																씨제이올리브네트웍스㈜, 씨제이씨지브이㈜, 씨제이푸드빌㈜, ㈜티빙(이하, 총칭하여 “CJ” 또는
																"CJ계열사")는 CJ가 보유한 다양한 온-오프라인 채널간 유기적 연계를 통해 다양한 고객 맞춤
																서비스를 제공하고 CJ 고객의 서비스 만족도를 보다 더 향상시키기 위하여 다음과 같이 CJ 계열사에게
																회원의 개인정보를 상호 제공(공유)ㆍ활용하고자 합니다. 동의하시는 경우 옴니서비스와 함께 CJ가
																제공하는 상품/서비스에 대하여 보다 더 만족스러운 경험을 느끼실 수 있습니다.</p>
															<!-- 20230112 수정 -->
															<table border="1" cellspacing="0" cellpadding="0"
																style="margin-top: 10px; width: 100%">
																<caption>CJ씨지브이㈜의 개인정보제공 동의로 제공자, 제공받는자, 제공
																	항목, 제공 목적, 제공 및 활용기간을 나타내는 표입니다.</caption>
																<colgroup>
																	<col style="width: 20%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">제공자</th>
																		<td style="font-size: 14px;">CJ씨지브이㈜</td>
																	</tr>
																	<tr>
																		<th scope="row">제공받는자</th>
																		<td style="font-size: 17px; font-weight: bold;">CJ제일제당㈜,
																			CJ대한통운㈜, CJ이엔엠㈜, CJ올리브영㈜, CJ올리브네트웍스㈜, CJ푸드빌㈜, ㈜티빙</td>
																		<!-- 20230629 개인정보보호법 반영 수정, 20230112 수정 -->
																	</tr>
																	<tr>
																		<th scope="row">제공 항목</th>
																		<td style="font-size: 14px;">인적정보[성명, 생년월일, 성별,
																			연계정보(CI), 주소, 이동전화번호, 이메일, 아이디], 기록정보[접속로그(IP 포함),
																			쿠키, 서비스이용기록(로그인, 동의 여부, 조회 이력 등)], 서비스 이용
																			내용[구매내역(상품명, 금액 등), 결제정보(수단, 내역, 사용처 등), 상담정보,
																			프로모션/이벤트 이용 정보, 이용자 입력 정보] 및 위 정보와 CJ계열사 항목 정보를 결합,
																			분석, 추출하여 생성된 정보</td>
																	</tr>
																	<tr>
																		<th scope="row">제공 목적</th>
																		<td style="font-size: 17px; font-weight: bold;">
																			1) 각 CJ계열사의 고유 상품/서비스 제공, 유지, 개선, 고도화, 최적화 및 신규
																			상품/서비스 개발<br> 2) 각 CJ계열사 보유 온-오프라인 채널 간 연계 및 통합을
																			통한 다양한 서비스 개발, 제공, 유지, 개선, 고도화 및 최적화<br> 3)
																			상품/서비스 이용실적 통계/분석, 시장조사, 인구통계학적 분석, 데이터 분석을 기반으로 한
																			이용자 간 관계 형성, 고객 성향 분석 및 이를 통한 고객별 맞춤 상품/서비스 개발 및 제공<br>
																			4) 고객만족서비스(CS)개선 및 고객과의 커뮤니케이션 능력 향상<br> 5)
																			상품/서비스 정보 제공 및 홍보, 경품/사은행사 등 이벤트 참여 기회 제공, 쿠폰, 할인 및
																			우대 혜택 제공 등 마케팅 및 프로모션 목적<br> 6) 고객 정보 보호 강화를 위한
																			외부 침입, 해킹, 악용사례, 보안위험, 기술적 문제 등 감지, 예방 및 대응책 수립<br>
																			7) 위 각 호의 목적을 위한 CJ계열사의 보유 데이터의 수집, 저장, 연계, 연동, 결합,
																			조합, 분해, 분석, 가공, 편집, 추출, 가명화, 비식별화, 기타 다양한 방법의 처리 및 이를
																			통한 새로운 데이터 생성, 인공지능 및 빅데이터 기술 개발
																		</td>
																		<!-- 20230629 개인정보보호법 반영 수정 -->
																	</tr>
																	<tr>
																		<th scope="row">제공 및 활용기간</th>
																		<td style="font-size: 17px; font-weight: bold;">제공에
																			동의하신 정보는 동의를 철회하거나 서비스이용 종료 시 파기합니다. 다만, 관련 법령상 특정 항목
																			보유기간이 제한된 경우에는 그에 따릅니다.</td>
																		<!-- 20230629 개인정보보호법 반영 수정 -->
																	</tr>
																	<tr>
																		<th scope="row">동의거부</th>
																		<td style="font-size: 14px;">모든 동의는 옴니서비스 제공 및 고객
																			만족 향상을 위한 선택 동의 사항으로 회원은 개인정보의 제공에 대한 동의를 거부할 수 있습니다.<br>거부하시는
																			경우 옴니서비스 등 목적에 명시된 일부 서비스 이용이 제한될 수 있으나 그 외 서비스에 대한
																			회원가입 등 기타 서비스 이용은 가능합니다.
																		</td>
																	</tr>
																</tbody>
															</table>
															<p style="margin-top: 10px;">
																본 서비스는 만14세 이상의 CJ ONE회원에 한하여 이용이 가능합니다.<br> <span
																	style="font-weight: bold; font-size: 17px">본 정보
																	제공에 동의하신 경우, 본인이 가입한 각 서비스의 가입 시점부터 본 동의 시점까지의 정보도
																	제공항목에 포함됩니다.</span><br> CJ올리브네트웍스는 정보제공회사(CJ계열사)로부터 본
																개인정보 제공 관련 동의 수령/철회/관리업무를 위탁처리합니다.
															</p>
														</div>
													</div>
													<ul class="bul_list">
														<li class="dot_arr">모든 동의는 옴니서비스 제공 및 고객 만족 향상을 위한 선택
															동의 사항으로 회원은 개인정보의 제공에 대한 동의를 거부할 수 있으며, 거부하시는 경우 관련 이벤트 및
															프로모션 등 참여가 제한될 수 있으나 CJ ONE 멤버십 서비스 이용에는 영향을 미치지 않습니다.</li>
													</ul>
													<div class="radio_agreement">
														<span class="radio_btn on" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">미동의<span>선택됨</span></span>
														</a><span class="hide"><span class="haze">미동의<span>선택불가</span></span></span>
															<input type="radio" class="chk" id="omniagreeN1070101000"
															name="omniagree1070101000" checked="checked" value="">
															<label for="omniagreeN1070101000"><span
																class="ico"></span>미동의</label>
														</span> <span class="radio_btn case" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">동의<span>미선택됨</span></span>
														</a><span class="hide"><span class="haze">동의<span>선택불가</span></span></span>
															<input type="radio" class="chk" id="omniagreeY1070101000"
															name="omniagree1070101000" value="10|7010|1000">
															<label for="omniagreeY1070101000"><span
																class="ico"></span>동의</label>
														</span>
													</div>
												</div>







												<div class="item_box">
													<h4 class="h5_tit">CJ푸드빌㈜의 개인정보 제공 동의 (선택)</h4>
													<div class="cont clause_box"
														style="padding: 20px; border: 1px solid #ddd;">
														<div id="polView">
															<p>본인은 아래 본인의 정보를 다음과 같이 제3자에게 제공함에 동의합니다.</p>
															<p>씨제이제일제당㈜, 씨제이대한통운㈜, 씨제이이엔엠㈜, 씨제이올리브영㈜,
																씨제이올리브네트웍스㈜, 씨제이씨지브이㈜, 씨제이푸드빌㈜, ㈜티빙(이하, 총칭하여 “CJ” 또는
																"CJ계열사")는 CJ가 보유한 다양한 온-오프라인 채널간 유기적 연계를 통해 다양한 고객 맞춤
																서비스를 제공하고 CJ 고객의 서비스 만족도를 보다 더 향상시키기 위하여 다음과 같이 CJ 계열사에게
																회원의 개인정보를 상호 제공(공유)ㆍ활용하고자 합니다. 동의하시는 경우 옴니서비스와 함께 CJ가
																제공하는 상품/서비스에 대하여 보다 더 만족스러운 경험을 느끼실 수 있습니다.</p>
															<!-- 20230112 수정 -->
															<table border="1" cellspacing="0" cellpadding="0"
																style="margin-top: 10px; width: 100%">
																<caption>CJ푸드빌㈜의 개인정보제공 동의로 제공자, 제공받는자, 제공 항목,
																	제공 목적, 제공 및 활용기간을 나타내는 표입니다.</caption>
																<colgroup>
																	<col style="width: 20%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">제공자</th>
																		<td style="font-size: 14px;">CJ푸드빌㈜</td>
																	</tr>
																	<tr>
																		<th scope="row">제공받는자</th>
																		<td style="font-size: 17px; font-weight: bold">CJ제일제당㈜,
																			CJ대한통운㈜, CJ이엔엠㈜, CJ올리브영㈜, CJ올리브네트웍스㈜, CJ씨지브이㈜, ㈜티빙</td>
																		<!-- 20230112 수정 -->
																	</tr>
																	<tr>
																		<th scope="row">제공 항목</th>
																		<td style="font-size: 14px;">인적정보[성명, 생년월일, 성별,
																			연계정보(CI, CI연계값, DI), 주소, 이동전화번호, 이메일, 아이디],
																			기록정보[접속로그(IP 포함), 쿠키, 서비스이용기록(로그인, 동의 여부, 조회 이력 등)],
																			서비스 이용 내용[구매내역(상품명, 금액, 쿠폰사용 등), 결제정보(수단, 내역, 사용처 등),
																			배송정보, 상담정보, 광고 전송·반응 정보, 프로모션/이벤트 이용 정보, 이용자 입력 정보] 및
																			위 정보와 CJ계열사 항목 정보를 결합, 분석, 추출하여 생성된 정보</td>
																	</tr>
																	<tr>
																		<th scope="row">제공 목적</th>
																		<td style="font-size: 17px; font-weight: bold">
																			1) 각 CJ계열사의 고유 상품/서비스 제공, 유지, 개선, 고도화, 최적화 및 신규
																			상품/서비스 개발<br> 2) 각 CJ계열사 보유 온-오프라인 채널 간 연계 및 통합을
																			통한 다양한 서비스 개발, 제공, 유지, 개선, 고도화 및 최적화<br> 3)
																			상품/서비스 이용실적 통계/분석, 시장조사, 인구통계학적 분석, 데이터 분석을 기반으로 한
																			이용자 간 관계 형성, 고객 성향 분석 및 이를 통한 고객별 맞춤 상품/서비스 개발 및 제공<br>
																			4) 고객만족서비스(CS)개선 및 고객과의 커뮤니케이션 능력 향상<br> 5)
																			상품/서비스 정보 제공 및 홍보, 경품/사은행사 등 이벤트 참여 기회 제공, 쿠폰, 할인 및
																			우대 혜택 제공 등 마케팅 및 프로모션 목적<br> 6) 고객 정보 보호 강화를 위한
																			외부 침입, 해킹, 악용사례, 보안위험, 기술적 문제 등 감지, 예방 및 대응책 수립<br>
																			7) 위 각 호의 목적을 위한 CJ계열사의 보유 데이터의 수집, 저장, 연계, 연동, 결합,
																			조합, 분해, 분석, 가공, 편집, 추출, 가명화, 비식별화, 기타 다양한 방법의 처리 및 이를
																			통한 새로운 데이터 생성, 인공지능 및 빅데이터 기술 개발
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">제공 및 활용기간</th>
																		<td style="font-size: 17px; font-weight: bold">제공에
																			동의하신 정보는 동의를 철회하거나 서비스이용 종료 시 파기합니다. 다만, 관련 법령상 특정 항목
																			보유기간이 제한된 경우에는 그에 따릅니다.</td>
																	</tr>
																	<tr>
																		<th scope="row">동의거부</th>
																		<td style="font-size: 14px;">모든 동의는 옴니서비스 제공 및 고객
																			만족 향상을 위한 선택 동의 사항으로 회원은 개인정보의 제공에 대한 동의를 거부할 수 있습니다.<br>거부하시는
																			경우 옴니서비스 등 목적에 명시된 일부 서비스 이용이 제한될 수 있으나 그 외 서비스에 대한
																			회원가입 등 기타 서비스 이용은 가능합니다.
																		</td>
																	</tr>
																</tbody>
															</table>
															<p style="margin-top: 10px;">
																본 서비스는 만14세 이상의 CJ ONE회원에 한하여 이용이 가능합니다.<br> <span
																	style="font-weight: bold; font-size: 17px">본 정보
																	제공에 동의하신 경우, 본인이 가입한 각 서비스의 가입 시점부터 본 동의 시점까지의 정보도
																	제공항목에 포함됩니다.</span><br> CJ올리브네트웍스는 정보제공회사(CJ계열사)로부터 본
																개인정보 제공 관련 동의 수령/철회/관리업무를 위탁처리합니다.
															</p>
														</div>
													</div>
													<ul class="bul_list">
														<li class="dot_arr">모든 동의는 옴니서비스 제공 및 고객 만족 향상을 위한 선택
															동의 사항으로 회원은 개인정보의 제공에 대한 동의를 거부할 수 있으며, 거부하시는 경우 관련 이벤트 및
															프로모션 등 참여가 제한될 수 있으나 CJ ONE 멤버십 서비스 이용에는 영향을 미치지 않습니다.</li>
													</ul>
													<div class="radio_agreement">
														<span class="radio_btn on" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">미동의<span>선택됨</span></span>
														</a><span class="hide"><span class="haze">미동의<span>선택불가</span></span></span>
															<input type="radio" class="chk" id="omniagreeN1070202000"
															name="omniagree1070202000" checked="checked" value="">
															<label for="omniagreeN1070202000"><span
																class="ico"></span>미동의</label>
														</span> <span class="radio_btn case" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">동의<span>미선택됨</span></span>
														</a><span class="hide"><span class="haze">동의<span>선택불가</span></span></span>
															<input type="radio" class="chk" id="omniagreeY1070202000"
															name="omniagree1070202000" value="10|7020|2000">
															<label for="omniagreeY1070202000"><span
																class="ico"></span>동의</label>
														</span>
													</div>
												</div>


												<div class="item_box">
													<h4 class="h5_tit">㈜티빙의 개인정보 제공 동의 (선택)</h4>
													<div class="cont clause_box"
														style="padding: 20px; border: 1px solid #ddd;">	
														<div id="polView">
															<p>본인은 아래 본인의 정보를 다음과 같이 제3자에게 제공함에 동의합니다.</p>
															<p>씨제이제일제당㈜, 씨제이대한통운㈜, 씨제이이엔엠㈜, 씨제이올리브영㈜,
																씨제이올리브네트웍스㈜, 씨제이씨지브이㈜, 씨제이푸드빌㈜, 씨제이프레시웨이㈜, ㈜티빙(이하, 총칭하여
																“CJ” 또는 "CJ계열사")는 CJ가 보유한 다양한 온-오프라인 채널간 유기적 연계를 통해 다양한
																고객 맞춤 서비스를 제공하고 CJ 고객의 서비스 만족도를 보다 더 향상시키기 위하여 다음과 같이 CJ
																계열사에게 회원의 개인정보를 상호 제공(공유)ㆍ활용하고자 합니다. 동의하시는 경우 옴니서비스와 함께
																CJ가 제공하는 상품/서비스에 대하여 보다 더 만족스러운 경험을 느끼실 수 있습니다.</p>
															<table border="1" cellspacing="0" cellpadding="0"
																style="margin-top: 10px; width: 100%">
																<caption>㈜티빙의 개인정보제공 동의로 제공자, 제공받는자, 제공 항목, 제공
																	목적, 제공 및 활용기간을 나타내는 표입니다.</caption>
																<!-- 20230112 수정 -->
																<colgroup>
																	<col style="width: 20%">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">제공자</th>
																		<td style="font-size: 14px;">㈜티빙</td>
																		<!-- 20230112 수정 -->
																	</tr>
																	<tr>
																		<th scope="row">제공받는자</th>
																		<td style="font-size: 17px; font-weight: bold">CJ제일제당㈜,
																			CJ대한통운㈜, CJ이엔엠㈜, CJ올리브영㈜, CJ올리브네트웍스㈜, CJ씨지브이㈜,
																			CJ프레시웨이㈜, CJ푸드빌㈜</td>
																	</tr>
																	<tr>
																		<th scope="row">제공 항목</th>
																		<td style="font-size: 14px;">인적정보[성명, 성별, 이동전화번호,
																			이메일, 아이디], 서비스 이용 내용[구매내역(상품금액, 과금유형), 시청로그(이용시각,
																			콘텐츠명, 콘텐츠유형, 콘텐츠메타정보, 채널명, 구맹상품명)] 및 위 정보와 CJ계열사 항목
																			정보를 결합, 분석, 추출하여 생성된 정보</td>
																	</tr>
																	<tr>
																		<th scope="row">제공 목적</th>
																		<td style="font-size: 17px; font-weight: bold">
																			1) 각 CJ계열사의 고유 상품/서비스 제공, 유지, 개선, 고도화, 최적화 및 신규
																			상품/서비스 개발<br> 2) 각 CJ계열사 보유 온-오프라인 채널 간 연계 및 통합을
																			통한 다양한 서비스 개발, 제공, 유지, 개선, 고도화 및 최적화<br> 3)
																			상품/서비스 이용실적 통계/분석, 시장조사, 인구통계학적 분석, 데이터 분석을 기반으로 한
																			이용자 간 관계 형성, 고객 성향 분석 및 이를 통한 고객별 맞춤 상품/서비스 개발 및 제공<br>
																			4) 고객만족서비스(CS)개선 및 고객과의 커뮤니케이션 능력 향상<br> 5)
																			상품/서비스 정보 제공 및 홍보, 경품/사은행사 등 이벤트 참여 기회 제공, 쿠폰, 할인 및
																			우대 혜택 제공 등 마케팅 및 프로모션 목적<br> 6) 고객 정보 보호 강화를 위한
																			외부 침입, 해킹, 악용사례, 보안위험, 기술적 문제 등 감지, 예방 및 대응책 수립<br>
																			7) 위 각 호의 목적을 위한 CJ계열사의 보유 데이터의 수집, 저장, 연계, 연동, 결합,
																			조합, 분해, 분석, 가공, 편집, 추출, 가명화, 비식별화, 기타 다양한 방법의 처리 및 이를
																			통한 새로운 데이터 생성, 인공지능 및 빅데이터 기술 개발
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">제공 및 활용기간</th>
																		<td style="font-size: 17px; font-weight: bold">제공에
																			동의하신 정보는 동의를 철회하거나 서비스이용 종료 시 파기합니다. 다만, 관련 법령상 특정 항목
																			보유기간이 제한된 경우에는 그에 따릅니다.</td>
																	</tr>
																	<tr>
																		<th scope="row">동의거부</th>
																		<td style="font-size: 14px;">모든 동의는 옴니서비스 제공 및 고객
																			만족 향상을 위한 선택 동의 사항으로 회원은 개인정보의 제공에 대한 동의를 거부할 수 있습니다.<br>거부하시는
																			경우 옴니서비스 등 목적에 명시된 일부 서비스 이용이 제한될 수 있으나 그 외 서비스에 대한
																			회원가입 등 기타 서비스 이용은 가능합니다.
																		</td>
																	</tr>
																</tbody>
															</table>
															<p style="margin-top: 10px;">
																본 서비스는 만14세 이상의 CJ ONE회원에 한하여 이용이 가능합니다.<br> <span
																	style="font-weight: bold; font-size: 17px">본 정보
																	제공에 동의하신 경우, 본인이 가입한 각 서비스의 가입 시점부터 본 동의 시점까지의 정보도
																	제공항목에 포함됩니다.</span><br> CJ올리브네트웍스는 정보제공회사(CJ계열사)로부터 본
																개인정보 제공 관련 동의 수령/철회/관리업무를 위탁처리합니다.
															</p>
														</div>
													</div>
													<ul class="bul_list">
														<li class="dot_arr">모든 동의는 옴니서비스 제공 및 고객 만족 향상을 위한 선택
															동의 사항으로 회원은 개인정보의 제공에 대한 동의를 거부할 수 있으며, 거부하시는 경우 관련 이벤트 및
															프로모션 등 참여가 제한될 수 있으나 CJ ONE 멤버십 서비스 이용에는 영향을 미치지 않습니다.</li>
													</ul>
													<div class="radio_agreement">
														<span class="radio_btn on" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">미동의<span>선택됨</span></span>
														</a><span class="hide"><span class="haze">미동의<span>선택불가</span></span></span>
															<input type="radio" class="chk" id="omniagreeN1071901900"
															name="omniagree1071901900" checked="checked" value="">
															<label for="omniagreeN1071901900"><span
																class="ico"></span>미동의</label>
														</span> <span class="radio_btn case" data-skin="accept"
															data-checked-text="선택됨" data-unchecked-text="미선택됨">
															<a href="#"> <span class="haze">동의<span>미선택됨</span></span>
														</a><span class="hide"><span class="haze">동의<span>선택불가</span></span></span>
															<input type="radio" class="chk" id="omniagreeY1071901900"
															name="omniagree1071901900" value="10|7190|1900">
															<label for="omniagreeY1071901900"><span
																class="ico"></span>동의</label>
														</span>
													</div>
												</div>

											</div>
										</li>
										<input type="hidden" name="omni_agr_list" id="omni_agr_list"
											value="">
										<!--// 옴니 서비스 약관 -->

									</ul>
								</div>
								<!-- 정보제공 동의여부 -->

								<div class="btn_sec btn_center">
									<button type="button" class="btn" id="btn_cancel"
										onclick="btncancel()"">취소</button>
									<button type="button" class="btn btn_em" id="btn_submit">수정</button>
								</div>

								<div id="guideArea">
									<h2 class="haze">고객센터 이용 안내</h2>
									<div class="box_btm box_gray cs_banner col2">
										<div class="banner_cs faq">
											<a href="https://www.cjone.com/cjmweb/customer/faq.do">
												<dl class="box_info">
													<dt>자주찾는 질문</dt>
													<dd>
														<p>
															CJ ONE에 관한 궁금하신 사항을 확인하세요.<br>질문에 빠르고 정확한 답변을 제공합니다.
														</p>
													</dd>
												</dl> <span class="bg faq"></span>
											</a>
										</div>
										<div class="banner_cs call_center">
											<a href="javascript:goCounseling();">
												<dl class="box_info">
													<dt>1:1상담</dt>
													<dd>
														<ul class="bul_list">
															<li class="dot_arr">평일 : 다음 날 답변 완료</li>
															<li class="dot_arr">토·일·공휴일 : 휴일 이후 답변 완료</li>
														</ul>
													</dd>
												</dl> <span class="bg"></span>
											</a>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<input type="hidden" name="userName" id="userName" value="" />
				<input type="hidden" name="userTel" id="userTel" value="" />
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</div>
		<!-- //contents -->


	<!--script 영역-->
<script>

$(document).ready(function () {
    $('.question_wrap').on('click', function () {
        var $parentLi = $(this).closest('li');
        $parentLi.toggleClass('on');
        var $btnText = $(this).find('[data-handler="toggleText"]');
        $btnText.text(function (i, text) {
            return text === '열기' ? '닫기' : '열기';
        });
        var $answer = $parentLi.find('.answer_wrap');
        $('.answer_wrap').not($answer).hide();
        $answer.toggle();
    });
    
    $('.radio_agreement a').on('click', function(event) {
        event.preventDefault();
        const $parentRadio = $(this).closest('.radio_agreement');
        $parentRadio.find('.radio_btn').removeClass('on');
        $(this).parent('.radio_btn').addClass('on');
        $(this).siblings('.chk').prop('checked', true);
    });
    $('#omniagreeN1070606040').prop('checked', true);
    
    $('.agreement_choose a').on('click', function(event) {
        event.preventDefault();
        const $parentRadio = $(this).closest('.radio_btn');
        const $radioBtns = $('.radio_btn');

        $radioBtns.removeClass('on'); 
        $parentRadio.addClass('on'); 

        // 선택된 라디오 버튼 체크 처리
        const $radioInput = $parentRadio.find('.chk');
        $radioInput.prop('checked', true);
    });
    
});


	var tm_rcv_checkbox = new Array();
	var sms_rcv_checkbox = new Array();
	var email_rcv_checkbox = new Array();
	var isMaskYn = "Y";
    $(function () {
       //제휴브랜드 마케팅 정보수신 동의 초기값
        $('#coop_agree input:checkbox[id^="tm_rcv_"]').each(function(){
        	tm_rcv_checkbox.push($(this).is(":checked")?"Y":"N")
         });
        	
        $('#coop_agree input:checkbox[id^="sms_rcv_"]').each(function(){
        	sms_rcv_checkbox.push($(this).is(":checked")?"Y":"N")
        });
       
        $('#coop_agree input:checkbox[id^="email_rcv_"]').each(function(){
        	email_rcv_checkbox.push($(this).is(":checked")?"Y":"N")
        });
  
    });
</script>
<script type="text/javascript">	
	
	    
	    // 카카오 로그인 사용 여부
        if($('#under_14').val() == 'N'){
            if($('#sns_typ_cd_10').val() != null && $('#sns_typ_cd_10').val() != ''){
                if($('#sns_typ_cd_10').val() == 'Y'){
                    $('#kakaosync').val('Y');
                    $('input:checkbox[id="kakaosync"]').attr("checked", true);
                    $('#kakaosync').prop("checked", true);
                }else{
                    $('#kakaosync').val('N');
                    $('input:checkbox[id="kakaosync"]').attr("checked", false);
                }
            }
        }



    // 회원수정 체크
     function checkInput() {
    		
	        if($('#email_addr1').val() == ""){
	            alert("이메일 주소를 입력하세요.");
	            alertMsg('msg_email_addr', "이메일 주소를 입력하세요.");
	            $('#email_addr1').focus();
	            return false;
	        }
	
	        if($('#email_addr_opt').val() == ""){
	            alert("이메일 도메인을 선택 하세요.");
	            alertMsg('msg_email_addr', "이메일 도메인을 선택 하세요.");
	            $('#email_addr_opt').focus();
	            return false;
	        }
	
	        if($('#email_addr_opt').val() == "0" && $('#email_addr2').val() == ""){
	            alert("이메일 도메인 직접입력시 이메일 도메인을 입력하셔야 합니다.");
	            alertMsg('msg_email_addr', "이메일 도메인 직접입력시 이메일 도메인을 입력하셔야 합니다.");
	            $('#email_addr2').focus();
	            return false;
	        }
     }
	function placeHolder(){
		  $('[placeholder][type="password"]').each(function(){
	          $(this).wrap('<div style="position: relative;"></div>');
	          $('<span class="ie8Lbls">'+$(this).attr('placeholder')+'</span>').insertAfter($(this));
	          if($(this).val() == "") {$(this).parent().find('.ie8Lbls').show();}
	          $(this).attr('placeholder','');
	      }).on('focus',function(){
	          $(this).parent().find('.ie8Lbls').hide();
	      }).on('blur',function(){
	          if($(this).val() == "") {$(this).parent().find('.ie8Lbls').show();}
	      });
	      $(document).on('click','.ie8Lbls',function(){
	          $(this).parent().find('input').focus();
	      });
	}

</script>

	<style>
.ie8Lbls {
	font-size: 10px;
	position: absolute;
	top: 5px;
	left: 14px;
}
</style>
	<!--//script 영역-->
	<script>
 	var email = "${userDto.userEmail}";
	var arr = email.split('@', 2);
	var emailadd1 = arr[0];
	var emailadd2 = arr[1];

	$("#email_addr1").val(emailadd1);
	$("#email_addr2").val(emailadd2);
	 
	if ( $("#email_addr2").val() != $("#email_addr_opt").val() ){
		$("#email_addr_opt option:first").attr("selected", "selected");
	}
	$("#email_addr_opt").change(function () {
		$("#email_addr2").val( $("#email_addr_opt").val() );
	});
	
	</script>
	<script>
	$(function () {
		var userTel = 	"${userDto.userTel}";
		var mobileNoText =  $("#mobileNoInfo").text(); 

			var arr = userTel.split('-', 3);
			var tel1 = arr[0];
			var tel2 = arr[1];
			var tel3 = arr[2];
			$("#userTel").val(tel1+"-"+tel2+"-"+tel3);
			$("#mobileNoInfo").text(tel1+"-"+"****"+"-"+tel3);

			 var newTel = "${newTel}"; // 파라미터로 전달된 newTel 값

			if (newTel && newTel !== 'null' && newTel !== 'undefined') {
			   var arr = newTel.split('-', 3);
			   var newtel1 = arr[0];
			   var newtel2 = arr[1];
			   var newtel3 = arr[2];
			   $("#userTel").val(newtel1+"-"+newtel2+"-"+newtel3);
			   $("#mobileNoInfo").text(newtel1+"-"+"****"+"-"+newtel3);
			}
	});

	</script>
	<script>

//비밀번호 체크
function chkPwd() {
	var userpwd = $("#pwd").val();
	var userckpwd = $("#pwd_check").val();
	var userid = "${userDto.userId}";
	var pwdPattern = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,12}$/;
	var num = userpwd.search(/[0-9]/g);
	var eng = userpwd.search(/[a-z]/ig);
	var spe = userpwd.search(/[!"#$%&'()*+,-./:;<=>?@[]^_`{|}~]/gi);
	if (userpwd == null) {
	   $("#msg_pwdNull").css("display", "block");
	   $("#pwd").focus();
	   return false;
	} else if (userpwd.length < 8 || userpwd.length > 12) {
	    $("#msg_pwdAbcd").css("display", "block");
	    $("#pwd").focus();
	    return false;
	} else if (/(\w)\1\1\1/.test(userpwd)) {
	    $("#msg_pwdAbcd").css("display", "block");
	    $("#pwd").focus();
	    return false;
	} else if (userpwd.search(userid) > -1) {
	      $("#msg_pwdId").css("display", "block");
	      $("#pwd").focus();
	    return false;
	 } else if (userpwd !== userckpwd) {
	  	 $("#msg_pwd_check").removeClass("hide");
	     $("#msg_pwd_check").addClass("show");
	     $("#pwd_check").focus();
	     return false;
	  }
	 $("#msg_pwdNull").css("display", "none");
	 $("#msg_pwdAbcd").css("display", "none");
	 $("#msg_pwdId").css("display", "none");
	    return true;
	}
// 패스워드 강도 체크  

$("#btn_submit").on("change", function () {
	//alert("event");		
	var inputVal = $("#pwd").val();	
	var length = inputVal.length;
		if ( length >15) {
			$("#pwd").text("강도 : 강함");
		} else if ( length >13) {
			$("#pwd").text("강도 : 적정");
		}  else if (length >9) {
			$("#pwd").text('강도 : 약함'); 
		}  else{
	       	$("#pwd").text("강도 : 매우약함");
	   }
}); 

</script>
	<script>
	function btncancel(){
		alert('수정하신 정보는 저장되지 않습니다.\n수정을 취소하시겠습니까?');
		location.href='<%=contextPath%>/mypage/usermodify';
		}
	$("#lnChangeName").on("click", function (event) {
		event.preventDefault();
		location.href = "/usermodify/name_update"; 
	});
	
	var uName = $("#hg_nm_area").text().trim();
	console.log ( uName);
	$("#userName").val(uName);
	
	$("#btn_submit").on("click", function () {
		if (chkPwd() ) {
			$("#form1").submit();
		}
	});

</script>
