<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>
        <script src="js/app-ajax.js" type="text/javascript"></script>
        <script type="text/javascript" src="static/js/codigoJs.js"></script>
        <script>
            var listaTabela = [];

            $(document).ready(function(){
                $("#pesquisarCodigo").click(function(){
                    if(listaTabela.indexOf($('#codigoCompra').val()) === -1){
                        listaTabela.push($('#codigoCompra').val());
                        $.ajax({
                            url : 'buscarCodigoCompra.action',
                            data : {
                                codigo : $('#codigoCompra').val()
                            },
                            success : function(result) {
                                $("#tabelaCompra").find('tbody').append(result);
                            }
                        });
                    } else{
                        alert("O Produto já está no carrinho!");
                    }
                });
            });
        </script>
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
                <span id='barra'> Barra de Pesquisa </span>
                <input type='number' placeholder="Código da mercadoria" min='0' id="codigoCompra">
                <button type='button' id="pesquisarCodigo"> 
                    <label> Botao Pesquisa </label>
                </button>
            </div>
        </div>
        <div>
            <table id='tabelaCompra'>
                <tr>
                    <th> Código</th>
                    <th> Nome</th>
                    <th> Unidade</th>
                    <th> Preço R$</th>
                    <th> Quantidade</th>
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