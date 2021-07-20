<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header -->
<jsp:include page="./header.jsp" />

<script>
    // 계수 보여주기 출처: https://minaminaworld.tistory.com/41 [미나미 블로그]
    $(document).ready(function() {
        $("select[name=vaf_1]").change(function() {
            //실행할 내용 출처: https://offbyone.tistory.com/47 [쉬고 싶은 개발자]
            var vaf_value_1;
            //alert($("select[name=vaf_1]").val()); // test1
            if ($("select[name=vaf_1]").val() == "1") {
                vaf_value_1 = "0.88";

            } else if ($("select[name=vaf_1]").val() == "2") {
                vaf_value_1 = "0.94";
            } else if ($("select[name=vaf_1]").val() == "3") {
                vaf_value_1 = "1.00";
            } else if ($("select[name=vaf_1]").val() == "4") {
                vaf_value_1 = "1.06";
            } else if ($("select[name=vaf_1]").val() == "5") {
                vaf_value_1 = "1.12";
            } else {
                alert("오류입니다.");
            };
            //출처: https://offbyone.tistory.com/47 [쉬고 싶은 개발자]
            $("input[type=number][name=linkageComplexity]").val(vaf_value_1);
            //alert(vaf_value_1);

        });

    });

    $(document).ready(function() {
        $("select[name=vaf_2]").change(function() {
            var vaf_value_2;
            if ($("select[name=vaf_2]").val() == "1") {
                vaf_value_2 = "0.91";
            } else if ($("select[name=vaf_2]").val() == "2") {
                vaf_value_2 = "0.95";
            } else if ($("select[name=vaf_2]").val() == "3") {
                vaf_value_2 = "1.00";
            } else if ($("select[name=vaf_2]").val() == "4") {
                vaf_value_2 = "1.05";
            } else if ($("select[name=vaf_2]").val() == "5") {
                vaf_value_2 = "1.09";
            } else {
                alert("오류입니다.");
            };
            $("input[type=number][name=performance]").val(vaf_value_2);

        });

    });

    $(document).ready(function() {
        $("select[name=vaf_3]").change(function() {
            var vaf_value_3;
            if ($("select[name=vaf_3]").val() == "1") {
                vaf_value_3 = "0.94";
            } else if ($("select[name=vaf_3]").val() == "2") {
                vaf_value_3 = "1.00";
            } else if ($("select[name=vaf_3]").val() == "3") {
                vaf_value_3 = "1.06";
            } else if ($("select[name=vaf_3]").val() == "4") {
                vaf_value_3 = "1.13";
            } else if ($("select[name=vaf_3]").val() == "5") {
                vaf_value_3 = "1.19";
            } else {
                alert("오류입니다.");
            };
            $("input[type=number][name=operationalCompatibility]").val(vaf_value_3);

        });

    });

    $(document).ready(function() {
        $("select[name=vaf_4]").change(function() {
            var vaf_value_4;
            if ($("select[name=vaf_4]").val() == "1") {
                vaf_value_4 = "0.97";
            } else if ($("select[name=vaf_4]").val() == "2") {
                vaf_value_4 = "1.00";
            } else if ($("select[name=vaf_4]").val() == "3") {
                vaf_value_4 = "1.03";
            } else if ($("select[name=vaf_4]").val() == "4") {
                vaf_value_4 = "1.06";
            } else if ($("select[name=vaf_4]").val() == "5") {
                vaf_value_4 = "1.08";
            } else {
                alert("오류입니다.");
            };
            $("input[type=number][name=security]").val(vaf_value_4);

        });

    });




    var form_name = "#system_form" //form 이름 
	var form_target = "./SystemServlet" //post 대상 
	var page_subject = "시스템 특성 정보 제출" 
	var next_location = "./RequirementServlet"

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
                            <img src="./assets/images/system_characteristics.png" alt="system_characteristics" class="img-fluid rounded-circle mb-2" width="128" height="128">
                            <h5 class="card-title mb-0">시스템 특성 </h5>
                            <div class="text-muted mb-2">보정계수 반영을 위하여 개발 시스템의 특성별 정도를 정의합니다.</div>
                        </div>
                        <form name="system_form" id="system_form">
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
                            <hr class="my-0">

                            <div class="container-fluid p-0" style="text-align:right">
                                <br>
                                <button type="button" class="btn btn-primary correction_factor_btn">2021 어플리케이션 복잡도 보정계수 보기</button>&nbsp;&nbsp;&nbsp;&nbsp;

                                <br>
                                <div class="correction_factor" style="display:none;">
                                    <img src="./assets/images/2021correction_factor.png" style="width:100%;height:100%;" />
                                </div>
                                <br>
                            </div>

                            <div class="container-fluid p-0">

                                <div class="row removable">
                                    <div class="col-lg-8">

                                        <div class="card-body">

                                            <!-- row -->
                                            <div class="row" style="padding-bottom:5px;padding-top:4px;margin-bottom:32px;">
                                                <div class="large-3 columns">
                                                    <span data-tooltip="" class="has-tip" data-selector="tooltip-kqsr7tzb0" title="">연계 복잡성 수준</span>
                                                </div>
                                                <div class="large-3 columns">
                                                    <select name="vaf_1" class="form-control">
                                                        <option value="1">1. 타기관 연계 없음</option>
                                                        <option value="2">2. 1~2개의 타 기관 연계 </option>
                                                        <option value="3">3. 3~5개의 타 기관 연계</option>
                                                        <option value="4">4. 6~10개의 타 기관 연계</option>
                                                        <option value="5">5. 10개를 초과하는 타 기관 연계</option>

                                                    </select>
                                                </div>

                                            </div>
                                            <!-- row -->
                                            <div class="row" style="padding-bottom:5px;padding-top:14px;border-top:1px dotted #ccc;margin-bottom:32px;">
                                                <div class="large-3 columns">
                                                    <span data-tooltip="" class="has-tip" data-selector="tooltip-kqsr7tzb4" title="">성능 요구 수준 </span>
                                                </div>
                                                <div class="large-3 columns">
                                                    <select name="vaf_2" class="form-control">
                                                        <option value="1">1. 응답성능에 대한 특별한 요구사항이 없다.</option>
                                                        <option value="2">2. 응답성능에 대한 요구사항이 있으나 특별한 조치가 필요하지는 않다.</option>
                                                        <option value="3">3. 응답시간이나 처리율이 피크(peak) 타임에 중요하며, 처리 시한이 명시되어 있다.</option>
                                                        <option value="4">4. 응답시간이나 처리율이 모든 업무 시간에 중요하며, 처리 시한이 명시되어 있다.</option>
                                                        <option value="5">5. 응답성능 요구사항이 엄격하여, 설계 단계에서부터 성능 분석이 요구되거나, 설계 및 구현단계에서 성능분석도구가 사용됨</option>

                                                    </select>
                                                </div>
                                            </div>
                                            <!-- row -->
                                            <div class="row" style="padding-bottom:5px;padding-top:14px;border-top:1px dotted #ccc;margin-bottom:32px;">
                                                <div class="large-3 columns">
                                                    <span data-tooltip="" class="has-tip" data-selector="tooltip-kqsr7tzb7" title="">운영환경 호환성</span>
                                                </div>
                                                <div class="large-3 columns"><select name="vaf_3" class="form-control">
                                                        <option value="1">1. 운영환경 호환성에 대한 요구사항이 없다.</option>
                                                        <option value="2">2. 운영환경 호환성에 대한 요구사항이 있으며, 동일 하드웨어 및 소프트웨어 환경에서 운영되도록 설계된다.</option>
                                                        <option value="3">3. 유사한 운영환경에 대한 요구사항이 있으며, 유사 하드웨어 및 소프트웨어 환경에서 운영되도록 설계된다.</option>
                                                        <option value="4">4. 상이한 운영환경에 대한 요구사항이 있으며, 이질적인 하드웨어 및 소프트웨어 환경에서 운영되도록 설계된다.</option>
                                                        <option value="5">5. 항목 4에 더하여 일반적 산출물 이외에 여러 장소에서 원활한 운영을 보장하기 위한 운영 절차의 문서화와 사전 모의훈련이 요구된다.</option>

                                                    </select> </div>

                                            </div>
                                            <!-- row -->
                                            <div class="row" style="padding-bottom:5px;padding-top:14px;border-top:1px dotted #ccc;margin-bottom:32px;">
                                                <div class="large-3 columns" style="margin-botton:20px;">
                                                    <span data-tooltip="" class="has-tip" data-selector="tooltip-kqsr7tzba" title="">보안성 수준</span>
                                                </div>
                                                <div class="large-3 columns">
                                                    <select name="vaf_4" class="form-control">
                                                        <option value="1">1. 암호화, 웹취약점 점검, 시큐어코딩, 개인정보보호 등 1가지 보안 요구사항이 포함되어 있다.</option>
                                                        <option value="2">2. 2가지 보안 요구사항이 포함되어 있다</option>
                                                        <option value="3">3. 3가지 보안 요구사항이 포함되어 있다.</option>
                                                        <option value="4">4. 4가지 보안 요구사항이 포함되어 있다.</option>
                                                        <option value="5">5. 5가지이상의 보안 요구사항이 포함되어 있다.</option>

                                                    </select>
                                                </div>
                                                <div class="large-6 columns">

                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-lg-4">

                                        <!-- row -->
                                        <div class="row" style="padding-bottom:5px;padding-top:4px;">
                                            <div class="large-3 columns">
                                                <h5 class="card-title mb-0"><br>계수 </h5>
                                            </div><br><br>
                                            <div class="large-3 columns"><input type="number" name="linkageComplexity" value="0.88" readonly class="form-control" placeholder="연계 복잡성 수준을 선택하세요"></div>
                                            <p style="font-size:1px;">&nbsp;&nbsp;&nbsp;&nbsp;</p>
                                        </div>
                                        <!-- row -->
                                        <div class="row" style="padding-bottom:5px;padding-top:4px;border-top:1px dotted #ccc">
                                            <p style="font-size:1px;">&nbsp;</p>
                                            <div class="large-3 columns"><input type="number" name="performance" value="0.91" readonly class="form-control" placeholder="성능 요구 수준을 선택하세요"></div>
                                            <p style="font-size:1px;">&nbsp;&nbsp;&nbsp;&nbsp;</p>
                                        </div>
                                        <!-- row -->
                                        <div class="row" style="padding-bottom:5px;padding-top:4px;border-top:1px dotted #ccc">
                                            <p style="font-size:1px;">&nbsp;</p>
                                            <div class="large-3 columns"><input type="number" name="operationalCompatibility" value="0.94" readonly class="form-control" placeholder="운영환경 호환성을 선택하세요"></div>
                                            <p style="font-size:1px;">&nbsp;&nbsp;&nbsp;&nbsp;</p>
                                        </div>
                                        <!-- row -->

                                        <div class="row" style="padding-bottom:5px;padding-top:4px;border-top:1px dotted #ccc">
                                            <p style="font-size:1px;">&nbsp;</p>
                                            <div class="large-3 columns"><input type="number" name="security" value="0.97" readonly class="form-control" placeholder="보안성 수준을 선택하세요"></div>
                                            <p style="font-size:1px;">&nbsp;&nbsp;&nbsp;&nbsp;</p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </form>
                        <hr class="my-0">

                        <div class="card-body text-center">

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
