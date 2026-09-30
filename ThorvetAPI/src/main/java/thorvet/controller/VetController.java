package thorvet.controller;


import thorvet.dto.vets.VetRequestDTO;
import thorvet.dto.vets.VetResponseDTO;
import thorvet.service.VetService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/vet")
@RequiredArgsConstructor
public class VetController {


    private final VetService vetService;
    //get todos los veterinarios paginado


    @GetMapping
    public ResponseEntity<Page<VetResponseDTO>> getAllVets(Pageable pageable){
        return ResponseEntity.ok(vetService.findAll(pageable));
    }

    @PostMapping
    public ResponseEntity<VetResponseDTO> createVet(@RequestBody VetRequestDTO vetRequestDTO){
        Optional<VetResponseDTO> result = vetService.create(vetRequestDTO);
        if(result.isPresent()){
            return ResponseEntity.status(HttpStatus.CREATED).body(result.get());
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id){
        if (vetService.delete(id)){
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }




}

