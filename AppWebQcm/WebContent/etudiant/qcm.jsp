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
<a href="AuthServlet?logout=1"><button type="button"> Se déconnecter </button></a>
<h1>ESPACE ETUDIANT</h1>
<h1>Q.C.M :</h1>
	
	<form action="./QcmServlet" method="post"  id="myform" >
		<c:forEach items="${listquestions}"  var="q" varStatus="ctr">
			<h3>Question :</h3> ${q.question}
			<h3>Les reponses :</h3>			
			<c:set var="inc"  value="${inc + 1}" />
				<c:forEach items="${listdelistReponses.get(ctr.index)}" var="reponse" >
					
					 <input type="radio" name="${inc}" value="${reponse.rep}"> ${reponse.rep}<br>
						 
						
				</c:forEach>
				
		</c:forEach>
		<button type="submit" name="action" value="verify" formaction="./QcmServlet?repQuestion=${reponse.rep}" form="myform">envoyer </button>		
	</form>
</body>
</html>