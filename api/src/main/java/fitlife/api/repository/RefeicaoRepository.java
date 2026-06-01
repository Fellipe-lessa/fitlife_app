package fitlife.api.repository;

import fitlife.api.model.Refeicao;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.UUID;

public interface RefeicaoRepository extends JpaRepository<Refeicao, UUID> {
    List<Refeicao> findByUsuarioId(UUID usuarioId);
}