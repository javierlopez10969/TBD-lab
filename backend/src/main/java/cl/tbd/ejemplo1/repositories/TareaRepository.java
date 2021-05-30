package cl.tbd.ejemplo1.repositories;
import java.util.List;
import cl.tbd.ejemplo1.models.Tarea;

public interface TareaRepository {
    public int countTarea();
    public List<Tarea> getAllTarea();
    public Tarea getById(int id);
    public Tarea createTarea(Tarea tarea);
}
