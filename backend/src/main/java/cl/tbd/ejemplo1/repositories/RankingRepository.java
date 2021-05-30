package cl.tbd.ejemplo1.repositories;
import java.util.List;
import cl.tbd.ejemplo1.models.Ranking;

public interface RankingRepository {
    public int countRanking();
    public List<Ranking> getAllRanking();
    public Ranking createRanking(Ranking ranking);
    public boolean deleteRanking(int id);
    public boolean updateRanking(Ranking nuevoRanking);
    public Ranking getRanking(int id);
}
