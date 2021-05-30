package cl.tbd.ejemplo1.repositories;
import java.util.List;
import cl.tbd.ejemplo1.models.Emergencia;

public interface EmergenciaRepository {
    public int countEmergencia();
    public List<Emergencia> getAllEmergencia();
    public Emergencia createEmergencia(Emergencia emergencia);
    public boolean deleteEmergencia(int id);
    public boolean updateEmergencia(Emergencia emergencia);
}
