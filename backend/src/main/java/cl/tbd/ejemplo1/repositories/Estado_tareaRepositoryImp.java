package cl.tbd.ejemplo1.repositories;

import cl.tbd.ejemplo1.models.Estado_tarea;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class Estado_tareaRepositoryImp implements Estado_tareaRepository {

    @Autowired
    private Sql2o sql2o;

    @Override
    public int countEstado_tarea() {
        int total = 0;
        try(Connection conn = sql2o.open()){
            total = conn.createQuery("SELECT COUNT(*) FROM estado_tarea").executeScalar(Integer.class);
        }
        return total;
    }

    @Override
    public List<Estado_tarea> getAllEstado_tarea() {
        try(Connection conn = sql2o.open()){
            return conn.createQuery("select * from estado_tarea")
                    .executeAndFetch(Estado_tarea.class);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    @Override
    public Estado_tarea createEstado_tarea(Estado_tarea estado_tarea) {
        try(Connection conn = sql2o.open()){
            int insertedId = countEstado_tarea()+1;
            conn.createQuery("INSERT INTO estado_tarea ( id, descrip) "+
            "values (:id, :estado_tareaDescrip)", true)
                    .addParameter("id",  insertedId)       
                    .addParameter("estado_tareaDescrip", estado_tarea.getDescrip())
                    .executeUpdate().getKey();
            estado_tarea.setId(insertedId);
            return estado_tarea;        
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
        
    }

    @Override
    public boolean deleteEstado_tarea(int id){
        try(Connection conn = sql2o.open()){
            conn.createQuery("DELETE FROM estado_tarea WHERE id = :id").addParameter("id", id)
            .executeUpdate();
            return true; 
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }

    }
    @Override
    public boolean updateEstado_tarea(Estado_tarea estado_tarea){
        String updateSql = "update estado_tarea set  descrip = :descrip where id = :id";
        try (Connection con = sql2o.open()) {   
            con.createQuery(updateSql)
                .addParameter("descrip", estado_tarea.getDescrip())
                .addParameter("id", estado_tarea.getId())
                .executeUpdate();
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }

    }
}
