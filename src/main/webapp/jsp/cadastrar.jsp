<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
    <form action="cadastro.action" method="post">
        <div>
            <label>Código</label>
            <input type='number' placeholder="Código do Produto" min='0' name="codigo">
        </div>
        <div>
            <label>Nome</label>
            <input type='text' placeholder="Nome da Mercadoria" name="nome">
        </div>
        <div>
            <label>Unidade</label>
            <input type='text' placeholder="Unidade da Mercadoria" name="unidade">
        </div>
        <div>
            <label>Preço R$</label>
            <input type='number' placeholder="Preço Unitário do Produto" min='0' name="preco">
        </div>
        <div>
            <label>Quantidade no Estoque</label>
            <input type='number' placeholder="Quantidade da Mercadoria no Estoque" min='1' name="quantidade">
        </div>
        <div>
            <label>Descrição</label>
            <input type='text' placeholder="Descrição da Mercadoria" name="descricao">
        </div>
        <div>
            <input type="submit" value="Salvar" class="submitButton" >
        </div>
        <div>
            <% String m = (String) request.getAttribute("mensagem"); 
                out.print("<label> " + m + " </label>");
            %>
        </div>
    </form>
</div>