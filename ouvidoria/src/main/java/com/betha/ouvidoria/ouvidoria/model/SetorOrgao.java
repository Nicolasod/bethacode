package com.betha.ouvidoria.ouvidoria.model;

public class SetorOrgao {
    private Integer id;
    private String departamento;

    public SetorOrgao(Integer id, String departamento) {
        this.id = id;
        this.departamento = departamento;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }
}
