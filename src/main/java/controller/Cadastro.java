
import model.Produto;
import model.ProdutoDAO;
import model.ProdutoDAOImpl;
import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "cadastro.action", urlPatterns = {"/cadastro.action"})
public class Cadastro extends HttpServlet {   

    
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp){

        try{
            req.setCharacterEncoding("UTF-8"); 
        }catch(Exception e){} 

        ServletContext sc = req.getServletContext();
        ProdutoDAOImpl pd = new ProdutoDAOImpl();
        Produto p = verificarCampos(req);
        if(p != null){
             if(!pd.insert(p)){
                req.setAttribute("mensagem", "Erro ao inser o produto.");
            } 
        }

        try {
            sc.getRequestDispatcher("/jsp/cadastrar.jsp").forward(req, resp); 
        }catch(Exception e){
            //Tratamento de erro de IO ou de Servlet..
        }
    }

    public Produto verificarCampos(HttpServletRequest req){
        //codigo
        Produto p = new Produto();

        try{
            p.setCodigo(Integer.parseInt(req.getParameter("codigo")));
        }catch(Exception e){
            req.setAttribute("mensagem", "Erro. Insira um número inteiro para o Código.");
        }  

        //nome
        p.setNome(req.getParameter("nome"));
        // if(nome.equals("")){
        //     req.setAttribute("mensagem", "Erro. Campo vazio para Nome.");
        // }

        //unidade
        p.setUnidade(req.getParameter("unidade"));
        // if(unidade.equals("")){
        //     req.setAttribute("mensagem", "Erro. Campo vazio para Unidade.");
        // }

        //preco
        try{
            p.setPreco(Double.parseDouble(req.getParameter("preco")));
        } catch(Exception e){
            req.setAttribute("mensagem", "Erro. Insira um número para o Preço.");

        }  

        //quantidade
        try{
            p.setQuantidade(Integer.parseInt(req.getParameter("quantidade")));
        } catch(Exception e){
            req.setAttribute("mensagem", "Erro. Insira um número inteiro para a Quantidade.");

        }  

        //descricao
        p.setDescricao(req.getParameter("descricao"));
        // if(descricao.equals("")){
        //     req.setAttribute("mensagem", "Erro. Campo vazio para Descrição.");

        // }

        req.setAttribute("mensagem", "Sucesso ao cadastrar Produto");
        return p;
    }
}