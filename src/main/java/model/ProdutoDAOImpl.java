package model;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import model.Produto;
import model.ProdutoDAO;

public class ProdutoDAOImpl implements ProdutoDAO {

    public ProdutoDAOImpl(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("");        
        EntityManager em = emf.createEntityManager();
        Produto p = em.find(Produto.class);
    }

    @Override
    public boolean insert(Produto produto){
        if(findByCodigo(produto.codigo) != null){
            return false;
        } else{
            Query query = em.createNativeQuery("insert into produto (codigo, nome, unidade, preco, quantidade, descricao) " +
                " values(?, ?, ?, ?, ?, ?)");
            query.setParameter(1, produto.codigo);
            query.setParameter(2, produto.nome);
            query.setParameter(3, produto.unidade);
            query.setParameter(4, produto.preco);
            query.setParameter(5, produto.quantidade);
            query.setParameter(6, produto.descricao);
            query.executeUpdate();

            return true;
        }
    }

    @Override
    public boolean update(Produto produto){
        if(findByCodigo(produto.codigo) != null){
            return false;
        } else{
            Query query = em.createNativeQuery("update produto set codigo = :codigo, nome = :nome," + 
            " unidade = :unidade, preco = :preco, quantidade = :quantidade, descricao = : quantidade " +
            " where codigo = :codigo");
            query.setParameter("codigo", produto.codigo);
            query.setParameter("nome", produto.nome);
            query.setParameter("unidade", produto.unidade);
            query.setParameter("preco", produto.preco);
            query.setParameter("quantidade", produto.quantidade);
            query.setParameter("descricao", produto.descricao);
            query.executeUpdate();

            return true;
        }
    }

    @Override
    public boolean delete(Integer codigo){
        if(findByCodigo(codigo) == null){
            return false;
        } else{
            Query query = em.createNativeQuery("delete from produto where codigo = :codogp");
            query.setParameter("codigo", codigo);
            query.executeUpdate();

            return true;
        }
    }

    @Override
    public Produto findByCodigo(Integer codigo){
        Query query = em.createQuery("select p from produto p  where p.codigo = :codigo"); 
        query.setParameter("codigo", codigo);  
        Produto produto = query.getResultList();

        return produto;
    }

    @Override
    public List<Produto> findAll(){
        Query query = em.createQuery("select p from produto p "); 
        List<Produto> produto = query.getResultList();

        return produto;
    }
}