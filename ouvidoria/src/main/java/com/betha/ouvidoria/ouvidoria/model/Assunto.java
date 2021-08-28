package com.betha.ouvidoria.ouvidoria.model;

public class Assunto {
    private Integer id;
    private String  descricao;

    public Assunto(Integer id, String descricao) {
        this.id = id;
        this.descricao = descricao;
    }
//teste
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}
