package cl.tbd.ejemplo1.repositories;

import cl.tbd.ejemplo1.models.Emergencia;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class EmergenciaRepositoryImp implements EmergenciaRepository {

    @Autowired
    private Sql2o sql2o;

    @Override
    public int countEmergencia() {
        int total = 0;
        try(Connection conn = sql2o.open()){
            total = conn.createQuery("SELECT COUNT(*) FROM emergencia").executeScalar(Integer.class);
        }
        return total;
    }

    @Override
    public List<Emergencia> getAllEmergencia() {
        try(Connection conn = sql2o.open()){
            return conn.createQuery("select * from emergencia")
                    .executeAndFetch(Emergencia.class);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    @Override
    public Emergencia createEmergencia(Emergencia emergencia) {
        try(Connection conn = sql2o.open()){
            int insertedId = (int) conn.createQuery("INSERT INTO emergencia (nombre, descrip, finicio, ffin, id_institucion) "+
			"values (:emergenciaNombre, :emergenciaDescrip, :emergenciaFinicio, :emergenciaFfin, :emergenciaId_institucion)", true)
                    .addParameter("emergenciaNombre", emergencia.getNombre())
					.addParameter("emergenciaDescrip", emergencia.getDescrip())
					.addParameter("emergenciaFinicio", emergencia.getFinicio())
					.addParameter("emergenciaFfin", emergencia.getFfin())
					.addParameter("emergenciaId_institucion", emergencia.getId_institucion())
                    .executeUpdate().getKey();
            emergencia.setId(insertedId);
            return emergencia;        
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
        
    }
}
