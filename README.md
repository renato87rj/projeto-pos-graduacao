
# Projeto para pós graduação

Este é um projeto para matéria de Projeto e Implementação Orientado a Objetos lecionada pelo professor Raphael Mauricio da universadade Estácio de Sá

O projeto consistem em um CRUD de livros lidos por uma pessoa onde o usuário pode registrar o livro que já leu e deixar uma avaliação, podendo também fazer edição e exclusão do livro.

## Stack utilizada

**Linguagem de programação:** Java 8

**Framework:** Spring Web MVC

**Banco de dados:** Mysql

**ORM:** JPA Hibernate

**Template Engine:** JSP

## O que você precisa

`Mysql 5.6 ou uma versão maior`

`JDK 1.8 ou uma versão maior`

Criar uma base de dados com o nome `projeto_pos` ou customizar as configurações no arquivo `src/main/resources/application.properties`:

 ```
spring.datasource.url=jdbc:mysql://${MYSQL_HOST:localhost}:3306/{BASE_DE_DADOS}
spring.datasource.username={USUARIO}
spring.datasource.password={SENHA}
 ```

## Executando o projeto

Clone o projeto

```bash
  git clone https://github.com/renato87rj/projeto-pos-graduacao.git
```

Entre no diretório do projeto

```bash
  cd projeto-pos-graduacao
```

Inicie o projeto

```bash
  mvnw spring-boot:run
```

