package cl.tbd.ejemplo1.repositories;
import java.util.List;
import cl.tbd.ejemplo1.models.Habilidad;

public interface HabilidadRepository {
    public int countHabilidad();
    public List<Habilidad> getAllHabilidad();
    public Habilidad createHabilidad(Habilidad habilidad);
}
