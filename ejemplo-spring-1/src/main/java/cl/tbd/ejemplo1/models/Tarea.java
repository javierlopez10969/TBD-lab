package cl.tbd.ejemplo1.models;

import java.util.Date;

public class Tarea {
    private Interger id;
    private String nombre;
    private String descrip;
    private Interger cant_vol_requeridos;
    private Interger cant_vol_inscritos;
    private Interger id_emergencia;
    private Date finicio;
    private Date ffin;
    private Interger id_estado;

	public Interger getId() {
		return this.id;
	}

	public void setId(Interger id) {
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

	public Interger getCant_vol_requeridos() {
		return this.cant_vol_requeridos;
	}

	public void setCant_vol_requeridos(Interger cant_vol_requeridos) {
		this.cant_vol_requeridos = cant_vol_requeridos;
	}

	public Interger getCant_vol_inscritos() {
		return this.cant_vol_inscritos;
	}

	public void setCant_vol_inscritos(Interger cant_vol_inscritos) {
		this.cant_vol_inscritos = cant_vol_inscritos;
	}

	public Interger getId_emergencia() {
		return this.id_emergencia;
	}

	public void setId_emergencia(Interger id_emergencia) {
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

	public Interger getId_estado() {
		return this.id_estado;
	}

	public void setId_estado(Interger id_estado) {
		this.id_estado = id_estado;
	}


}
