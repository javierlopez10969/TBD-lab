package cl.tbd.ejemplo1.repositories;
import java.util.List;
import cl.tbd.ejemplo1.models.Institucion;

public interface InstitucionRepository {
    public int countInstitucion();
    public List<Institucion> getAllInstitucion();
    public Institucion createInstitucion(Institucion institucion);
    public boolean deleteInstitucion(int id);
}
