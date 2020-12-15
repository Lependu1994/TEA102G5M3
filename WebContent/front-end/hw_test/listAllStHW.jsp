<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.student_homework.model.*"%>


<%
	Student_homeworkService sthwService = new Student_homeworkService();
	List<Student_homeworkVO> list = sthwService.getAll();
	pageContext.setAttribute("list", list);
%>


<html>
<head>
<title>�Ҧ��ǥͧ@�~��� - listAllStHW.jsp</title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body bgcolor='white'>
	<table id="table-1">
		<tr>
			<td>
				<h3>�Ҧ��ǥͧ@�~��� - listAllStHW.jsp</h3>
				<h4>
					<a href="studenthw.jsp">�^����	</a>
				</h4>
			</td>
		</tr>
	</table>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<table>
		<tr>
			<th>�@�~�s��</th>
			<th>�@�~�s��</th>
			<th>�ǥͽs��</th>
			<th>�ɮ�</th>
			<th>�W�Ǯɶ�</th>
			<th>��s�ɶ�</th>
			<th>�ק�</th>
			<th>�R��</th>
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="sthwVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

			<tr>
				<td>${sthwVO.studenthw_id}</td>
				<td>${sthwVO.teacherhw_id}</td>
				<td>${sthwVO.member_id}</td>
				<td>${sthwVO.file_data}</td>
				<td>${sthwVO.hw_uploadtime}</td>
				<td>${sthwVO.hw_updatetime}</td>
				<td>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/hw_test/studenthw.do" style="margin-bottom: 0px;">
						<input type="submit" value="�ק�">
						<input type="hidden" name="studenthw_id"  value="${sthwVO.studenthw_id}">
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/hw_test/studenthw.do" style="margin-bottom: 0px;">
						<input type="submit" value="�R��">
						<input type="hidden" name="studenthw_id" value="${sthwVO.studenthw_id}">
						<input type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>

</body>
</html>