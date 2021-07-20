<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<jsp:include page="./header.jsp" />

<script>
	var form_name = "#boundaries_form" //form 이름 
	var form_target = "./BoundariesServlet" //post 대상 
	var page_subject = "개발대상업무 설정" 
	var next_location = "./DataServlet"
	
    function addColumn() {
        var NowColNodes = eval($(".req_pro_div:last").attr('id').replace("req_pro_div_", ""));
        //alert(NowColNodes);
        if (NowColNodes < 1) {
            NowColNodes = 0;
        }
        var AddColNodes = Number(NowColNodes) + 1;
        //alert(AddColNodes);
        //메인이 되는 DIV를 먼저 추가한다.
        $('#boundaries_form')
            .append('<!--  row  -->')
            .append('<div class="req_pro_div" id="req_pro_div_' + AddColNodes + '"  style="border:0px solid red;overflow:hidden" >')
            .append('</div><!-- req_def_div -->');
        //해당 DIV에 내용을 넣는다.
        $('#req_pro_div_' + AddColNodes)
            .append('<div style="display: inline-block; float:left; width: 48%;"><h5 class="card-title mb-0"><br>요구사항을 선택하세요</h5><select name="requirement_list" id="="require_' + AddColNodes + '" class="form-control"><c:forEach var="req" items="${requirement_list}"><option value="<c:out value="${req.req_def_num}"/>"> <c:out value="${req.req_def_num}.${req.req_def}"/></option></c:forEach></select></div>  <!-- inline-block -->')
        $('#req_pro_div_' + AddColNodes)
            .append('<div style="display: inline-block; float: right; width: 48%"><h5 class="card-title mb-0"><br>단위업무를 선택하세요</h5><select name="uni_pro_list" id="process_' + AddColNodes + '" class="form-control"><c:forEach var="up" items="${unitProcess_list}"><option value="<c:out value="${up.uni_pro_num}"/>"> <c:out value="${up.uni_pro_num}.${up.uni_pro}"/></option></c:forEach></select></div> <!-- inline-block -->');
    }


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
                            <h5 class="card-title mb-0">측정 단계</h5>
                        </div>
                        <div class="card-body text-center">
                            <img src="./assets/images/setting_application_boundaries.png" alt="setting application boundaries" class="img-fluid rounded-circle mb-2" width="128" height="128" />
                            <h5 class="card-title mb-0">개발대상 업무 설정</h5>
                            <div class="text-muted mb-2">
                                요구사항과 단위 프로세스를 매칭함하여 측정범위를 확정합니다.<br />기능점수
                                측정 범위에 포함된 측정대상 애플리케이션과 다른 애플리케이션
                                또는 외부 사용자간의 경계가 설정됩니다.
                            </div>
                        </div>

                        <hr class="my-0" />

                        <div class="container-fluid p-0">
                            <div class="row removable" style="padding:20px;">
                                <form name="boundaries_form" id="boundaries_form">

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

                                    <!--  row  -->
                                    <div class="req_pro_div" id="req_pro_div_1" style="border: 0px solid red; overflow: hidden">
                                        <div style="display: inline-block; float: left; width: 48%;">
                                            <h5 class="card-title mb-0">
                                                <br />요구사항을 선택하세요
                                            </h5>
                                            <select name="requirement_list" id="require_1" class="form-control">
                                                <c:forEach var="req" items="${requirement_list}">
                                                    <option value="<c:out value=" ${req.req_def_num}" />">
                                                    <c:out value="${req.req_def_num}.${req.req_def}" />
                                                    </option>
                                                </c:forEach> <!--  -->
                                            </select>
                                        </div>
                                        <!-- inline-block -->

                                        <div style="display: inline-block; float: right; width: 48%">
                                            <h5 class="card-title mb-0">
                                                <br />단위업무를 선택하세요
                                            </h5>
                                            <select name="uni_pro_list" id="process_1" class="form-control">
                                                <c:forEach var="up" items="${unitProcess_list}">
                                                    <option value="<c:out value=" ${up.uni_pro_num}" />">
                                                    <c:out value="${up.uni_pro_num}.${up.uni_pro}" />
                                                    </option>
                                                </c:forEach> <!--  -->
                                            </select>
                                        </div>
                                        <!-- inline-block -->
                                    </div>
                                    <!-- req_pro_div -->


                                    <!--  row  -->
                                    <div class="req_pro_div" id="req_pro_div_2" style="border: 0px solid red; overflow: hidden">
                                        <div style="display: inline-block; float: left; width: 48%;">
                                            <h5 class="card-title mb-0">
                                                <br />요구사항을 선택하세요
                                            </h5>
                                            <select name="requirement_list" id="require_2" class="form-control">
                                                <c:forEach var="req" items="${requirement_list}">
                                                    <option value="<c:out value=" ${req.req_def_num}" />">
                                                    <c:out value="${req.req_def_num}.${req.req_def}" />
                                                    </option>
                                                </c:forEach> <!--  -->
                                            </select>
                                        </div>
                                        <!-- inline-block -->

                                        <div style="display: inline-block; float: right; width: 48%">
                                            <h5 class="card-title mb-0">
                                                <br />단위업무를 선택하세요
                                            </h5>
                                            <select name="uni_pro_list" id="process_2" class="form-control">
                                                <c:forEach var="up" items="${unitProcess_list}">
                                                    <option value="<c:out value=" ${up.uni_pro_num}" />">
                                                    <c:out value="${up.uni_pro_num}.${up.uni_pro}" />
                                                    </option>
                                                </c:forEach> <!--  -->
                                            </select>
                                        </div>
                                        <!-- inline-block -->
                                    </div>
                                    <!-- req_pro_div -->


                                    <!--  row  -->
                                    <div class="req_pro_div" id="req_pro_div_3" style="border: 0px solid red; overflow: hidden">
                                        <div style="display: inline-block; float: left; width: 48%;">
                                            <h5 class="card-title mb-0">
                                                <br />요구사항을 선택하세요
                                            </h5>
                                            <select name="requirement_list" id="require_3" class="form-control">
                                                <c:forEach var="req" items="${requirement_list}">
                                                    <option value="<c:out value=" ${req.req_def_num}" />">
                                                    <c:out value="${req.req_def_num}.${req.req_def}" />
                                                    </option>
                                                </c:forEach> <!--  -->
                                            </select>
                                        </div>
                                        <!-- inline-block -->

                                        <div style="display: inline-block; float: right; width: 48%">
                                            <h5 class="card-title mb-0">
                                                <br />단위업무를 선택하세요
                                            </h5>
                                            <select name="uni_pro_list" id="process_3" class="form-control">
                                                <c:forEach var="up" items="${unitProcess_list}">
                                                    <option value="<c:out value=" ${up.uni_pro_num}" />">
                                                    <c:out value="${up.uni_pro_num}.${up.uni_pro}" />
                                                    </option>
                                                </c:forEach> <!--  -->
                                            </select>
                                        </div>
                                        <!-- inline-block -->
                                    </div>
                                    <!-- req_pro_div -->


                                    <!--  row  -->
                                    <div class="req_pro_div" id="req_pro_div_4" style="border: 0px solid red; overflow: hidden">
                                        <div style="display: inline-block; float: left; width: 48%;">
                                            <h5 class="card-title mb-0">
                                                <br />요구사항을 선택하세요
                                            </h5>
                                            <select name="requirement_list" id="require_4" class="form-control">
                                                <c:forEach var="req" items="${requirement_list}">
                                                    <option value="<c:out value=" ${req.req_def_num}" />">
                                                    <c:out value="${req.req_def_num}.${req.req_def}" />
                                                    </option>
                                                </c:forEach> <!--  -->
                                            </select>
                                        </div>
                                        <!-- inline-block -->

                                        <div style="display: inline-block; float: right; width: 48%">
                                            <h5 class="card-title mb-0">
                                                <br />단위업무를 선택하세요
                                            </h5>
                                            <select name="uni_pro_list" id="process_4" class="form-control">
                                                <c:forEach var="up" items="${unitProcess_list}">
                                                    <option value="<c:out value=" ${up.uni_pro_num}" />">
                                                    <c:out value="${up.uni_pro_num}.${up.uni_pro}" />
                                                    </option>
                                                </c:forEach> <!--  -->
                                            </select>
                                        </div>
                                        <!-- inline-block -->
                                    </div>
                                    <!-- req_pro_div -->


                                    <!--  row  -->
                                    <div class="req_pro_div" id="req_pro_div_5" style="border: 0px solid red; overflow: hidden">
                                        <div style="display: inline-block; float: left; width: 48%;">
                                            <h5 class="card-title mb-0">
                                                <br />요구사항을 선택하세요
                                            </h5>
                                            <select name="requirement_list" id="require_5" class="form-control">
                                                <c:forEach var="req" items="${requirement_list}">
                                                    <option value="<c:out value=" ${req.req_def_num}" />">
                                                    <c:out value="${req.req_def_num}.${req.req_def}" />
                                                    </option>
                                                </c:forEach> <!--  -->
                                            </select>
                                        </div>
                                        <!-- inline-block -->

                                        <div style="display: inline-block; float: right; width: 48%">
                                            <h5 class="card-title mb-0">
                                                <br />단위업무를 선택하세요
                                            </h5>
                                            <select name="uni_pro_list" id="process_5" class="form-control">
                                                <c:forEach var="up" items="${unitProcess_list}">
                                                    <option value="<c:out value=" ${up.uni_pro_num}" />">
                                                    <c:out value="${up.uni_pro_num}.${up.uni_pro}" />
                                                    </option>
                                                </c:forEach> <!--  -->
                                            </select>
                                        </div>
                                        <!-- inline-block -->
                                    </div>
                                    <!-- req_pro_div -->
                                </form>
                                <!-- boundaries_form -->
                            </div>
                            <!-- removable -->
                        </div>
                        <!-- container-fluid p-0 -->
                        <br>
                        <hr class="my-0" />
                        <div class="card-body text-center">
                            <button type="button" class="btn btn-primary addColumn" onclick="addColumn();">
                                추가하기
                            </button>
                            
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
        </div>
    </div>
</body>
