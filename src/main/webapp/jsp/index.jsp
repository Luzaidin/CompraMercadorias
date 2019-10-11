<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Belo -  Mercadorias</title>
    </head>
    <body>
        <div>
            <div>
                <div>
                <a href=''>
                    <label> Mercadorias </label>
                </a>
                <a href='estoque'>
                    <label> Estoque </label>
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
                    <th> Quantidade</th>
                </tr>

                <tr>
                    <td> 0</td>
                    <td> Carne</td>
                    <td> FriBoi</td>
                    <td> Kg</td>
                    <td> 15</td>
                    <td>
                        <input type='number' placeholder="Quantidade" min='1'>
                    </td>
                </tr>

                <tr>
                    <td> 1</td>
                    <td> Camiseta Nike</td>
                    <td> Nike</td>
                    <td> - </td>
                    <td> 15</td>
                    <td>
                        <input type='number' placeholder="Quantidade" min='1'>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <button>
                <a href='relatoriocompra'>
                        <label> Finalizar Compra </label>
                </a>
            </button>
        </div>
    </body>
</html>