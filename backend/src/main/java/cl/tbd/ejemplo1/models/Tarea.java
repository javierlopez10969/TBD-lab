package cl.tbd.ejemplo1.models;

import java.util.Date;

public class Tarea {
    private Integer id;
    private String nombre;
    private String descrip;
    private Integer cant_vol_requeridos;
    private Integer cant_vol_inscritos;
    private Integer id_emergencia;
    private Date finicio;
    private Date ffin;
	private Double altitud;
	private Double longitud;
    private Integer id_estado;

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

	public Integer getCant_vol_requeridos() {
		return this.cant_vol_requeridos;
	}

	public void setCant_vol_requeridos(Integer cant_vol_requeridos) {
		this.cant_vol_requeridos = cant_vol_requeridos;
	}

	public Integer getCant_vol_inscritos() {
		return this.cant_vol_inscritos;
	}

	public void setCant_vol_inscritos(Integer cant_vol_inscritos) {
		this.cant_vol_inscritos = cant_vol_inscritos;
	}

	public Integer getId_emergencia() {
		return this.id_emergencia;
	}

	public void setId_emergencia(Integer id_emergencia) {
		this.id_emergencia = id_emergencia;
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

	public Double getAltitud() {
		return this.altitud;
	}

	public void setAltitud(Double altitud) {
		this.altitud = altitud;
	}

	public Double getLongitud() {
		return this.longitud;
	}

	public void setLongitud(Double longitud) {
		this.longitud = longitud;
	}

	public Integer getId_estado() {
		return this.id_estado;
	}

	public void setId_estado(Integer id_estado) {
		this.id_estado = id_estado;
	}


}
