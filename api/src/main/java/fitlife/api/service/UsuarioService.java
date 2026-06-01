package fitlife.api.service;

import org.springframework.stereotype.Service;

import fitlife.api.dto.UsuarioRequestDTO;
import fitlife.api.dto.UsuarioResponseDTO;
import fitlife.api.models.Usuario;
import fitlife.api.repository.UsuarioRepository;

@Service
public class UsuarioService {

    private final UsuarioRepository repository;

    public UsuarioService(UsuarioRepository repository) {
        this.repository = repository;
    }

    public UsuarioResponseDTO criar(UsuarioRequestDTO dto) {
        // Converte o DTO que veio da App para a Entidade da base de dados
        Usuario usuario = new Usuario();
        usuario.setNome(dto.nome());
        usuario.setEmail(dto.email());
        usuario.setSenha(dto.senha()); // Numa aplicação real, a palavra-passe seria encriptada aqui
        usuario.setPeso(dto.peso());
        usuario.setAltura(dto.altura());
        usuario.setDataNascimento(dto.dataNascimento());

        // Grava na base de dados (o ID é gerado automaticamente)
        usuario = repository.save(usuario);

        // Calcula o IMC e devolve a resposta formatada
        double imc = usuario.getPeso() / (usuario.getAltura() * usuario.getAltura());
        
        return new UsuarioResponseDTO(
            usuario.getId(),
            usuario.getNome(),
            usuario.getEmail(),
            usuario.getPeso(),
            usuario.getAltura(),
            usuario.getDataNascimento(),
            imc
        );
    }
}