package cl.tbd.ejemplo1.repositories;
import java.util.List;
import cl.tbd.ejemplo1.models.Habilidad;

public interface HabilidadRepository {
    public int countHabilidad();
    public List<Habilidad> getAllHabilidad();
    public List<Habilidad> getHabilidadUsuario(int id);
    public List<Habilidad> getHabilidadTarea(int id);
    public List<Habilidad> getHabilidadEmergencia(int id);
    public Habilidad createHabilidad(Habilidad habilidad);
    public boolean deleteHabilidad(int id);
    public boolean updateHabilidad(Habilidad nuevoHabilidad);
    public Habilidad getHabilidad(int id);
}
