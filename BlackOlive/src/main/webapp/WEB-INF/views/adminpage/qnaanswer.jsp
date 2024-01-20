<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<main id="main" class="main">
      <section class="section">
        <div class="row">
          <div class="col-lg-4">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">QnA 상세</h5>

                <!-- Vertical Form -->
                <form class="row g-3">
                  <div class="col-12">
                    <label for="inputUserID" class="form-label"
                      >사용자 ID</label
                    >
                    <input
                      type="text"
                      class="form-control"
                      id="inputUserID"
                      value="${qna.userId}"
                      disabled
                    />
                  </div>
                  <div class="col-12">
                    <label for="inputProductName" class="form-label"
                      >상품명</label
                    >
                    <input
                      type="text"
                      class="form-control"
                      id="inputProductName"
                      value="${qna.productDisplayId}"
                      disabled
                    />
                  </div>
                  <div class="col-12">
                    <label for="inputQuestion" class="form-label">질문</label>
                    <input
                      type="text"
                      class="form-control"
                      id="inputQuestion"
                      value="${qna.qnaQuestion}"
                      disabled
                    />
                  </div>
                </form>
                <!-- Vertical Form -->
              </div>
            </div>
          </div>
          <div class="col-lg-8">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">QnA 답변</h5>

                <!-- Quill Editor Full -->
                <div class="quill-editor-full"></div>
                <!-- End Quill Editor Full -->
              </div>
              <button class="btn btn-primary" id="answerReg" onclick="getQuillContent()">답변 등록</button>
            </div>
          </div>
        </div>
      </section>
    </main>
    
<script>
var quill;

document.addEventListener('DOMContentLoaded', function() {
    // Quill Editor 초기화
    quill = new Quill('.quill-editor-full', {
		theme: 'snow'  // 테마 설정
    });

    // 편집기의 내용을 가져오는 함수
});

function getQuillContent() {
    var content = quill.getText();
    alert('Quill Content:\n' + content);
} 
    </script>