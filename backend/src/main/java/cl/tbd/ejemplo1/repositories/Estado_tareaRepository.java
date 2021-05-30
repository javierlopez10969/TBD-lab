package cl.tbd.ejemplo1.repositories;
import java.util.List;
import cl.tbd.ejemplo1.models.Estado_tarea;

public interface Estado_tareaRepository {
    public int countEstado_tarea();
    public List<Estado_tarea> getAllEstado_tarea();
    public Estado_tarea createEstado_tarea(Estado_tarea estado_tarea);
    public boolean deleteEstado_tarea(int id);
    public boolean updateEstado_tarea(Estado_tarea estado_tarea);
    public Estado_tarea getEstado_tarea(int id);
}
