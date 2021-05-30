package cl.tbd.ejemplo1.services;

import cl.tbd.ejemplo1.models.Ranking;
import cl.tbd.ejemplo1.repositories.RankingRepository;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin
@RestController
public class RankingService {

    private final RankingRepository rankingRepository;
    RankingService(RankingRepository rankingRepository){
        this.rankingRepository = rankingRepository;
    }

    @GetMapping("/rankings")
    public List<Ranking> getAllRanking() {
        return rankingRepository.getAllRanking();
    }

    @GetMapping("/rankings/count")
    public String countRanking(){
        int total = rankingRepository.countRanking();
        return String.format("Tienes en total, %s de la lista.", total);
    }

    @PostMapping("/rankings/a")
    @ResponseBody
    public Ranking createRanking(@RequestBody Ranking ranking){
        Ranking result = rankingRepository.createRanking(ranking);
        return result;
    }

    @GetMapping("/rankings/d/{id}")
    public boolean deleteRanking(@PathVariable int id){
        return rankingRepository.deleteRanking(id);
    }

    @GetMapping("/rankings/{id}")
    public Ranking getRanking(@PathVariable int id){
        return rankingRepository.getRanking(id);
    }

    @PostMapping("/rankings/update")
    public boolean updateRanking(@RequestBody Ranking ranking){
         return rankingRepository.updateRanking(ranking);
    }
}
