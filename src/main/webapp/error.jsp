<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="./header.jsp" />
<%
String pageName =null;
%>

<body class="null">



    <div class="wrapper">
        <!-- side bar -->
        <jsp:include page="./sidebar.jsp" />

        <div class="main" id="panel">
            <!-- navi bar -->
            <jsp:include page="./navi.jsp" />


            <main class="content text-center">

				<h1> 이거슨 에러 입니다.</h1>
				<h2>${err}</h2>
				
				<img src="./assets/images/error.png">
				</main>
            <!-- Footer -->
            <jsp:include page="./footer.jsp" />
