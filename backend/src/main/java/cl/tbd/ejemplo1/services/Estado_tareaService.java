package cl.tbd.ejemplo1.services;

import cl.tbd.ejemplo1.models.Estado_tarea;
import cl.tbd.ejemplo1.repositories.Estado_tareaRepository;

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
public class Estado_tareaService {

    private final Estado_tareaRepository estado_tareaRepository;
    Estado_tareaService(Estado_tareaRepository estado_tareaRepository){
        this.estado_tareaRepository = estado_tareaRepository;
    }

    @GetMapping("/estado_tareas")
    public List<Estado_tarea> getAllEstado_tarea() {
        return estado_tareaRepository.getAllEstado_tarea();
    }

    @GetMapping("/estado_tareas/count")
    public String countEstado_tarea(){
        int total =estado_tareaRepository.countEstado_tarea();
        return String.format("Tienes en total, %s de la lista.", total);
    }

    @PostMapping("/estado_tareas/a")
    @ResponseBody
    public Estado_tarea createEstado_tarea(@RequestBody Estado_tarea estado_tarea){
        Estado_tarea result = estado_tareaRepository.createEstado_tarea(estado_tarea);
        return result;
    }

    @GetMapping("/estado_tareas/d/{id}")
    public boolean deleteEstado_tarea(@PathVariable int id){
        return estado_tareaRepository.deleteEstado_tarea(id);
    }
    @PostMapping("/estado_tareas/update")
    public boolean updateEstado_tarea(@RequestBody Estado_tarea estado_tarea){
         return estado_tareaRepository.updateEstado_tarea(estado_tarea);
    }

    @GetMapping("/estado_tareas/{id}")
    public Estado_tarea getEstado_tarea(@PathVariable int id){
        return estado_tareaRepository.getEstado_tarea(id);
    }
}
