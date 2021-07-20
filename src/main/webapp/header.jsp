<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SW사업 구현단계 FP 산출</title>
    <link href="https://demo-basic.adminkit.io/css/app.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/loopple/loopple.css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    
        <link rel="stylesheet" href="./assets/css/bootstrap.css">
    
        <script src="./assets/js/bootstrap.bundle.js"></script>
    

    <script>
	 //  사이트바 토글
	    $(document).ready(function() {
	        $('.sidebar-toggle').click(function() {
	            
	            $('#sidebar').toggle( 'fast' )
	        });
	    }); 
        
        // 모달 창 띄우기 1 : 2021 평균임금 
        $(document).ready(function() {
            $('#modal_btn').click(function() {
                //alert('클릭!');

                $('.modal_wrap').css({
                    display: 'block',
                    opacity: 0
                }).animate({
                    width: 800,
                    height: 1100,
                    opacity: 1
                }, 1000);
                $('.black_bg').css({
                    display: 'block'
                });
            });
        });    
      $(document).ready(function() {
            $('#modal_close').click(function() {
                //alert('클릭!');

                $('.modal_wrap').animate({
                    width: 0,
                    height: 0,
                    opacity: 0
                }, 800);
                $('.black_bg').css({
                    display: 'none'
                });
            });

        });


        // 모달 창 띄우기 2 : 트랜젝션 사례 
        $(document).ready(function() {
            // 클릭 발생
            $('.transaction_example_btn').click(function() {
                //alert('클릭!');

                $('.transaction_example').css({
                    display: 'block',
                    opacity: 0
                }).animate({
                    width: 900,
                    height: 1100,
                    opacity: 1
                }, 1000);

            });

            $('.transaction_example').click(function() {
                //alert('클릭!');

                $('.transaction_example').animate({
                    width: 0,
                    height: 0,
                    opacity: 0
                }, 800);

            });

        });

        // 모달 창 띄우기 3 : FP 단가  
        $(document).ready(function() {
            // 클릭 발생
            $('.cost_per_fp_btn').click(function() {
                //alert('클릭!');

                $('.cost_per_fp').css({
                    display: 'block',
                    opacity: 0
                }).animate({
                    width: 900,
                    height: 800,
                    opacity: 1
                }, 1000);

            });

            $('.cost_per_fp').click(function() {
                //alert('클릭!');

                $('.cost_per_fp').animate({
                    width: 0,
                    height: 0,
                    opacity: 0
                }, 800);

            });

        });

        // 모달 창 띄우기 4 : 보정계수   
        $(document).ready(function() {
            // 클릭 발생
            $('.correction_factor_btn').click(function() {
                //alert('클릭!');

                $('.correction_factor').css({
                    display: 'block',
                    opacity: 0
                }).animate({
                    width: 900,
                    height: 1000,
                    opacity: 1
                }, 1000);

            });

            $('.correction_factor').click(function() {
                //alert('클릭!');

                $('.correction_factor').animate({
                    width: 0,
                    height: 0,
                    opacity: 0
                }, 800);

            });

        });
      
        // 모달 창 띄우기 5 : 복잡도 및 기능점수 가중치   
        $(document).ready(function() {
            // 클릭 발생
            $('.complexity_weight_btn').click(function() {
                //alert('클릭!');

                $('.complexity_weight_div').css({
                    display: 'block',
                    opacity: 0
                }).animate({
                    width: 1500,
                    height: 1000,
                    opacity: 1
                }, 1000);

            });

            $('.complexity_weight_div').click(function() {
                //alert('클릭!');

                $('.complexity_weight_div').animate({
                    width: 0,
                    height: 0,
                    opacity: 0
                }, 800);

            });

        });






        // 사이드바 색상 변경하  
        $(document).ready(function() {
            // 마우스 오버 발생
            $('.sidebar-link').hover(function() {
                //alert(this);
                $(this).addClass('active');
            }, function() {
                $(this).removeClass('active');
            });
        });
        
        
        

        // 사이드바 메뉴 활성화
        $(document).ready(function() {
        	
		        var url = (window.location.pathname).replace("/WebProject", "");
        	
		        var url2;
		        //alert(url);
		            $(".sidebar-link").each(function (index, item) {
		            				url2 = $(item).attr("href").replace(".", "");
		            				//alert(url2);
		                            if (url == url2) {
		
						                $(this).parent('li').addClass('active');
						
						            } else {
						            	
						            	$(this).parent('li').removeClass('active');
						            }
		            })
		    });
        
    </script>
    <style>
        .text_right {
        text-align:right;
        }
        .modal_wrap {
            display: none;
            position: absolute;
            width: 0;
            height: 0;
            top: 10%;
            left: 30%;
            background: #eee;
            z-index: 2;
            border-radius: 25px;
            padding: 15px;
        }

        .black_bg {
            display: none;
            position: absolute;
            content: "";
            width: 100%;
            height: 300vh;
            background-color: rgba(0, 0, 0, 0.5);
            top: 0;
            left: 0;
            z-index: 1;
        }


        .modal_close {
            width: 26px;
            height: 26px;
            position: absolute;
            top: -30px;
            right: 0;
        }

        .modal_close>a {
            display: block;
            width: 100%;
            height: 100%;
            background: url(./assets/images/close-window.png);
            text-indent: -9999px;
        }



        /* FP 다이어그램  */


        .fp-item {
            border: 1px solid black;
            font-weight: bold;
            background-color: #ededef;
            font-size: 18px;
            width: 150px;
            height: 70px;
            text-align: center;
            padding-top: 8px;


            /* outer shadows  (note the rgba is red, green, blue, alpha) */
            -webkit-box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.4);
            -moz-box-shadow: 0px 1px 6px rgba(23, 69, 88, .5);

            /* rounded corners */
            -webkit-border-radius: 12px;
            -moz-border-radius: 7px;
            border-radius: 7px;

            /* gradients */
            background: -webkit-gradient(linear, left top, left bottom,
                    color-stop(0%, white), color-stop(15%, white), color-stop(100%, #D7E9F5));
            background: -moz-linear-gradient(top, white 0%, white 55%, #D5E4F3 130%);

        }

        .fp-item:hover {
            border: 2px solid blue;

        }



        #ilf {
            position: absolute;
            top: 60px;
            left: 78px;
        }


        #ei {
            position: absolute;
            top: 0px;
            left: 50px;
        }

        #eo {
            position: absolute;
            top: 140px;
            left: 400px;
        }

        #eif {
            position: absolute;
            top: 240px;
            left: 400px;
        }

        #eo-arrow {
            position: absolute;
            left: 340px;
            top: 155px;
        }

        #eif-arrow {
            position: absolute;
            left: 350px;
            top: 255px;
        }




        #ei-arrow {
            position: absolute;
            left: 110px;
            top: 95px;
            line-height: 0px;
        }


        #eq {
            position: absolute;
            top: 0px;
            left: 210px;
        }



        #eq-arrow {
            position: absolute;
            left: 270px;
            top: 95px;
            line-height: 0px;
        }


        #fp-app-boundary {
            position: absolute;
            left: 50px;
            top: 130px;
            background-color: #5588BD;
            width: 320px;
            height: 195px;
            text-align: center;
            /*   border:1px solid red;
 */
        }


        #fp-app-boundary p {
            font-size: 11px;
            color: white;
        }


        #fp-outer {
            text-align: center;
        }

        #fp-container {
            display: inline-block;
            position: relative;
            top: 10px;
            height: 400px;
            width: 600px;
            overflow: hidden;
            /*      border:1px solid blue;
 */
            /*
   background-color:WhiteSmoke;
    border:1px solid gray;*/
        }

        .fp-subtext {
            font-size: 10px;
        }

        .fp-details {
            display: inline-block;
            color: red;
            font-size: 20px;
            font-weight: normal;
            line-height: 20px;
            padding-top: 10px;
            /* border: 1px solid red; */

        }

        .fp-large {
            font-size: 40px;
        }

    </style>


