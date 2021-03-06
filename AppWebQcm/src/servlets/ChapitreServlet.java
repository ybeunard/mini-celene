package servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ejb.metier.interfaces.IChapitreMetier;

/**
 * Servlet implementation class ChapitreServlet
 */
@WebServlet("/ChapitreServlet")
public class ChapitreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	private IChapitreMetier metier ;

    public ChapitreServlet() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//INITIALISATION DE PARAMETRES
		String action = request.getParameter("action");
		String page = request.getParameter("page");
		
		String idModuleStr = request.getParameter("idModule");
		
		int idModule= 0;
		if(idModuleStr!=null && !idModuleStr.equals(""))
			idModule = Integer.parseInt(idModuleStr);
		
		String idChapitreStr = request.getParameter("idChapitre");
		int idChapitre= 0;
		if(idChapitreStr!=null && !idChapitreStr.equals(""))
			idChapitre = Integer.parseInt(idChapitreStr);
		
		String titre = request.getParameter("titre");
		String texte = request.getParameter("texte");
		
		String scoreMinStr = request.getParameter("scoreMin");
		int scoreMin = 0;
		if(scoreMinStr!=null && !scoreMinStr.equals(""))
			scoreMin = Integer.parseInt(scoreMinStr);
		
		String niveauStr = request.getParameter("niveau");
		int niveau = 0;
		if(niveauStr!=null && !niveauStr.equals(""))
			niveau = Integer.parseInt(niveauStr);
		
		String idModuleSessionStr =""+request.getSession().getAttribute("idMS");
		if(idModule == 0){
			if(idModuleSessionStr!=null && !idModuleSessionStr.equals(""))
				idModule= Integer.parseInt(idModuleSessionStr);
			System.out.println("i'm in "+idModule);
		}
		// FIN INITIALISATION DE PARAMETRES
		
		if(action!= null ){
			switch(action){
			case "module" :
				if(idModule !=0) {
					request.getSession().setAttribute("idMS",idModule);
				request.setAttribute("allChapitres", metier.getChapitres(idModule));
				request.getRequestDispatcher("enseignant/chapitre.jsp").forward(request, response);
				}
				break;
			case "Add":
				if(idModule != 0)
				metier.addChapitre(idModule, titre, texte, niveau, scoreMin);
				break;
			case "Edit":
				if(page.equals("chapitre")){
					request.setAttribute("currentChapitre", metier.getChapitre(idChapitre));
					request.getRequestDispatcher("enseignant/editChapitre.jsp").forward(request, response);
				} 
				else if(page.equals("edit") && idChapitre !=0){
					metier.editChapitreById(idChapitre, titre, texte, scoreMin);
					request.setAttribute("allChapitres", metier.getChapitres(idModule));
					request.getRequestDispatcher("enseignant/chapitre.jsp").forward(request, response);
				}
				else
					request.getRequestDispatcher("index.jsp").forward(request, response);
				break;
			case "Delete":
				metier.deleteChapitre(idChapitre);
				break;
			case "Search":
				metier.getChapitre(idChapitre);
				break;
			}
		}
		
		request.setAttribute("allChapitres", metier.getChapitres(idModule));
		request.getRequestDispatcher("enseignant/chapitre.jsp").forward(request, response);		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
	