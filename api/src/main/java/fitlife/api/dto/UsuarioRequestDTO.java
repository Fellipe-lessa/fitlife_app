package fitlife.api.dto;

import java.time.LocalDate;
import jakarta.validation.constraints.*;

public record UsuarioRequestDTO(
    @NotBlank(message = "Nome é obrigatório") String nome,
    @Email(message = "Email inválido") String email,
    @NotBlank String senha,
    @Positive double peso,
    @Positive double altura,
    java.time.LocalDate dataNascimento
) {}