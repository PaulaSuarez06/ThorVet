package es.daw.thorvet.controller;


import es.daw.thorvet.service.MedicalServiceService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/services")
@RequiredArgsConstructor
public class MedicalServicesController {

    private final MedicalServiceService medicalServiceService;

    @GetMapping
    public ResponseEntity<?> getMedicalServices(){
        return ResponseEntity.ok(medicalServiceService.findAll());
    }




}
