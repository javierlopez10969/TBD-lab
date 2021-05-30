package cl.tbd.ejemplo1.services;

import cl.tbd.ejemplo1.models.Vol_habilidad;
import cl.tbd.ejemplo1.repositories.Vol_habilidadRepository;

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
public class Vol_habilidadService {

    private final Vol_habilidadRepository vol_habilidadRepository;
    Vol_habilidadService(Vol_habilidadRepository vol_habilidadRepository){
        this.vol_habilidadRepository = vol_habilidadRepository;
    }

    @GetMapping("/vol_habilidades")
    public List<Vol_habilidad> getAllVol_habilidad() {
        return vol_habilidadRepository.getAllVol_habilidad();
    }

    @GetMapping("/vol_habilidades/count")
    public String countVol_habilidad(){
        int total = vol_habilidadRepository.countVol_habilidad();
        return String.format("Tienes en total, %s de la lista.", total);
    }

    @PostMapping("/vol_habilidades/a")
    @ResponseBody
    public Vol_habilidad createVol_habilidad(@RequestBody Vol_habilidad vol_habilidad){
        Vol_habilidad result = vol_habilidadRepository.createVol_habilidad(vol_habilidad);
        return result;
    }

    @GetMapping("/vol_habilidades/d/{id}")
    public boolean deleteVol_habilidad(@PathVariable int id){
        return vol_habilidadRepository.deleteVol_habilidad(id);
    }
    @PostMapping("/vol_habilidades/update")
    public boolean deleteVol_habilidad(@RequestBody Vol_habilidad vol_habilidad){
        return vol_habilidadRepository.updateVol_habilidad(vol_habilidad);
    }
}
