<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>ESPACE ENSEIGNANT</h1>
<h2>GESTION CHAPITRE</h2>
<br><a href="AuthServlet?logout=1"> Se déconnecter </a>
<form action="./ChapitreServlet" method="post"  id="myform" >
	
	<table>
		<tr>
			<td>titre : </td>
			<td><input type="text" name="titre" value="${chapitre.titre}"/></td>
		</tr>
		<tr>
			<td>texte : </td>
			<td><input type="text" name="texte" value="${chapitre.texte}"/></td>
		</tr>
		<tr>
			<td>niveau : </td>
			<td><input type="text" name="niveau" value="${chapitre.niveau}"/></td>
		</tr>
		<tr>
			<td>score Min : </td>
			<td><input type="text" name="scoreMin" value="${chapitre.scoreMin}"/></td>
		</tr>
	
		<tr>
			<td>
			<button type="submit" name="action" value="Add" formaction="./ChapitreServlet?idModule=${idMS}" form="myform">Ajouter</button>
			
			</td>
		</tr>
	</table>

	<table>
			<tr>
				<th>Titre :</th>
				<th>Texte : </th>
				<th>Niveau :</th>
				<th>Score Min :</th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
		<c:forEach items="${allChapitres}" var="chapitre" >
			<tr>
				<td>${chapitre.titre} </td>
				<td>${chapitre.texte}</td>
				<td>${chapitre.niveau}</td>
				<td>${chapitre.scoreMin}</td>
				<td><button type="submit" name="action" value="Edit" formaction="./ChapitreServlet?idChapitre=${chapitre.id}&page=module" form="myform">Modifier le chapitre</button></td>
				<td><button type="submit" name="action" value="Delete" formaction="./ChapitreServlet?idChapitre=${chapitre.id}" form="myform">Supprimer </button></td>
				<td><button type="submit" name="action" value="Edit" formaction="./QuestionReponseServlet?idChapitre=${chapitre.id}&page=chapitre&action=chapitre" form="myform">Gerer les questionnaires du chapitre</button></td>
			 </tr>
		</c:forEach>
	</table>
</form>
</body>
</html>