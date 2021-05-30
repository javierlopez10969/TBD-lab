package cl.tbd.ejemplo1.repositories;

import cl.tbd.ejemplo1.models.Tarea_habilidad;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class Tarea_habilidadRepositoryImp implements Tarea_habilidadRepository {

    @Autowired
    private Sql2o sql2o;

    @Override
    public int countTarea_habilidad() {
        int total = 0;
        try(Connection conn = sql2o.open()){
            total = conn.createQuery("SELECT COUNT(*) FROM tarea_habilidad").executeScalar(Integer.class);
        }
        return total;
    }

    @Override
    public List<Tarea_habilidad> getAllTarea_habilidad() {
        try(Connection conn = sql2o.open()){
            return conn.createQuery("select * from tarea_habilidad")
                    .executeAndFetch(Tarea_habilidad.class);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    @Override
    public Tarea_habilidad createTarea_habilidad(Tarea_habilidad tarea_habilidad) {
        try(Connection conn = sql2o.open()){
            int insertedId = (int) conn.createQuery("INSERT INTO tarea_habilidad ( id_emehab, id_tarea)"+
            " values ( :tarea_habilidadId_emehab, :tarea_habilidadId_tarea)", true)
                    .addParameter("tarea_habilidadId_emehab", tarea_habilidad.getId_emehab())
                    .addParameter("tarea_habilidadId_tarea", tarea_habilidad.getId_tarea())
                    .executeUpdate().getKey();
                    tarea_habilidad.setId(insertedId);
            return tarea_habilidad;        
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
        
    }

    @Override
    public boolean deleteTarea_habilidad(int id){
        try(Connection conn = sql2o.open()){
            conn.createQuery("DELETE FROM Tarea_habilidad WHERE id = :id").addParameter("id", id)
            .executeUpdate();
            return true; 
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }

    }

}
