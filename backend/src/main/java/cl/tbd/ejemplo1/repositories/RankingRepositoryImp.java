package cl.tbd.ejemplo1.repositories;

import cl.tbd.ejemplo1.models.Ranking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class RankingRepositoryImp implements RankingRepository {

    @Autowired
    private Sql2o sql2o;

    @Override
    public int countRanking() {
        int total = 0;
        try(Connection conn = sql2o.open()){
            total = conn.createQuery("SELECT COUNT(*) FROM ranking").executeScalar(Integer.class);
        }
        return total;
    }

    @Override
    public List<Ranking> getAllRanking() {
        try(Connection conn = sql2o.open()){
            return conn.createQuery("select * from ranking")
                    .executeAndFetch(Ranking.class);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    @Override
    public Ranking createRanking(Ranking ranking) {
        try(Connection conn = sql2o.open()){
            int insertedId = countRanking()+1;
            conn.createQuery("INSERT INTO ranking (id, id_voluntario, id_tarea, puntaje, flg_invitado, flg_participa)"+
            "values (:id, :rankingId_voluntario, :rankingId_tarea, :rankingPuntaje, :rankingFlg_invitado, :rankingFlg_participa)", true)
                    .addParameter("id",  insertedId)     
                    .addParameter("rankingId_voluntario", ranking.getId_voluntario())
					.addParameter("rankingId_tarea", ranking.getId_tarea())
					.addParameter("rankingPuntaje", ranking.getPuntaje())
					.addParameter("rankingFlg_invitado", ranking.getFlg_invitado())
					.addParameter("rankingFlg_participa", ranking.getFlg_participa())
                    .executeUpdate().getKey();
            ranking.setId(insertedId);
            return ranking;        
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
        
    }
    @Override
    public boolean deleteRanking(int id){
        try(Connection conn = sql2o.open()){
            conn.createQuery("DELETE FROM ranking WHERE id = :id").addParameter("id", id)
            .executeUpdate();
            return true; 
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }

    }

    @Override
    public boolean updateRanking(Ranking nuevoRanking){
        String updateSql = "update ranking set " +
        "id_voluntario = :id_voluntario, " +
        "id_tarea = :id_tarea, " +
        "puntaje = :puntaje, " +
        "flg_invitado = :flg_invitado, "+
        "flg_participa = :flg_participa " +
        "where id = :id";
        try (Connection con = sql2o.open()) {   
            con.createQuery(updateSql)
                .addParameter("id_voluntario", nuevoRanking.getId_voluntario())
                .addParameter("id_tarea", nuevoRanking.getId_tarea())
                .addParameter("puntaje", nuevoRanking.getPuntaje())
                .addParameter("flg_invitado", nuevoRanking.getFlg_invitado())
                .addParameter("flg_participa", nuevoRanking.getFlg_participa())
                .addParameter("id", nuevoRanking.getId())
                .executeUpdate();
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
}
