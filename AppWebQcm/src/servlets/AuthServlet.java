package servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ejb.metier.interfaces.IUserMetier;

@WebServlet("/AuthServlet")
public class AuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int ADMIN=1;
	static final int ENSEIGNANT=2;
	static final int ETUDIANT=3;
	
	

@EJB
private IUserMetier metier ;
       
    public AuthServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//si le parametre logout n'est pas null, on detruit la variable de session login
		if (request.getParameter("logout") != null) {
			request.getSession().removeAttribute("login");
		}
		
		//on get la variable de session login
		String login = (String) request.getSession().getAttribute("login");
		String submit = request.getParameter("submit");
	//	String role = "null";
		
		// pour verifier si l'utilisateur s'est deja authentifier ( variable de session )
		if (login == null) {
			if(submit!= null && submit.equals("auth")){
				String mdp = request.getParameter("mdp");
				login = request.getParameter("login");
				
				if ((login != null) && (mdp != null)) {
					if (metier.checkCredentials(login, mdp)) {
						
						request.getSession().setAttribute("login", login);
						switchRoleRedirection(login,request, response);
						return;
					} else {
						request.setAttribute("result", "Connexion echouée");
					}
				}
				else 
					request.getRequestDispatcher("login.jsp").forward(request, response);
				
			}
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		else{
			System.out.println(login+"a");
			
			System.out.println("b"+metier.getRole(login));
			switchRoleRedirection(login,request, response);
		}	
	}
	private void switchRoleRedirection(String login, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		switch(metier.getRole(login)){
		
		case ADMIN :
			request.setAttribute("allUsers", metier.listUser());
			request.getRequestDispatcher("admin/home.jsp").forward(request, response);
			break;
		case ENSEIGNANT :
			request.getRequestDispatcher("enseignant/home.jsp").forward(request, response);
			break;
		case ETUDIANT :
			request.getRequestDispatcher("/InscriptionServlet").forward(request, response);
			break;
		default : 
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
