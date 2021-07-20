<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="./header.jsp" />
<script>
	var form_name = "" //form 이름 
	var form_target = "" //post 대상 
	var page_subject = "" 
	var next_location = ""
</script>
<body class="null">



    <div class="wrapper">
        <!-- side bar -->
        <jsp:include page="./sidebar.jsp" />

        <div class="main" id="panel">
            <!-- navi bar -->
            <jsp:include page="./navi.jsp" />


            <main class="content text-center">
                <div class="container-fluid p-0">
                    <div class="card flex-fill">
                        <div class="card-header text-center">

                            <h1><strong>SW사업 구현단계 FP 산출</strong></h1>
                        </div>
                        <table class="table table-hover my-0">
                            <thead>
                                <tr>
                                    <th>
                                        <p class="mbr-text mbr-fonts-style display-7">
                                            소프트웨어 의 개발을 위한 요구사항 분석에서부터&nbsp;분석, 설계, 구현, 시험 단계별 공정에 대한 개발비를 산출할 수 있도록 구현되어 있습니다.<br>&nbsp;개발비 산정은 소프트웨어 개발규모를 기능점수(FP; Function Point) 방식으로 산출하며, <br>
                                            기획 및 발주단계에서의 기능점수 측정 및 예산 산출이 가능하도록 적용되었습니다.<br>
                                            예산 산출을 위한 기능점수 단가와 보정계수는 'SW사업 대가산정 가이드'를 준용합니다.</p>
                                        <div class="mbr-section-btn mt-3">
                                            <a class="btn btn-success display-4" href="https://www.sw.or.kr/site/sw/ex/board/View.do?cbIdx=276&amp;bcIdx=49546&amp;searchExt1=" target="_blank">2021 SW사업 대가산정 가이드</a>
                                            <a class="btn btn-success display-4" href="https://www.sw.or.kr/site/sw/ex/board/View.do?cbIdx=304&amp;bcIdx=47505&amp;searchExt1=" target="_blank">2021년 SW기술자 평균임금</a>
                                        </div>
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="text-canter">
                                        <h2><strong>SW사업 구현단계 대가산정</strong></h2>
                                    </td>

                                </tr>
                                <tr>
                                    <td>

                                        <p class="mbr-text mbr-fonts-style display-7">
                                            소프트웨어 개발비 산정은 소프트웨어 개발규모를 기능점수(FP; Function Point)로 측정하고 기능점수당 단가를 곱하여 비용을 산출하는 기능점수 방식을 원칙으로 합니다.<br><br>
                                            기능점수(FP; Function Point) 방법은 사용자 관점에서의 사용자가 요구하고 사용자에게 인 도되는 기능을 정량적으로 산정하는 소프트웨어 규모 측정방법으로 <br>
                                            ISO/IEC 14143(FSM; Functional Size Measurement)으로 SW Size에 대한 국제표준이며, <br>
                                            소프트웨어 개발, 유지관리 및 운영 을 위한 비용과 자원 소요를 산정하는데 가장 중요한 요소입니다.</p>

                                    </td>

                                </tr>
                                <tr>
                                    <td class="text-canter">

                                        <h2><strong>기능점수란?</strong></h2>

                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <p class="mbr-text mbr-fonts-style display-7">기능점수(FP; Function Point)란 사용자 관점에서 측정된 소프트웨어 기능의 양으로서, 사용자에게 제공되는 소프트웨어 기능의 규모를 측정하는 단위입니다.<br />
                                            소프트웨어 기능은 사용자 관점에서 갖는 논리적 의미에 따라 크게&nbsp;<strong>데이터 측면</strong>의 기능과&nbsp;<strong>트랜잭션 측면</strong>의 기능으로 구분됩니다.<br />

                                            <br>이들을 다시 세분하면&nbsp;<strong>데이터 기능</strong>에는&nbsp;<strong>내부논리파일(ILF)</strong>과&nbsp;<strong>외부연계파일(EIF)</strong>의 2가지 유형이 있으며,&nbsp;<br><strong>트랜잭션 기능</strong>에는 세부적으로&nbsp;<strong>외부입력(EI)</strong>,&nbsp;<strong>외부출력(EO)</strong>,&nbsp;<strong>외부조회(EQ)</strong>의 3가지 유형이 있습니다.

                                        </p>

                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <h2><strong>기능점수 측정방식의 종류</strong></h2>

                                    </td>

                                </tr>
                                <tr>
                                    <td class="text-canter">

                                        <p class="mbr-text mbr-fonts-style display-7">

                                            기능점수 방식으로 소프트웨어의 개발규모를 산정하는 방법은 일반적인 기능점수 산정방법 (정통법)과 평균 복잡도를 적용하는 방법(간이법)의 두 가지로 구분할 수 있습니다.<br><br>
                                            <strong>정통법</strong><br>
                                            &nbsp;&nbsp;소프트웨어의 기능을 도출하고,&nbsp;<strong>각 기능의 유형별 복잡도를 고려</strong>하여 정확한 기능점수 산정을 필요로 할 경우 사용 되는 일반적인 방법입니다. <br>통상적으로 소프트웨어 개발 공정 상<strong>&nbsp;설계공정 후 사용</strong>됩니다.<br>
                                            <br><br>
                                            <strong>간이법</strong><br>
                                            &nbsp; &nbsp; 기능의 복잡도를 판단하기 어려운 경우 적용하는 방법으로 계산 절차는 정통 법과 동일하나 기능점수 산정 시&nbsp;<strong>기능 유형별 평균 복잡도</strong>를 적용하여 기능 점수를 산출합니다. <br>통상적으로&nbsp;<strong>기획 및 발주단계</strong>에서의 기능점수 측정에 사용 됩니다.<br>
                                        </p>


                                    </td>

                                </tr>
                                <tr>
                                    <td class="text-canter">
                                        <h2><strong>기능점수 방식의 SW개발비 산정</strong></h2>

                                    </td>

                                </tr>
                                <tr>
                                    <td>

                                        <p class="mbr-text mbr-fonts-style display-7">
                                            기능점수 방식에 의한 소프트웨어 개발비는 크게 소프트웨어 개발원가, 직접경비, 이윤의 세 부분으로 구성됩니다. <br>소프트웨어 개발원가는 기능점수로 측정되는 소프트웨어 개발규모에 기능점수당 단가를 곱하고 여기에 보정계수를 곱하여 산정됩니다.<br> 직접경비는 해당 소프트웨어 개발사업에 소요되는 직접적인 경비를 의미합니다. 이윤은 개발원가의 25% 이내에서 계상됩니다.

                                        </p>


                                    </td>

                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
            <!-- Footer -->
            <jsp:include page="./footer.jsp" />
