<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <div class="row justify-content-center p-5">
        <div class="col-4">
            <h1>Meus livros lidos</h1>
        </div>
    </div>
    <div class="row justify-content-center pb-5">
        <div class="col-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title mb-3">Atualizar registro</h5>
                    <form:form action="${'/update/'.concat(livro.id)}" method="post" id="form-update">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" name="nome" placeholder="name@example.com" value="<c:out value="${livro.nome}"/>">
                            <label for="floatingInput">Nome do livro</label>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col-4 form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="avaliacao" id="inlineRadio1" value="1" <c:out value="${livro.avaliacao == true ? 'checked':''}"/>>
                                <label class="form-check-label" for="inlineRadio1"><i class="fas fa-thumbs-up"></i> Gostei</label>
                            </div>
                            <div class="col-4 form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="avaliacao" id="inlineRadio2" value="0" <c:out value="${livro.avaliacao == false ? 'checked':''}"/>>
                                <label class="form-check-label" for="inlineRadio2"><i class="fas fa-thumbs-down"></i> Não gostei</label>
                            </div>
                        </div>
                    </form:form>
                </div>
                <div class="card-body">
                    <button type="submit" form="form-update" class="btn btn-primary" role="button">Atualizar livro</button>
                    <a href="<c:url value="/" />" class="btn btn-secondary" role="button">Voltar</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/833572b2be.js" crossorigin="anonymous"></script>

</body>
</html>