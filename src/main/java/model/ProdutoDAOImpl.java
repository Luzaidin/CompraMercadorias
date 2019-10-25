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
    }

    @Override
    public boolean insert(Produto produto){
        EntityManagerFactory emf     = Persistence.createEntityManagerFactory("compra_mercadorias");
        EntityManager em = emf.createEntityManager();
        if(findByCodigo(produto.getCodigo()) != null){
            return false;
        } else{
            Query query = em.createNativeQuery("insert into produto (codigo, nome, unidade, preco, quantidade, descricao) " +
                " values(?, ?, ?, ?, ?, ?)");
            query.setParameter(1, produto.getCodigo());
            query.setParameter(2, produto.getNome());
            query.setParameter(3, produto.getUnidade());
            query.setParameter(4, produto.getPreco());
            query.setParameter(5, produto.getQuantidade());
            query.setParameter(6, produto.getDescricao());
            query.executeUpdate();

            em.close();
            emf.close(); 

            return true;
        }
    }

    @Override
    public boolean update(Produto produto){
        EntityManagerFactory emf     = Persistence.createEntityManagerFactory("compra_mercadorias");
        EntityManager em = emf.createEntityManager();
        if(findByCodigo(produto.getCodigo()) != null){
            return false;
        } else{
            Query query = em.createNativeQuery("update produto set codigo = :codigo, nome = :nome," + 
            " unidade = :unidade, preco = :preco, quantidade = :quantidade, descricao = : quantidade " +
            " where codigo = :codigo");
            query.setParameter("codigo", produto.getCodigo());
            query.setParameter("nome", produto.getNome());
            query.setParameter("unidade", produto.getUnidade());
            query.setParameter("preco", produto.getPreco());
            query.setParameter("quantidade", produto.getQuantidade());
            query.setParameter("descricao", produto.getDescricao());
            query.executeUpdate();
            em.close();
            emf.close(); 

            return true;
        }
    }

    @Override
    public boolean delete(Integer codigo){
        EntityManagerFactory emf     = Persistence.createEntityManagerFactory("compra_mercadorias");
        EntityManager em = emf.createEntityManager();
        if(findByCodigo(codigo) == null){
            return false;
        } else{
            Query query = em.createNativeQuery("delete from produto where codigo = :codogp");
            query.setParameter("codigo", codigo);
            query.executeUpdate();
            em.close();
            emf.close(); 

            return true;
        }
    }

    @Override
    public Produto findByCodigo(Integer codigo){
        EntityManagerFactory emf     = Persistence.createEntityManagerFactory("compra_mercadorias");
        EntityManager em = emf.createEntityManager();
        Query query = em.createQuery("select p from produto p  where p.codigo = :codigo"); 
        query.setParameter("codigo", codigo);  
        Produto produto = (Produto)query.getSingleResult();
        em.close();
        emf.close();  

        return produto;
    }

    @Override
    public List<Produto> findAll(){
        EntityManagerFactory emf     = Persistence.createEntityManagerFactory("compra_mercadorias");
        EntityManager em = emf.createEntityManager();
        Query query = em.createQuery("select p from produto p "); 
        List<Produto> produto = query.getResultList();
        em.close();
        emf.close(); 

        return produto;
    }
}