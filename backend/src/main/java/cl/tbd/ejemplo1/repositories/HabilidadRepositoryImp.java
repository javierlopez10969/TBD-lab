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
            int insertedId = countHabilidad()+1;
            conn.createQuery("INSERT INTO habilidad ( id, descrip)"+
            " values (:id, :habilidadDescrip)", true)
                    .addParameter("id",  insertedId)        
                    .addParameter("habilidadDescrip", habilidad.getDescrip())
                    .executeUpdate().getKey();
            habilidad.setId(insertedId);
            return habilidad;        
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
        
    }

    @Override
    public boolean deleteHabilidad(int id){
        try(Connection conn = sql2o.open()){
            conn.createQuery("DELETE FROM habilidad WHERE id = :id").addParameter("id", id)
            .executeUpdate();
            return true; 
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }

    }

    @Override
    public boolean updateHabilidad(Habilidad nuevoHabilidad){
        String updateSql = "update habilidad set descrip = :descrip where id = :id";
        try (Connection con = sql2o.open()) {   
            con.createQuery(updateSql)
                .addParameter("descrip", nuevoHabilidad.getDescrip())
                .addParameter("id", nuevoHabilidad.getId())
                .executeUpdate();
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }

    @Override
    public Habilidad getHabilidad(int id){
		String sql = "SELECT * FROM habilidad where id=:id";

		try (Connection con = sql2o.open()) {
			return con.createQuery(sql)
				.addParameter("id", id)
				.executeAndFetchFirst(Habilidad.class);
		}catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
	}
}
