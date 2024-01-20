   
function setCookie(cookie_name, value, days) {
  var exdate = new Date();
  exdate.setDate(exdate.getDate() + days);
  // 설정 일수만큼 현재시간에 만료값으로 지정

  var cookie_value = escape(value) + ((days == null) ? '' : '; expires=' + exdate.toUTCString());
  document.cookie = cookie_name + '=' + cookie_value;
}

// 쿠키 값 가져오는 함수
function getCookie(cookie_name) {
     var x, y;
     var val = document.cookie.split(';');

     for (var i = 0; i < val.length; i++) {
       x = val[i].substr(0, val[i].indexOf('='));
       y = val[i].substr(val[i].indexOf('=') + 1);
       x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
       if (x == cookie_name) {
         return unescape(y); // unescape로 디코딩 후 값 리턴
       }
     }
   }
   
   //쿠키 값 저장 하기
   function addCookie(id) {
  var items = getCookie('productItems'); // 이미 저장된 값을 쿠키에서 가져오기
  var maxItemNum = 4; // 최대 저장 가능한 아이템 개수
  var expire = 7; // 쿠키값을 저장할 기간
  
  if (items) {
    var itemArray = items.split(',');
    var itemSet = new Set(itemArray); // 중복 아이템을 제거하기 위해 Set 사용
    
    if (!itemSet.has(id)) {
      // 새로운 값 추가
      itemSet.add(id);
      
      // 쿠키에 새로운 값 추가 후, 최대 개수 유지하기
      var updatedItemsArray = Array.from(itemSet);
      while (updatedItemsArray.length > maxItemNum) {
        updatedItemsArray.shift(); // 오래된 값을 삭제
      }

      // 쿠키에 새로운 값을 추가한 후, 다시 설정
      var updatedItemsString = updatedItemsArray.join(',');
      setCookie('productItems', updatedItemsString, expire);
    }
  } else {
    // 신규 id값 저장하기
    setCookie('productItems', id, expire);
  }
}

// 클릭 이벤트 처리
$(function(){
  $(".prd_thumb.goodsList").on("click",function(){
    let pro_id = $(this).attr("name");
    addCookie(pro_id); // addCookie 함수 호출
  })
})

   $(document).ready(function(){
      $(".btn_thumb").click(function(){
         $(this).addClass('active');
         $(".btn_list").removeClass('active');
         $(".cate_prd_list.gtm_cate_list").removeClass("list_type");
      })
      
      $(".btn_list").click(function(){
         $(this).addClass('active');
         $(".btn_thumb").removeClass('active');
         $(".cate_prd_list.gtm_cate_list").addClass("list_type");
      })
      
      $(".cartBtn").click(function(){
         
         
         
         addModalBackdrop();
         
         let productDisplayId = $(this).attr("id");
         let url = window.location.href
         let data = {
               productDisplayId: productDisplayId,
            }
         
         $.ajax({
            
            
            url: "/itemlist.json",
            data:data,
            cache: false,
            
            success:function( response ) {
            var content = "";
                    $("#displItem").empty();
                    
                     content += `<div class="layer_pop_wrap w490" id="basketOption" style="z-index: 999; display: block;">
   <div class="layer_cont2">
      <h2 class="layer_title2">옵션선택</h2>
   

      <div class="prd_option_box cate_list_basket">

   
         <a href="javascript:open();" onclick="" class="sel_option" id="mainCartSelect">옵션을 선택해주세요</a>

         <ul class="sel_option_list selectItem new">`
         
            for (var i = 0; i < response.length; i++) {
            content +=`
            <li class=" okQuick">
            <!-- 혜택 아이콘 li 분기 끝 -->
            
            <!--[END 오늘드림 옵션상품 개선:jwkim]-->
               <a href="javascript:;" onclick="test(this);" data-ref-goodsno="${response[i].productId }" data-ref-itemno="001" promkndcd="" buycnt="" promno="" getitemautoaddyn="" getitemgoodsno="" getitemitemno="">
         
                  <div class="set">
                  <!-- 오늘드림 아이콘 추가 시작 -->
                  
                        <span class="option_value">
                           ${response[i].productName }
                           <span class="option_price">
                              <span class="tx_num">${response[i].afterPrice }원</span>
                           </span>
                        </span>
                           
                        <!-- 
                           <span class="icon">
                              <span class="icon_flag delivery">오늘드림</span>
                           </span> -->                  
                  <!-- 오늘드림 아이콘 추가 끝 -->
                  </div>
               </a>
            </li>`
         }
            content += `</ul>
   

      </div>
      
      <div class="area2sButton">
         <button class="btnGray closepopup" onclick="close(this);" ><span>취소</span></button>
         <button class="btnGreen" id="goodsSelCart" ><span>장바구니</span></button>         
      </div>
      
      <button class="layer_close type2 closepopup" onclick="close();">창 닫기</button>
   </div>
   
   <input type="hidden" name="cartGoodsNo" id="cartGoodsNo" value="">
   <input type="hidden" name="cartItemNo" id="cartItemNo" value="">
   <input type="hidden" name="paramGoodsNo" id="paramGoodsNo" value="">
   <input type="hidden" name="paramItemNo" id="paramItemNo" value="001">
   <input type="hidden" name="dupYn" id="dupYn" value="Y">
   <input type="hidden" name="goodsSctCd" id="goodsSctCd" value="">
   <input type="hidden" name="promKndCd" id="promKndCd" value="">
   <input type="hidden" name="promNo" id="promNo" value="">
   <input type="hidden" name="buyCnt" id="buyCnt" value="">
   <input type="hidden" name="getItemAutoAddYn" id="getItemAutoAddYn" value="">
   <input type="hidden" name="getItemGoodsNo" id="getItemGoodsNo" value="">
   <input type="hidden" name="getItemItemNo" id="getItemItemNo" value="">
   <input type="hidden" name="pkgGoodsYn" id="pkgGoodsYn" value="N">
   <!-- 오늘드림 전문관 리스트에서 오늘드림 장바구니에 넣기위해 값 추가 -->
   <input type="hidden" name="quickYn" id="quickYn" value="">
   <!-- 레코벨 상품 장바구니 담기 구분을 위해 추가 -->
   <input type="hidden" name="regCartRecoBellGoodsInCartYn" id="regCartRecoBellGoodsInCartYn" value="">
   <input type="hidden" name="ordQty" id="ordQty" value="0">
   <input type="hidden" name="recoRcCode" id="recoRcCode" value="">
   <input type="hidden" name="ordPsbMinQty" id="ordPsbMinQty" value="1"> <!-- 최수구매가능수량 -->
   
</div>`
      
                    $("#displItem").html( content );
                    
                }
              , error      : function(xhr, textStatus, error) {
                 if (xhr.status == 401) {
                   alert("로그인 후 이용가능 합니다.");
                         window.location.href = "/auth/login";   
               }else{
                    alert("서버 에러") 
               }
              }
         })
      });
      
      
      $(".layer_close.type2").click(function(){
         $("#basketOption").css("display","none");
      })
      
   })
   
   function addModalBackdrop() {
    var backdrop = $('<div class="modal-backdrop"></div>');
    $("body").append(backdrop);
}

$(document).ready(function() {
    $('.align_sort ul li').on('click', function() {
        // 현재 클릭된 요소에 'on' 클래스 추가 및 형제 요소로부터 'on' 클래스 제거
        $(this).addClass('on').siblings().removeClass('on');
    });
});

$(document).ready(function() {
$("#mainCartSelect").click(function(){
      $(".prd_option_box.cate_list_basket").addClass("open");
      
   })
   
   $('#displItem').on('click', '.closepopup', function() {
    $(".modal-backdrop").remove();
      $("#displItem").empty();
});
   
   $(".okQuick a").click(function(event){
      event.preventDefault();
       var optionValue = $(this).find(".option_value").html();
       var productid = $(this).attr("data-ref-goodsno");
       $("#paramGoodsNo").attr("value", productid);
         $("#mainCartSelect").html(optionValue);
         $(".prd_option_box.cate_list_basket").removeClass("open");
   })
   
   $(".closepopup").click(function(){
       $(".layer_pop_wrap.w490.test").hide()
   })
   
   $("#displItem").on("click","#goodsSelCart",function(){
      
      let productID = $("input#paramGoodsNo").attr("value");
      if(productID == ""){
      alert("상품을 선택하세요")
      return
      }
      alert(productID);
      
      let data = {
            productID: productID
         }
      
      $.ajax({
         
         url: "/basket/itemadd",
         data:data,
         cache: false,
         success:function( response ) {
         console.log(response)
            $("#basketOption").css("display","none");
            $(".layer_pop_wrap.w490.test").css("display","block");
             }
           , error      : function() {
               alert( '서버 데이터를 가져오지 못했습니다. 다시 확인하여 주십시오.' );
           }
      })
      
   })
   
   
   $(".btnGray.basket").click(function(){
      window.location.href = "/basket";
   })
   });
   
   
   $(".okQuick a").on("click",function(event){
      event.preventDefault();
       var optionValue = $(this).find(".option_value").html();
       var productid = $(this).attr("data-ref-goodsno");
       $("#paramGoodsNo").attr("value", productid);
         $("#mainCartSelect").html(optionValue);
         $(".prd_option_box.cate_list_basket").removeClass("open");
   })
   
   function test(obj){
   var optionValue = $(obj).find(".set").html();
       var productid = $(obj).attr("data-ref-goodsno");
       $("#paramGoodsNo").attr("value", productid);
         $("#mainCartSelect").html(optionValue);
         $(".prd_option_box.cate_list_basket").removeClass("open");
   }
   
   function open(obj){   
      $(".prd_option_box.cate_list_basket").addClass("open");
   }
   
   function close(obj){
   alert("123")
      $(".modal-backdrop").remove();
      $("#displItem").empty();
   }
   
   