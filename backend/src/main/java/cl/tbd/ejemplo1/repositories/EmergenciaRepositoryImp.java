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
            int insertedId = countEmergencia()+1;
            String point = "public.ST_GeomFromText(POINT("+emergencia.getLongitud()+" "+emergencia.getLatitud()+"),4326)";
            conn.createQuery("INSERT INTO emergencia (id, nombre, descrip, finicio, ffin, altitud, longitud, id_institucion) "+
			"values (:id, :emergenciaNombre, :emergenciaDescrip, :emergenciaFinicio, :emergenciaFfin, :emergenciaUbicacion, :emergenciaId_institucion)", true)
                    .addParameter("id",  insertedId)      
                    .addParameter("emergenciaNombre", emergencia.getNombre())
					.addParameter("emergenciaDescrip", emergencia.getDescrip())
					.addParameter("emergenciaFinicio", emergencia.getFinicio())
					.addParameter("emergenciaFfin", emergencia.getFfin())
                    .addParameter("emergenciaUbicacion", point)
					.addParameter("emergenciaId_institucion", emergencia.getId_institucion())
                    .executeUpdate().getKey();
            emergencia.setId(insertedId);
            return emergencia;        
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
        
    }

    @Override
    public boolean deleteEmergencia(int id){
        try(Connection conn = sql2o.open()){
            conn.createQuery("DELETE FROM emergencia WHERE id = :id").addParameter("id", id)
            .executeUpdate();
            return true; 
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }

    }

    @Override
    public boolean updateEmergencia(Emergencia emergencia){
        String updateSql = "update emergencia set nombre = :nombre, descrip = :descrip, finicio = :finicio, ffin = :ffin, ubicacion = :ubicacion , id_institucion = :id_institucion where id = :id";
        String point = "public.ST_GeomFromText(POINT("+emergencia.getLongitud()+" "+emergencia.getLatitud()+"),4326)";
        try (Connection con = sql2o.open()) {   
            con.createQuery(updateSql)
                .addParameter("nombre", emergencia.getNombre())
                .addParameter("descrip", emergencia.getDescrip())
                .addParameter("finicio", emergencia.getFinicio())
                .addParameter("ffin", emergencia.getFfin())
                .addParameter("ubicacion", point)
                .addParameter("id_institucion",emergencia.getId_institucion())
                .addParameter("id", emergencia.getId())
                .executeUpdate();
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }

    }

    @Override
    public Emergencia getEmergencia(int id){
		String sql = "SELECT * FROM emergencia where id=:id";

		try (Connection con = sql2o.open()) {
			return con.createQuery(sql)
				.addParameter("id", id)
				.executeAndFetchFirst(Emergencia.class);
		}catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
	}
}
