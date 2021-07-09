package cl.tbd.ejemplo1.repositories;

import cl.tbd.ejemplo1.models.Habilidad;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class HabilidadRepositoryImp implements HabilidadRepository {

    @Autowired
    private Sql2o sql2o;

    @Override
    public int countHabilidad() {
        int total = 0;
        try(Connection conn = sql2o.open()){
            total = conn.createQuery("SELECT COUNT(*) FROM habilidad").executeScalar(Integer.class);
        }
        return total;
    }

    @Override
    public List<Habilidad> getAllHabilidad() {
        try(Connection conn = sql2o.open()){
            return conn.createQuery("select * from habilidad")
                    .executeAndFetch(Habilidad.class);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    @Override
    public Habilidad createHabilidad(Habilidad habilidad) {
        try(Connection conn = sql2o.open()){
            int insertedId = countHabilidad()+1;
            conn.createQuery("INSERT INTO habilidad ( id, descrip)"+
            " values (:id, :habilidadDescrip)", true)
                    .addParameter("id",  insertedId)        
                    .addParameter("habilidadDescrip", habilidad.getDescrip())
                    .executeUpdate().getKey();
            habilidad.setId(insertedId);
            return habilidad;        
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
        
    }

    @Override
    public boolean deleteHabilidad(int id){
        try(Connection conn = sql2o.open()){
            conn.createQuery("DELETE FROM habilidad WHERE id = :id").addParameter("id", id)
            .executeUpdate();
            return true; 
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }

    }

    @Override
    public boolean updateHabilidad(Habilidad nuevoHabilidad){
        String updateSql = "update habilidad set descrip = :descrip where id = :id";
        try (Connection con = sql2o.open()) {   
            con.createQuery(updateSql)
                .addParameter("descrip", nuevoHabilidad.getDescrip())
                .addParameter("id", nuevoHabilidad.getId())
                .executeUpdate();
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }

    @Override
    public Habilidad getHabilidad(int id){
		String sql = "SELECT * FROM habilidad where id=:id";

		try (Connection con = sql2o.open()) {
			return con.createQuery(sql)
				.addParameter("id", id)
				.executeAndFetchFirst(Habilidad.class);
		}catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
	}

    /*
    Habilidad {
    private Integer id;
    private String descrip;

    Tarea {
    private Integer id;
    private String nombre;
    private String descrip;
    private Integer cant_vol_requeridos;
    private Integer cant_vol_inscritos;
    private Integer id_emergencia;
    private Date finicio;
    private Date ffin;
    private Integer id_estado;
    
    Emergencia {
    private Integer id;
    private String nombre;
	private String descrip;
	private Date finicio;
	private Date ffin;
	private Double latitud;
	private Double longitud;
	private Integer id_institucion;

    Vol_habilidad {
    private Integer id;
    private Integer id_voluntario;
    private Integer id_habilidad;

    Tarea_habilidad {
    private Integer id;
    private Integer id_emehab;
    private Integer id_tarea;
    
    Eme_habilidad {
    private Integer id;
    private Integer id_emergencia;
	private Integer id_habilidad;

    */
    @Override
    //Consulta sql que a partir del ide de un usuario obtenemos
    //Todas las habilidades que tiene el usuario
    public List<Habilidad> getHabilidadUsuario(int id){
        String sql = "select h.id, h.descrip from habilidad as h, vol_habilidad as vh, voluntario as v  where vh.id_habilidad=h.id and vh.id_voluntario=v.id and v.id= :id ";
        try (Connection con = sql2o.open()) {
			return con.createQuery(sql)
				.addParameter("id", id)
				.executeAndFetch(Habilidad.class);
		}catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    //Consulat sql que a partir de la id de una tarea obtiene
/*
    @Override
    public List<Habilidad> getHabilidadTarea(int id){
        return null;
    }
   
    @Override
    public List<Habilidad>  getHabilidadEmergencia(int id){
        return null;
    }
  */       
    @Override
    public List<Habilidad> getHabilidadTarea(int id){
        String sql = "select h.id, h.descrip from habilidad as h, eme_habilidad as eme, Tarea_habilidad as th, Tarea as t where th.id_emehab=eme.id and eme.id_habilidad = h.id and th.id_tarea=t.id and t.id= :id";
        try (Connection con = sql2o.open()) {
			return con.createQuery(sql)
				.addParameter("id", id)
				.executeAndFetch(Habilidad.class);
		}catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }

    @Override
    public List<Habilidad> getHabilidadEmergencia(int id){
    String sql = "select h.id, h.descrip from habilidad as h, eme_habilidad as eme, Emergencia as e where eme.id_habilidad = h.id and eme.id_emergencia=e.id and e.id= :id";
        try (Connection con = sql2o.open()) {
			return con.createQuery(sql)
				.addParameter("id", id)
				.executeAndFetch(Habilidad.class);
		}catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    
}
