<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
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
    <form>
        <div>
            <label>Código</label>
            <input type='number' placeholder="Código do Produto" min='0'>
        </div>
        <div>
            <label>Nome</label>
            <input type='text' placeholder="Nome da Mercadoria">
        </div>
        <div>
            <label>Unidade</label>
            <input type='text' placeholder="Unidade da Mercadoria">
        </div>
        <div>
            <label>Preço R$</label>
            <input type='number' placeholder="Preço Unitário do Produto" min='0'>
        </div>
        <div>
            <label>Quantidade no Estoque</label>
            <input type='number' placeholder="Quantidade da Mercadoria no Estoque" min='1'>
        </div>
        <div>
            <label>Descrição</label>
            <input type='text' placeholder="Descrição da Mercadoria">
        </div>
    </form>
    <div>
        <button>
            Salvar 
        </button>
    </div>
</div>