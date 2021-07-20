<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="./header.jsp" />

<script>
	var form_name = "#weighted_form" //form 이름 
	var form_target = "./WeightedServlet" //post 대상 
	var page_subject = "가중치 산정" 
	var next_location = "./CorrectionServlet"

  	// id 'testBtn'이라는 버튼을 클릭 시 체크박스 검사.
      $(document).ready(function() {
		 
          // form summit;  
          $("#btn-submit").click(function() {
        	  
        	  // 가중치 세팅
 	    	 if( $("#ilf_tot").val() == null || (typeof $("#ilf_tot").val() == 'string' && $("#ilf_tot").val() == '') || (typeof $("#ilf_tot").val() == 'undefined')){
 	    		 $("#ilf_tot").val(0);
 	    	 }
 	    	 if( $("#eif_tot").val() == null || (typeof $("#eif_tot").val() == 'string' && $("#eif_tot").val() == '') || (typeof $("#eif_tot").val() == 'undefined')) {
 	    		 $("#eif_tot").val(0);
 	    	 }
 	    	  
 	    	 if( $("#ei_tot").val() == null || (typeof $("#ei_tot").val() == 'string' && $("#ei_tot").val() == '') || (typeof $("#ei_tot").val() == 'undefined')){
 	    		 $("#ei_tot").val(0);
 	    	 }
 	    	 if( $("#eo_tot").val() == null || (typeof $("#eo_tot").val() == 'string' && $("#eo_tot").val() == '') || (typeof $("#eo_tot").val() == 'undefined')) {
 	    		 $("#eo_tot").val(0);
 	    	 }
 	    	 if( $("#eq_tot").val() == null || (typeof $("#eq_tot").val() == 'string' && $("#eq_tot").val() == '') || (typeof $("#eq_tot").val() == 'undefined')) {
 	    		 $("#eq_tot").val(0);
 	    	 }

      	});
      });       
</script>

<style type="text/css">
    .tg {
        border-collapse: collapse;
        border-color: #ccc;
        border-spacing: 0;
    }

    .tg td {
        background-color: #fff;
        border-color: #ccc;
        border-style: solid;
        border-width: 1px;
        color: #333;
        font-family: Arial, sans-serif;
        font-size: 14px;
        overflow: hidden;
        padding: 10px 5px;
        word-break: normal;
    }

    .tg th {
        background-color: #f0f0f0;
        border-color: #ccc;
        border-style: solid;
        border-width: 1px;
        color: #333;
        font-family: Arial, sans-serif;
        font-size: 14px;
        font-weight: normal;
        overflow: hidden;
        padding: 10px 5px;
        word-break: normal;
    }

    .tg .tg-buh4 {
        background-color: #f9f9f9;
        text-align: left;
        vertical-align: top
    }

    .tg .tg-0lax {
        text-align: left;
        vertical-align: top
    }

</style>
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

                            <img src="./assets/images/weighted_fp.png" alt="weighted fp" class="img-fluid rounded-circle mb-2" width="128" height="128">
                            <h5 class="card-title mb-0">복잡도 가중치 반영 FP</h5>
                            <div class="text-muted mb-2"></div>

                            <hr class="my-0">
                            <div class="card-body  text-center">

 								<button type="button" class="btn btn-primary complexity_weight_btn">복잡도 및 기능점수 가중치 보기</button>

 							
                                    <!--  row  -->

                                <div class="container-fluid p-0 complexity_weight_div" style="display:none;">
                                    <div class="row removable">
                                        <div class="col-lg-6">


                                            <div style="text-align: left; padding-left: 40px; padding-right: 40px;">
                                                <img src="./assets/images/weight_ilf.png" style="width: 100%; height: 100%"><br>
                                                <img src="./assets/images/weight_eif.png" style="width: 100%; height: 100%"><br>
                                            </div>
                                        </div>


                                        <div class="col-lg-6">


                                            <div style="text-align: left; padding-left: 40px; padding-right: 40px;">
                                                <img src="./assets/images/weight_ei.png" style="width: 100%; height: 100%"><br>
                                                <img src="./assets/images/weight_eo.png" style="width: 100%; height: 100%"><br>
                                                <img src="./assets/images/weight_eq.png" style="width: 100%; height: 100%">
                                            </div>

                                        </div>

                                    </div>

                                </div>



                               <br>
                                <form name="weighted_form" id="weighted_form">
                                   <div class="card-body">
                                
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
                               		</div>
                                
                                    <div class="card-body">



                                        <div class="container-fluid p-0">
                                            <div class="row removable">
                                                <div class="col-lg-3">


                                                    <div style="height: 35px; background: #eee; margin-top:20px;padding: 7px 10px 0 10px; border-radius: 5px;">
                                                        내부논리파일(ILF)</div>
                                                </div>



                                                <div class="col-lg-3">
                                                    <label>레코드요소유형(RET)의 개수 </label> 
                                                    <div class="input-group">
                                                    	<span class="input-group-text" id="basic-addon1">낮음</span>
                                                    	<input type="text" id="ilf_rets_low" name="ilf_rets_low" value="${ilf_rets_low}" class="form-control" >
													</div>	
													<div class="input-group">
														<span class="input-group-text" id="basic-addon1">보통</span>
                                                    	<input type="text" id="ilf_rets_mid" name="ilf_rets_mid" value="${ilf_rets_mid}" class="form-control" >
													</div>
													<div class="input-group">
														<span class="input-group-text" id="basic-addon1">높음</span>
                                                    	<input type="text" id="ilf_rets_high" name="ilf_rets_high" value="${ilf_rets_high}" class="form-control" >
													</div>		
                                                </div>
                                                <div class="col-lg-3">
                                                    <label>데이터요소유형(DET)의 개수 </label> 
                                                    <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">낮음</span>
                                                    	<input type="text" id="ilf_dets_low" name="ilf_dets_low" value="${ilf_dets_low}" class="form-control" >
													</div>	
													<div class="input-group">
													<span class="input-group-text" id="basic-addon1">보통</span>
                                                    	<input type="text" id="ilf_dets_mid" name="ilf_dets_mid" value="${ilf_dets_mid}" class="form-control" >
													</div>
													<div class="input-group">
													<span class="input-group-text" id="basic-addon1">높음</span>
                                                    	<input type="text" id="ilf_dets_high" name="ilf_dets_high" value="${ilf_dets_high}" class="form-control" >
													</div>		                                                  
                                                </div>
                                                <div class="col-lg-3">
                                                    <label>기능점수 가중치 </label> <input type="text" id="ilf_tot" name="ilf_tot" value="${ilf_tot}"class="form-control" >
                                                </div>
                                                
                                            </div>
                                            <div class="row removable">
                                                <div class="col-lg-3">


                                                    <div style="height: 35px; background: #eee; margin-top:20px;padding: 7px 10px 0 10px; border-radius: 5px;">
                                                        외부연계파일(EIF)</div>
                                                </div>

                                                <div class="col-lg-3">
                                                    <label>레코드요소유형(RET)의 개수 </label> 
                                                    <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">낮음</span>
                                                    	<input type="text" id="eif_rets_low" name="eif_rets_low" value="${eif_rets_low}" class="form-control" >
													</div>	
													<div class="input-group">
													<span class="input-group-text" id="basic-addon1">보통</span>
                                                    	<input type="text" id="eif_rets_mid" name="eif_rets_mid" value="${eif_rets_mid}" class="form-control" >
													</div>
													<div class="input-group">
													<span class="input-group-text" id="basic-addon1">높음</span>
                                                    	<input type="text" id="eif_rets_high" name="eif_rets_high" value="${eif_rets_high}" class="form-control" >
													</div>	
                                                </div>
                                                <div class="col-lg-3">
                                                    <label>데이터요소유형(DET)의 개수 </label> 
                                                    <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">낮음</span>
                                                    	<input type="text" id="eif_dets_low" name="eif_dets_low" value="${eif_dets_low}" class="form-control" >
													</div>	
													<div class="input-group">
													<span class="input-group-text" id="basic-addon1">보통</span>
                                                    	<input type="text" id="eif_dets_mid" name="eif_dets_mid" value="${eif_dets_mid}" class="form-control" >
													</div>
													<div class="input-group">
													<span class="input-group-text" id="basic-addon1">높음</span>
                                                    	<input type="text" id="eif_dets_high" name="eif_dets_high" value="${eif_dets_high}" class="form-control" >
													</div>	
                                                </div>
                                                <div class="col-lg-3">
                                                    <label>기능점수 가중치 </label> 
                                                    <input type="text" id="eif_tot" name="eif_tot" value="${eif_tot}" class="form-control" >
                                                    
                                                </div>
                                            </div>
                                            &nbsp;<br>
                                            <hr class="my-0">
                                            <div class="row removable" style="margin-top:15px;">
                                                <div class="col-lg-3">


                                                    <div style="height: 35px; background: #eee; margin-top:20px;padding: 7px 10px 0 10px; border-radius: 5px;">
                                                        외부입력(EI)</div>
                                                </div>

                                                <div class="col-lg-3">
                                                    <label>참조파일유형(FTR)의 개수 </label> 
                                                    <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">낮음</span>
                                                    	<input type="text" id="ei_ftrs_low" name="ei_ftrs_low" value="${ei_ftrs_low}" class="form-control" >
													</div>	
													<div class="input-group">
													<span class="input-group-text" id="basic-addon1">보통</span>
                                                    	<input type="text" id="ei_ftrs_mid" name="ei_ftrs_mid" value="${ei_ftrs_mid}" class="form-control" >
													</div>
													<div class="input-group">
													<span class="input-group-text" id="basic-addon1">높음</span>
                                                    	<input type="text" id="ei_ftrs_high" name="ei_ftrs_high" value="${ei_ftrs_high}" class="form-control" >
													</div>	

                                                </div>
                                                <div class="col-lg-3">
                                                    <label>데이터요소유형(DET)의 개수 </label> 
                                                    <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">낮음</span>
                                                    	<input type="text" id="ei_dets_low" name="ei_dets_low" value="${ei_dets_low}" class="form-control" >
													</div>	
													<div class="input-group">
													<span class="input-group-text" id="basic-addon1">보통</span>
                                                    	<input type="text" id="ei_dets_mid" name="ei_dets_mid" value="${ei_dets_mid}" class="form-control" >
													</div>
													<div class="input-group">
													<span class="input-group-text" id="basic-addon1">높음</span>
                                                    	<input type="text" id="ei_dets_high" name="ei_dets_high" value="${ei_dets_high}" class="form-control" >
													</div>	
                                                </div>
                                                <div class="col-lg-3">
                                                    <label>기능점수 가중치 </label> <input type="text" id="ei_tot" name="ei_tot" value="${ei_tot}" class="form-control" >
                                                </div>
                                            </div>
                                            <div class="row removable">
                                                <div class="col-lg-3">


                                                    <div style="height: 35px; background: #eee; margin-top:20px;padding: 7px 10px 0 10px; border-radius: 5px;">
                                                        외부출력(EO)</div>
                                                </div>

                                                <div class="col-lg-3">
                                                    <label>참조파일유형(FTR)의 개수 </label> 
                                                    <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">낮음</span>
                                                    	<input type="text" id="eo_ftrs_low" name="eo_ftrs_low" value="${eo_ftrs_low}" class="form-control" >
													</div>	
													<div class="input-group">
													<span class="input-group-text" id="basic-addon1">보통</span>
                                                    	<input type="text" id="eo_ftrs_mid" name="eo_ftrs_mid" value="${eo_ftrs_mid}" class="form-control" >
													</div>
													<div class="input-group">
													<span class="input-group-text" id="basic-addon1">높음</span>
                                                    	<input type="text" id="eo_ftrs_high" name="eo_ftrs_high" value="${eo_ftrs_high}" class="form-control" >
													</div>

                                                </div>
                                                <div class="col-lg-3">
                                                    <label>데이터요소유형(DET)의 개수 </label> 
                                                    <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">낮음</span>
                                                    	<input type="text" id="eo_dets_low" name="eo_dets_low" value="${eo_dets_low}" class="form-control" >
													</div>	
													<div class="input-group">
													<span class="input-group-text" id="basic-addon1">보통</span>
                                                    	<input type="text" id="eo_dets_mid" name="eo_dets_mid" value="${eo_dets_mid}" class="form-control" >
													</div>
													<div class="input-group">
													<span class="input-group-text" id="basic-addon1">높음</span>
                                                    	<input type="text" id="eo_dets_high" name="eo_dets_high" value="${eo_dets_high}" class="form-control" >
													</div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <label>기능점수 가중치 </label> <input type="text" id="eo_tot" name="eo_tot" value="${eo_tot}" class="form-control" >
                                                </div>
                                            </div>
                                            <div class="row removable">
                                                <div class="col-lg-3">


                                                    <div style="height: 35px; background: #eee; margin-top:20px;padding: 7px 10px 0 10px; border-radius: 5px;">
                                                        외부조회(EQ)</div>
                                                </div>

                                                <div class="col-lg-3">
                                                    <label>참조파일유형(FTR)의 개수 </label> 
                                                     <div class="input-group">
                                                     <span class="input-group-text" id="basic-addon1">낮음</span>
                                                    	<input type="text" id="eq_ftrs_low" name="eq_ftrs_low" value="${eq_ftrs_low}" class="form-control" >
													</div>	
													<div class="input-group">
													<span class="input-group-text" id="basic-addon1">보통</span>
                                                    	<input type="text" id="eq_ftrs_mid" name="eq_ftrs_mid" value="${eq_ftrs_mid}" class="form-control" >
													</div>
													<div class="input-group">
													<span class="input-group-text" id="basic-addon1">높음</span>
                                                    	<input type="text" id="eq_ftrs_high" name="eq_ftrs_high" value="${eq_ftrs_high}" class="form-control" >
													</div>

                                                </div>
                                                <div class="col-lg-3">
                                                    <label>데이터요소유형(DET)의 개수 </label> 
                                                     <div class="input-group">
                                                     <span class="input-group-text" id="basic-addon1">낮음</span>
                                                    	<input type="text" id="eq_dets_low" name="eq_dets_low" value="${eq_dets_low}" class="form-control" >
													</div>	
													<div class="input-group">
													<span class="input-group-text" id="basic-addon1">보통</span>
                                                    	<input type="text" id="eq_dets_mid" name="eq_dets_mid" value="${eq_dets_mid}" class="form-control" >
													</div>
													<div class="input-group">
													<span class="input-group-text" id="basic-addon1">높음</span>
                                                    	<input type="text" id="eq_dets_high" name="eq_dets_high" value="${eq_dets_high}" class="form-control" >
													</div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <label>기능점수 가중치 </label> <input type="text" id="eq_tot" name="eq_tot" value="${eq_tot}" class="form-control" >
                                                </div>
                                            </div>

                                        </div>




                                    </div>
                                    <br>
                         
                            
                                </form>
                            </div>

                        </div>


                        <hr class="my-0">
                        <div class="card-body">



                            <hr class="my-0">
                            <div class="card-body text-center">

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
