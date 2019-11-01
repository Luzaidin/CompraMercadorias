<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@page import="model.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
        <title>Belo -  Gerenciamento de Estoque</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<div>
    <div>
        <div>
        <a href='mercadoria'>
            <label> Mercadorias </label>
        </a>
        <a href='estoque'>
            <label> Estoque </label>
        </a>
    </div>
</div>
<div>
    <div>
        <div>
        <a href='estoque'>
            <label> Gerenciamento </label>
        </a>
        <a href='cadastrar'>
            <label> Cadastrar / Atualizar </label>
        </a>
        <a href='relatorioestoque'>
            <label> Relatório </label>
        </a>
    </div>
</div>

<div>

</div>
<div>
    <form action="relatorioestoque.action" method="get">
            <div >
                    <input type="submit" value="Gerar Relatório Estoque" class="submitButton"> 
                </div>
            <label> Total de Items no Estoque</label>
            <div>
                <% 
                    Integer quantidade = (Integer) request.getAttribute("quantidadeEstoque"); 
                    
                    if(quantidade != null){
                        out.print("<label>" + quantidade + "</label>");
                    } else{
                        out.print("<label>" + 0 + "</label>");
                    }
                %>  
            </div>
            
            <table>
                    <tr>
                        <th> Código</th>
                        <th> Nome</th>
                        <th> Unidade</th>
                        <th> Preço R$</th>
                        <th> Quantidade no Estoque</th>
                        <th> Descrição</th>
                    </tr>
                    
                    <%
                        String gerarRelatorio = (String) request.getAttribute("gerarRelatorio");

                        if(gerarRelatorio != null){
                            List<Produto> items = (List) request.getAttribute("ListaProdutos");

                            if(items != null){
                                for(Produto p : items){
                                    out.print("<tr>");
                                        out.print("<td>" + p.getCodigo() + "</td>");
                                        out.print("<td>" + p.getNome() + "</td>");
                                        out.print("<td>" + p.getUnidade() + "</td>");
                                        out.print("<td>" + p.getPreco() + "</td>");
                                        out.print("<td>" + p.getQuantidade() + "</td>");
                                        out.print("<td>" + p.getDescricao() + "</td>");
                                    out.print("</tr>");
                                }
                            }
                        } else{
                            String m = (String) request.getAttribute("mensagem"); 
                            if(m != null){
                                out.print(m);
                            }
                        }
                    %>

            
                    <!--<tr>
                        <td> 0</td>
                        <td> Carne</td>
                        <td> FriBoi</td>
                        <td> Kg</td>
                        <td> 15</td>
                        <td> 0 </td>
                        <td> Uma carne</td>
                    </tr>
            
                    <tr>
                        <td> 1</td>
                        <td> Camiseta Nike</td>
                        <td> Nike</td>
                        <td> - </td>
                        <td> 15</td>
                        <td> 15 </td>
                        <td> Camiseta Nike</td>
                    </tr>-->
                </table>
    </form>
    
</div>
    