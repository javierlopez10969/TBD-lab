package cl.tbd.ejemplo1.models;

public class Ranking {
    private Integer id;
    private Integer id_voluntario;
    private Integer id_tarea;
    private Integer puntaje;
    private Integer flg_invitado;
    private Integer flg_participante;

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId_voluntario() {
		return this.id_voluntario;
	}

	public void setId_voluntario(Integer id_voluntario) {
		this.id_voluntario = id_voluntario;
	}

	public Integer getId_tarea() {
		return this.id_tarea;
	}

	public void setId_tarea(Integer id_tarea) {
		this.id_tarea = id_tarea;
	}

	public Integer getPuntaje() {
		return this.puntaje;
	}

	public void setPuntaje(Integer puntaje) {
		this.puntaje = puntaje;
	}

	public Integer getFlg_invitado() {
		return this.flg_invitado;
	}

	public void setFlg_invitado(Integer flg_invitado) {
		this.flg_invitado = flg_invitado;
	}

	public Integer getFlg_participante() {
		return this.flg_participante;
	}

	public void setFlg_participante(Integer flg_participante) {
		this.flg_participante = flg_participante;
	}

}
