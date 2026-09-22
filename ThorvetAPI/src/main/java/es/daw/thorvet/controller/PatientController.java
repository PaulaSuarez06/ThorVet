package es.daw.thorvet.controller;


import es.daw.thorvet.dto.owners.OwnerRequestDTO;
import es.daw.thorvet.dto.owners.OwnerResponseDTO;
import es.daw.thorvet.dto.patients.PatientRequestDTO;
import es.daw.thorvet.dto.patients.PatientResponseDTO;
import es.daw.thorvet.service.PatientService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/patient")
@RequiredArgsConstructor
public class PatientController {

    private final PatientService patientService;

    @GetMapping
    public ResponseEntity<List<PatientResponseDTO>> getAllPatients(){
        return ResponseEntity.ok(patientService.findAll());
    }

    @PostMapping
    public ResponseEntity<PatientResponseDTO> createPatient(@RequestBody PatientRequestDTO patientRequestDTO){

        Optional<PatientResponseDTO> result = patientService.create(patientRequestDTO);
      if(result.isPresent()){
          return ResponseEntity.status(HttpStatus.CREATED).body(result.get());
      }
      return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    }





}
