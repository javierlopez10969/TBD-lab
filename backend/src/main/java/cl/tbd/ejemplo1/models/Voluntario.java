package cl.tbd.ejemplo1.models;

import java.util.Date;

public class Voluntario {
    private Integer id;
    private String nombre;
    private Date fnacimiento;
	private String email;
	private String pass;
	private int loginToken;
	private Double altitud;
	private Double longitud;

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

	public Date getFnacimiento() {
		return this.fnacimiento;
	}

	public void setFnacimiento(Date fnacimiento) {
		this.fnacimiento = fnacimiento;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return this.pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public int getLoginToken() {
		return this.loginToken;
	}

	public void setLoginToken(int loginToken) {
		this.loginToken = loginToken;
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

}
