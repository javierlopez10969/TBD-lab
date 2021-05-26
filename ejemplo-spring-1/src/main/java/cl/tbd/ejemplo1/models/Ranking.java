package cl.tbd.ejemplo1.models;

public class Ranking {
    private Integer id;
    private Interger id_voluntario;
    private Interger id_tarea;
    private Interger puntaje;
    private Interger flg_invitado;
    private Interger flg_participante;

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Interger getId_voluntario() {
		return this.id_voluntario;
	}

	public void setId_voluntario(Interger id_voluntario) {
		this.id_voluntario = id_voluntario;
	}

	public Interger getId_tarea() {
		return this.id_tarea;
	}

	public void setId_tarea(Interger id_tarea) {
		this.id_tarea = id_tarea;
	}

	public Interger getPuntaje() {
		return this.puntaje;
	}

	public void setPuntaje(Interger puntaje) {
		this.puntaje = puntaje;
	}

	public Interger getFlg_invitado() {
		return this.flg_invitado;
	}

	public void setFlg_invitado(Interger flg_invitado) {
		this.flg_invitado = flg_invitado;
	}

	public Interger getFlg_participante() {
		return this.flg_participante;
	}

	public void setFlg_participante(Interger flg_participante) {
		this.flg_participante = flg_participante;
	}

}
