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
            int insertedId = (int) conn.createQuery("INSERT INTO ranking ( id_voluntario, id_tarea, puntaje, flg_invitado, flg_participa) "+"values ( :rankingId_voluntario, :rankingId_tarea, :rankingPuntaje, :rankingFlg_invitado, :rankingFlg_participa)", true)
                
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
}
