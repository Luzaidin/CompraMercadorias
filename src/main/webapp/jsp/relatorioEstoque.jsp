<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@page import="model.Produto"%>
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
    <input type="submit" value="Gerar Relatório Estoque" class="submitButton" action="relatorioestoque.action" method="get"> 
</div>
<div>
    <label> Total de Items no Estoque</label>
    <label> <% items.size(); %> </label>
</div>
<div>
    <table>
        <tr>
            <th> Código</th>
            <th> Nome</th>
            <th> Unidade</th>
            <th> Preço R$</th>
            <th> Quantidade no Estoque</th>
            <th> Descrição</th>
        </tr>

        <%  for(Produto p : items){
            out.print("<tr>");
                out.print("<td>" + p.codigo + "</td>");
                out.print("<td>" + p.nome + "</td>");
                out.print("<td>" + p.unidade + "</td>");
                out.print("<td>" + p.preco + "</td>");
                out.print("<td>" + p.quantidade + "</td>");
                out.print("<td>" + p.descricao + "</td>");
            out.print("</tr>");
        }%>
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
</div>
    