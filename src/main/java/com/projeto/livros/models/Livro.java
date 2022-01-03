package com.projeto.livros.models;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "livros")
public class Livro {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column(unique = true, nullable = false, length = 50)
    private String nome;

    @Column(nullable = false)
    private Boolean avaliacao;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private Date createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private Date updatedAt;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Boolean getAvaliacao() {
        return avaliacao;
    }

    public void setAvaliacao(Boolean avaliacao) {
        this.avaliacao = avaliacao;
    }

    public Date getCreatedAt() {return createdAt;}

    public void setCreated_at(Date createdAt) {this.createdAt = createdAt;}

    public Date getUpdatedAt() {return updatedAt;}

    public void setUpdatedAt(Date updatedAt) {this.updatedAt = updatedAt;}
}
