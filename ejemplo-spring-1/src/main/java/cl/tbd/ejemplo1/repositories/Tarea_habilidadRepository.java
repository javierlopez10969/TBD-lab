package cl.tbd.ejemplo1.repositories;
import java.util.List;
import cl.tbd.ejemplo1.models.Tarea_habilidad;

public interface Tarea_habilidadRepository {
    public int countTarea_habilidad();
    public List<Tarea_habilidad> getAllTarea_habilidad();
}
