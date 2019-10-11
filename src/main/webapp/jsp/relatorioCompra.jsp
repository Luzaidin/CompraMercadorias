<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <title>Belo -  Relatório de Compra</title>
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
    <label>Relatório de Compra</label>
</div>
<div>
    <table>
        <tr>
            <th> Código</th>
            <th> Nome</th>
            <th> Marca</th>
            <th> Unidade</th>
            <th> Preço R$ unitário</th>
            <th> Quantidade</th>
            <th> Total item</th>
        </tr>

        <tr>
            <td> 0</td>
            <td> Carne</td>
            <td> FriBoi</td>
            <td> Kg</td>
            <td> 15</td>
            <td> 2</td>
            <td> 30</td>
        </tr>

        <tr>
            <td> 1</td>
            <td> Camiseta Nike</td>
            <td> Nike</td>
            <td> - </td>
            <td> 15</td>
            <td> 2</td>
            <td> 30</td>
        </tr>
    </table>
    <div>
        <label><b>Total da Compra: </b></label>
        <label>60</label>
    </div>
</div>
    