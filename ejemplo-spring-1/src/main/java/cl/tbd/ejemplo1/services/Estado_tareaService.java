package cl.tbd.ejemplo1.services;

import cl.tbd.ejemplo1.models.Estado_tarea;
import cl.tbd.ejemplo1.repositories.Estado_tareaRepository;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin
@RestController
public class Estado_tareaService {

    private final Estado_tareaRepository estado_tareaRepository;
    Estado_tareaService(Estado_tareaRepository estado_tareaRepository){
        this.estado_tareaRepository = estado_tareaRepository;
    }

    @GetMapping("/estado_tarea")
    public List<Estado_tarea> getAllEstado_tarea() {
        return estado_tareaRepository.getAllEstado_tarea();
    }

    @GetMapping("/estado_tarea/count")
    public String countDogs(){
        int total =estado_tareaRepository.countEstado_tarea();
        return String.format("Tienes en total, %s de la lista.", total);
    }

    @PostMapping("/estado_tarea/a")
    @ResponseBody
    public Estado_tarea createDog(@RequestBody Estado_tarea estado_tarea){
        Estado_tarea result = estado_tareaRepository.createEstado_tarea(estado_tarea);
        return result;
    }
}
