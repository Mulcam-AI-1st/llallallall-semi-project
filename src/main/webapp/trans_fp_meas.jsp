<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<jsp:include page="./header.jsp" />

<script>

	var form_name = "#trans_fp_form" //form 이름 
	var form_target = "./TransactionServlet" //post 대상 
	var page_subject = "트랜젝션 FP 측정" 
	var next_location = "./WeightedServlet"
	
	
    //로우 추가하기 
    function addColumn() {
        var NowColNodes = eval($(".trans_fp_div:last").attr('id').replace(
            "trans_fp_div_", ""));
        //alert(NowColNodes);
        if (NowColNodes < 1) {
            NowColNodes = 0;
        }
        var AddColNodes = Number(NowColNodes) + 1;
        //alert(AddColNodes);
        //메인이 되는 DIV를 먼저 추가한다.
        $('#trans_fp_div_wrapper')
            .append('<!--  row  -->')
            .append('<div class="trans_fp_div row" id="trans_fp_div_' + AddColNodes + '"  style="padding-bottom: 0px; padding-top: 15px; border-top: 1px dotted #ccc">')
            .append('</div>');
        //해당 DIV에 내용을 넣는다.
        $('#trans_fp_div_' + AddColNodes)
            .append('  <!-- row -->  ')
            .append('      <div style="display: inline-block; float: left; width: 33%;"> <div class="row">  <div class="col-lg-6"> <select name="uni_pro_list" id="process_' + AddColNodes + '" class="form-control">' +
                '                      <c:forEach var="up" items="${unitProcess_list}">' +
                '                          <option value="<c:out value=" ${up.uni_pro_num}" />">' +
                '                          <c:out value="${up.uni_pro_num}.${up.uni_pro}" />' +
                '                          </option>' +
                '                      </c:forEach> <!--  -->' +
                '                  </select>' +
                '              </div>' +
                '              <div class="col-lg-6">' +
                '                  <input type="text" class="form-control" id="function_' + AddColNodes + '" name="function" value="" placeholder="세부 기능을 입력하세요 ">' +
                '              </div>' +
                '          </div>' +
                '      </div>')

            .append('      <div style="display: inline-block; float: left; width: 33%;">' +
                '          <div class="col-lg-12">' +
                '              <select id="trans_fp_type_' + AddColNodes + '" name="trans_fp_type" class="form-control">' +
                '                  <option value="EI">외부입력(External Input : EI)</option>' +
                '                  <option value="EO">외부출력(External Output : EO)</option>' +
                '                  <option value="EQ">외부조회(External Inquery : EQ)</option>'

                +
                '              </select>' +
                '          </div>'

                +
                '      </div>')



            .append('      <div style="display: inline-block; float: left; width: 33%;">' +
                ' <div class="row removable">'

                +
                ' <div class="col-lg-4">'

                +
                ' <input type="number" id="ftrs_' + AddColNodes + '" name="ftrs" class="form-control" placeholder="FTRs">' +
                ' <input type="hidden" id="ftrs_status_' + AddColNodes + '" name="ftrs_status">'

                +
                ' </div>' +
                ' <div class="col-lg-4">'

                +
                ' <input type="number" id="dets_' + AddColNodes + '" name="dets" class="form-control" placeholder="DETs">' +
                ' <input type="hidden" id="dets_status_' + AddColNodes + '" name="dets_status">'

                +
                ' </div>'

                +
                ' <div class="col-lg-4">'

                +
                ' <input type="text" class="form-control" id="complexity_' + AddColNodes + '" name="complexity" value="" placeholder="복잡도" readonly>' +
                ' </div>'


                +
                ' </div>'

                +
                ' </div> ');



    };



    // id 'testBtn'이라는 버튼을 클릭 시 체크박스 검사.
    $(document).ready(function() {

        // rets, dets 변경시 complexity 자동 변경 
        var elem_id, ftrs_id, ftrs_status_id, dets_id, dets_status_id, trans_fp_type_id, complexity_id;

        $("#trans_fp_form input[type=number]").change(function() {

            elem_id = $(this).attr("id");
            //alert(elem_id);

            //id값 확인 및 세팅 
            if (elem_id.indexOf("ftrs") != -1) {
                //alert("ftrs");
                ftrs_id = "#" + elem_id;
                ftrs_status_id = "#ftrs_status" + elem_id.replace("ftrs", "")
                dets_id = "#dets" + elem_id.replace("ftrs", "");
                dets_status_id = "#dets_status" + elem_id.replace("ftrs", "");
                trans_fp_type_id = "#trans_fp_type" + elem_id.replace("ftrs", "");
                complexity_id = "#complexity" + elem_id.replace("ftrs", "");
            } else if (elem_id.indexOf("dets") != -1) {
                //alert("dets");
                ftrs_id = "#ftrs" + elem_id.replace("dets", "");
                ftrs_status_id = "#ftrs_status" + elem_id.replace("dets", "")
                dets_id = "#" + elem_id;
                dets_status_id = "#dets_status" + elem_id.replace("dets", "");
                trans_fp_type_id = "#trans_fp_type" + elem_id.replace("dets", "");
                complexity_id = "#complexity" + elem_id.replace("dets", "");
            }

            /*  alert(ftrs_id);
             alert(ftrs_status_id);
             alert(dets_id);
             alert(dets_status_id);
             alert(trans_fp_type_id);
             alert(complexity_id);
              */
            // hidden에 상태값 입력
            if ($(trans_fp_type_id).val() == "EI") {
                //alert("EI");
                if ($(ftrs_id).val() == 0 || $(ftrs_id).val() == 1) {
                    $(ftrs_status_id).val("low");
                } else if (($(ftrs_id).val() == 2)) {
                    $(ftrs_status_id).val("mid");

                } else if ($(ftrs_id).val() >= 3) {
                    $(ftrs_status_id).val("high");

                };

                if ($(dets_id).val() >= 1 && $(dets_id).val() <= 4) {

                    $(dets_status_id).val("low");

                } else if (($(dets_id).val() >= 5) && ($(dets_id).val() <= 15)) {
                    $(dets_status_id).val("mid");

                } else if ($(dets_id).val() >= 16) {
                    $(dets_status_id).val("high");
                };

                // 복잡도 세팅
                /* 		alert($(ftrs_status_id).val());
                	alert($(dets_status_id).val());
                	alert(complexity_id);
                	 */
                if (($(ftrs_status_id).val() == "low") && ($(dets_status_id).val() == "low")) $(complexity_id).val(3);
                if (($(ftrs_status_id).val() == "mid") && ($(dets_status_id).val() == "low")) $(complexity_id).val(4);
                if (($(ftrs_status_id).val() == "high") && ($(dets_status_id).val() == "low")) $(complexity_id).val(4);

                if (($(ftrs_status_id).val() == "low") && ($(dets_status_id).val() == "mid")) $(complexity_id).val(3);
                if (($(ftrs_status_id).val() == "mid") && ($(dets_status_id).val() == "mid")) $(complexity_id).val(4);
                if (($(ftrs_status_id).val() == "high") && ($(dets_status_id).val() == "mid")) $(complexity_id).val(6);

                if (($(ftrs_status_id).val() == "low") && ($(dets_status_id).val() == "high")) $(complexity_id).val(4);
                if (($(ftrs_status_id).val() == "mid") && ($(dets_status_id).val() == "high")) $(complexity_id).val(6);
                if (($(ftrs_status_id).val() == "high") && ($(dets_status_id).val() == "high")) $(complexity_id).val(6);

            } else if ($(trans_fp_type_id).val() == "EO") {
                //alert("EO");
                if ($(ftrs_id).val() == 0 || $(ftrs_id).val() == 1) {
                    $(ftrs_status_id).val("low");
                } else if (($(ftrs_id).val() == 2) || ($(ftrs_id).val() == 3)) {
                    $(ftrs_status_id).val("mid");

                } else if ($(ftrs_id).val() >= 4) {
                    $(ftrs_status_id).val("high");
                };

                if ($(dets_id).val() >= 1 && $(dets_id).val() <= 5) {
                    $(dets_status_id).val("low");
                } else if (($(dets_id).val() >= 6) && ($(dets_id).val() <= 19)) {
                    $(dets_status_id).val("mid");

                } else if ($(dets_id).val() >= 20) {
                    $(dets_status_id).val("high");
                };

                // 복잡도 세팅

                if (($(ftrs_status_id).val() == "low") && ($(dets_status_id).val() == "low")) $(complexity_id).val(4);
                if (($(ftrs_status_id).val() == "mid") && ($(dets_status_id).val() == "low")) $(complexity_id).val(4);
                if (($(ftrs_status_id).val() == "high") && ($(dets_status_id).val() == "low")) $(complexity_id).val(5);

                if (($(ftrs_status_id).val() == "low") && ($(dets_status_id).val() == "mid")) $(complexity_id).val(4);
                if (($(ftrs_status_id).val() == "mid") && ($(dets_status_id).val() == "mid")) $(complexity_id).val(5);
                if (($(ftrs_status_id).val() == "high") && ($(dets_status_id).val() == "mid")) $(complexity_id).val(7);

                if (($(ftrs_status_id).val() == "low") && ($(dets_status_id).val() == "high")) $(complexity_id).val(5);
                if (($(ftrs_status_id).val() == "mid") && ($(dets_status_id).val() == "high")) $(complexity_id).val(7);
                if (($(ftrs_status_id).val() == "high") && ($(dets_status_id).val() == "high")) $(complexity_id).val(7);



            } else if ($(trans_fp_type_id).val() == "EQ") {
                //alert("EQ");
                if ($(ftrs_id).val() == 1) {
                    $(ftrs_status_id).val("low");
                } else if (($(ftrs_id).val() == 2) || ($(ftrs_id).val() == 3)) {
                    $(ftrs_status_id).val("mid");

                } else if ($(ftrs_id).val() >= 4) {
                    $(ftrs_status_id).val("high");
                };

                if ($(dets_id).val() >= 1 && $(dets_id).val() <= 5) {
                    $(dets_status_id).val("low");
                } else if (($(dets_id).val() >= 6) && ($(dets_id).val() <= 19)) {
                    $(dets_status_id).val("mid");

                } else if ($(dets_id).val() >= 20) {
                    $(dets_status_id).val("high");
                };

                // 복잡도 세팅

                if (($(ftrs_status_id).val() == "low") && ($(dets_status_id).val() == "low")) $(complexity_id).val(3);
                if (($(ftrs_status_id).val() == "mid") && ($(dets_status_id).val() == "low")) $(complexity_id).val(4);
                if (($(ftrs_status_id).val() == "high") && ($(dets_status_id).val() == "low")) $(complexity_id).val(4);

                if (($(ftrs_status_id).val() == "low") && ($(dets_status_id).val() == "mid")) $(complexity_id).val(3);
                if (($(ftrs_status_id).val() == "mid") && ($(dets_status_id).val() == "mid")) $(complexity_id).val(4);
                if (($(ftrs_status_id).val() == "high") && ($(dets_status_id).val() == "mid")) $(complexity_id).val(6);

                if (($(ftrs_status_id).val() == "low") && ($(dets_status_id).val() == "high")) $(complexity_id).val(4);
                if (($(ftrs_status_id).val() == "mid") && ($(dets_status_id).val() == "high")) $(complexity_id).val(6);
                if (($(ftrs_status_id).val() == "high") && ($(dets_status_id).val() == "high")) $(complexity_id).val(6);



            };


        });
        
        //data_fp_type rets dets

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
                            <h5 class="card-title mb-0">측정 단계</h5>
                        </div>
                        <div class="card-body text-center">
                            <img src="./assets/images/transaction_fp.png" alt="transaction fp" class="img-fluid rounded-circle mb-2" width="128" height="128">
                            <h5 class="card-title mb-0">트랜젝션 기능점수(FP) 측정</h5>
                            <div class="text-muted mb-2">

                                트랜잭션 기능은 사용자에게 의미있는 데이터를 처리하는 기능을 제공하는 단위프로세스의 집합을 말한다.<br>
                                <strong>외부입력(EI), 외부출력(EO), 외부조회(EQ)</strong> 기능으로 구분되어 기능점수로
                                산정된다.<br> <br> <strong>외부입력(EI), 외부출력(EO),
                                    외부조회(EQ)</strong><br> <br>
                                <div style="text-align: left; padding-left: 40px; padding-right: 40px;">
                                    ● 개발대상 소프트웨어의 외부입력(EI), 외부출력(EO), 외부조회(EQ) 기능을 식별하고, 각각의 개수를
                                    산정한다.<br> <br> ● <strong>외부입력(External Input
                                        : EI)</strong> :애플리케이션 경계 밖에서 들어오는 데이터나 제어정보를 처리하는 단위프로세스로서, 하나 이상의
                                    논리파일을 변경하거나 시스템 동작을 변경함 <br> &nbsp;&nbsp;&nbsp;&nbsp;- 하나
                                    이상의 논리파일 변경해야하며, ∆∆ 등록, ∆∆ 수정, ∆∆ 삭제, ∆∆ 설정, ∆∆ 승인 등 단위프로세스 실행
                                    시 특정 논리파일이 변경되는 활동을 의미한다.<br> &nbsp;&nbsp;&nbsp;&nbsp;-
                                    시스템 동작을 변경해야하며, 특정 시점에 수행되던 단위프로세스가 업무환경 변경에 따라단위프로세스 실행 시점이
                                    변경되는 활동을 의미한다.<br> &nbsp;&nbsp;&nbsp;&nbsp;- (예 : 급여지급
                                    주기가 격주금요일에서 매월 15일과 말일로 변경된 경우)<br> <br> ● <strong>외부출력(External
                                        Output : EO):</strong> 외부조회에 추가적인 처리로직을 포함하여 데이터나 제어정보를 애플리케이션 경계 밖으로
                                    보여주는 단위프로세스<br> &nbsp;&nbsp;&nbsp;&nbsp;- 처리로직은 하나 이상의
                                    수학적계산, 공식 또는 파생 데이터를 포함하거나, 하나 이상의 내부논리파일(ILF)을 유지하거나, 시스템의 동작
                                    변경을 수행해야 함<br> &nbsp;&nbsp;&nbsp;&nbsp;- (예 : 월간 판매실적
                                    집계조회)<br> <br> ● <strong>외부조회(External
                                        Inquery : EQ):</strong> 데이터나 제어정보를 애플리케이션 경계 밖으로 보여주는 단위프로세스로서, 데이터나
                                    제어정보를 단순히 검색하여 사용자에게 제공함<br> &nbsp;&nbsp;&nbsp;&nbsp;-
                                    외부조회는 4가지처리로직인 수학적 계산이나 공식을 사용하지 않으며, 파생 데이터도 생성하지 않음<br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;- 처리 과정에서 내부논리파일(ILF)을 유지하지 않으며 시스템의
                                    동작도 변경하지 않음<br> &nbsp;&nbsp;&nbsp;&nbsp;- (예 : 게시판 조회,
                                    게시판 목록조회)<br> <br>
                                    <button type="button" class="btn btn-primary transaction_example_btn">트랜젝션
                                        기능식별 사례 보기</button> <br>
                                    <div class="transaction_example" style="display: none;">
                                        <img src="./assets/images/transaction_example.png" style="width: 100%; height: 100%;" />
                                    </div>
                                </div>

                            </div>

                            <hr class="my-0">

                            <div class="card-body">

                                <h5 class="h6 card-title">트랜잭션 유형별 기능 수 분석 방법</h5>

                                <div class="container-fluid p-0">
                                    <div class="row removable">
                                        <div class="col-lg-6">

                                            <label>참조파일유형(FTR)의 개수 판단 기준 </label>
                                            <div style="text-align: left; padding-left: 40px; padding-right: 40px;">
                                                ● 정보가 실제로 저장되는 논리테이블 개수 (즉 테이블 개수) <br> ● 외부입력(EI)기능을
                                                수행하는 동안에 참조하는 논리테이블 수 <br> &nbsp;&nbsp;&nbsp;&nbsp;- (예
                                                : 회원등록기능은 사용자마스터테이블에 정보가 저장되므로 FTR = 1)<br>

                                            </div>
                                        </div>

                                        <div class="col-lg-6">

                                            <label>데이터요소유형(DET)의 개수 판단 기준 </label>
                                            <div style="text-align: left; padding-left: 40px; padding-right: 40px;">
                                                ● 사용자에게 의미있는 데이터를 처리하는 과정에서 사용자가 입력 또는 조작하는 요소 <br> ●
                                                데이터 정보(Input 필드), 기능버튼(체크 버튼의 경우 버튼 갯수,라디오 버튼의 경우 DET 1개로
                                                취급,콤보박스, Message 개수(에러메시지,확인메시지, 버튼에 메시지(alert)를 포함하는 경우,
                                                DET 2개로 취급, 단 Notification Message는 제외) <br>
                                                &nbsp;&nbsp;&nbsp;&nbsp;- 게시판 화면의 첨부파일 등록은 기능으로 취급하지 않는다.

                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </div>

                            <hr class="my-0">
                            <div class="container-fluid p-0">
                                <form name="trans_fp_form" id="trans_fp_form">


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

                                    <div class="row removable">
                                        <div class="col-lg-12">
                                            <div class="card flex-fill w-100">

                                                <div class="card-body" id="trans_fp_div_wrapper">

                                                    <!-- row 1 -->
                                                    <div class="trans_fp_div row" id="trans_fp_div_1" style="padding-bottom: 0px; margin-top: -20px; margin-bottom: 10px;">


                                                        <div style="display: inline-block; float: left; width: 33%;">

                                                            <div class="large-3 columns">
                                                                <span data-tooltip="" class="has-tip" data-selector="tooltip-kqsr7tzbm" title="">단위업무를 선택하고 세부 기능을 입력하세요 </span>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <select name="uni_pro_list" id="process_1" class="form-control">
                                                                        <c:forEach var="up" items="${unitProcess_list}">
                                                                            <option value="<c:out value=" ${up.uni_pro_num}" />">
                                                                            <c:out value="${up.uni_pro_num}.${up.uni_pro}" />
                                                                            </option>
                                                                        </c:forEach> <!--  -->
                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <input type="text" class="form-control" id="function_1" name="function" value="" placeholder="세부 기능을 입력하세요 ">
                                                                </div>
                                                            </div>


                                                        </div>
                                                        <div style="display: inline-block; float: left; width: 33%;">



                                                            <div class="large-3 columns">
                                                                <span data-tooltip="" class="has-tip" data-selector="tooltip-kqsr7tzbm" title="">트랜젝션
                                                                    기능점수 유형을 선택하세요 </span>
                                                            </div>
                                                            <div class="col-lg-12">
                                                                <select id="trans_fp_type_1" name="trans_fp_type" class="form-control">
                                                                    <option value="EI">외부입력(External Input : EI)</option>
                                                                    <option value="EO">외부출력(External Output : EO)</option>
                                                                    <option value="EQ">외부조회(External Inquery : EQ)</option>

                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div style="display: inline-block; float: left; width: 33%;">
                                                            <div class="large-3 columns">
                                                                <span data-tooltip="" class="has-tip" data-selector="tooltip-kqsr7tzbm" title="">유형별 기능 수를 입력하세요 </span>
                                                            </div>
                                                            <div class="row removable">

                                                                <div class="col-lg-4">

                                                                    <input type="number" id="ftrs_1" name="ftrs" class="form-control" placeholder="FTRs">
                                                                    <input type="text" class="form-control" id="ftrs_status_1" name="ftrs_status" readonly>

                                                                </div>
                                                                <div class="col-lg-4">

                                                                    <input type="number" id="dets_1" name="dets" class="form-control" placeholder="DETs">
                                                                    <input type="text" class="form-control" id="dets_status_1" name="dets_status" readonly>

                                                                </div>

                                                                <div class="col-lg-4">

                                                                    <input type="text" class="form-control" id="complexity_1" name="complexity" value="" placeholder="복잡도" readonly>
                                                                </div>


                                                            </div>

                                                        </div>

                                                    </div>


                                                    <!-- row 2 -->
                                                    <div class="trans_fp_div row" id="trans_fp_div_2" style="padding-bottom: 0px; padding-top: 15px; border-top: 1px dotted #ccc">


                                                        <div style="display: inline-block; float: left; width: 33%;">

                                                            <div class="row">

                                                                <div class="col-lg-6">
                                                                    <select name="uni_pro_list" id="process_2" class="form-control">
                                                                        <c:forEach var="up" items="${unitProcess_list}">
                                                                            <option value="<c:out value=" ${up.uni_pro_num}" />">
                                                                            <c:out value="${up.uni_pro_num}.${up.uni_pro}" />
                                                                            </option>
                                                                        </c:forEach> <!--  -->
                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <input type="text" class="form-control" id="function_2" name="function" value="" placeholder="세부 기능을 입력하세요 ">
                                                                </div>

                                                            </div>

                                                        </div>
                                                        <div style="display: inline-block; float: left; width: 33%;">


                                                            <div class="col-lg-12">
                                                                <select id="trans_fp_type_2" name="trans_fp_type" class="form-control">
                                                                    <option value="EI">외부입력(External Input : EI)</option>
                                                                    <option value="EO">외부출력(External Output : EO)</option>
                                                                    <option value="EQ">외부조회(External Inquery : EQ)</option>

                                                                </select>
                                                            </div>

                                                        </div>
                                                        <div style="display: inline-block; float: left; width: 33%;">

                                                            <div class="row removable">

                                                                <div class="col-lg-4">

                                                                    <input type="number" id="ftrs_2" name="ftrs" class="form-control" placeholder="FTRs">
                                                                    <input type="text" class="form-control" id="ftrs_status_2" name="ftrs_status" readonly>

                                                                </div>
                                                                <div class="col-lg-4">

                                                                    <input type="number" id="dets_2" name="dets" class="form-control" placeholder="DETs">
                                                                    <input type="text" class="form-control" id="dets_status_2" name="dets_status" readonly>

                                                                </div>

                                                                <div class="col-lg-4">

                                                                    <input type="text" class="form-control" id="complexity_2" name="complexity" value="" placeholder="복잡도" readonly>
                                                                </div>


                                                            </div>

                                                        </div>


                                                    </div>

                                                    <!-- row 3 -->
                                                    <div class="trans_fp_div row" id="trans_fp_div_3" style="padding-bottom: 0px; padding-top: 15px; border-top: 1px dotted #ccc">

                                                        <div style="display: inline-block; float: left; width: 33%;">

                                                            <div class="row">

                                                                <div class="col-lg-6">
                                                                    <select name="uni_pro_list" id="process_3" class="form-control">
                                                                        <c:forEach var="up" items="${unitProcess_list}">
                                                                            <option value="<c:out value=" ${up.uni_pro_num}" />">
                                                                            <c:out value="${up.uni_pro_num}.${up.uni_pro}" />
                                                                            </option>
                                                                        </c:forEach> <!--  -->
                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <input type="text" class="form-control" id="function_3" name="function" value="" placeholder="세부 기능을 입력하세요 ">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div style="display: inline-block; float: left; width: 33%;">


                                                            <div class="col-lg-12">
                                                                <select id="trans_fp_type_3" name="trans_fp_type" class="form-control">
                                                                    <option value="EI">외부입력(External Input : EI)</option>
                                                                    <option value="EO">외부출력(External Output : EO)</option>
                                                                    <option value="EQ">외부조회(External Inquery : EQ)</option>

                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div style="display: inline-block; float: left; width: 33%;">

                                                            <div class="row removable">

                                                                <div class="col-lg-4">

                                                                    <input type="number" id="ftrs_3" name="ftrs" class="form-control" placeholder="FTRs">
                                                                    <input type="text" class="form-control" id="ftrs_status_3" name="ftrs_status" readonly>

                                                                </div>
                                                                <div class="col-lg-4">

                                                                    <input type="number" id="dets_3" name="dets" class="form-control" placeholder="DETs">
                                                                    <input type="text" class="form-control" id="dets_status_3" name="dets_status" readonly>

                                                                </div>

                                                                <div class="col-lg-4">

                                                                    <input type="text" class="form-control" id="complexity_3" name="complexity" value="" placeholder="복잡도" readonly>
                                                                </div>


                                                            </div>


                                                        </div>


                                                    </div>


                                                    <!-- row 4 -->
                                                    <div class="trans_fp_div row" id="trans_fp_div_4" style="padding-bottom: 0px; padding-top: 15px; border-top: 1px dotted #ccc">

                                                        <div style="display: inline-block; float: left; width: 33%;">

                                                            <div class="row">
                                                                <div class="col-lg-6">

                                                                    <select name="uni_pro_list" id="process_4" class="form-control">
                                                                        <c:forEach var="up" items="${unitProcess_list}">
                                                                            <option value="<c:out value=" ${up.uni_pro_num}" />">
                                                                            <c:out value="${up.uni_pro_num}.${up.uni_pro}" />
                                                                            </option>
                                                                        </c:forEach> <!--  -->
                                                                    </select>

                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <input type="text" class="form-control" id="function_4" name="function" value="" placeholder="세부 기능을 입력하세요 ">
                                                                </div>

                                                            </div>

                                                        </div>
                                                        <div style="display: inline-block; float: left; width: 33%;">


                                                            <div class="col-lg-12">
                                                                <select id="trans_fp_type_4" name="trans_fp_type" class="form-control">
                                                                    <option value="EI">외부입력(External Input : EI)</option>
                                                                    <option value="EO">외부출력(External Output : EO)</option>
                                                                    <option value="EQ">외부조회(External Inquery : EQ)</option>

                                                                </select>
                                                            </div>


                                                        </div>
                                                        <div style="display: inline-block; float: left; width: 33%;">



                                                            <div class="row removable">

                                                                <div class="col-lg-4">

                                                                    <input type="number" id="ftrs_4" name="ftrs" class="form-control" placeholder="FTRs">
                                                                    <input type="text" class="form-control" id="ftrs_status_4" name="ftrs_status" readonly>

                                                                </div>
                                                                <div class="col-lg-4">

                                                                    <input type="number" id="dets_4" name="dets" class="form-control" placeholder="DETs">
                                                                    <input type="text" class="form-control" id="dets_status_4" name="dets_status" readonly>

                                                                </div>

                                                                <div class="col-lg-4">

                                                                    <input type="text" class="form-control" id="complexity_4" name="complexity" value="" placeholder="복잡도" readonly>
                                                                </div>


                                                            </div>

                                                        </div>

                                                    </div>

                                                    <!--  새로운 로우 삽입 위치  -->
                                
                            </div>
                        </div>
                    </div>

                </div>
            </form>
        </div>
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
    </div>
    </main>
    <!-- Footer -->
    <jsp:include page="./footer.jsp" />
