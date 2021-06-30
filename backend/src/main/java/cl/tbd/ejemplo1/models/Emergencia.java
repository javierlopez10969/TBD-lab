package cl.tbd.ejemplo1.models;

import java.util.Date;

public class Emergencia {
    private Integer id;
    private String nombre;
	private String descrip;
	private Date finicio;
	private Date ffin;
	private Double latitud;
	private Double longitud;
	private Integer id_institucion;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescrip() {
		return this.descrip;
	}

	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}

	public Date getFinicio() {
		return this.finicio;
	}

	public void setFinicio(Date finicio) {
		this.finicio = finicio;
	}

	public Date getFfin() {
		return this.ffin;
	}

	public void setFfin(Date ffin) {
		this.ffin = ffin;
	}

	public Double getLatitud() {
		return this.latitud;
	}

	public void setLatitud(Double latitud) {
		this.latitud = latitud;
	}

	public Double getLongitud() {
		return this.longitud;
	}

	public void setLongitud(Double longitud) {
		this.longitud = longitud;
	}

	public Integer getId_institucion() {
		return this.id_institucion;
	}

	public void setId_institucion(Integer id_institucion) {
		this.id_institucion = id_institucion;
	}

    
}
