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
<h1>ESPACE ADMINISTRATEUR</h1>

	<br><a href="AuthServlet?logout=1"> Se déconnecter </a>
	<br>
	<h1>Users Information</h1>
	<form action="./UserServlet" method="post" id="myform">
	<table>
		
		<tr>
			<td>Login</td>
			<td><input type="text" name="login" value="${utilisateur.login}"/></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="text" name="password" value="${utilisateur.password}"/></td>
		</tr>
		<tr>
			<td>Role</td>
			<td><input type="text" name="role" value="${utilisateur.role}"/></td>
		</tr>
		
		<tr>
			<td>Nom</td>
			<td><input type="text" name="nom" value="${utilisateur.nom}"/></td>
		</tr>
		
		<tr>
			<td>Prenom</td>
			<td><input type="text" name="prenom" value="${utilisateur.prenom}"/></td>
		</tr>
		
		<tr>
			<td>
			<input type="submit" name="action" value="Add" />
			</td>
		</tr>
		
	</table>
	</form>
	
	<br>
	<table>
			<tr>
				<th>LOGIN :</th>
				<th>PASSWORD : </th>
				<th>ROLE :</th>
				<th>NOM : </th>
				<th>PRENOM :</th>
				<th></th>
				<th></th>
			</tr>
		<c:forEach items="${allUsers}" var="u">
			<tr>
				<td>${u.login}</td>
				<td>${u.password}</td>
				<td>${u.role}</td>
				<td>${u.nom}</td>
				<td>${u.prenom}</td>
				<td><button type="submit" name="action" value="Edit" formaction="./UserServlet?login=${u.login}&page=home" form="myform">Edit</button></td>
				<td><button type="submit" name="action" value="Delete" formaction="./UserServlet?login=${u.login}" form="myform">Drop</button></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>