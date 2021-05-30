package cl.tbd.ejemplo1.repositories;

import cl.tbd.ejemplo1.models.Eme_habilidad;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class Eme_habilidadRepositoryImp implements Eme_habilidadRepository {

    @Autowired
    private Sql2o sql2o;

    @Override
    public int countEme_habilidad() {
        int total = 0;
        try(Connection conn = sql2o.open()){
            total = conn.createQuery("SELECT COUNT(*) FROM eme_habilidad").executeScalar(Integer.class);
        }
        return total;
    }

    @Override
    public List<Eme_habilidad> getAllEme_habilidad() {
        try(Connection conn = sql2o.open()){
            return conn.createQuery("select * from eme_habilidad")
                    .executeAndFetch(Eme_habilidad.class);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    @Override
    public Eme_habilidad createEme_habilidad(Eme_habilidad eme_habilidad) {
        try(Connection conn = sql2o.open()){
            int insertedId = countEme_habilidad()+1;
            conn.createQuery("INSERT INTO eme_habilidad (id, id_emergencia, id_habilidad)"+
            " values (:id, :eme_habilidadId_emergencia, :eme_habilidadId_habilidad)", true)
                    .addParameter("id",  insertedId)        
                    .addParameter("eme_habilidadId_emergencia", eme_habilidad.getId_emergencia())
                    .addParameter("eme_habilidadId_habilidad", eme_habilidad.getId_habilidad())
                    .executeUpdate().getKey();
                    eme_habilidad.setId(insertedId);
            return eme_habilidad;        
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
        
    }
    @Override
    public boolean deleteEme_habilidad(int id){
        try(Connection conn = sql2o.open()){
            conn.createQuery("DELETE FROM eme_habilidad WHERE id = :id").addParameter("id", id)
            .executeUpdate();
            return true; 
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }

    }
    @Override
    public boolean updateEme_habilidad(Eme_habilidad eme_habilidad){
        String updateSql = "update eme_habilidad set id_emergencia = :id_emergencia, id_habilidad = :id_habilidad where id = :id";
        try (Connection con = sql2o.open()) {   
            con.createQuery(updateSql)
                .addParameter("id_emergencia", eme_habilidad.getId_emergencia())
                .addParameter("id_habilidad",eme_habilidad.getId_habilidad())
                .addParameter("id", eme_habilidad.getId())
                .executeUpdate();
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }

    }

}
