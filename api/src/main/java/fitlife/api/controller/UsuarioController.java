package fitlife.api.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import fitlife.api.dto.UsuarioRequestDTO;
import fitlife.api.dto.UsuarioResponseDTO;
import fitlife.api.service.UsuarioService;

@RestController
@RequestMapping("/api/usuarios")
public class UsuarioController {

    private final UsuarioService service;

    public UsuarioController(UsuarioService service) {
        this.service = service;
    }

    @PostMapping
    public ResponseEntity<UsuarioResponseDTO> registarUsuario(@RequestBody UsuarioRequestDTO request) {
        UsuarioResponseDTO response = service.criar(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }
}