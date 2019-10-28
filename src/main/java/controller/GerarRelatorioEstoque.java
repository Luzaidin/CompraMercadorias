

import model.Produto;
import model.ProdutoDAO;
import model.ProdutoDAOImpl;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/relatorioestoque.action")
public class GerarRelatorioEstoque extends HttpServlet {   
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp){

        try{
            req.setCharacterEncoding("UTF-8"); 
        }catch(Exception e){} 

        ServletContext sc = req.getServletContext();

        try{
            ProdutoDAOImpl pd = new ProdutoDAOImpl();
            List<Produto> items = pd.findAll();
            req.setAttribute("gerarRelatorio", true);
            req.setAttribute("quantidadeEstoque", items.size());
        } catch(Exception e){
            req.setAttribute("mensagem", "Erro ao gerar relatório do estoque.");
            req.setAttribute("gerarRelatorio", false);
        }

        try {
            sc.getRequestDispatcher("/jsp/relatorioEstoque.jsp").forward(req, resp); 
        }catch(Exception e){
            //Tratamento de erro de IO ou de Servlet..
        }        
    }
}
