package cl.tbd.ejemplo1.repositories;
import java.util.List;
import cl.tbd.ejemplo1.models.Voluntario;

public interface VoluntarioRepository {
    public int countVoluntario();
    public List<Voluntario> getAllVoluntarios();
    public Voluntario createVoluntario(Voluntario voluntario);
    public boolean deleteVoluntario(int id);
    public Voluntario getVoluntario(int id);
    public boolean updateVoluntario(Voluntario nuevoVoluntario);
}
