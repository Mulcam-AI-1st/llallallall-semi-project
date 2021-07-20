<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="./header.jsp" />

<script>
var form_name = "#project_form" //form 이름 
var form_target = "./ProInfoServlet" //post 대상 
var page_subject = "프로젝트 명칭 입력" 
var next_location = "./SystemServlet"

    
    
// 세션 초기화 버튼 
$(document).ready(function() {

   	$("#btn-reset").click(function(){
   		//alert("와따!");
   		$("#projectname").val(null);
   		$("#projectdesc").val(null);
   		$.ajax({
   	        type:"get",
   	        url:"/DestroySession",
   	        success: function() {
   	          alert("초기화 되었습니다.");			
   	        },
   	        error: function(e) {
   	          alert("에러발생");
   	        }			
   	      });
  	}); 
   	
   	
   	$("#DestroySession").click(function(){
   		//alert("와따!");
   		$("#projectname").val(null);
   		$("#projectdesc").val(null);
   		$.ajax({
   	        type:"get",
   	        url:"/DestroySession",
   	        success: function() {
   	          alert("초기화 되었습니다.");			
   	        },
   	        error: function(e) {
   	          alert("에러발생");
   	        }			
   	      });
  	});
	 
}); 	 	 
        
</script>
</head>
<body class="null">
<input type="hidden" id="submitChkBox" value="${submitChk}">
    <div class="wrapper">
        <!-- side bar -->
        <jsp:include page="./sidebar.jsp" />


        <div class="main" id="panel">
            <!-- navi bar -->
            <jsp:include page="./navi.jsp" />


            <main class="content">
               

                <div class="container-fluid p-0">
                    <div class="card mb-3">
                        <div class="card-header">
                            <h5 class="card-title mb-0">사전 단계 </h5>
                        </div>
                        <div class="card-body text-center">
                            <form name="project_form" id="project_form">
                                <img src="./assets/images/project_information.png" alt="project_information" class="img-fluid rounded-circle mb-2" width="128" height="128">
                                <h5 class="card-title mb-0">프로젝트 기본정보 </h5>
                                <div class="text-muted mb-2">개발비 산정에 기반이 되는 필수 정보를 정의하는 단계입니다.</div>

                                <hr />
                                <!--  기본 정보  -->
                                <div class="row removable">
                                    <div class="col-lg-3">
                                        <h5 class="card-title mb-0">프로젝트 명칭 </h5>
                                    </div>
                                    <div class="col-lg-3">
                                        <input type="text" class="form-control" value="${pi.projectName}" placeholder="프로젝트 명을 입력하세요" id="projectname" name="projectName">
                                    </div>
                                    <div class="col-lg-3">
                                        <h5 class="card-title mb-0">프로젝트 설명 </h5>
                                    </div>
                                    <div class="col-lg-3"><input type="text" class="form-control" value="${pi.projectDesc}" placeholder="프로젝트 상세내역을 입력하세요" id="projectdesc" name="projectDesc"></div>
                                </div>
                                <hr />
                                <!--  시스템 구성 정보  -->
                                <div class="row removable">
                                    <div class="col-lg-3">
                                        <h5 class="card-title mb-0">프로그램 언어 </h5>

                                        <div class="text-muted mb-2">프로젝트의 주된 개발 언어를 선택합니다.</div>
                                    </div>

                                    <div class="col-lg-3">

                                        <select class="form-control" name="codingLanguage" id="codinglanguage">
                                            <option value="JAVA" selected="selected">Java / PHP / Web</option>
                                            <option value="C#">C#</option>
                                            <option value="COBOL">COBOL</option>
                                            <option value="PERL">Perl</option>
                                            <option value="SQL">SQL</option>
                                            <option value="VB">Visual Basic</option>
                                        </select>

                                    </div>
                                    <div class="col-lg-3">
                                        <h5 class="card-title mb-0">시스템 유형 </h5>
                                        <div class="text-muted mb-2">개발할 시스템의 주된 유형을 선택합니다.</div>
                                    </div>
                                    <div class="col-lg-3">

                                        <select class="form-control" name="systemType" id="systemtype">
                                            <option value="MIS">MIS</option>
                                            <option value="WEB" selected="selected">Web application</option>
                                            <option value="OUTSOURCE">Outsource - locally</option>
                                            <option value="OUTSOURCE_OFFSHORE">Outsource - offshore</option>
                                            <option value="SYSTEM">System and embedded</option>
                                            <option value="COMMERCIAL">Commercial</option>
                                            <option value="MILITARY">Military</option>
                                            <option value="ENDUSER">End user developed</option>
                                        </select>

                                    </div>
                                </div>
                            </form>
                        </div>
                        <hr class="my-0">
                        <div class="card-body text-center">

                            <button type="button" class="btn btn-primary" id="btn-reset">초기화</button>
                            		<div style="display:inline-block;width:20px;"></div>
                            		
                            		
                            		
    					    <!-- Button trigger modal -->
							<button type="button" class="btn btn-success" id="btn-submit" data-bs-toggle="modal" data-bs-target="#submitModal">제출하기</button>
									<div style="display:inline-block;width:20px;"></div>
							<button type="button" class="btn btn-dark" id="btn-next" data-bs-toggle="modal" data-bs-target="#submitModal">다음</button>
							
							

							
                        </div>
                    </div>

                </div>
            </main>

            <!-- Footer -->
            <jsp:include page="./footer.jsp" />
