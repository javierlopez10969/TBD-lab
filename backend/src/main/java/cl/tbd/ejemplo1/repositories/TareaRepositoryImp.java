package cl.tbd.ejemplo1.repositories;

import cl.tbd.ejemplo1.models.Tarea;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class TareaRepositoryImp implements TareaRepository {

    @Autowired
    private Sql2o sql2o;

    @Override
    public int countTarea() {
        int total = 0;
        try(Connection conn = sql2o.open()){
            total = conn.createQuery("SELECT COUNT(*) FROM tarea").executeScalar(Integer.class);
        }
        return total;
    }

    @Override
    public Tarea getById(int ID) {
        try(Connection conn = sql2o.open()){
            return conn.createQuery("SELECT * FROM tarea WHERE tarea.id = :id").addParameter("id", ID).executeAndFetchFirst(Tarea.class);
        
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    @Override
    public List<Tarea> getAllTarea() {
        try(Connection conn = sql2o.open()){
            return conn.createQuery("select * from tarea")
                    .executeAndFetch(Tarea.class);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    @Override
    public Tarea createTarea(Tarea tarea) {
        try(Connection conn = sql2o.open()){
            int insertedId = countTarea()+1;
            conn.createQuery("INSERT INTO tarea (id, nombre, descrip, cant_vol_requeridos, cant_vol_inscritos, id_emergencia, finicio, ffin, id_estado) " + 
            "values ( :id , :tareaNombre, :tareaDescrip, :tareaCant_vol_requeridos, :tareaCant_vol_inscritos, :tareaId_emergencia, :tareaFinicio, :tareaFfin, :tareaId_estado)", true)
                    .addParameter("id",  insertedId)  
                    .addParameter("tareaNombre", tarea.getNombre())
					.addParameter("tareaDescrip", tarea.getDescrip())
                    .addParameter("tareaCant_vol_requeridos", tarea.getCant_vol_requeridos())
					.addParameter("tareaCant_vol_inscritos", tarea.getCant_vol_inscritos())
					.addParameter("tareaId_emergencia", tarea.getId_emergencia())
					.addParameter("tareaFinicio", tarea.getFinicio())
					.addParameter("tareaFfin", tarea.getFfin())
					.addParameter("tareaId_estado", tarea.getId_estado())
                    .executeUpdate().getKey();
            tarea.setId(insertedId);
            return tarea;        
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
        
    }

    @Override
    public boolean deleteTarea(int id){
        try(Connection conn = sql2o.open()){
            conn.createQuery("DELETE FROM Tarea WHERE id = :id").addParameter("id", id)
            .executeUpdate();
            return true; 
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
    @Override
    public boolean updateTarea(Tarea nuevaTarea){
        String updateSql = 
        "update tarea set nombre = :nombre ," +
        "descrip = :descrip, cant_vol_requeridos = :cant_vol_requeridos," +
        "cant_vol_inscritos = :cant_vol_inscritos , id_emergencia = :id_emergencia,"+
        "finicio = :finicio, ffin = :ffin"+
        "where id = :id";
        try (Connection con = sql2o.open()) {   
            con.createQuery(updateSql)
                .addParameter("nombre", nuevaTarea.getNombre() )
                .addParameter("descrip",nuevaTarea.getDescrip() )
                .addParameter("cant_vol_requeridos",nuevaTarea.getCant_vol_requeridos())
                .addParameter("cant_vol_inscritos",nuevaTarea.getCant_vol_inscritos())
                .addParameter("id_emergencia",nuevaTarea.getId_emergencia())
                .addParameter("finicio",nuevaTarea.getFinicio())
                .addParameter("ffin",nuevaTarea.getFfin())
                .addParameter("id", nuevaTarea.getId())
                .executeUpdate();
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
}
