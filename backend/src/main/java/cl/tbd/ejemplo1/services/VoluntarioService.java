package cl.tbd.ejemplo1.services;

import cl.tbd.ejemplo1.models.Emergencia;
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
    @PostMapping("/voluntarioscercanos")
    @ResponseBody
    public List<Voluntario> voluntariosCercanos(@RequestBody Emergencia emergencia){
        System.out.println("Calculando voluntarios cercanos ...");
        return voluntarioRepository.getCercanos(emergencia.getLatitud(),emergencia.getLongitud(), 1);
    }

    @GetMapping("/voluntarios/count")
    public String countVoluntario(){
        int total = voluntarioRepository.countVoluntario();
        return String.format("Tienes en total, %s de la lista.", total);
    }

    @PostMapping("/voluntarios/a")
    @ResponseBody
    public String createVoluntario(@RequestBody Voluntario voluntario){
        Voluntario result = voluntarioRepository.createVoluntario(voluntario);
        if (result==null){
            return String.format("Ya existe un usuario con ese correo");
        }
        return String.format("Usuario creado con exito");
    }

    @GetMapping("/voluntarios/{id}")
    public Voluntario getVoluntario(@PathVariable int id){
        return voluntarioRepository.getVoluntario(id);
    }

    @PostMapping("/voluntarios/update")
    public boolean updateVoluntario(@RequestBody Voluntario voluntario){
         return voluntarioRepository.updateVoluntario(voluntario);
    }

    @GetMapping("/voluntarios/d/{id}")
    public boolean deleteVoluntario(@PathVariable int id){
        return voluntarioRepository.deleteVoluntario(id);
    }
    @PostMapping("/login")
    @ResponseBody
    public Voluntario logIn(@RequestBody Voluntario user){
        System.out.println("HOLA");
        Voluntario resultado =  voluntarioRepository.logIn(user);
        if (resultado == null){
            return user;
        }else{
            return resultado;
        }
    }
    @PostMapping("/voluntarios/logout")
    public String logOut(@RequestBody Voluntario user){
        return voluntarioRepository.logOut(user);
    }
    
}
