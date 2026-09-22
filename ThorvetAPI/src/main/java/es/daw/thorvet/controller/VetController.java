package es.daw.thorvet.controller;


import es.daw.thorvet.dto.vets.VetResponseDTO;
import es.daw.thorvet.service.VetService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}