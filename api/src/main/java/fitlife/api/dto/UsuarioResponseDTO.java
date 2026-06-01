package fitlife.api.dto;

import java.time.LocalDate;
import java.util.UUID;

public record UsuarioResponseDTO(
    UUID id, 
    String nome, 
    String email, 
    double peso, 
    double altura, 
    LocalDate dataNascimento,
    double imc // O IMC já calculado e pronto para ser exibido no ecrã!
) {}