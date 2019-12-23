package com.sistemas.entidad;

import javax.persistence.*;

@Entity
@Table(name = "Curso")
public class Curso {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(length = 9, nullable = false)
    private String codigo;
    @Column(length = 250, nullable = false)
    private String descripcion;
    @Column(columnDefinition = "TEXT", nullable = false)
    private String sumilla;
    @Column(length = 1, nullable = false)
    private int creditos;
    @Column(length = 4, nullable = false)
    private String ciclo;
    @Column(length = 2, nullable = false)
    private int horasTeoria;
    @Column(length = 2, nullable = false)
    private int horasPractica;

    public Curso() {

    }

    public Curso(Long id, String codigo, String descripcion, String sumilla, int creditos, String ciclo, int horasTeoria, int horasPractica) {
        super();
        this.id = id;
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.sumilla = sumilla;
        this.creditos = creditos;
        this.ciclo = ciclo;
        this.horasTeoria = horasTeoria;
        this.horasPractica = horasPractica;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getSumilla() {
        return sumilla;
    }

    public void setSumilla(String sumilla) {
        this.sumilla = sumilla;
    }

    public int getCreditos() {
        return creditos;
    }

    public void setCreditos(int creditos) {
        this.creditos = creditos;
    }

    public String getCiclo() {
        return ciclo;
    }

    public void setCiclo(String ciclo) {
        this.ciclo = ciclo;
    }

    public int getHorasTeoria() {
        return horasTeoria;
    }

    public void setHorasTeoria(int horasTeoria) {
        this.horasTeoria = horasTeoria;
    }

    public int getHorasPractica() {
        return horasPractica;
    }

    public void setHorasPractica(int horasPractica) {
        this.horasPractica = horasPractica;
    }
}
