package com.betha.ouvidoria.ouvidoria.model;

import java.util.Date;

public class Processo {
    private Integer id;
    private String status;
    private Date dataMovimento;

    public Processo(Integer id, String status, Date dataMovimento) {
        this.id = id;
        this.status = status;
        this.dataMovimento = dataMovimento;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDataMovimento() {
        return dataMovimento;
    }

    public void setDataMovimento(Date dataMovimento) {
        this.dataMovimento = dataMovimento;
    }
}
