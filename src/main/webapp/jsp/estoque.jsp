<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
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
    <div>
        <label> Barra de Pesquisa </label>
        <input type='number' placeholder="Código da mercadoria" min='0'>
        <button type='button'> 
            <label> Botao Pesquisa </label>
        </button>
    </div>
</div>
<div>
    <table>
        <tr>
            <th> Código</th>
            <th> Nome</th>
            <th> Marca</th>
            <th> Unidade</th>
            <th> Preço R$</th>
            <th> Quantidade no Estoque</th>
            <th> Descrição</th>
        </tr>

        <tr>
            <td> 0</td>
            <td> Carne</td>
            <td> FriBoi</td>
            <td> Kg</td>
            <td> 15</td>
            <td> 0 </td>
            <td> Uma carne</td>
            <td>
                <button>
                    <a href='atualizar'>
                        <label> Alterar </label>
                    </a>
                </button>
            </td>
            <td>
                <button>
                    <label> Excluir </label>
                </button>
            </td>
        </tr>

        <tr>
            <td> 1</td>
            <td> Camiseta Nike</td>
            <td> Nike</td>
            <td> - </td>
            <td> 15</td>
            <td> 15 </td>
            <td> Camiseta Nike</td>
            <td>
                <button>
                    <a href='atualizar'>
                        <label> Alterar </label>
                    </a>
                </button>
            </td>
            <td>
                <button>
                    <label> Excluir </label>
                </button>
            </td>
        </tr>
    </table>
</div>
