package com.betha.ouvidoria.ouvidoria.model;

public class FormaSolicitacao {
    private Integer id;
    private String tipoSolicitacao;

    public FormaSolicitacao(Integer id, String tipoSolicitacao) {
        this.id = id;
        this.tipoSolicitacao = tipoSolicitacao;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTipoSolicitacao() {
        return tipoSolicitacao;
    }

    public void setTipoSolicitacao(String tipoSolicitacao) {
        this.tipoSolicitacao = tipoSolicitacao;
    }
}
