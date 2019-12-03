<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@page import="model.Produto"%>

<head>
    <title>Belo -  Cadastro/Atualziar Mercadoria</title>
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
    <% Produto produto = (Produto) request.getAttribute("Produto"); 
    Integer atualizar = (Integer) request.getAttribute("Atualizar"); 
    Integer codigo = 0;
    String nome = "";
    String unidade = "";
    Double preco = 0 * 1.0;
    Integer quantidade = 0;
    String descricao = "";

    if(produto != null){
        codigo = produto.getCodigo();
        nome = produto.getNome();
        unidade = produto.getUnidade();
        preco = produto.getPreco();
        quantidade = produto.getQuantidade();
        descricao = produto.getDescricao();
    }

    if(atualizar == 1){%>
    <form action="atualizarProduto.action" method="post">
    <%} else{%>
    <form action="cadastro.action" method="post">
    <%} 
    %>
    <!--<form action="cadastro.action" method="post">-->
        <div>
            <label>Código</label>
            <%
            if(atualizar == 1){%>
            <input type="number" placeholder="Código" min="0" name="codigo" value="<%=codigo%>" readonly>
            <%
            } else{%>
            <input type="number" placeholder="Código do Produto" min="0" name="codigo">
            <%} 
            %>
            <!--<input type="number" placeholder="Código do Produto" min="0" name="codigo">-->
        </div>
        <div>
            <label>Nome</label>
            <%
            if(atualizar == 1){%>
            <input type="text" placeholder="Nome da Mercadoria" name="nome" value="<%=nome%>">
            <%
            } else{%>
            <input type="text" placeholder="Nome da Mercadoria" name="nome">
            <%} 
            %>
            <!--<input type="text" placeholder="Nome da Mercadoria" name="nome">-->
        </div>
        <div>
            <label>Unidade</label>
            <%
            if(atualizar == 1){%>
            <<input type="text" placeholder="Unidade da Mercadoria" name="unidade" value="<%=unidade%>">
            <%
            } else{%>
            <<input type="text" placeholder="Unidade da Mercadoria" name="unidade">
            <%} 
            %>
            <!--<input type="text" placeholder="Unidade da Mercadoria" name="unidade">-->
        </div>
        <div>
            <label>Preço R$</label>
            <%
            if(atualizar == 1){%>
            <input type="number" placeholder="Preço Unitário do Produto" min="0" name="preco" step="any" value="<%=preco%>">
            <%
            } else{%>
            <input type="number" placeholder="Preço Unitário do Produto" min="0" name="preco" step="any">
            <%} 
            %>
            <!--<input type="number" placeholder="Preço Unitário do Produto" min="0" name="preco">-->
        </div>
        <div>
            <label>Quantidade no Estoque</label>
            <%
            if(atualizar == 1){%>
            <input type="number" placeholder="Quantidade da Mercadoria no Estoque" min="1" name="quantidade" value="<%=quantidade%>">
            <%
            } else{%>
            <input type="number" placeholder="Quantidade da Mercadoria no Estoque" min="1" name="quantidade">
            <%} 
            %>
            <!--<input type="number" placeholder="Quantidade da Mercadoria no Estoque" min="1" name="quantidade">-->
        </div>
        <div>
            <label>Descrição</label>
            <%
            if(atualizar == 1){%>
            <input type="text" placeholder="Descrição da Mercadoria" name="descricao" value="<%=descricao%>">
            <%
            } else{%>
            <input type="text" placeholder="Descrição da Mercadoria" name="descricao">
            <%} 
            %>
            <!--<input type="text" placeholder="Descrição da Mercadoria" name="descricao">-->
        </div>
        <div>
            <%
            if(atualizar == 1){%>
            <input type="submit" value="Atualizar" class="submitButton">
            <%
            } else{%>
            <input type="submit" value="Salvar" class="submitButton">
            <%} 
            %>
            <!--<input type="submit" value="Salvar" class="submitButton">-->
        </div>
        <div>
            <% String m = (String) request.getAttribute("mensagem"); 
                out.print("<label> " + m + " </label>");
            %>
        </div>
    </form>
</div>