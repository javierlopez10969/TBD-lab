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

}
