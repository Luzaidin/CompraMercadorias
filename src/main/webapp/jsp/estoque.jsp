<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <title>Belo -  Gerenciamento de Estoque</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="static/css/tabelas.css">
</head>
<body>
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
    <div class="row">
        <div class="col-4">
            <a href='estoque'>
                <label> Gerenciamento </label>
            </a>
        </div>
        <div class="col-4">
            <a href='cadastrar'>
                <label> Cadastrar / Atualizar </label>
            </a>
        </div>
        <div class="col-4">
            <a href='relatorioestoque'>
                <label> Relatório </label>
            </a>
        </div>
    </div>
</div>
<div>
    <div>
        <label> Barra de Pesquisa </label>
        <form method='get' action="buscarCodigo.action">
            <input type='number' placeholder="Código da mercadoria" min='0' name="buscaCodigo">
            <input type="submit" value="Buscar Código">
        </form>
    </div>
</div>
<div>
    <table>
        <thead>
            <tr>
                <th> Código</th>
                <th> Nome</th>
                <th> Unidade</th>
                <th> Preço R$</th>
                <th> Quantidade no Estoque</th>
                <th> Descrição</th>
                <th> Atualizar</th>
                <th> Excluir</th>
            </tr>
        </thead>
        <%
            Produto produto = (Produto) request.getAttribute("Produto"); 
            Integer produtoCodigo = 0;
            if(produto != null){ 
                produtoCodigo = produto.getCodigo();
            }
        %>
        <%
            if(produto != null){
                    out.print("<tr>");
                            out.print("<td>" + produto.getCodigo() + "</td>");
                            out.print("<td>" + produto.getNome() + "</td>");
                            out.print("<td>" + produto.getUnidade() + "</td>");
                            out.print("<td>" + produto.getPreco() + "</td>");
                            out.print("<td>" + produto.getQuantidade() + "</td>");
                            out.print("<td>" + produto.getDescricao() + "</td>");
                            out.print("<td> <button  id ='atualizarP' onclick=atualizar("+produto.getCodigo()+") > Atualizar</button> </td>");
                            out.print("<td> <button id='excluir' onclick=remover("+produto.getCodigo()+") > Excluir</button></td>");
                    out.print("</tr>");
            }
        %>
    </table>
    <div>
        <%
            String mensagem = (String) request.getAttribute("mensagem"); 
            if(mensagem != null){
                out.print("<label> " + mensagem + " </label>");
            }
        %>
    </div>
</div>


<script type="text/javascript">
    function atualizar(id){
        console.log('atualizar?id='+ id)
        window.location.href = 'atualizar?id='+ id;
    }

    function remover(id){
        console.log('excluir.action?id='+ id)
        window.location.href = 'excluir.action?id='+ id;
    }
</script> 
</body>