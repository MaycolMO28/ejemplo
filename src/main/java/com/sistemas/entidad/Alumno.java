package com.sistemas.entidad;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="Alumno")
public class Alumno {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@Column(length=60, nullable=false)
	@NotBlank(message="El nombre no puede estar vacio")
	@Size(min=2, max=60, message="El nombre debe tener entre 2 y 60 caracteres")
	private String nombre;
	
	@Column(length=60)
	@NotBlank(message="El apellido no puede estar vacio")
	@Size(min=2, max=60, message="El apellido tener entre 2 y 60 caracteres")
	private String apellido;
	
	@Column(length=15)
	@NotBlank(message="El celular no puede estar vacio")
	@Size(min=2, max=15, message="El celular debe tener entre 2 y 15 numeros")
	private String celular;
	
	//@Temporal(TemporalType.DATE)
	@Past(message="La fecha de nacimiento debe ser anteior a la fecha actual")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy")
	private Date fNacimiento;
	//private LocalDate fNacimiento;
	
	@Column(length=80)
	@NotBlank(message="El eMail no puede estar vacio")
	@Email(message="Debe ingresar un Email valido")
	private String eMail;
	
	@Column(length=150)
	private String direccion;
	
	@DecimalMin(value="0.00", message="El promedio debe ser mayor o igual que 0.00")
	@DecimalMax(value="20.00", message="El promedio debe ser menor o igual que 20.00")
	@NotNull(message="El promedio no puede ser nulo")
	private Double promedio;
	
	public Alumno() {
		
	}
		
	public Alumno(long id, String nombre, String apellido, String celular, 
			Date fNacimiento, String eMail, String direccion, Double promedio) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.apellido = apellido;
		this.celular = celular;
		this.fNacimiento = fNacimiento;
		this.eMail = eMail;
		this.direccion = direccion;
		this.promedio = promedio;
	}

	@Override
	public String toString() {
		return "Alumno [id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + ", celular=" + celular
				+ ", fNacimiento=" + fNacimiento + ", eMail=" + eMail + ", direccion=" + direccion + ", promedio="
				+ promedio + "]";
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
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

	public Date getfNacimiento() {
		return fNacimiento;
	}

	public void setfNacimiento(Date fNacimiento) {
		this.fNacimiento = fNacimiento;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public Double getPromedio() {
		return promedio;
	}

	public void setPromedio(Double promedio) {
		this.promedio = promedio;
	}
}
