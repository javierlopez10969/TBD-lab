package cl.tbd.ejemplo1.repositories;
import java.util.List;
import cl.tbd.ejemplo1.models.Eme_habilidad;

public interface Eme_habilidadRepository {
    public int countEme_habilidad();
    public List<Eme_habilidad> getAllEme_habilidad();
    public Eme_habilidad createEme_habilidad(Eme_habilidad eme_habilidad);
    public boolean deleteEme_habilidad(int id);
    public boolean updateEme_habilidad(Eme_habilidad eme_habilidad);
}
