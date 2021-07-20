<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="./header.jsp" />

<style type="text/css">
    .tg {
        border-collapse: collapse;
        border-color: #ccc;
        border-spacing: 0;
        width: 100%;
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

<script>
	var form_name = "#estimaton_form" //form 이름 
	var form_target = "" //post 대상 
	var page_subject = "" 
	var next_location = ""
    
	function numberSetting() {
		$("#fp_tot").val(comma(uncomma(${cf.fp_tot})));
		$("#fp_unitcost").val(comma(uncomma(${cf.fp_unitcost})));
		$("#fp_cost_before_correction").val(comma(uncomma(${cf.fp_cost_before_correction})));
		$("#fp_cost_after_correction").val(comma(uncomma(${cf.fp_cost_after_correction})));
	}
	window.onload = numberSetting;
	
	
   	// 콤마 찍기
   	function comma(str) {
	  str = String(str);
	  return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	// 콤마 풀기
	function uncomma(str) {
	  str = String(str);
	  return str.replace(/[^\d]+/g, '');
	}
    // 숫자 세자리 마다 컴마 찍기 
	function inputNumberFormat(obj) {
	  obj.value = comma(uncomma(obj.value));
	}
  	
   	 $(document).ready(function() {
   		//alert("와따 ");
	        // 직접경비 금액 변경시 합계 자동 변경 
	        var elem_id, rets_id, dets_id, data_fp_type_id, complexity_id;
	        
	        $("#estimation_form input[type=text]").change(function() {
	        	
	            
	            // 직정 경비 테이블 합계 구하기 
	            /* elem_id = $(this).attr("id");
	            if (elem_id.indexOf("direct_expense") != -1) {
 	             $(".direct_expense_tot").each(function() {
 	            	    
					var $this = $(this);
					var sum_value = 0;	
					$(".direct_expense").each(function (i, e) {
						var cycle_num = isNaN(parseInt($(e).val())) ? 0 : parseInt($(e).val());
	                  		sum_value+=cycle_num;
		             })
		               $this.val(sum_value);
					   $("#direct_expense_fianl").val(sum_value);
 	             });
 	                	                
	            }; */
	            elem_id = $(this).attr("id");
	            if (elem_id.indexOf("direct_expense") != -1) {
		            var sum_value = 0;	
		            $(".direct_expense").each(function (i, e) {
		            	//alert("와따 ");
						var cycle_num = isNaN(parseInt(uncomma($(e).val()))) ? 0 : parseInt(uncomma($(e).val()));
	                  		sum_value+=cycle_num;
	                  		
		             });
		            //alert("와따" + sum_value);
		            $(".direct_expense_tot").val(comma(uncomma(sum_value)));
		            $("#direct_expense_fianl").val(comma(uncomma(sum_value)));
	            };
	            
	            
	         	// 이윤 구하기
	        	//alert($("#ProfitRatio").val());
				var int_cost_after_correction =0;
				var profit_ratio=0;
				var int_profit_ratio=0;
				var profit_value=0;
				var int_Profit=0;
				var int_direct_expense_fianl=0;
				
				// 보정 후 개발원가 구하기 
				int_cost_after_correction =  isNaN(parseInt(uncomma($("#fp_cost_after_correction").val()))) ? 0 : parseInt(uncomma($("#fp_cost_after_correction").val()));
						
				// 이윤율 구하기 
				profit_ratio = $("#ProfitRatio").val().replace(/ /gi,"").replace("%","");
	        	int_profit_ratio = isNaN(parseInt(profit_ratio)) ? 0 : parseInt(profit_ratio);
	        	//alert(int_profit_ratio);
	        	
	        	// 이윤 구하기 
	        	profit_value = int_cost_after_correction*(int_profit_ratio/100);
	        	//alert(profit_value);
	        	$("#Profit").val(comma(uncomma(profit_value)));
	        	int_Profit = parseInt( isNaN(parseInt(uncomma($("#Profit").val()))) ? 0 : parseInt(uncomma($("#Profit").val())) );
	        	
	        	// 직접 경비 구하기 
	        	int_direct_expense_fianl = parseInt( isNaN(parseInt(uncomma($("#direct_expense_fianl").val()))) ? 0 : parseInt(uncomma($("#direct_expense_fianl").val())) );
	        		        		        	
	        	// 총 개발비 구하기 
	        	$("#fianl_cost").val( comma(uncomma(int_cost_after_correction + int_Profit + int_direct_expense_fianl)) );
	        	
	            
	            
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
                    <form name="estimation_form" id="estimation_form">
                        <div class="card mb-3">
                        
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
                            
                            <hr class="my-0">
                            <div class="card-body text-center">
                                <h3>개발원가 산정</h3>
                                <p style="text-align:right">(단위 : 원)</p>
                                <table class="tg">
                                    <thead>
                                        <tr>
                                            <th class="tg-0pky" rowspan="2">총기능점수</th>
                                            <th class="tg-0pky" rowspan="2">기능점수당 단가</th>
                                            <th class="tg-0pky" colspan="5">보정계수</th>

                                            <th class="tg-0pky" rowspan="2">개발원가</th>
                                        </tr>
                                        <tr>

                                            <th class="tg-0pky">규모</th>
                                            <th class="tg-0pky">연계복잡성</th>
                                            <th class="tg-0pky">성능</th>
                                            <th class="tg-0pky">운영환경</th>
                                            <th class="tg-0pky">보안성</th>

                                        </tr>
                                    </thead>
                                    <tbody>

                                        <tr>
                                            <td class="tg-0pky"><input type="text" id="fp_tot" value="" class="form-control text_right" readonly></td>
                                            <td class="tg-0pky"><input type="text" id="fp_unitcost" value=""  class="form-control text_right" readonly></td>
                                            <td class="tg-0pky"><input type="text" id="scalCorrectionFactor" value="${cf.scalCorrectionFactor}" class="form-control text_right" readonly></td>
                                            <td class="tg-0pky"><input type="text" id="linkageComplexity" value="${cf.linkageComplexity}" class="form-control text_right" readonly></td>
                                            <td class="tg-0pky"><input type="text" id="performance" value="${cf.performance}" class="form-control text_right" readonly></td>
                                            <td class="tg-0pky"><input type="text" id="operarionalCompatibility" value="${cf.operarionalCompatibility}" class="form-control text_right" readonly></td>
                                            <td class="tg-0pky"><input type="text" id="security" value="${cf.security}" class="form-control text_right" readonly></td>
                                            <td class="tg-0pky"><input type="text" id="fp_cost_before_correction" value=""  class="form-control text_right" readonly></td>
                                        </tr>
                                        <tr>
                                            <td class="tg-0pky" colspan="7">합계(보정 후 개발원가)</td>
                                            <td class="tg-0pky"><input type="text" value="" class="form-control text_right" id="fp_cost_after_correction" readonly></td>
                                        </tr>
                                        <tr>
                                            <td class="tg-0pky" colspan="6">이윤</td>
                                            <td class="tg-0pky"><input type="text" class="form-control text_right" value="20%" id="ProfitRatio"></td>
                                            <td class="tg-0pky"><input type="text" onchange="inputNumberFormat(this)" class="form-control text_right" id="Profit" readonly></td>
                                        </tr>
                                        <tr>
                                            <td class="tg-0pky" colspan="7">직접경비</td>
                                            <td class="tg-0pky"><input type="text" onchange="inputNumberFormat(this)" class="form-control text_right" id="direct_expense_fianl" readonly></td>
                                        </tr>
                                        <tr>
                                            <td class="tg-0pky" colspan="7">소프트웨어 개발비(부가세 별도)</td>
                                            <td class="tg-0pky"><input type="text" onchange="inputNumberFormat(this)" class="form-control text_right" id="fianl_cost" readonly></td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                            <hr class="my-0">
                            
                            <div class="card-body text-center">



                                <h3>직접경비</h3>
                                <p style="text-align:right">(단위 : 원)</p>
                                <table class="tg" class="direct_expense_tb">
                                    <thead>
                                        <tr>
                                            <th class="tg-0pky">구분</th>
                                            <th class="tg-0pky">산출내역</th>
                                            <th class="tg-0pky">금액</th>

                                        </tr>
                                    </thead>
                                    <tbody>


                                        <tr>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" id="direct_expense_1" name="direct_expense"  class="direct_expense form-control text_right" onkeyup="inputNumberFormat(this)"></td>
                                        </tr>
                                        <tr>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" id="direct_expense_2" name="direct_expense"  class="direct_expense form-control text_right" onkeyup="inputNumberFormat(this)"></td>
                                        </tr>
                                        <tr>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" id="direct_expense_3" name="direct_expense"  class="direct_expense form-control text_right" onkeyup="inputNumberFormat(this)"></td>
                                        </tr>
                                        <tr>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" id="direct_expense_4" name="direct_expense"  class="direct_expense form-control text_right" onkeyup="inputNumberFormat(this)"></td>
                                        </tr>
                                        <tr>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" id="direct_expense_5" name="direct_expense"  class="direct_expense form-control text_right" onkeyup="inputNumberFormat(this)"></td>
                                        </tr>
                                        <tr>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" id="direct_expense_6" name="direct_expense"  class="direct_expense form-control text_right" onkeyup="inputNumberFormat(this)"></td>
                                        </tr>
                                        <tr>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" id="direct_expense_7" name="direct_expense" class="direct_expense form-control text_right" onkeyup="inputNumberFormat(this)"></td>
                                        </tr>
                                        <tr>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" id="direct_expense_8" name="direct_expense"  class="direct_expense form-control text_right" onkeyup="inputNumberFormat(this)"></td>
                                        </tr>
                                        <tr>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" id="direct_expense_9" name="direct_expense" class="direct_expense form-control text_right" onkeyup="inputNumberFormat(this)"></td>
                                        </tr>
                                        <tr>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" id="direct_expense_10" name="direct_expense" class="direct_expense form-control text_right" onkeyup="inputNumberFormat(this)"></td>
                                        </tr>
                                       <tr>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" id="direct_expense_11" name="direct_expense" class="direct_expense form-control text_right" onkeyup="inputNumberFormat(this)"></td>
                                        </tr>
                                        <tr>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" class="form-control"></td>
                                            <td class="tg-0pky"><input type="text" id="direct_expense_12" name="direct_expense" class="direct_expense form-control text_right" onkeyup="inputNumberFormat(this)"></td>
                                        </tr>
                                        <tr>
                                            <td class="tg-0pky" colspan="2">합계</td>

                                            <td class="tg-0pky"><input type="text" id="direct_expense_tot" name="direct_expense_tot" class="direct_expense_tot form-control text_right" readonly></td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                             <hr class="my-0">
                            <div class="card-body text-center">

                             <!-- Button trigger modal -->
							<button type="button" class="btn btn-success" id="btn-print" onclick="javascript:window.print();">출력 하기</button>
							<!-- 		<div style="display:inline-block;width:20px;"></div>
							<button type="button" class="btn btn-dark" id="btn-next" data-bs-toggle="modal" data-bs-target="#submitModal">다음</button>
							-->
							

							 

                            </div>
                        </div>
                    </form>
                </div>
            </main>


            <!-- Footer -->
            <jsp:include page="./footer.jsp" />
