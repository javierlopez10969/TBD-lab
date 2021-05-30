package cl.tbd.ejemplo1.services;

import cl.tbd.ejemplo1.models.Voluntario;
import cl.tbd.ejemplo1.repositories.VoluntarioRepository;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin
@RestController
public class VoluntarioService {

    private final VoluntarioRepository voluntarioRepository;
    VoluntarioService(VoluntarioRepository voluntarioRepository){
        this.voluntarioRepository = voluntarioRepository;
    }

    @GetMapping("/voluntarios")
    public List<Voluntario> getAllVoluntarios() {
        return voluntarioRepository.getAllVoluntarios();
    }

    @GetMapping("/voluntarios/count")
    public String countVoluntario(){
        int total = voluntarioRepository.countVoluntario();
        return String.format("Tienes en total, %s de la lista.", total);
    }

    @PostMapping("/voluntarios/a")
    @ResponseBody
    public Voluntario createVoluntario(@RequestBody Voluntario voluntario){
        Voluntario result = voluntarioRepository.createVoluntario(voluntario);
        return result;
    }

    @GetMapping("/voluntarios/d/{id}")
    public boolean deleteVoluntario(@PathVariable int id){
        return voluntarioRepository.deleteVoluntario(id);
    }
}
