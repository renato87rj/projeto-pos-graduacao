package com.projeto.livros.repositories;

import com.projeto.livros.models.Livro;
import org.springframework.data.repository.CrudRepository;

public interface LivroRepository extends CrudRepository<Livro, Integer> {

    Livro findByNome(String nome);
}
