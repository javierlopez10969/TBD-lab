package cl.tbd.ejemplo1.repositories;

import cl.tbd.ejemplo1.models.Voluntario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class VoluntarioRepositoryImp implements VoluntarioRepository {

    @Autowired
    private Sql2o sql2o;

    @Override
    public int countVoluntario() {
        int total = 0;
        try(Connection conn = sql2o.open()){
            total = conn.createQuery("SELECT COUNT(*) FROM voluntario").executeScalar(Integer.class);
        }
        return total;
    }

    @Override
    public List<Voluntario> getAllVoluntarios() {
        try(Connection conn = sql2o.open()){
            return conn.createQuery("select * from voluntario")
                    .executeAndFetch(Voluntario.class);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    @Override
    public Voluntario createVoluntario(Voluntario voluntario) {
        try(Connection conn = sql2o.open()){
            int insertedId = countVoluntario()+1;
            conn.createQuery("insert into voluntario (id, nombre, fnacimiento)"+
                    " values (:id, :voluntarioNombre, :voluntarioFnacimiento)") 
                    .addParameter("id",  insertedId)                
                    .addParameter("voluntarioNombre", voluntario.getNombre())
                    .addParameter("voluntarioFnacimiento", voluntario.getFnacimiento())
                    .executeUpdate().getKey();
            voluntario.setId(insertedId);
            return voluntario;        
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
        
    }
    @Override
    public boolean deleteVoluntario(int id){
        try(Connection conn = sql2o.open()){
            conn.createQuery("DELETE FROM voluntario WHERE id = :id")
            .addParameter("id", id)
            .executeUpdate();
            return true; 
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
    @Override
    public Voluntario getVoluntario(int id){
		String sql = "SELECT * FROM voluntario where id=:id";

		try (Connection con = sql2o.open()) {
			return con.createQuery(sql)
				.addParameter("id", id)
				.executeAndFetchFirst(Voluntario.class);
		}catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
	}

    @Override
    public boolean updateVoluntario(Voluntario nuevoVoluntario){
        String updateSql = "update voluntario set nombre = :nombre, fnacimiento = :fnacimiento where id = :id";
        try (Connection con = sql2o.open()) {   
            con.createQuery(updateSql)
                .addParameter("fnacimiento", nuevoVoluntario.getFnacimiento())
                .addParameter("nombre",nuevoVoluntario.getNombre())
                .addParameter("id", nuevoVoluntario.getId())
                .executeUpdate();
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
}