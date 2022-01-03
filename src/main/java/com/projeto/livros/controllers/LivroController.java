package com.projeto.livros.controllers;

import com.projeto.livros.models.Livro;
import com.projeto.livros.repositories.LivroRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LivroController {
    @Autowired
    private LivroRepository livroRepository;

    @GetMapping(path = "/")
    public String index(Model model) {
        Iterable<Livro> livros = livroRepository.findAll();
        model.addAttribute("livros",livros);
        return "livros";
    }

    @PostMapping(path = "/create")
    public String store(@RequestParam String nome, @RequestParam Boolean avaliacao, RedirectAttributes redirectAttributes) {
        Livro livroCadastrado = livroRepository.findByNome(nome);

        if (livroCadastrado != null) {
            redirectAttributes.addFlashAttribute("error", "Este livro já foi registrado.");
            return "redirect:/";
        }

        Livro livro = new Livro();
        livro.setNome(nome);
        livro.setAvaliacao(avaliacao);

        livroRepository.save(livro);
        redirectAttributes.addFlashAttribute("success", "Seu livro foi gravado com sucesso.");

        return "redirect:/";
    }

    @GetMapping(path = "/edit/{id}")
    public String edit(@PathVariable Integer id,Model model) {
        Livro livro = livroRepository.findById(id).get();
        model.addAttribute("livro", livro);
        return "edit-livro";
    }

    @PostMapping(path = "/update/{id}")
    public String update(@PathVariable Integer id, @RequestParam String nome, @RequestParam Boolean avaliacao, RedirectAttributes redirectAttributes) {
        Livro livro = livroRepository.findById(id).get();

        if (livro == null) {
            redirectAttributes.addFlashAttribute("error", "Livro não encontrado.");
            return "redirect:/";
        }

        livro.setNome(nome);
        livro.setAvaliacao(avaliacao);

        livroRepository.save(livro);
        redirectAttributes.addFlashAttribute("success", "Seu livro foi atualizado com sucesso.");

        return "redirect:/";
    }

    @GetMapping(path = "/destroy/{id}")
    public String delete(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        Livro livro = livroRepository.findById(id).get();

        if (livro == null) {
            redirectAttributes.addFlashAttribute("error", "Livro não encontrado.");
            return "redirect:/";
        }

        livroRepository.delete(livro);
        redirectAttributes.addFlashAttribute("success", "Seu livro foi removido com sucesso.");

        return "redirect:/";
    }
}
