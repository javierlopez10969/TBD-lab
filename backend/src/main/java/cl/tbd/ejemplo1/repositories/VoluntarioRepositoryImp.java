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
            return conn.createQuery("select nombre AS Nombre, id as Id,fnacimiento AS fnacimiento, email AS email, pass as pass, st_x(st_astext(ubicacion)) AS latitud, st_y(st_astext(ubicacion)) AS longitud from voluntario").executeAndFetch(Voluntario.class);
        
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    @Override
    public List<Voluntario> getCercanos(Double latitud,Double longitud,int N){
        try(Connection conn = sql2o.open()){
            return conn.createQuery(
            //Obtener al menos los 20 voluntarios cercanos
            //SELECT nombre,ST_Distance( 'SRID=4326;POINT(-72.092285 -36.597889)'::geometry,ubicacion) as distancia, ubicacion from voluntario ORDER BY distancia asc limit 3;
            //SELECT *, ubicacion from voluntario ORDER BY ST_Distance( 'SRID=4326;POINT(-72.092285 -36.597889)'::geometry,ubicacion) asc limit 3;
            "SELECT nombre , id , st_x(st_astext(ubicacion)) AS latitud, st_y(st_astext(ubicacion)) AS  longitud from voluntario " +
            "ORDER BY ST_Distance('SRID=4326;POINT("+latitud + " "+ longitud+ ")'::geometry, ubicacion ) ASC " +
            "limit " + N + ";").executeAndFetch(Voluntario.class);
        
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    @Override
    public Voluntario createVoluntario(Voluntario voluntario) {
        try(Connection conn = sql2o.open()){
            Voluntario v1 = conn.createQuery("select * from voluntario where email=:email").addParameter("email",voluntario.getEmail()).executeAndFetchFirst(Voluntario.class);
            if (v1 == null){
                int insertedId = countVoluntario()+1;
                String point = "public.ST_GeomFromText(POINT("+voluntario.getLongitud()+" "+voluntario.getLatitud()+"),4326)";
                conn.createQuery("insert into voluntario (id, nombre, fnacimiento, email, pass, loginToken, ubicacion)"+
                        " values (:id, :voluntarioNombre, :voluntarioFnacimiento, :email, :pass, :loginToken, :ubicacion)") 
                        .addParameter("id",  insertedId)                
                        .addParameter("voluntarioNombre", voluntario.getNombre())
                        .addParameter("voluntarioFnacimiento", voluntario.getFnacimiento())
                        .addParameter("email", voluntario.getEmail())
                        .addParameter("pass", voluntario.getPass())
                        .addParameter("loginToken", 0)
                        .addParameter("ubicacion", point)
                        .executeUpdate().getKey();
                voluntario.setId(insertedId);
                return voluntario;  
            }else{
                return null;
            }

      
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
        String updateSql = "update voluntario set nombre = :nombre, fnacimiento = :fnacimiento, email = :email, pass = :pass, loginToken = :loginToken where id = :id, ubicacion = :ubicacion";
        try (Connection con = sql2o.open()) {   
            String point = "public.ST_GeomFromText(POINT("+nuevoVoluntario.getLongitud()+" "+nuevoVoluntario.getLatitud()+"),4326)";
            con.createQuery(updateSql)
                .addParameter("fnacimiento", nuevoVoluntario.getFnacimiento())
                .addParameter("nombre",nuevoVoluntario.getNombre())
                .addParameter("id", nuevoVoluntario.getId())
                .addParameter("email", nuevoVoluntario.getEmail())
                .addParameter("pass", nuevoVoluntario.getPass())
                .addParameter("loginToken", nuevoVoluntario.getLoginToken())
                .addParameter("ubicacion", point)
                .executeUpdate();
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
    @Override
    public Voluntario getUserByToken(String token){
        try(Connection conn = sql2o.open()){
            return conn.createQuery("SELECT * FROM voluntario WHERE loginToken = :v_token")
                    .addParameter("v_token", token)
                    .executeAndFetchFirst(Voluntario.class);
        }catch (Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    @Override
    public Voluntario logIn(Voluntario user) {
        System.out.println("HOLA BUENAS NOCHEs");
        try(Connection conn = sql2o.open()){
            System.out.println("HOLA BUENAS NOCHEs");
            List<Voluntario> findUsers = conn.createQuery("select * from voluntario  where email=:email and pass=:pass")
                .addParameter("email", user.getEmail())
                .addParameter("pass", user.getPass())
                .executeAndFetch(Voluntario.class);
            if(findUsers.size() == 1){
                System.out.println("Usuario ingresado con exito");
                user.setLoginToken(1);
                updateVoluntario(user);
                return user;
            }else{
                return null;
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }   
    @Override
    public String logOut(Voluntario user){
        try(Connection conn = sql2o.open()){
            List<Voluntario> findUsers = conn.createQuery("select * from voluntario where id=:id")
                    .addParameter("id", user.getId())
                    .executeAndFetch(Voluntario.class);
            if(findUsers.size() == 1){
                int token = 0;
                try(Connection con = sql2o.open()){
                    user.setLoginToken(0);
                    updateVoluntario(user);
                    return "LogOut Successfully";
                }catch (Exception e){
                    System.out.println(e.getMessage());
                    return  "LogOut Fail";
                }
            }else{
                return "LogOut Fail";
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
            return " Deslogeado Fail";
        }
    }

}