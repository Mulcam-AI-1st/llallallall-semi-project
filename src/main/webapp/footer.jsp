<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 

    
        <footer class="footer">
            <div class="container-fluid">
                <div class="row text-muted">
                    <div class="col-6 text-start">

                    </div>
                    <div class="col-6 text-end">
                    
                    <!-- 
                        <ul class="list-inline">
                            <li class="list-inline-item"> <a class="text-muted" href="#" target="_blank">Support</a> </li>
                            <li class="list-inline-item"> <a class="text-muted" href="#" target="_blank">Help Center</a> </li>
                            <li class="list-inline-item"> <a class="text-muted" href="#" target="_blank">Privacy</a> </li>
                            <li class="list-inline-item"> <a class="text-muted" href="#" target="_blank">Terms</a> </li>
                        </ul>
                       -->  
                    </div>
                </div>
            </div>
        </footer>


    </div>
</div>


<!-- 모달 창 시작 -->

<!-- Modal -->
<div class="modal fade" id="submitModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">데이터 전송 확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body"></div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫 기</button>
        <button type="button" class="btn btn-success" id="btn-submit-modal">확인</button>
        <button type="button" class="btn btn-dark" id="btn-next-modal">다음</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal 끝  -->

<!-- Send Message Modal 시작  -->

<div class="modal fade" id="sendMessageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="sendMessageModalLabel">메시지 전송</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="sendMessageModalBody">
        <form id="sendMessageModalForm">
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">이 름 : </label>
            <input type="text" name="recipient-name" class="form-control" id="recipient-name">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">개선의견 :</label>
            <textarea class="form-control" name="message-text" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer center">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" id="sendMessageModal-Submit-btn" class="btn btn-primary">전송</button>
      </div>
    </div>
  </div>
</div>
<!-- Send Message Modal 끝   -->
<script >
 // form summit(modal);		
        var modal_title_basic = "데이터 전송 확인"
        var modal_body_basic = "정보를 제출하시려면 확인 버튼을 눌러주세요. <br>이미 제출하셨다면 다음 버튼을 클릭하 다음 단계로 이동해주세요." 

       	var modal_title_input_check = "알림"
        var modal_body_input_check = page_subject + "이 필요합니다." 
        
        var modal_title_before = "알림"
        var modal_body_before = "다음 단계로 이동하기 전에 정보 제출이 필요합니다.<br>정보 제출없이 이동하시려면 사이드바 메뉴를 이용해 주세요." 
        
        var modal_title_success = "전송 성공"
        var modal_body_success = "다음 버튼을 누르시면<br>다음 단계로 이동합니다." 

        var modal_title_failure = "전송 실패"

        var modal_title_error = "오류 발생"
        var modal_body_error = "요청 처리 중 오류가 발생하였습니다!!" 

        $(document).ready(function() {
        	
	       	   // null 체크 함수(custom)
	           function isNull(value){
	         	 //alert("isNull");
	               if (value == null) {
	             	 // alert("null!");
	             	  return true; 
	               }
	               if (typeof value == 'string' && value == '') {
	             	//  alert("''!");
	             	  return true;
	               }
	               if (typeof value == 'undefined') {
	             	//  alert("undefined");
	             	  return true;
	               }
	               
	               return false;
	
	           };
        		
        		$("#btn-next").click(function(){
        			if ($("#submitChkBox").val() != 'success') {
	        			
	        			//메시지 세팅 
	        			$(".modal-title").html( modal_title_before );	
	        		    $(".modal-body").html( modal_body_before );
	        		    $("#btn-submit-modal").hide();
	        		    $("#btn-next-modal").hide();
	        		    
	        		  	 } else {
	        		  		 
	        			 location.href = next_location;
        		  	 }
        		});
        		
        		$("#btn-submit").click(function(){
        	       	 
        			  if (form_name=="#project_form") {  	
        			
	        			    if(  isNull($("#projectname").val()) ){
		  	        		  
			  	                  $(".modal-title").html( modal_title_input_check );	
			  			          $(".modal-body").html( modal_body_input_check );
			  			          $("#btn-submit-modal").hide();
			  			          $("#btn-next-modal").hide();
			  	                  return false;
	        			    }        			    
        			    }
        			
	        			//기본 메시지 세팅 
		             	 $(".modal-title").html( modal_title_basic );	
		               	 $(".modal-body").html( modal_body_basic );
		               	 $("#btn-submit-modal").show(); 
		                 $("#btn-next-modal").show();
		               	 return false;
            		});

        		$("#btn-submit-modal").click(function(){
            	 
        	      $.ajax({
        	          type: "POST",
        	          dataType: "text",
        	          //async: false,
        	          url: form_target,
        	          data: $(form_name).serialize(),
        	          
        	          // 전송 전 작업
        	          beforeSend : function () {
        	        		if (form_name=="#project_form") {  
		        	        	  if(isNull($("#projectname").val())){
		        	        		  
		        	                  $(".modal-title").html( modal_title_input_check );	
		        			          $(".modal-body").html( modal_body_input_check );
		        			          $("#btn-submit-modal").hide();
		        			          $("#btn-next-modal").hide();
		        	                  return false;
		        	              }
        	        		}
        	          },
        	          
        	          // 요청에 성공하면 함수 실행 data는 응답 데이터가 들어간다
        	          success: function(data, textStatus){     
        			      //alert(textStatus);
        	        	  if( data == 'success') {
        		        	 $(".modal-title").html( modal_title_success );	
        		        	 $(".modal-body").html( modal_body_success );
        		        	 $("#btn-submit-modal").hide();
        		        	 $("#btn-next-modal").show();
        		        	 $("#submitChkBox").val("success")
        	        	  } else {
        	        		  $(".modal-title").html( modal_title_failure );
        	        		  $(".modal-body").html( data );
        	        		  $("#btn-submit-modal").hide();
        	        		  $("#btn-next-modal").hide();
        	        		  $("#submitChkBox").val("failure")
        	        	  };
        	          },
        	          
        	          // 응답이 종료되면 실행, 성공여부와 상관없이 ajax 완료후 작업 
        	          complete : function(data) {
        	          },
        	          
        	          // 에러가 났을 경우의 작업
        			  error: function(response, textStatus){
        				   
        				  $(".modal-title").html( modal_title_error );
                		  $(".modal-body").html( modal_body_error );
                		  $("#btn-submit-modal").hide();
    	        		  $("#btn-next-modal").hide();
                		  $("#submitChkBox").val("error")
                		  
        	          }
        	     });
        	     
        	     return false; // 페이지 리로딩을 막는다. 
          
              });  //end of btn-submit
              
            	$("#btn-next-modal").click(function(){
            	    //alert($("#submitChkBox").val());
            		if ($("#submitChkBox").val() != 'success') {
            			$(".modal-title").html( modal_title_before );	
                	    $(".modal-body").html( modal_body_before );
                	    $("#btn-submit-modal").hide();
                	    $("#btn-next-modal").hide();
             	  	 } else { 
            		location.href = next_location;
             	  	 }
            	});  // end of btn-next-modal
              
              
            				
                $("#sendMessageModal-Submit-btn").click(function(){
                	
          	      $.ajax({
          	          type: "POST",
          	          dataType: "text",
          	          //async: false,
          	          url: "./ImprovementOpinion",
          	          data: $("#sendMessageModalForm").serialize(),
          	          
          	          // 전송 전 작업
          	          beforeSend : function () {
          	        	
                  			
           			    if(  isNull($("#recipient-name").val()) ){
     	  	        		  
     		  	                  alert("이름과 메시지를 입력해주세요");
     		  	                  return false;
         			    }
          	          },
          	          
          	          // 요청에 성공하면 함수 실행 data는 응답 데이터가 들어간다
          	          success: function(data, textStatus){   
          	        	  
          	        	  
               			//메시지 세팅 

          	        	  if( data == 'success') {
          	     			//메시지 세팅 
      	        			$("#sendMessageModalLabel").html( "전송 성공" );	
      	        		    $("#sendMessageModalBody").html( "개선의견 감사합니다." );
      	        		    $("#sendMessageModal-Submit-btn").hide();
      	        		    
          	        	  } else {
       	        			$("#sendMessageModalLabel").html( "전송 성공" );	
         	        		$("#sendMessageModalBody").html( '<form id="sendMessageModal">'
         	        				+'<div class="mb-3">'
         	        				+'<label for="recipient-name" class="col-form-label">이 름 : </label>'
         	        				+'<input type="text" class="form-control" id="recipient-name">'
         	        				+'</div>'
         	        				+'<div class="mb-3">'
         	        				+'<label for="message-text" class="col-form-label">개선의견 :</label>'
         	        				+'<textarea class="form-control" id="message-text"></textarea>'
         	        				+'</div>'
         	        				+'</form>' );
         	        		$("#sendMessageModal-Submit-btn").show();
          	        	  };
          	        	  
          	        	  
          	        	
          	          },
          	          
          	          // 응답이 종료되면 실행, 성공여부와 상관없이 ajax 완료후 작업 
          	          complete : function(data) {
          	        	data = null;
          	          },
          	          
          	          // 에러가 났을 경우의 작업
          			  error: function(response, textStatus){
          				   
          				  $("#sendMessageModalLabel").html( "알림" );
                  		  $("#sendMessageModalBody").html( "요청 처리 중 오류가 발생하였습니다." );
                  		  
          	          }
          	     });
          	     
          	     return false; // 페이지 리로딩을 막는다. 
            
                });  //end of btn-submit	
            	
            	
 }); 

</script>
<!-- 모달 창 종료 -->

<div style="display:none;" class="loopple-alert loopple-alert-gradient-dark loopple-alert-dismissible loopple-fade loopple-position-fixed loopple-z-index-9999 loopple-top-10 loopple-mx-auto loopple-text-center loopple-right-0 loopple-w-30 loopple-opacity-5" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>	
	
	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">X</span></button>	
</div>
<!-- 

<script src="https://demo-basic.adminkit.io/js/app.js"></script>
<script src="./assets/js/loopple/loopple.js"></script>
 -->


 </body>

</html>
