package com.betha.ouvidoria.ouvidoria.model;

public class AcaoResposta {
    private Integer id;
    private String tipoResposta;

    public AcaoResposta(Integer id, String tipoResposta) {
        this.id = id;
        this.tipoResposta = tipoResposta;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTipoResposta() {
        return tipoResposta;
    }

    public void setTipoResposta(String tipoResposta) {
        this.tipoResposta = tipoResposta;
    }
}
