import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet( urlPatterns={"/relatoriocompra"})
public class RelatorioCompra extends HttpServlet{
    
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp){
        
        ServletContext sc = req.getServletContext();

        try{
        sc.getRequestDispatcher("/jsp/relatorioCompra.jsp").forward(req, resp);            
        } catch (Exception e){}
    }
}
