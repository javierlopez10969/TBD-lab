package cl.tbd.ejemplo1.services;

import cl.tbd.ejemplo1.models.Tarea_habilidad;
import cl.tbd.ejemplo1.repositories.Tarea_habilidadRepository;

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
public class Tarea_habilidadService {

    private final Tarea_habilidadRepository tarea_habilidadRepository;
    Tarea_habilidadService(Tarea_habilidadRepository tarea_habilidadRepository){
        this.tarea_habilidadRepository = tarea_habilidadRepository;
    }

    @GetMapping("/tarea_habilidades")
    public List<Tarea_habilidad> getAllTarea_habilidad() {
        return tarea_habilidadRepository.getAllTarea_habilidad();
    }

    @GetMapping("/tarea_habilidades/count")
    public String countTarea_habilidad(){
        int total = tarea_habilidadRepository.countTarea_habilidad();
        return String.format("Tienes en total, %s de la lista.", total);
    }

    @PostMapping("/tarea_habilidades/a")
    @ResponseBody
    public Tarea_habilidad createTarea_habilidad(@RequestBody Tarea_habilidad tarea_habilidad){
        Tarea_habilidad result = tarea_habilidadRepository.createTarea_habilidad(tarea_habilidad);
        return result;
    }

    @GetMapping("/tarea_habilidades/d/{id}")
    public boolean deleteTarea_habilidad(@PathVariable int id){
        return tarea_habilidadRepository.deleteTarea_habilidad(id);
    }
}
