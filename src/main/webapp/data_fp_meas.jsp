<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<jsp:include page="./header.jsp" />
<script>

	var form_name = "#data_fp_form" //form 이름 
	var form_target = "./DataServlet" //post 대상 
	var page_subject = "데이터 FP 측정" 
	var next_location = "./TransactionServlet"
		
	
	
    // 로우 추가하기
    function addColumn() {
        var NowColNodes = eval($(".data_fp_div:last").attr('id').replace(
            "data_fp_div_", ""));
        //alert(NowColNodes);
        if (NowColNodes < 1) {
            NowColNodes = 0;
        }
        var AddColNodes = Number(NowColNodes) + 1;
        //alert(AddColNodes);
        //메인이 되는 DIV를 먼저 추가한다.
        $('#data_fp_div_wrapper')
            .append('<!--  row  -->')
            .append('<div class="data_fp_div row" id="data_fp_div_' + AddColNodes + '" style="padding-bottom: 0px; padding-top: 15px; border-top: 1px dotted #ccc">')
            .append('</div>');

        //해당 DIV에 내용을 넣는다.
        $('#data_fp_div_' + AddColNodes)
            .append(' <div style="display: inline-block; float: left; width: 33%;">'
            	     +' <div class="row removable">'
                     +' <div class="col-lg-6">'
                         +' <select name="uni_pro_list" id="process_' + AddColNodes + '" class="form-control">'
                         +'                      <c:forEach var="up" items="${unitProcess_list}">' 
                         +'                          <option value="<c:out value=" ${up.uni_pro_num}" />">' 
                         +'                          <c:out value="${up.uni_pro_num}.${up.uni_pro}" />' 
                         +'                          </option>' 
                         +'                      </c:forEach> <!--  -->' 
                         +'                  </select>' 
                         +' </div>'
                     +' <div class="col-lg-6">'
                         +' <input type="text" class="form-control" id="function" name="function" value="" placeholder="세부 기능을 입력하세요 ">'
                         +' </div>'
                     +' </div>'
                 +' </div>'
             +' <div style="display: inline-block; float: left; width: 33%;">'
                 +' <div class="col-lg-12">'
                     +' <select name="data_fp_type" id="data_fp_type_' + AddColNodes + '" class="form-control">'
                         +' <option value="ILF">내부논리파일 (Internal Logical File: ILF)</option>'
                         +' <option value="EIF">외부연계파일 (External Interface File: EIF)</option>'
                         +' </select>'
                     +' </div>'
                 +' </div>'
             +' <div style="display: inline-block; float: left; width: 33%;">'
                 +' <div class="row removable">'
                     +' <div class="col-lg-4">'
                         +' <input type="number" class="form-control" id="rets_' + AddColNodes + '" name="rets" value="" placeholder="RETs">'
                         +' <input type="hidden" id="rets_status_' + AddColNodes + '" name="rets_status">'
                         +' </div>'
                     +' <div class="col-lg-4">'
                         +' <input type="number" class="form-control" id="dets_' + AddColNodes + '" name="dets" value="" placeholder="DETs">'
                         +' <input type="hidden" id="dets_status_' + AddColNodes + '" name="dets_status">'
                         +' </div>'
                     +' <div class="col-lg-4">'
                         +' <input type="text" class="form-control" id="complexity_' + AddColNodes + '" name="complexity" value="" placeholder="복잡도" readonly>'
                         +' </div>'
                     +' </div>'
                 +' </div>');

        
    };
    
    // id 'testBtn'이라는 버튼을 클릭 시 체크박스 검사.
    $(document).ready(function() {

        // rets, dets 변경시 complexity 자동 변경 
        var elem_id, rets_id, dets_id, data_fp_type_id, complexity_id;

        $("#data_fp_form input[type=number]").change(function() {

            elem_id = $(this).attr("id");
            //alert(elem_id);
            //id값 확인 및 세팅 
            if (elem_id.indexOf("rets") != -1) {
                //alert("rets");
                rets_id = "#" + elem_id;
                rets_status_id = "#rets_status" + elem_id.replace("rets", "")
                dets_id = "#dets" + elem_id.replace("rets", "");
                dets_status_id = "#dets_status" + elem_id.replace("rets", "");
                data_fp_type_id = "#data_fp_type" + elem_id.replace("rets", "");
                complexity_id = "#complexity" + elem_id.replace("rets", "");
            } else if (elem_id.indexOf("dets") != -1) {
                //alert("dets");
                rets_id = "#rets" + elem_id.replace("dets", "");
                rets_status_id = "#rets_status" + elem_id.replace("dets", "")
                dets_id = "#" + elem_id;
                dets_status_id = "#dets_status" + elem_id.replace("dets", "");
                data_fp_type_id = "#data_fp_type" + elem_id.replace("dets", "");
                complexity_id = "#complexity" + elem_id.replace("dets", "");
            }
            // hidden에 상태값 입력
            if ($(data_fp_type_id).val() == "ILF") {
                //alert("ILF");
                if ($(rets_id).val() == 1) {
                    $(rets_status_id).val("low");
                } else if (($(rets_id).val() >= 2) && ($(rets_id).val() <= 5)) {
                    $(rets_status_id).val("mid");

                } else if ($(rets_id).val() >= 6) {
                    $(rets_status_id).val("high");

                };

                if ($(dets_id).val() >= 1 && $(dets_id).val() <= 19) {

                    $(dets_status_id).val("low");

                } else if (($(dets_id).val() >= 20) && ($(dets_id).val() <= 50)) {
                    $(dets_status_id).val("mid");

                } else if ($(dets_id).val() >= 51) {
                    $(dets_status_id).val("high");
                };

            } else if ($(data_fp_type_id).val() == "EIF") {
                //alert("EIF");
                if ($(rets_id).val() == 1) {
                    $(rets_status_id).val("low");
                } else if (($(rets_id).val() >= 2) && ($(rets_id).val() <= 5)) {
                    $(rets_status_id).val("mid");

                } else if ($(rets_id).val() >= 6) {
                    $(rets_status_id).val("high");
                };

                if ($(dets_id).val() >= 1 && $(dets_id).val() <= 19) {
                    $(dets_status_id).val("low");
                } else if (($(dets_id).val() >= 20) && ($(dets_id).val() <= 50)) {
                    $(dets_status_id).val("mid");

                } else if ($(dets_id).val() >= 51) {
                    $(dets_status_id).val("high");
                };
            };

            // 복잡도 세팅

            if (($(rets_status_id).val() == "low") && ($(dets_status_id).val() == "low")) $(complexity_id).val(7);
            if (($(rets_status_id).val() == "mid") && ($(dets_status_id).val() == "low")) $(complexity_id).val(7);
            if (($(rets_status_id).val() == "high") && ($(dets_status_id).val() == "low")) $(complexity_id).val(10);

            if (($(rets_status_id).val() == "low") && ($(dets_status_id).val() == "mid")) $(complexity_id).val(7);
            if (($(rets_status_id).val() == "mid") && ($(dets_status_id).val() == "mid")) $(complexity_id).val(10);
            if (($(rets_status_id).val() == "high") && ($(dets_status_id).val() == "mid")) $(complexity_id).val(15);

            if (($(rets_status_id).val() == "low") && ($(dets_status_id).val() == "high")) $(complexity_id).val(10);
            if (($(rets_status_id).val() == "mid") && ($(dets_status_id).val() == "high")) $(complexity_id).val(15);
            if (($(rets_status_id).val() == "high") && ($(dets_status_id).val() == "high")) $(complexity_id).val(15);

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
                            <img src="./assets/images/data_fp.png" alt="data fp" class="img-fluid rounded-circle mb-2" width="128" height="128">
                            <h5 class="card-title mb-0">데이터 기능점수(FP) 측정</h5>
                            <div class="text-muted mb-2">



                                데이터 기능점수 측정은 사용자의 내부 및 외부 데이터 요구사항을 충족시키기 위한 기능량을 말한다.<br>
                                데이터 기능점수 측정에는 <strong>내부논리파일(ILF)</strong>과 <strong>외부연계파일(EIF)</strong>의
                                두 가지 유형이 있다.<br> <br> <strong>내부논리파일(ILF)과
                                    외부연계파일(EIF) 식별</strong><br> <br>
                                <div style="text-align: left; padding-left: 40px; padding-right: 40px;">
                                    ● 개발대상 소프트웨어에서 내부논리파일과 외부연계파일을 식별하고, 각각의 개수를 산정한다. 내부논리파일과
                                    외부연계파일은 다음과 같이 식별한다.<br> ● <strong>내부논리파일
                                        (Internal Logical File: ILF):</strong> 측정대상 애플리케이션 내부에서 유지되는 파일 <br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;- (예: 애플리케이션 내부에서 유지되는 <strong>직원정보</strong>)<br>
                                    ● <strong>외부연계파일 (External Interface File: EIF):</strong> 측정 대상
                                    애플리케이션 내부에서는 오직 참조만 되고 다른 애플리케이션에서 유지되는 파일<br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;- (예: 측정대상 애플리케이션 내부에서 오직 참조용으로 사용하고 다른
                                    애플리 케이션 내부에서 유지되는 <strong>거래처주소정보</strong>)<br> <br>
                                    <strong>데이터 기능 식별 방법</strong> <br> ● 사업초기(예산수립, 계약 및 요건분석
                                    단계) 데이터 기능 식별 방법<br> &nbsp;&nbsp;&nbsp;&nbsp;- 트랜잭션 기능(단위
                                    프로세스)을 이용한 논리파일 식별 방법임<br> &nbsp;&nbsp;&nbsp;&nbsp;-
                                    애플리케이션 경계 내에서 단위 프로세스가 엔티티를 유지하는 방식을 검토한다. <br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;- (예 : 직원정보 등록, 직원정보 수정, 직원정보 삭제 <strong>단위
                                        프로세스가 존재한다면 데이터 유지관리를 위한 직원정보 엔티티가 필요함</strong>)<br> ● 데이터 설계
                                    산출물(설계 완료 이후)을 활용한 데이터 기능 식별 방법<br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;- 엔티티관계도(ERD), 테이블(파일) 목록 및 테이블 정의서 등
                                    데이터 설계 산출물을 이용한 논리파일 식별 방법임<br> &nbsp;&nbsp;&nbsp;&nbsp;-
                                    엔티티 종속성과 독립성 판단을 통해 논라파일을 식별한다.<br>
                                </div>

                            </div>


                        </div>
                        <hr class="my-0">
                        <div class="card-body  text-center">

                            <h5 class="h6 card-title">데이터 유형별 기능 수 분석 방법</h5>

                            <div class="container-fluid p-0">
                                <div class="row removable">
                                    <div class="col-lg-6">

                                        <label>레코드요소유형(RET)의 개수 판단 기준 </label>
                                        <div style="text-align: left; padding-left: 40px; padding-right: 40px;">
                                            ● 내부논리파일이나 외부연계파일 내에 데이터 서브그룹이 없다면 하나의
                                            레코드요소 유형으로 식별한다<br> ● 내부논리파일이나 외부연계파일 내에 데이터 서브그룹이 있다면,
                                            각각의 데이터 서브그룹을 하나씩의 레코드요소유형으로 식별한다. <br>
                                            &nbsp;&nbsp;&nbsp;&nbsp;- 정규직 직원정보와 계약직 직원정보는 각각 서로의 정보가
                                            필요하므로 필수적 서브그룹에 해당한다.<br> &nbsp;&nbsp;&nbsp;&nbsp;- 게시판
                                            첨부정보, 부양가족정보, 동호회 가입정보 등 연관되어 있으나 부가적인 정보이므로 선택적 데이터 그룹에
                                            해당한다.<br> &nbsp;&nbsp;&nbsp;&nbsp;- 필수 또는 선택적 서브그룹의 경우,
                                            연관된 정보 단위를 모두 레코드 요소 개수로 판단한다.<br>
                                            &nbsp;&nbsp;&nbsp;&nbsp;- 예를 들어, 직원정보에 직원 부양가족정보가 연계되어 있는 경우,
                                            RET는 2개로 식별한다.

                                        </div>
                                    </div>


                                    <div class="col-lg-6">

                                        <label>데이터요소유형(DET)의 개수 판단 기준 </label>
                                        <div style="text-align: left; padding-left: 40px; padding-right: 40px;">
                                            ● 데이터요소유형(DET)은 사용자가 인식 가능하고 반복되지 않는 유일한 속성을 말한다<br> ● 두
                                            개의 서로 다른 애플리케이션이 동일한 내부논리파일/외부연계파일을 유지관리하거나 참조한다면, 각각의
                                            애플리케이션이 사용하는 속성만 데이터요소유형으로 식별한다.<br> &nbsp;&nbsp;&nbsp;&nbsp;- 정규직 직원정보와
                                            계약직 직원정보는 각각 서로의 정보가 필요하므로 필수적 서브그룹에 해당한다.<br>
                                            &nbsp;&nbsp;&nbsp;&nbsp;- 게시판 첨부정보, 부양가족정보, 동호회 가입정보 등 연관되어
                                            있으나 부가적인 정보이므로 선택적 데이터 그룹에 해당한다.<br>
                                            &nbsp;&nbsp;&nbsp;&nbsp;- 필수 또는 선택적 서브그룹의 경우, 연관된 정보 단위를 모두
                                            레코드 요소 개수로 판단한다.<br> &nbsp;&nbsp;&nbsp;&nbsp;- 예를 들어,
                                            직원정보에 직원 부양가족정보가 연계되어 있는 경우, RET는 2개로 식별한다.

                                        </div>

                                    </div>

                                </div>

                            </div>
                            <br>
                            <hr class="my-0">
                            <br>
                            <div class="container-fluid p-0">
                                <div class="row removable">
                                    <div class="col-lg-2" align=center>
                                        <label align=Center><i>A회사</i></label>
                                        <table class="table table-hover my-0">
                                            <thead>
                                                <tr>

                                                    <th class="d-none d-xl-table-cell">회사명</th>
                                                </tr>
                                            </thead>
                                            <tr>
                                                <td class="d-none d-xl-table-cell">CEO</td>
                                            </tr>
                                            <tr>
                                                <td class="d-none d-xl-table-cell">사업자번호</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-2" align=center>
                                        <label align=Center><i>A회사 - 1번 지점 </i></label>
                                        <table class="table table-hover my-0">

                                            <thead>
                                                <tr>

                                                    <th class="d-none d-xl-table-cell">회사명</th>
                                                </tr>
                                            </thead>
                                            <tr>
                                                <td class="d-none d-xl-table-cell">지점명</td>
                                            </tr>
                                            <tr>
                                                <td class="d-none d-xl-table-cell">지점연락처</td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="col-lg-8">
                                        <label><b>레코드요소유형(RET)의 개수 판단 기준</b></label>
                                        <div style="text-align: left; padding-left: 40px; padding-right: 40px;">
                                            ● 'A회사'와 'A회사 1번지점'은 회사명으로 연결되어 있으므로 RET 는 2개가 된다.<br>

                                        </div>
                                        <label><b>데이터요소유형(DET)의 개수 판단 기준</b></label>
                                        <div style="text-align: left; padding-left: 40px; padding-right: 40px;">
                                            ● 'A회사'와 'A회사 1번지점'은 '회사명'을 공통 요소로 반복 사용하므로 이는 1개의 요소로 판단한다.
                                            ● DET는 회사명, CEO, 사업자번호, 지점명, 지점연락처 총 5개가 된다.</div>
                                        <div class="container-fluid p-0" style="text-align: right;">
                                            <br>
                                            <button type="button" class="btn btn-primary cost_per_fp_btn">2021
                                                소프트웨어 개발 단계별 기능점수 가충치 및 단가 보기</button>

                                            <br>
                                            <div class="cost_per_fp" style="display: none;">
                                                <img src="./assets/images/2021cost_per_fp.png" style="width: 100%; height: 100%;" />
                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </div>


                            <hr class="my-0">

                            <div class="container-fluid p-0">
                                <form name="data_fp_form" id="data_fp_form">

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
                                    <div class="row removable">

                                        <div class="col-lg-12">
                                            <div class="card flex-fill w-100">

                                                <div class="card-body" id="data_fp_div_wrapper">

                                                    <!-- row 1-->
                                                    <div class="data_fp_div row" id="data_fp_div_1" style="padding-bottom: 0px; margin-top: -20px; margin-bottom: 10px;">

                                                        <div style="display: inline-block; float: left; width: 33%;">


                                                            <div class="large-3 columns">
                                                                <span data-tooltip="" class="has-tip" data-selector="tooltip-kqsr7tzbm" title="">단위업무를 선택하고 세부 기능을 입력하세요 </span>
                                                            </div>


                                                            <div class="row removable">
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
                                                                    <input type="text" class="form-control" id="function" name="function" value="" placeholder="세부 기능을 입력하세요 ">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div style="display: inline-block; float: left; width: 33%;">
                                                            <div class="large-3 columns">
                                                                <span data-tooltip="" class="has-tip" data-selector="tooltip-kqsr7tzbm" title="">기능점수
                                                                    유형을 선택하세요 </span>
                                                            </div>


                                                            <div class="col-lg-12">
                                                                <select name="data_fp_type" id="data_fp_type_1" class="form-control">
                                                                    <option value="ILF">내부논리파일 (Internal Logical File:
                                                                        ILF)</option>
                                                                    <option value="EIF">외부연계파일 (External Interface File:
                                                                        EIF)</option>
                                                                </select>
                                                            </div>


                                                        </div>
                                                        <div style="display: inline-block; float: left; width: 33%;">
                                                            <div class="large-3 columns">
                                                                <span data-tooltip="" class="has-tip" data-selector="tooltip-kqsr7tzbm" title="">유형별 기능 수를
                                                                    입력하면 복잡도가 산출됩니다.</span>
                                                            </div>
                                                            <div class="row removable">
                                                                <div class="col-lg-4">

                                                                    <input type="number" class="form-control" id="rets_1" name="rets" value="" placeholder="RETs">
                                                                    <input type="text" class="form-control" id="rets_status_1" name="rets_status" readonly>
                                                                </div>
                                                                <div class="col-lg-4">

                                                                    <input type="number" class="form-control" id="dets_1" name="dets" value="" placeholder="DETs">
                                                                    <input type="text" class="form-control"  id="dets_status_1" name="dets_status" readonly>
                                                                </div>

                                                                <div class="col-lg-4">

                                                                    <input type="text" class="form-control" id="complexity_1" name="complexity" value="" placeholder="복잡도" readonly>

                                                                </div>

                                                            </div>

                                                        </div>

                                                    </div>

                                                    <!-- row 2-->
                                                    <div class="data_fp_div row" id="data_fp_div_2" style="padding-bottom: 0px; padding-top: 15px; border-top: 1px dotted #ccc">

                                                        <div style="display: inline-block; float: left; width: 33%;">
                                                            <div class="row removable">

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
                                                                    <input type="text" class="form-control" id="function" name="function" value="" placeholder="세부 기능을 입력하세요 ">
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div style="display: inline-block; float: left; width: 33%;">
                                                            <div class="col-lg-12">
                                                                <select name="data_fp_type" id="data_fp_type_2" class="form-control">
                                                                    <option value="ILF">내부논리파일 (Internal Logical File:
                                                                        ILF)</option>
                                                                    <option value="EIF">외부연계파일 (External Interface File:
                                                                        EIF)</option>
                                                                </select>
                                                            </div>


                                                        </div>
                                                        <div style="display: inline-block; float: left; width: 33%;">
                                                            <div class="row removable">
                                                                <div class="col-lg-4">

                                                                    <input type="number" class="form-control" id="rets_2" name="rets" value="" placeholder="RETs">
                                                                    <input type="text" class="form-control" id="rets_status_2" name="rets_status" readonly>
                                                                </div>
                                                                <div class="col-lg-4">

                                                                    <input type="number" class="form-control" id="dets_2" name="dets" value="" placeholder="DETs">
                                                                    <input type="text" class="form-control" id="dets_status_2" name="dets_status" readonly>
                                                                </div>

                                                                <div class="col-lg-4">

                                                                    <input type="text" class="form-control" id="complexity_2" name="complexity" value="" placeholder="복잡도" readonly>

                                                                </div>

                                                            </div>
                                                        </div>

                                                    </div>


                                                    <!-- row 3-->
                                                    <div class="data_fp_div row" id="data_fp_div_3" style="padding-bottom: 0px; padding-top: 15px; border-top: 1px dotted #ccc">
                                                        <div style="display: inline-block; float: left; width: 33%;">

                                                            <div class="row removable">
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
                                                                    <input type="text" class="form-control" id="function" name="function" value="" placeholder="세부 기능을 입력하세요 ">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div style="display: inline-block; float: left; width: 33%;">
                                                            <div class="row removable">
                                                                <div class="col-lg-12">
                                                                    <select name="data_fp_type" id="data_fp_type_3" class="form-control">
                                                                        <option value="ILF">내부논리파일 (Internal Logical File:
                                                                            ILF)</option>
                                                                        <option value="EIF">외부연계파일 (External Interface File:
                                                                            EIF)</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div style="display: inline-block; float: left; width: 33%;">
                                                            <div class="row removable">
                                                                <div class="col-lg-4">

                                                                    <input type="number" class="form-control" id="rets_3" name="rets" value="" placeholder="RETs">
                                                                    <input type="text" class="form-control" id="rets_status_3" name="rets_status" readonly>
                                                                </div>
                                                                <div class="col-lg-4">

                                                                    <input type="number" class="form-control" id="dets_3" name="dets" value="" placeholder="DETs">
                                                                    <input type="text" class="form-control" id="dets_status_3" name="dets_status" readonly>
                                                                </div>
                                                                <div class="col-lg-4">

                                                                    <input type="text" class="form-control" id="complexity_3" name="complexity" value="" placeholder="복잡도" readonly>

                                                                </div>

                                                            </div>
                                                        </div>

                                                    </div>


                                                    <!-- row 4-->
                                                    <div class="data_fp_div row" id="data_fp_div_4" style="padding-bottom: 0px; padding-top: 15px; border-top: 1px dotted #ccc">


                                                        <div style="display: inline-block; float: left; width: 33%;">
                                                            <div class="row removable">
                                                                <div class="col-lg-6">

                                                                    <select name="uni_pro_list" id="process_4" class="form-control">
                                                                        <c:forEach var="up" items="${unitProcess_list}">
                                                                            <option value="<c:out value=" ${up.uni_pro_num}" /> "/>
                                                                            <c:out value="${up.uni_pro_num}.${up.uni_pro}" />
                                                                            </option>
                                                                        </c:forEach>
                                                                    </select>

                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <input type="text" class="form-control" id="function" name="function" value="" placeholder="세부 기능을 입력하세요 ">
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div style="display: inline-block; float: left; width: 33%;">

                                                            <div class="col-lg-12">
                                                                <select name="data_fp_type" id="data_fp_type_4" class="form-control">
                                                                    <option value="ILF">내부논리파일 (Internal Logical File:
                                                                        ILF)</option>
                                                                    <option value="EIF">외부연계파일 (External Interface File:
                                                                        EIF)</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div style="display: inline-block; float: left; width: 33%;">
                                                            <div class="row removable">
                                                                <div class="col-lg-4">

                                                                    <input type="number" class="form-control" id="rets_4" name="rets" value="" placeholder="RETs">
                                                                    <input type="text" class="form-control" id="rets_status_4" name="rets_status" readonly>
                                                                </div>
                                                                <div class="col-lg-4">

                                                                    <input type="number" class="form-control" id="dets_4" name="dets" value="" placeholder="DETs">
                                                                    <input type="text"" class="form-control" id="dets_status_4" name="dets_status" readonly>
                                                                </div>

                                                                <div class="col-lg-4">

                                                                    <input type="text" class="form-control" id="complexity_4" name="complexity" value="" placeholder="복잡도" readonly>

                                                                </div>

                                                            </div>
                                                        </div>

                                                    </div>
												 <!-- 새로운 로우 삽입 위치  -->		
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
