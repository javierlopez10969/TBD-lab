package cl.tbd.ejemplo1.services;

import cl.tbd.ejemplo1.models.Ranking;
import cl.tbd.ejemplo1.repositories.RankingRepository;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
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
}
