
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
        Produto p = new Produto();

        Integer codigo = 0;
        String nome = "";
        String unidade = "";
        Double preco = 0.0;
        Integer quantidade = 0;
        String descricao = "";

        if(verificarCampos(req, p, codigo, nome, unidade, preco, quantidade, descricao)){
            p.setCodigo(codigo);
            p.setNome(nome);
            p.setUnidade(unidade);
            p.setPreco(preco);
            p.setQuantidade(quantidade);
            p.setDescricao(descricao);

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

    public boolean verificarCampos(HttpServletRequest req, Produto p, Integer codigo, String nome, String unidade, Double preco, Integer quantidade, String descricao){
        //codigo
        try{
            codigo = Integer.parseInt(req.getParameter("codigo"));
        }catch(Exception e){
            req.setAttribute("mensagem", "Erro. Insira um número inteiro para o Código.");
            return false;
        }  

        //nome
        nome = req.getParameter("nome");
        if(nome.equals("")){
            req.setAttribute("mensagem", "Erro. Campo vazio para Nome.");
            return false;
        }

        //unidade
        unidade = req.getParameter("unidade");
        if(unidade.equals("")){
            req.setAttribute("mensagem", "Erro. Campo vazio para Unidade.");
            return false;
        }

        //preco
        try{
            preco = Double.parseDouble(req.getParameter("preco"));
        } catch(Exception e){
            req.setAttribute("mensagem", "Erro. Insira um número para o Preço.");
            return false;
        }  

        //quantidade
        try{
            quantidade = Integer.parseInt(req.getParameter("quantidade"));
        } catch(Exception e){
            req.setAttribute("mensagem", "Erro. Insira um número inteiro para a Quantidade.");
            return false;
        }  

        //descricao
        descricao = req.getParameter("descricao");
        if(descricao.equals("")){
            req.setAttribute("mensagem", "Erro. Campo vazio para Descrição.");
            return false;
        }

        req.setAttribute("mensagem", "Sucesso ao cadastrar Produto");
        return true;
    }
}