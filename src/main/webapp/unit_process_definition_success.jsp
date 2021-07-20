<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="./header.jsp" />

<script>

var form_name = "#unitprocess_form" //form 이름 
var form_target = "./PreStepCompletionController" //post 대상 
var page_subject = "" 
var next_location = ""

</script>

<body class="null">
<input type="hidden" id="submitChkBox" value="${submitChk}">



    <div class="wrapper">
        <!-- side bar -->
        <jsp:include page="./sidebar.jsp" />

        <div class="main" id="panel">
            <!-- navi bar -->
            <jsp:include page="./navi.jsp" />


            <main class="content text-center">
                <div class="container-fluid p-0">
                    <div class="card flex-fill">
                        <div class="card-header text-center">

                            <h1><strong>사전 단계가 완료되었습니다. </strong></h1>
                        </div>
                        <form action="BoundariesServlet" method="get">
                        <div class="container-fluid p-0">
                                    <div class="row removable">
                                        <div class="col-lg-6">
                                            <div class="input-group" style="margin:10px;width:90%;">
                                                <span class="input-group-text" id="basic-addon1">프로젝트 명칭</span>
                                                <input type="text" class="form-control" name="projectName" value="${pi.projectName}" placeholder="${sspi.projectName}">
                                            </div>
                                            <div class="input-group" style="margin:10px;width:90%;">
                                                <span class="input-group-text" id="basic-addon1">프로그램 언어</span>
                                                <input type="text" class="form-control" name="codingLanguage" value="${pi.codingLanguage}" placeholder="${sspi.codingLanguage}">
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="input-group" style="margin:10px;width:90%;">
                                                <span class="input-group-text" id="basic-addon1">프로젝트 상세</span>
                                                <input type="text" class="form-control" name="projectDesc" value="${pi.projectDesc}" placeholder="${sspi.projectDesc}">
                                            </div>



                                            <div class="input-group" style="margin:10px;width:90%;">
                                                <span class="input-group-text" id="basic-addon1">시스템 유형&nbsp;&nbsp;&nbsp;</span>
                                                <input type="text" class="form-control" name="systemType" value="${pi.systemType}" placeholder="${sspi.systemType}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                     
                        <div class="card-body text-center">
							
							

							
                            <button type="submit" class="btn btn-primary btn-submit" >측정 단계로 이동하기</button>

                        </div>
                    </div>
                </div>
            </main>
            <!-- Footer -->
            <jsp:include page="./footer.jsp" />
