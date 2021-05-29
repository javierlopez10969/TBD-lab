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
            int insertedId = (int) conn.createQuery("INSERT INTO vol_habilidad (id, id_voluntario, id_habilidad)"+
            " values (:vol_habilidadId, :vol_habilidadId_voluntario, :vol_habilidadId_habilidad)", true)
                    .addParameter("vol_habilidadId", vol_habilidad.getId())
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

}
