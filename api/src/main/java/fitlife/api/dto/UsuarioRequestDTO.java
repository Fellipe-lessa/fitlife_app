package fitlife.api.dto;

import java.time.LocalDate;

public record UsuarioRequestDTO(
    String nome, 
    String email, 
    String senha, 
    double peso, 
    double altura, 
    LocalDate dataNascimento
) {}