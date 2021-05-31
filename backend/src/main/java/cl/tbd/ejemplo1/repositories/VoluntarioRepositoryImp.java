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
            Voluntario v1 = conn.createQuery("select * from voluntario where email=:email").addParameter("email",voluntario.getEmail()).executeAndFetchFirst(Voluntario.class);
            if (v1 == null){
                int insertedId = countVoluntario()+1;
                conn.createQuery("insert into voluntario (id, nombre, fnacimiento, email, pass)"+
                        " values (:id, :voluntarioNombre, :voluntarioFnacimiento, :email, :pass)") 
                        .addParameter("id",  insertedId)                
                        .addParameter("voluntarioNombre", voluntario.getNombre())
                        .addParameter("voluntarioFnacimiento", voluntario.getFnacimiento())
                        .addParameter("email", voluntario.getEmail())
                        .addParameter("pass", voluntario.getPass())
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
        String updateSql = "update voluntario set nombre = :nombre, fnacimiento = :fnacimiento, email = :email, pass = :pass where id = :id";
        try (Connection con = sql2o.open()) {   
            con.createQuery(updateSql)
                .addParameter("fnacimiento", nuevoVoluntario.getFnacimiento())
                .addParameter("nombre",nuevoVoluntario.getNombre())
                .addParameter("id", nuevoVoluntario.getId())
                .addParameter("email", nuevoVoluntario.getEmail())
                .addParameter("pass", nuevoVoluntario.getPass())
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
    public String logIn(Voluntario user) {
        int visible = 0;
        try(Connection conn = sql2o.open()){
            List<Voluntario> findUsers = conn.createQuery("select * from voluntario  where email=:email and pass=:pass")
                .addParameter("email", user.getEmail())
                .addParameter("pass", user.getPass())
                .executeAndFetch(Voluntario.class);
            if(findUsers.size() == 1){
                int token = 1;
                try(Connection con = sql2o.open()){
                    con.createQuery("UPDATE users SET nombre=:nombre, email=:email, pass=:pass, logintoken=:logintoken, fnacimiento = :fnacimiento WHERE id=:id ", true)
                            .addParameter("id", findUsers.get(0).getId())
                            .addParameter("nombre", findUsers.get(0).getNombre())
                            .addParameter("fnacimiento", findUsers.get(0).getFnacimiento())
                            .addParameter("email", findUsers.get(0).getEmail())
                            .addParameter("pass", findUsers.get(0).getPass())
                            //.addParameter("logintoken", token)
                            .executeUpdate().getKey();
                    return "Login Successfully";
                }catch (Exception e){
                    System.out.println(e.getMessage());
                    return  "Login Fail";
                }
            }else{
                return "Login Fail";
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
            return "Login Fail";
        }
    }
    @Override
    public String logOut(Voluntario user){
        int visible = 0;
        try(Connection conn = sql2o.open()){
            List<Voluntario> findUsers = conn.createQuery("select * from voluntario where email=:email and pass=:pass")
                    .addParameter("email", user.getEmail())
                    .addParameter("pass", user.getPass())
                    .executeAndFetch(Voluntario.class);
            if(findUsers.size() == 1){
                int token = 0;
                try(Connection con = sql2o.open()){
                    con.createQuery("UPDATE users SET nombre=:nombre, email=:email, pass=:pass, fnacimiento = :fnacimiento WHERE id=:id ", true)
                            .addParameter("id", findUsers.get(0).getId())
                            .addParameter("nombre", findUsers.get(0).getNombre())
                            .addParameter("fnacimiento", findUsers.get(0).getFnacimiento())
                            .addParameter("email", findUsers.get(0).getEmail())
                            .addParameter("pass", findUsers.get(0).getPass())
                            //.addParameter("logintoken", token)
                            .executeUpdate().getKey();
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