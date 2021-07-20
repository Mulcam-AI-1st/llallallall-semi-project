<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!-- header -->
<jsp:include page="./header.jsp" />
<script>

	var form_name = "#requirement_form" //form 이름 
	var form_target = "./RequirementServlet" //post 대상 
	var page_subject = "요구 사항 정보 제출" 
	var next_location = "./UnitprocessServlet"


    function addColumn() {
        var NowColNodes = eval($(".req_def_div:last").attr('id').replace(
            "req_def_div_", ""));
        //alert(NowColNodes);
        if (NowColNodes < 1) {
            NowColNodes = 0;
        }
        var AddColNodes = Number(NowColNodes) + 1;
        //alert(AddColNodes);
        //메인이 되는 DIV를 먼저 추가한다.
        $('#requirement_form')
            .append('<!--  row  -->')
            .append(
                '<div class="req_def_div" id="req_def_div_' + AddColNodes + '"  style="border:0px solid red;overflow:hidden" >')
            .append('</div>');
        //해당 DIV에 내용을 넣는다.
        $('#req_def_div_' + AddColNodes)
            .append(
                '<div style="display: inline-block; float:left; width: 48%;"><h5 class="card-title mb-0"><br>요구사항 ' +
                AddColNodes +
                '</h5><input type="text" id="requirement_def_' + AddColNodes + '" name="requirement_list"  class="form-control requirement_def" placeholder="Input"></div>')
        $('#req_def_div_' + AddColNodes)
            .append(
                '<div style="display: inline-block; float:right;  width: 48%"><h5 class="card-title mb-0"><br>요구사항 ' +
                AddColNodes +
                ' 상세내역</h5><textarea type="text" id="requirement_def_detail_' + AddColNodes + '" name="requirement_desc_list"  class="form-control requirement_def"></textarea></div>');

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
                            <h5 class="card-title mb-0">사전 단계</h5>
                        </div>
                        <div class="card-body text-center">
                            <img src="./assets/images/requirement_definition.png" alt="requirement definition" class="img-fluid rounded-circle mb-2" width="128" height="128">
                            <h5 class="card-title mb-0">기능 요구사항 정의</h5>
                            <div class="text-muted mb-2">
                                개발대상 소프트웨어에 대한 <strong><u>기능적 요구사항</u></strong>을 정의합니다.<br>개발대상
                                업무에 대한 분석을 통하여 기능점수 산정이 가능한 수준으로 소프트웨어의 구성요소 및 구성요소별로 요구되는 기능을
                                상세히 분석하고 정의합니다.
                            </div>

                        </div>

                        <hr class="my-0">

                        <div class="card-body text-center">
                            <form name="requirement_form" id="requirement_form">
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
                                <br />

                                <!--  row  -->
                                <div class="req_def_div" id="req_def_div_1" style="border: 0px solid red; overflow: hidden">
                                    <div style="display: inline-block; float: left; width: 48%;">
                                        <h5 class="card-title mb-0">
                                            <br>요구사항 1
                                        </h5>
                                        <input type="text" id="requirement_def_1" name="requirement_list" class="form-control requirement_def" placeholder="요구사항을 입력하세요" value="요리하기">
                                    </div>
                                    <div style="display: inline-block; float: right; width: 48%">
                                        <h5 class="card-title mb-0">
                                            <br>요구사항 1 상세내역
                                        </h5>
                                        <textarea type="text" id="requirement_def_detail_1" name="requirement_desc_list" class="form-control requirement_def">요리잘한다.</textarea>
                                    </div>

                                </div>

                                <!--  row  -->
                                <div class="req_def_div" id="req_def_div_2" style="border: 0px solid red; overflow: hidden">
                                    <div style="display: inline-block; float: left; width: 48%;">
                                        <h5 class="card-title mb-0">
                                            <br>요구사항 2
                                        </h5>
                                        <input type="text" id="requirement_def_2" name="requirement_list" class="form-control requirement_def" placeholder="요구사항을 입력하세요" value="공부하기 ">
                                    </div>
                                    <div style="display: inline-block; float: right; width: 48%">
                                        <h5 class="card-title mb-0">
                                            <br>요구사항 2 상세내역
                                        </h5>
                                        <textarea type="text" id="requirement_def_detail_2" name="requirement_desc_list" class="form-control requirement_def">공부잘한다.</textarea>
                                    </div>

                                </div>

                                <!--  row  -->
                                <div class="req_def_div" id="req_def_div_3" style="border: 0px solid red; overflow: hidden">
                                    <div style="display: inline-block; float: left; width: 48%;">
                                        <h5 class="card-title mb-0">
                                            <br>요구사항 3
                                        </h5>
                                        <input type="text" id="requirement_def_3" name="requirement_list" class="form-control requirement_def" placeholder="요구사항을 입력하세요" value="청소하기 ">
                                    </div>
                                    <div style="display: inline-block; float: right; width: 48%">
                                        <h5 class="card-title mb-0">
                                            <br>요구사항 3 상세내역
                                        </h5>
                                        <textarea type="text" id="requirement_def_detail_3" name="requirement_desc_list" class="form-control requirement_def">청소잘한다.</textarea>
                                    </div>

                                </div>

                                <!--  row  -->
                                <div class="req_def_div" id="req_def_div_4" style="border: 0px solid red; overflow: hidden">
                                    <div style="display: inline-block; float: left; width: 48%;">
                                        <h5 class="card-title mb-0">
                                            <br>요구사항 4
                                        </h5>
                                        <input type="text" id="requirement_def_4" name="requirement_list" class="form-control requirement_def" placeholder="요구사항을 입력하세요" value="놀기 ">
                                    </div>
                                    <div style="display: inline-block; float: right; width: 48%">
                                        <h5 class="card-title mb-0">
                                            <br>요구사항 4 상세내역
                                        </h5>
                                        <textarea type="text" id="requirement_def_detail_4" name="requirement_desc_list" class="form-control requirement_def">잘논다.</textarea>
                                    </div>

                                </div>

                                <!--  row  -->
                                <div class="req_def_div" id="req_def_div_5" style="border: 0px solid red; overflow: hidden">
                                    <div style="display: inline-block; float: left; width: 48%;">
                                        <h5 class="card-title mb-0">
                                            <br>요구사항 5
                                        </h5>
                                        <input type="text" id="requirement_def_5" name="requirement_list" class="form-control requirement_def" placeholder="요구사항을 입력하세요" value="노래하기 ">
                                    </div>
                                    <div style="display: inline-block; float: right; width: 48%">
                                        <h5 class="card-title mb-0">
                                            <br>요구사항 5 상세내역
                                        </h5>
                                        <textarea type="text" id="requirement_def_detail_5" name="requirement_desc_list" class="form-control requirement_def">노래잘한다.</textarea>
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
