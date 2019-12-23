package com.sistemas.entidad;

import java.time.LocalDate;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Docente {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(length=60, nullable=false)
	private String nombre;
	
	@Column(length=60)
	private String apellido;
	
	@Column(length=15)
	private String celular;
	
	@Column(length=100)
	private String especialidad;
	
	@Temporal(TemporalType.DATE)
	private Date fechaIngreso;
	
	private LocalDate fechaNacimiento;
	
	@Temporal(TemporalType.TIMESTAMP)
    private Date creationTime;
	
	@Temporal(TemporalType.TIMESTAMP)
    private Date modificationTime;
	
	public Docente(){
		
	}

	public Docente(Long id, String nombre, String apellido, String celular, String especialidad) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.apellido = apellido;
		this.celular = celular;
		this.especialidad = especialidad;
	}
	
    @PreUpdate
    public void preUpdate() {
        modificationTime = new Date();
    }
     
    @PrePersist
    public void prePersist() {
        Date now = new Date();
        creationTime = now;
        modificationTime = now;
    }
	
	@Override
	public String toString() {
		return "Docente [id=" + id + ", nombre=" + nombre + ", apellido=" + apellido 
				+ ", celular=" + celular + ", especialidad=" + especialidad + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getEspecialidad() {
		return especialidad;
	}

	public void setEspecialidad(String especialidad) {
		this.especialidad = especialidad;
	}

	public Date getFechaIngreso() {
		return fechaIngreso;
	}

	public void setFechaIngreso(Date fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}

	public LocalDate getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(LocalDate fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public Date getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}

	public Date getModificationTime() {
		return modificationTime;
	}

	public void setModificationTime(Date modificationTime) {
		this.modificationTime = modificationTime;
	}
}
