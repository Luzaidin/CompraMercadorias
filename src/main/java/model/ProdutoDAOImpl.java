package model;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import model.Produto;
import model.ProdutoDAO;

public class ProdutoDAOImpl implements ProdutoDAO {

    protected EntityManager entityManager;

    @Override
    public boolean insert(Produto produto){
        //System.out.println("produto e seu codigo" + produto.getCodigo());
        entityManager = ServicoEntityManager.getEntityManager();
        if(findByCodigo(produto.getCodigo()) != null){
             return false;
        } else{
            //System.out.println("Cadastrando.");
            Query query = entityManager.createNativeQuery("insert into Produto (codigo, nome, unidade, preco, quantidade, descricao) " +
                " values(?, ?, ?, ?, ?, ?)", Produto.class);

            entityManager.getTransaction().begin();
            query.setParameter(1, produto.getCodigo());
            query.setParameter(2, produto.getNome());
            query.setParameter(3, produto.getUnidade());
            query.setParameter(4, produto.getPreco());
            query.setParameter(5, produto.getQuantidade());
            query.setParameter(6, produto.getDescricao());


            query.executeUpdate();

            entityManager.getTransaction().commit();
            

            //entityManager.close();

            return true;
        }
    }

    @Override
    public boolean update(Produto produto){
        entityManager = ServicoEntityManager.getEntityManager();
        if(findByCodigo(produto.getCodigo()) != null){
            return false;
        } else{
            Query query = entityManager.createNativeQuery("update Produto set codigo = :codigo, nome = :nome," + 
            " unidade = :unidade, preco = :preco, quantidade = :quantidade, descricao = : quantidade " +
            " where codigo = :codigo", Produto.class);
            query.setParameter("codigo", produto.getCodigo());
            query.setParameter("nome", produto.getNome());
            query.setParameter("unidade", produto.getUnidade());
            query.setParameter("preco", produto.getPreco());
            query.setParameter("quantidade", produto.getQuantidade());
            query.setParameter("descricao", produto.getDescricao());

            entityManager.getTransaction().begin();
            query.executeUpdate();
            entityManager.getTransaction().commit();

            //entityManager.close();

            return true;
        }
    }

    @Override
    public boolean delete(Integer codigo){
        entityManager = ServicoEntityManager.getEntityManager();
        if(findByCodigo(codigo) == null){
            return false;
        } else{
            Query query = entityManager.createNativeQuery("delete from Produto where codigo = :codogp", Produto.class);
            query.setParameter("codigo", codigo);

            entityManager.getTransaction().begin();
            query.executeUpdate();
            entityManager.getTransaction().commit();

           // entityManager.close();

            return true;
        }
    }

    @Override
    public Produto findByCodigo(Integer codigo){
        //System.out.print("entrou no codigo " + codigo);
        try{
            entityManager = ServicoEntityManager.getEntityManager();
            Query query = entityManager.createQuery("select p from Produto p  where p.codigo = :codigo", Produto.class); 

            query.setParameter("codigo", codigo);  

            Produto produto = (Produto)query.getSingleResult();


            //System.out.print("vproduto e  :" + produto);

            return produto;
        } catch(Exception e){
            System.out.print("Erro ");
            return null;
        }
    }

    @Override
    public List<Produto> findAll(){
        entityManager = ServicoEntityManager.getEntityManager();
        Query query = entityManager.createQuery("select p from Produto p ", Produto.class); 

        entityManager.getTransaction().begin();
        List<Produto> produto = query.getResultList();
        entityManager.getTransaction().commit();
        System.out.println("olha a lançaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

        //entityManager.close(); 

        return produto;
    }
}