<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header -->
<jsp:include page="./header.jsp" />

<script>
	var form_name = "#unitprocess_form" //form 이름 
	var form_target = "./UnitprocessServlet" //post 대상 
	var page_subject = "단위 프로세스 정보 제출" 
	var next_location = "./PreStepCompletionController"
	
    function addColumn() {
        var NowColNodes = eval($(".uni_pro_div:last").attr('id').replace(
            "uni_pro_div_", ""));
        if (NowColNodes < 1) {
            NowColNodes = 0;
        }
        var AddColNodes = Number(NowColNodes) + 1;
        //메인이 되는 DIV를 먼저 추가한다.
        $('#unitprocess_form')
            .append('<!--  row  -->')
            .append(
                '<div class="uni_pro_div" id="uni_pro_div_' + AddColNodes + '"  style="border:0px solid red;overflow:hidden" >')
            .append('</div>');
        //해당 DIV에 내용을 넣는다.
        $('#uni_pro_div_' + AddColNodes)
            .append(
                '<div style="display: inline-block; float:left; width: 48%;"><h5 class="card-title mb-0"><br>단위업무 ' +
                AddColNodes +
                '</h5><input type="text" id="requirement_def_' + AddColNodes + '" name="uni_pro_list"  class="form-control requirement_def" placeholder="Input"></div>')
        $('#uni_pro_div_' + AddColNodes)
            .append(
                '<div style="display: inline-block; float:right;  width: 48%"><h5 class="card-title mb-0"><br>단위업무 ' +
                AddColNodes +
                ' 상세내역</h5><textarea type="text" id="requirement_def_detail_' + AddColNodes + '" name="uni_pro_desc_list" class="form-control requirement_def"></textarea></div>');

    };


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
                            <img src="./assets/images/unit_process_definition.png" alt="unit process definition" class="img-fluid rounded-circle mb-2" width="128" height="128">
                            <h5 class="card-title mb-0">단위 업무 정의 </h5>
                            <div class="text-muted mb-2">조직이 보유하고 있는 비즈니스 아키텍처(BA) 또는 사규, 업무분장 규정 등을 참고하여 개발 대상이 되는 단위 업무를 정의합니다. </div>

                        </div>



                        <br />
                        <hr class="my-0">

                        <div class="card-body text-center">
                            <form name="unitprocess_form" id="unitprocess_form">
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
                                <div class="uni_pro_div" id="uni_pro_div_1" style="border: 0px solid red; overflow: hidden">
                                    <div style="display: inline-block; float: left; width: 48%;">
                                        <h5 class="card-title mb-0">
                                            <br>단위업무 1
                                        </h5>
                                        <input type="text" id="uni_pro_def_1" name="uni_pro_list" class="form-control requirement_def" value="복지관리" placeholder="단위업무를 입력하세요">
                                    </div>
                                    <div style="display: inline-block; float: right; width: 48%">
                                        <h5 class="card-title mb-0">
                                            <br>단위업무 1 상세내역
                                        </h5>
                                        <textarea type="text" id="uni_pro_def_detail_1" name="uni_pro_desc_list" name="requirement_def_detail_1" class="form-control requirement_def"></textarea>
                                    </div>

                                </div>

                                <!--  row  -->
                                <div class="uni_pro_div" id="uni_pro_div_2" style="border: 0px solid red; overflow: hidden">
                                    <div style="display: inline-block; float: left; width: 48%;">
                                        <h5 class="card-title mb-0">
                                            <br>단위업무 2
                                        </h5>
                                        <input type="text" id="uni_pro_def_2" name="uni_pro_list" class="form-control requirement_def" value="승진관리" placeholder="단위업무를 입력하세요 ">
                                    </div>
                                    <div style="display: inline-block; float: right; width: 48%">
                                        <h5 class="card-title mb-0">
                                            <br>단위업무 2 상세내역
                                        </h5>
                                        <textarea type="text" id="uni_pro_def_detail_2" name="uni_pro_desc_list" class="form-control requirement_def"></textarea>
                                    </div>

                                </div>

                                <!--  row  -->
                                <div class="uni_pro_div" id="uni_pro_div_3" style="border: 0px solid red; overflow: hidden">
                                    <div style="display: inline-block; float: left; width: 48%;">
                                        <h5 class="card-title mb-0">
                                            <br>단위업무 3
                                        </h5>
                                        <input type="text" id="uni_pro_def_3" name="uni_pro_list" class="form-control requirement_def" value="채용관리" placeholder="단위업무를 입력하세요">
                                    </div>
                                    <div style="display: inline-block; float: right; width: 48%">
                                        <h5 class="card-title mb-0">
                                            <br>단위업무 3 상세내역
                                        </h5>
                                        <textarea type="text" id="uni_pro_def_detail_3" name="uni_pro_desc_list" class="form-control requirement_def"></textarea>
                                    </div>

                                </div>

                                <!--  row  -->
                                <div class="uni_pro_div" id="uni_pro_div_4" style="border: 0px solid red; overflow: hidden">
                                    <div style="display: inline-block; float: left; width: 48%;">
                                        <h5 class="card-title mb-0">
                                            <br>단위업무 4
                                        </h5>
                                        <input type="text" id="uni_pro_def_4" name="uni_pro_list" class="form-control requirement_def" value="근태관리" placeholder="단위업무를 입력하세요">
                                    </div>
                                    <div style="display: inline-block; float: right; width: 48%">
                                        <h5 class="card-title mb-0">
                                            <br>단위업무 4 상세내역
                                        </h5>
                                        <textarea type="text" id="uni_pro_def_detail_4" name="uni_pro_desc_list" class="form-control requirement_def"></textarea>
                                    </div>

                                </div>

                                <!--  row  -->
                                <div class="uni_pro_div" id="uni_pro_div_5" style="border: 0px solid red; overflow: hidden">
                                    <div style="display: inline-block; float: left; width: 48%;">
                                        <h5 class="card-title mb-0">
                                            <br>단위업무 5
                                        </h5>
                                        <input type="text" id="uni_pro_def_5" name="uni_pro_list" class="form-control requirement_def" value="급여관리" placeholder="단위업무를 입력하세요">
                                    </div>
                                    <div style="display: inline-block; float: right; width: 48%">
                                        <h5 class="card-title mb-0">
                                            <br>단위업무 5 상세내역
                                        </h5>
                                        <textarea type="text" id="uni_pro_def_detail_5" name="uni_pro_desc_list" class="form-control requirement_def"></textarea>
                                    </div>

                                </div>
                            </form>
                        </div>

                        <hr class="my-0">


                        <div class="card-body text-center">

                            <button type="button" class="btn btn-primary addColumn" onclick="addColumn();">추가하기</button>

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
