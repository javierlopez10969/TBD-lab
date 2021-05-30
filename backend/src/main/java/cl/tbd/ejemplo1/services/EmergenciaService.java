package cl.tbd.ejemplo1.services;

import cl.tbd.ejemplo1.models.Emergencia;
import cl.tbd.ejemplo1.repositories.EmergenciaRepository;

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
public class EmergenciaService {

    private final EmergenciaRepository emergenciaRepository;
    EmergenciaService(EmergenciaRepository emergenciaRepository){
        this.emergenciaRepository = emergenciaRepository;
    }

    @GetMapping("/emergencias")
    public List<Emergencia> getAllEmergencia(){
        return emergenciaRepository.getAllEmergencia();
    }

    @GetMapping("/emergencias/count")
    public String countEmergencia(){
        int total = emergenciaRepository.countEmergencia();
        return String.format("Tienes en total, %s de la lista.", total);
    }

    @PostMapping("/emergencias/a")
    @ResponseBody
    public Emergencia createEmergencia(@RequestBody Emergencia emergencia){
        Emergencia result = emergenciaRepository.createEmergencia(emergencia);
        return result;
    }

    @GetMapping("/emergencias/d/{id}")
    public boolean deleteEmergencia(@PathVariable int id){
        return emergenciaRepository.deleteEmergencia(id);
    }
    @PostMapping("/emergencias/update")
    public boolean updateEmergencia(@RequestBody Emergencia emergencia){
         return emergenciaRepository.updateEmergencia(emergencia);
    }
}
