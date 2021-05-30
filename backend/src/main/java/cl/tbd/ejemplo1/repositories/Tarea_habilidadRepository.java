package cl.tbd.ejemplo1.repositories;
import java.util.List;
import cl.tbd.ejemplo1.models.Tarea_habilidad;

public interface Tarea_habilidadRepository {
    public int countTarea_habilidad();
    public List<Tarea_habilidad> getAllTarea_habilidad();
    public Tarea_habilidad createTarea_habilidad(Tarea_habilidad tarea_habilidad);
    public boolean deleteTarea_habilidad(int id);    
    public boolean updateTarea_habilidad(Tarea_habilidad nuevoTarea_habilidad);
    public Tarea_habilidad getTarea_habilidad(int id);
}
