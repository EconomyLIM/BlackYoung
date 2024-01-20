$(function () {
	// console.log(window.location.href);
	$(".loc_history>li").mouseover(function () {
		$(this).addClass("active");
		$("history_cate_box").css("display","block");
	})
	$(".loc_history>li").mouseleave(function () {
		$(".loc_history>li").removeClass("active");
	})
	/*  */
	$('#btnSaleOpen').on('click', function() {
		if ($(this).hasClass('is-active')) {
	        // 이미 클래스가 추가되어 있으면 제거
	        $(this).removeClass('is-active');
	        $('#saleLayer').css('display','none');
	    } else {
	        // 클래스가 추가되어 있지 않으면 추가
	        $(this).addClass('is-active');
	        $('#saleLayer').css('display','block');
	    }
		
	})
	/*  */
	$('#btnSaleClose').on('click', function () {
		$(this).parent().css('display','none');
		$('#btnSaleOpen').removeClass('is-active');
	})
	/*  */
	
	/* */

}) ; 

// 팝업창 띄우는 함수들
function popUp() {
	event.preventDefault();
	
    var topPosition = Math.max(0, (window.innerHeight - $('#layer_pop_wrap').offsetHeight) / 2);
    var leftPosition = Math.max(0, (window.innerWidth - $('#layer_pop_wrap').offsetWidth) / 2);
    
    
	$('#layer_pop_wrap').css({
		top: topPosition + 'px',
        left: leftPosition + 'px',
		display: 'block'});
	
	$('.dimm').css('display','block');

} // popUp

function popDown() {
	event.preventDefault();
	$('#layer_pop_wrap').css('display','none');
	$('.dimm').css('display','none');
} // popDown

function todayDeliveryPop() {
	event.preventDefault();
	
	 var topPosition = Math.max(0, (window.innerHeight - $('#infoTodayDeliveryQuestion').offsetHeight) / 2);
	 var leftPosition = Math.max(0, (window.innerWidth - $('#infoTodayDeliveryQuestion').offsetWidth) / 2);
	    
	$('#infoTodayDeliveryQuestion').css({
		top: topPosition + 'px',
        left: leftPosition + 'px',
		display: 'block'});
	$('.dimm').css('display','block');
} // todayDeliveryPop

function todayDeliveryPopDown() {
	event.preventDefault();
	$('#infoTodayDeliveryQuestion').css('display','none');
	$('.dimm').css('display','none');
} // todayDeliveryPopDown

function cjone_pointPop() {
	event.preventDefault();
	
	 var topPosition = Math.max(0, (window.innerHeight - $('#layerWrap534').offsetHeight) / 2);
	 var leftPosition = Math.max(0, (window.innerWidth - $('#layerWrap534').offsetWidth) / 2);
	 
	 $('#layerWrap534').css({
			top: topPosition + 'px',
	        left: leftPosition + 'px',
			display: 'block'});
		$('.dimm').css('display','block');
	
} // cjone_pointPop

function cjone_pointPopDown() {
	
	event.preventDefault();
	
	$('#layerWrap534').css('display','none');
	$('.dimm').css('display','none');
	
} // cjone_pointPopDown

function card_infoPop() {
	event.preventDefault();
	
	var topPosition = Math.max(0, (window.innerHeight - $('#layer_pop_wrap2').offsetHeight) / 2);
	 var leftPosition = Math.max(0, (window.innerWidth - $('#layer_pop_wrap2').offsetWidth) / 2);
	 
	 $('#layer_pop_wrap2').css({
			top: topPosition + 'px',
	        left: leftPosition + 'px',
			display: 'block'});
		$('.dimm').css('display','block');
	
} // card_infoPop

function card_infoPopDown() {
	event.preventDefault();
	
	$('#layer_pop_wrap2').css('display','none');
	$('.dimm').css('display','none');
	
} // card_infoPopDown

/* ----------------------------*/

function Test2() {
	if ($('#buy_option_box').hasClass('open')) {
		 $('#buy_option_box').removeClass('open');
	} else {
		 $('#buy_option_box').addClass('open');
	}
} // Test2

/* 오늘드림 팝업 */
$(function() {
	$('#deliveDay').on('click', function() {
		$('.option_add_area.pkg_goods_n').css('display','none');
		$('.prd_cnt_box.no_prom').css('display','none');
		$('.option_cnt_box input').val(0);
		$('.tx_cont > .tx_num').text(0);
	})// deliveDay
}) // function

/* 하단 정보 탭 클릭 */
$(function() {
			$("#tabList li").click(function() {
				let id = $(this).attr("id");

				$("#tabList li").removeClass("on");
				$(this).addClass("on")
				if (id == "productInfo") {
					showDiv(1)
				}
				if (id == "buyInfo") {
					showDiv(2)
				}
				if (id == "reviewInfo") {
					showDiv(3)
				}
				if (id == "qnaInfo") {
					showDiv(4)
				}
			})
		}); //
function showDiv(index) {
			const divs = document.querySelectorAll('.tabConts.prd_detail_cont'); // 모든 div 요소 선택

			// index는 1부터 시작하므로 실제 인덱스는 index - 1이 됨
			for (let i = 0; i < divs.length; i++) {
				if (i === index - 1) {
					divs[i].classList.add("show"); // 선택된 div 보이기
				} else {
					divs[i].classList.remove("show"); // 선택되지 않은 div 감추기
				}
			}
		}

/* qna 스크립트 */

function qnaPopDown() {
		$('#pop_cont').hide();
		$('.dimm').hide();
		$('.radioGT1 label:nth-child(1)').removeClass('checked');
		$('#cancel').prop("disabled",true);
		$('#reg').prop("disabled",true);
		$('.mypage-qna-write').addClass('disabled');
		$('.reviews-write').addClass('disabled');
		$('.reviews-write > textarea').prop('disabled', true);
	}
$(function() {

		$('.btnInquiry.goods_qna_inquiry').on('click', function() {
			
			$.ajax({
				url: "/loginCheck",
				method:"GET",
				cache:false,
				success: function (result) {
					$('#pop_cont').show();
					$('.dimm').css('display', 'block');
					$('#sForm')[0].reset();
				}, error : function (xhr, data, textStatus) {
					if (xhr.status == 401) {
		                   alert("로그인 후 이용가능 합니다.");
		                         window.location.href = "/auth/login";   
		               }else{
		                    alert("서버 에러") 
		               }
		        } // success , error
			}) // ajax
			
			
			
		}) // btnInquiry
		
		$('.radioGT1 label:nth-child(1)').on('click', function() {
			$(this).addClass('checked');	
			$('.reviews-write').removeClass('disabled');
			$('.mypage-qna-write').removeClass('disabled');
			$('.reviews-write textarea').prop("disabled",false);
			$('#cancel').prop("disabled",false);
			$('#reg').prop("disabled",false);
		})
		
		$('.radioGT1 label:nth-child(2)').on('click', function() {
			$(this).addClass('checked');
			$('.radioGT1 label:nth-child(1)').removeClass('checked');
			$('.alertPop.isOpen').show();
		})
		
		
		var maxChars = 250;

	    $("#gdasCont").on("input", function () {
	        var curLength = $(this).val().length;
	        $("#curTxtLength").text(curLength);

	        // 250자를 넘으면 입력 취소
	        if (curLength > maxChars) {
	            $(this).val(function(_, val) {
	            	alert('250자 이내로 작성해주세요.');
	                return val.slice(0, maxChars);
	                
	            });
	        }
	    });

	    $("#gdasCont").on("keypress", function (e) {
	        // 텍스트가 삭제될 때 입력 취소
	        if (e.which === 8) { // 8은 백스페이스 키의 ASCII 코드
	            var curLength = $(this).val().length;
	            if (curLength <= maxChars) {
	                $("#curTxtLength").text(curLength);
	            }
	        }
	    });
	    
	    $('.btnMedium.wGreen.btnClose').on('click', function() {
			$('.alertPop.isOpen').hide();
			$('.radioGT1 label:nth-child(2)').removeClass('checked');
			$('.radioGT1 label:nth-child(1)').addClass('checked');
			$('.reviews-write').removeClass('disabled');
			$('.mypage-qna-write').removeClass('disabled');
			$('.reviews-write textarea').prop("disabled",false);
			$('#cancel').prop("disabled",false);
			$('#reg').prop("disabled",false);
		})
		
}) // ready function close

// qnaListAjax

function qnaListAjax(currentPage, productDisplayId) {
	let qnadiv = $('.prd_qna_list');
	let qnaPage = $('.pageing');
	
	
	$.ajax({
		type: "GET",
		cache: false,
		url: '/getQnAList',
		dataType:'json', 
		data: {
			productDisplayId : productDisplayId,
			currentPage : currentPage
		},
		success: function(response) {
			
			var qnaList = response.qnaList;
			var qnaPageDTO = response.qnaPageDTO;
			
			console.log("QnA 조회 성공");
			qnadiv.empty();
			qnaPage.empty();
			
			$.each(qnaList, function (i, qna) {
			    var li = $('<li class="">');
			    
			    var qnaTitBox = $('<div class="qna_tit_box">');
			    var qnaQuestion = $('<p class="qna_question">');
			    
			    if (qna.qnaAnswer) {
			        qnaQuestion.append('<span class="qna_flag complete">답변완료</span>');
			    } else {
			        qnaQuestion.append('<span class="qna_flag">답변대기</span>');
			    }
			    
			    qnaQuestion.append('<a href="#" class="completeBind">' + qna.qnaQuestion + '</a>');
			    
			    var txUserId = $('<p class="tx_userid">');
			    var userId = qna.userId;
			    
			    txUserId.append('<span>' + userId + '</span>');
			    
			   if (qna.canModify) {
			        var editButton = $('<button class="btnSmall fullGray" onclick="modifyQnA(\''+ qna.qnaId  + '\')">수정</button>');
			        var deleteButton = $('<button class="btnSmall fullGray" onclick="deleteQnA(\'' + qna.qnaId + '\');">삭제</button>');
			        
			        txUserId.append(editButton);
			        txUserId.append(deleteButton);
			    }
			    
			    txUserId.append('</p>');
			    
			    var txDate = $('<p class="tx_date">' + qna.qnaDate + '</p>');
			    
			    qnaTitBox.append(qnaQuestion);
			    qnaTitBox.append(txUserId);
			    qnaTitBox.append(txDate);
			    
			    var qnaAnswerBox = $('<div class="qna_answer_box">');
			    
			    var txQuestion = $('<div class="tx_question">');
			    txQuestion.append('<span class="ico_qna question">질문</span>' + qna.qnaQuestion);
			    
			    var txAnswer = $('<div class="tx_answer">');
			    
			    if (qna.qnaAnswer) {
			        txAnswer.append('<span class="ico_qna answer">답변</span>' + qna.qnaAnswer);
			    }
			    
			    qnaAnswerBox.append(txQuestion);
			    qnaAnswerBox.append(txAnswer);
			    
			    li.append(qnaTitBox);
			    li.append(qnaAnswerBox);
			    
			    // Append the generated HTML to your container
			    // Example: $('#yourContainerId').append(li);
			    
				qnadiv.append(li);
				
			});
			
			let paginationHtml = ' ';
			if (qnaPageDTO.prev) {
			    paginationHtml += '<a class="prev" href="#" data-page-no="' + (qnaPagedto.start - 1) + '">이전 10 페이지</a>';
			}

			for (let i = qnaPageDTO.start; i <= qnaPageDTO.end; i++) {
			    if (i === qnaPageDTO.currentPage) {
			        paginationHtml += '<strong title="현재 페이지">' + i + '</strong>';
			    } else {
			        paginationHtml += '<a href="javascript:qnaListAjax()" data-page-no="' + i + '">' + i + '</a>';
			    }
			}

			if (qnaPageDTO.next) {
			    paginationHtml += '<a class="next" href="#" data-page-no="' + (qnaPageDTO.end + 1) + '">다음 10 페이지</a>';
			}
			
			qnaPage.append(paginationHtml);
			
			$('.completeBind').on('click', function(e) {
			e.preventDefault();
			if ($(this).closest('li').hasClass('show')) {
				$(this).closest('li').removeClass('show');
			}else{
				$(this).closest('li').addClass('show');
			}
			
		}) // completeBind
			
			
		},
		error: function(response) {
			alert('실패');
			console.log("QnA 조회 실패");
		} // error close
	}); // ajax close 
} // qnaListAjax

// 리뷰 관련 스크립트
$(function(){
	 
	 $(".prd_option_box.box_select").click(function(){
		 $(this).addClass("open")
	 })
	 
	  $(".sel_option_list.scrbar  a.item").on("click",function(){
		 let productId = $(this).find("input[name=gdasItemNo]").val()
		 //let type = $("#gdasSort li.on > a").attr("data-value")
		 let productDisplayId = $("#goodsNo").val();
		 let txt = $(this).attr("title");
		 let data = {
			 productId: productId,
			 productDisplayId: productDisplayId
		    };
		 $.ajax({
				url: "/getReview",
				data:data,
				cache: false,
				success:function( response ) {
					$(".prd_option_box.box_select > a").attr("id",productId);
					$(".prd_option_box.box_select > a > span.txt").text(txt);
					$(".prd_option_box.box_select").removeClass("open");
		              $("#review").empty();
		              $("#review").append( response );
		          }
		        , error		: function() {
		            alert( '서버 데이터를 가져오지 못했습니다. 다시 확인하여 주십시오.' );
		        }
			})
			
			
	 })
	 
	 
	 
}) // function



	
	
	