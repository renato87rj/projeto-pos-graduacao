<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Livros</title>
</head>
<body>
<div class="container">
    <c:if test="${not empty error}">
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-circle"></i> <c:out value="${error}" />
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <c:if test="${not empty success}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle"></i> ${success}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <div class="row justify-content-center p-5">
        <div class="col-4">
            <h1>Meus livros lidos</h1>
        </div>
    </div>
    <div class="row justify-content-center pb-5">
        <div class="col-12">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Avaliação</th>
                    <th scope="col">Salvo na data</th>
                    <th scope="col">Ação</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty livros}">
                    <tr>
                        <td colspan="4" class="text-center">Nenhum livro foi lido ainda</td>
                    </tr>
                </c:if>
                <c:forEach items="${livros}" var="livro">
                    <tr>
                        <td>${livro.id}</td>
                        <td>${livro.nome}</td>
                        <c:choose>
                            <c:when test="${livro.avaliacao == true}">
                                <td><i class="fas fa-thumbs-up"></i></td>
                            </c:when>
                            <c:otherwise>
                                <td><i class="fas fa-thumbs-down"></i></td>
                            </c:otherwise>
                        </c:choose>
                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${livro.createdAt}" /></td>
                        <td>
                            <a href="<c:url value="${'/edit/'.concat(livro.id)}"/>" type="button" class="btn btn-info"><i class="fas fa-edit"></i></a>
                            <a class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalRemove" role="button"><i class="fas fa-trash"></i></a>
                            <c:set value="${'/destroy/'.concat(livro.id)}" var="urlRemover" />
                            <c:set value="${livro.nome}" var="nomeLivro" />
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <a class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalCadastro" role="button">Cadastrar Livro</a>
</div>
<!-- Modal Criar -->
<div class="modal fade" id="modalCadastro" tabindex="-1" aria-labelledby="modalCadastro" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalCadastroLabel">Guarde seu livro</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form:form action="/create" method="post" id="form-cadastro">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingInput" name="nome" placeholder="name@example.com" required>
                        <label for="floatingInput">Nome do livro</label>
                    </div>
                    <div class="row justify-content-center">
                    <div class="col-4 form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="avaliacao" id="inlineRadio1" value="1" required>
                        <label class="form-check-label" for="inlineRadio1"><i class="fas fa-thumbs-up"></i> Gostei</label>
                    </div>
                    <div class="col-4 form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="avaliacao" id="inlineRadio2" value="0" required>
                        <label class="form-check-label" for="inlineRadio2"><i class="fas fa-thumbs-down"></i> Não gostei</label>
                    </div>
                    </div>
                </form:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                <button type="submit" form="form-cadastro" class="btn btn-primary">Cadastrar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Deletar -->
<div class="modal fade" id="modalRemove" tabindex="-1" aria-labelledby="modalRemove" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 700px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span class="h4">Tem certeza que deseja remover o livro <strong>${nomeLivro}</strong>?</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <a href="${urlRemover}" type="button" class="btn btn-danger">Deletar</a>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/833572b2be.js" crossorigin="anonymous"></script>
</body>
</html>