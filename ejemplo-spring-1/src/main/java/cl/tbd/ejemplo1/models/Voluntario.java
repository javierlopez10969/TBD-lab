package cl.tbd.ejemplo1.models;

import java.util.Date;

public class Voluntario {
    private Interger id;
    private String nombre;
    private Date fnacimiento;

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

	public Date getFnacimiento() {
		return this.fnacimiento;
	}

	public void setFnacimiento(Date fnacimiento) {
		this.fnacimiento = fnacimiento;
	}


}
