package cl.tbd.ejemplo1.services;

import cl.tbd.ejemplo1.models.Tarea;
import cl.tbd.ejemplo1.repositories.TareaRepository;

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
public class TareaService {

    private final TareaRepository tareaRepository;
    TareaService(TareaRepository tareaRepository){
        this.tareaRepository = tareaRepository;
    }

    @GetMapping("/tareas")
    public List<Tarea> getAllTarea() {
        return tareaRepository.getAllTarea();
    }

    @GetMapping("/tareas/count")
    public String countTarea(){
        int total = tareaRepository.countTarea();
        return String.format("Tienes en total, %s de la lista.", total);
    }

    @PostMapping("/tareas/a")
    @ResponseBody
    public Tarea createTarea(@RequestBody Tarea tarea){
        Tarea result = tareaRepository.createTarea(tarea);
        return result;
    }

    @GetMapping("/tareas/d/{id}")
    public boolean deleteTarea(@PathVariable int id){
        return tareaRepository.deleteTarea(id);
    }
     @GetMapping("/tareas/{id}")
    public Tarea getById(@PathVariable int id){
        return tareaRepository.getById(id);
    }
    @PostMapping("/tareas/update")
    public boolean updateTarea(@RequestBody Tarea tarea){
         return tareaRepository.updateTarea(tarea);
    }
    @GetMapping("/tareas/buscar/{id}")
    public List<Tarea> buscarTareas(@PathVariable int id){
        return tareaRepository.buscarTareas(id);
    }
}

