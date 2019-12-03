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
            var listaCodigo2 = [];

            $(document).ready(function(){
                $("#pesquisarCodigo").click(function(){
                    if(listaTabela.indexOf($('#codigoCompra').val()) === -1){
                        listaTabela.push($('#codigoCompra').val());
                        listaCodigo2.push($('#codigoCompra').val());
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

                $("#compraFinal").click(function(){
                    if(listaTabela.length > 0){
                        console.log(listaCodigo2);
                        for(var i = 0; i < listaTabela.length; i++){
                            listaCodigo2.push($("#quantidade"+listaTabela[i]).val());
                            console.log(listaCodigo2);
                        }
                        $.ajax({
                            url : 'relatorioCompra.action',
                            data:{
                                listaCodigo: JSON.stringify(listaCodigo2),
                            },
                            success : function(result) {
                                $("#relatorioFinal").find('tbody').append(result);
                            },
                            error: function(erro){
                                alert("Erro ao finalizar Compra!");
                            }
                        });
                    } else{
                        alert("Não Existe Produto no carrinho!");
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
            <!--<form method="get" action='relatorioCompra.action' id="formCompra">-->
                <table id='tabelaCompra'>
                    <tr>
                        <th> Código</th>
                        <th> Nome</th>
                        <th> Unidade</th>
                        <th> Preço R$</th>
                        <th> Quantidade</th>
                    </tr>
                </table>
                <!--<input id="relatorioCompra" type="submit" class="submitButton" hidden>-->
                <button  type="button" id="compraFinal"> Comprar </button>
            <!--</form>-->
        </div>
        <div>
            <table id="relatorioFinal">
                <tr>
                    <th style="display:none;">A</th>
                </tr>
            </table>
        </div>
    </body>
</html>