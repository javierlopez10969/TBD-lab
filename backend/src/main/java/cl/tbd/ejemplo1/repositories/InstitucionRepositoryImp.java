package cl.tbd.ejemplo1.repositories;

import cl.tbd.ejemplo1.models.Institucion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class InstitucionRepositoryImp implements InstitucionRepository {

    @Autowired
    private Sql2o sql2o;

    @Override
    public int countInstitucion() {
        int total = 0;
        try(Connection conn = sql2o.open()){
            total = conn.createQuery("SELECT COUNT(*) FROM institucion").executeScalar(Integer.class);
        }
        return total;
    }

    @Override
    public List<Institucion> getAllInstitucion() {
        try(Connection conn = sql2o.open()){
            return conn.createQuery("select * from institucion")
                    .executeAndFetch(Institucion.class);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    @Override
    public Institucion createInstitucion(Institucion institucion) {
        try(Connection conn = sql2o.open()){
            int insertedId = countInstitucion()+1;
            conn.createQuery("INSERT INTO institucion (id, nombre, descrip) "+
			"values (:id, :institucionNombre, :institucionDescrip)", true)
                    .addParameter("id",  insertedId)  
                    .addParameter("institucionNombre", institucion.getNombre())
					.addParameter("institucionDescrip", institucion.getDescrip())
                    .executeUpdate().getKey();
            institucion.setId(insertedId);
            return institucion;        
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
        
    }
    @Override
    public Institucion getInstitucion(int id){
		String sql = "SELECT * FROM institucion where id=:id";

		try (Connection con = sql2o.open()) {
			return con.createQuery(sql)
				.addParameter("id", id)
				.executeAndFetchFirst(Institucion.class);
		}catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
	}
    @Override
    public boolean deleteInstitucion(int id){
        try(Connection conn = sql2o.open()){
            conn.createQuery("DELETE FROM institucion WHERE id = :id").addParameter("id", id)
            .executeUpdate();
            return true; 
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }

    }

    @Override
    public boolean updateInstitucion(Institucion nuevoInstitucion){
        String updateSql = "update institucion set nombre = :nombre, descrip = :descrip where id = :id";
        try (Connection con = sql2o.open()) {   
            con.createQuery(updateSql)
                .addParameter("descrip", nuevoInstitucion.getDescrip())
                .addParameter("nombre", nuevoInstitucion.getNombre())
                .addParameter("id", nuevoInstitucion.getId())
                .executeUpdate();
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
}
