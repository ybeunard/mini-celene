<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Modules Information</h1>
	<form action="./ModuleServlet" method="post" id="myform">
	<table>
		<tr>
			<td>nom</td>
			<td><input type="text" name="nom" value="${currentModule.nom}"/></td>
		</tr>
	
		<tr>
			<td>
			<button type="submit" name="action" value="Edit" formaction="./ModuleServlet?id=${currentModule.id}&page=edit">Edit</button>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>