package cl.tbd.ejemplo1.repositories;

import cl.tbd.ejemplo1.models.Vol_habilidad;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class Vol_habilidadRepositoryImp implements Vol_habilidadRepository {

    @Autowired
    private Sql2o sql2o;

    @Override
    public int countVol_habilidad() {
        int total = 0;
        try(Connection conn = sql2o.open()){
            total = conn.createQuery("SELECT COUNT(*) FROM vol_habilidad").executeScalar(Integer.class);
        }
        return total;
    }

    @Override
    public List<Vol_habilidad> getAllVol_habilidad() {
        try(Connection conn = sql2o.open()){
            return conn.createQuery("select * from vol_habilidad")
                    .executeAndFetch(Vol_habilidad.class);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    @Override
    public Vol_habilidad createVol_habilidad(Vol_habilidad vol_habilidad) {
        try(Connection conn = sql2o.open()){
            int insertedId = countVol_habilidad()+1;
            conn.createQuery("INSERT INTO vol_habilidad (id, id_voluntario, id_habilidad)"+
            " values (:id, :vol_habilidadId_voluntario, :vol_habilidadId_habilidad)", true)
                    .addParameter("id",  insertedId)  
                    .addParameter("vol_habilidadId_voluntario", vol_habilidad.getId_voluntario())
                    .addParameter("vol_habilidadId_habilidad", vol_habilidad.getId_habilidad())
                    .executeUpdate().getKey();
                    vol_habilidad.setId(insertedId);
            return vol_habilidad;        
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
        
    }
    @Override
    public Vol_habilidad getVol_habilidad(int id){
		String sql = "SELECT * FROM Vol_habilidad where id=:id";

		try (Connection con = sql2o.open()) {
			return con.createQuery(sql)
				.addParameter("id", id)
				.executeAndFetchFirst(Vol_habilidad.class);
		}catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
	}

    @Override
    public boolean deleteVol_habilidad(int id){
        try(Connection conn = sql2o.open()){
            conn.createQuery("DELETE FROM Vol_habilidad WHERE id = :id").addParameter("id", id)
            .executeUpdate();
            return true; 
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
    @Override
    public boolean updateVol_habilidad(Vol_habilidad nuevoVol_habilidad){
        String updateSql = "update Vol_habilidad set id_voluntario = :id_voluntario , id_habilidad = :id_habilidad where id = :id";
        try (Connection con = sql2o.open()) {   
            con.createQuery(updateSql)
                .addParameter("id_voluntario", nuevoVol_habilidad.getId_voluntario())
                .addParameter("id_habilidad",nuevoVol_habilidad.getId_habilidad())
                .addParameter("id", nuevoVol_habilidad.getId())
                .executeUpdate();
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
}
