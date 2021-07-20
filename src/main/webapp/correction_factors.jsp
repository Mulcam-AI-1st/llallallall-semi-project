<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="./header.jsp" />

<link rel="stylesheet" href="./assets/css/foundation-icons.css">

<script src="./assets/js/foundation.min.js"></script>
<style>
    @font-face {
        font-family: "foundation-icons";
        src: url("./assets/fonts/foundation-icons.woff") format("woff");
        font-weight: normal;
        font-style: normal;
    }

</style>
<script>

	var form_name = "#correction_form" //form 이름 
	var form_target = "./CorrectionServlet" //post 대상 
	var page_subject = "보정계수 반영" 
	var next_location = "./EstimationServlet"
	
$(document).ready(function() {

		//기능점수 총합
		//alert(Number(${ilf_tot}) + Number(${eif_tot})+ Number(${ei_tot}) + Number(${eo_tot}) + Number(${eq_tot}));
		$("#fp_tot").val(Number(${ilf_tot}) + Number(${eif_tot}) + Number(${ei_tot}) + Number(${eo_tot}) + Number(${eq_tot})); 
		
		//보정 전 걔발원가 계산
		$("#fp_before_correction").val(
				(Number($("#fp_unitcost").val().replace("원","").replace(",","").replace(" ","")) * Number($("#fp_tot").val())).toLocaleString('ko-KR')+ " 원"
		);
		
				
		//규모 보정계수 계산 - 0.4057 x (log e(기능점수) - 7.1978)^2 + 0.8878
		// FP가 500 미만 시 1.2800, 3000 초과시 1.1530 적용 
	    //alert(Math.log(Number($("#fp_tot").val())));
		if ( Number($("#fp_tot").val()) < 500) {
			$("#scalCorrectionFactor").val(1.2800);
		} else if  ( Number($("#fp_tot").val()) > 3000) {
			$("#scalCorrectionFactor").val(1.1530);
			
		} else {
			$("#scalCorrectionFactor").val(
					((0.4057 *    Math.pow(  (Math.log(Number($("#fp_tot").val())) - 7.1978)  ,2)    ) + 0.8878).toFixed(4)
		    ); 
		}
		
		//보정 후 걔발원가 계산
		$("#fp_cost_after_correction").val(
				parseInt( (Number($("#fp_unitcost").val().replace("원","").replace(",","").replace(" ","")) * Number($("#fp_tot").val()))
						* Number($("#scalCorrectionFactor").val())
						* Number($("#LINKAGECOMPLEXITY").val()) 
						* Number($("#PERFORMANCE").val()) 
						* Number($("#OPERATIONALCOMPATIBILITY").val()) 
						* Number($("#SECURITY").val()) 
				).toLocaleString('ko-KR')+ " 원"
		);
		

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


                        <!-- FP modal -->

                        <div id="fp-outer">
                            <div id="fp-container">

                                <div id="fp-app-boundary">
                                    <p>Application</p>

                                    <a href="#" data-reveal-id="ILF-modal">
                                        <div id="ilf" class="fp-item">
                                            &nbsp;내부논리파일<span class="fp-subtext"><br />ILFs</span> <br />
                                            <span class="fp-details">${ilf_tot} FP</span>

                                        </div>
                                    </a>
                                </div>


                                <a href="#" data-reveal-id="EI-modal">
                                    <div id="ei" class="fp-item">
                                        &nbsp;외부입력 <span class="fp-subtext"><br />EIs</span> <br />
                                        <span class="fp-details">${ei_tot} FP</span>

                                    </div>
                                </a>

                                <div id="ei-arrow">
                                    <i class="fi-arrow-up fp-large" style="color: silver"></i><br />
                                    <i class="fi-arrow-down fp-large"></i>
                                </div>




                                <a href="#" data-reveal-id="EQ-modal">
                                    <div id="eq" class="fp-item">
                                        &nbsp;외부조회<span class="fp-subtext"><br />EQs</span> <br /> <span class="fp-details">${eq_tot} FP</span>
                                    </div>
                                </a>

                                <div id="eq-arrow">
                                    <i class="fi-arrow-up fp-large"></i><br /> <i class="fi-arrow-down fp-large" style="color: silver"></i>
                                </div>




                                <div id="eo-arrow">
                                    <i class="fi-arrow-left fp-large" style="color: silver"></i><i class="fi-arrow-right fp-large"></i>
                                </div>

                                <a href="#" data-reveal-id="EO-modal">
                                    <div id="eo" class="fp-item">
                                        &nbsp;외부출력<span class="fp-subtext"><br />EOs</span> <br /> <span class="fp-details">${eo_tot} FP</span>
                                    </div>
                                </a>
                                <div id="eif-arrow">
                                    <i class="fi-arrow-left fp-large"></i>
                                </div>

                                <a href="#" data-reveal-id="EIF-modal">
                                    <div id="eif" class="fp-item">
                                        &nbsp;외부연계파일<span class="fp-subtext"><br />EIFs</span> <br />
                                        <span class="fp-details">${eif_tot} FP</span>
                                    </div>
                                </a>


                            </div>

                        </div>
                        <hr class="my-0">
                        <div class="card-body text-center">
                            <h3 class="mbr-section-title align-center">개발원가 보정의 필요성</h3>
                            <div class="text-muted mb-2">
                                기능점수당 단가는 개발 프로젝트의 복잡도가 보통인 경우를 전제로 하여 산정된 것이다. <br>그러나 실제의
                                개발비용은 프로젝트 규모에 따른 생산성과 발주기관의 비기능적인 요구사항에 따른 <br>프로젝트의 복잡도
                                수준에 의해 영향을 받게 되어, 이에 대한보정이 필요하다.
                            </div>
                            <div class="text-muted mb-2">
                                보정전 개발원가에 <strong>
                                    <font style="color: black">규모,
                                        연계복잡성 수준, 성능요구 수준, 운영환경 호환성, 보안성 수준</font>
                                </strong>의 <br>5가지 보정계수를 곱하여
                                보정후 개발원가를 산정한다.
                            </div>


                        </div>
                        <hr class="my-0">
                        <form name="correction_form" id="correction_form">
                            <div class="card-body">

                                <h5 class="h6 card-title">보정 전 개발원가</h5>
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
                                <div class="container-fluid p-0">
                                    <div class="row removable">
                                        <div class="col-lg-3">
                                            <label>보정 전 개발원가 산출 방법 </label>

                                            <div style="height: 35px; background: #eee; padding: 7px 10px 0 10px; border-radius: 5px;">
                                                기능점수 × 기능점수당 단가</div>
                                        </div>

                                        <div class="col-lg-3">
                                            <label>기능점수 총합 </label> <input type="text" id="fp_tot" name="fp_tot" class="form-control" readonly>

                                        </div>
                                        <div class="col-lg-3">
                                            <label>기능점수당 단가 </label> <input type="text" id="fp_unitcost" name="fp_unitcost" class="form-control" style="text-align: right"  value="553,144 원" readonly>
                                        </div>
                                        <div class="col-lg-3">
                                            <label>보정 전 개발원가 </label> <input type="text" id="fp_before_correction" name="fp_cost_before_correction" style="text-align: right"   class="form-control" readonly>
                                        </div>
                                    </div>

                                </div>



                                <div class="container-fluid p-0" style="text-align: right">
                                    <br> <br>
                                    <button type="button" class="btn btn-primary cost_per_fp_btn">2021
                                        소프트웨어 개발 단계별 기능점수 가충치 및 단가 보기</button>

                                    <br>
                                    <div class="cost_per_fp" style="display: none;">
                                        <img src="./assets/images/2021cost_per_fp.png" style="width: 100%; height: 100%;" />
                                    </div>

                                </div>
                            </div>
                            <hr class="my-0">
                            <div class="card-body">
                                <h5 class="h6 card-title">보정 후 개발원가</h5>

                                <div class="container-fluid p-0">
                                    <div class="row removable">
                                        <div class="col-lg-3">
                                            <label>보정 전 개발원가 산출 방법 </label>
                                            <div style="height: 100px; background: #eee; padding: 7px 10px 0 10px; border-radius: 5px;margin-bottom:10px;">
                                                보정전 개발원가 × 규모 보정계수 × 연계복잡성수준 보정계수 × 성능요구수준 보정계수 × 운영환경 호환성
                                                보정계수 × 보안성수준 보정계수</div>
                                            <label>규모 보정계수 산출 방법 </label>
                                            <div style="height: 55px; background: #eee; padding: 7px 10px 0 10px; border-radius: 5px;">
                                                0.4057 x (log e(기능점수) - 7.1978)^2 + 0.8878</div>


                                        </div>

                                        <div class="col-lg-3">
                                            <label>규모 보정계수 </label> <input type="text" id="scalCorrectionFactor" name="scalCorrectionFactor" class="form-control" readonly>
                                            <label>연계복잡성수준 보정계수 </label> <input type="text" id="LINKAGECOMPLEXITY" name="LINKAGECOMPLEXITY" value="${LINKAGECOMPLEXITY}"  class="form-control" readonly>


                                        </div>
                                        <div class="col-lg-3">
                                            <label>성능요구수준 보정계수 </label> <input type="text" id="PERFORMANCE" name="PERFORMANCE" value="${PERFORMANCE}"  class="form-control" readonly>
                                            <label>운영환경 호환성 보정계수 </label> <input type="text" id="OPERATIONALCOMPATIBILITY" value="${OPERATIONALCOMPATIBILITY}" name="OPERATIONALCOMPATIBILITY" class="form-control" readonly>
                                        </div>
                                        <div class="col-lg-3">
                                            <label>보안성수준 보정계수 </label> <input type="text" id="SECURITY" name="SECURITY" value="${SECURITY}" class="form-control" readonly>
                                            <label style="color:red;">보정 후 개발원가 </label> <input type="text" id="fp_cost_after_correction" name="fp_cost_after_correction" value="${fp_cost_after_correction}" class="form-control text_right" readonly>

                                        </div>
                                    </div>
                                </div>

                                <div class="container-fluid p-0" style="text-align:right;margin-top: -40px;">
                                    
									<button type="button" class="btn btn-primary correction_factor_btn">2021 어플리케이션 복잡도 보정계수 보기</button>

                                    <div class="correction_factor" style="display: none;">
                                        <img src="./assets/images/2021correction_factor.png" style="width: 100%; height: 100%;" />
                                    </div>

                                </div>
                                <br>

                                <hr class="my-0">

                                <br>
                                <div class="container-fluid p-0 text-center">
                                   
                                   
                                         <!-- Button trigger modal -->
							<button type="button" class="btn btn-success" id="btn-submit" data-bs-toggle="modal" data-bs-target="#submitModal">제출하기</button>
									<div style="display:inline-block;width:20px;"></div>
							<button type="button" class="btn btn-dark" id="btn-next" data-bs-toggle="modal" data-bs-target="#submitModal">다음</button>
							
							
                                   
                                </div>

                            </div>
                        </form>

                    </div>
                </div>
            </main>


            <!-- Footer -->
            <jsp:include page="./footer.jsp" />
