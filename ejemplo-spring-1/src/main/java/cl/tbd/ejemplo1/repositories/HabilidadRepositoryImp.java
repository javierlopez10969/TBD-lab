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
            int insertedId = (int) conn.createQuery("INSERT INTO habilidad (descrip)"+
            " values (:habilidadDescrip)", true)
                    .addParameter("habilidadDescrip", habilidad.getDescrip())
                    .executeUpdate().getKey();
            habilidad.setId(insertedId);
            return habilidad;        
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
        
    }
}
