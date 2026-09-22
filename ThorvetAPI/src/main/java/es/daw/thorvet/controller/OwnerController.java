package es.daw.thorvet.controller;

import es.daw.thorvet.dto.owners.OwnerRequestDTO;
import es.daw.thorvet.dto.owners.OwnerResponseDTO;
import es.daw.thorvet.service.OwnerService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/owner")
@RequiredArgsConstructor
public class OwnerController {

    private final OwnerService ownersService;

//    1. Propietarios (Owners) - Lo más básico
//    GET /api/owners - Listar todos los propietarios HECHO
//    GET /api/owners/{id} - Ver un propietario por ID
//    POST /api/owners - Crear nuevo propietario
//    DELETE /api/owners/{id} - Eliminar propietario (o desactivar)

    @GetMapping
    public ResponseEntity<List<OwnerResponseDTO>> getAllOwners(){
        return ResponseEntity.ok(ownersService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<OwnerResponseDTO> getOwnerById(@PathVariable Long id){
        return ownersService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<OwnerResponseDTO> create(@RequestBody OwnerRequestDTO ownerRequestDTO){

        Optional<OwnerResponseDTO> result = ownersService.create(ownerRequestDTO);
        if(result.isPresent()){
            return ResponseEntity
                    .status(HttpStatus.CREATED)
                    .body(result.get());
        }
    return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id){
        if (ownersService.delete(id)){
            return ResponseEntity.noContent().build();
    } else {
            return ResponseEntity.notFound().build();
        }
    }



}
