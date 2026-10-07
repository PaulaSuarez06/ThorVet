package thorvet.controller;


import thorvet.dto.patients.PatientRequestDTO;
import thorvet.dto.patients.PatientResponseDTO;
import thorvet.service.PatientService;
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

    @GetMapping("/{name}")
    public ResponseEntity<PatientResponseDTO> getPatientByName(@PathVariable String name){
        Optional<PatientResponseDTO> result = patientService.findByName(name);
        if(result.isPresent()){
            return ResponseEntity.ok(result.get());
        }
        return ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<PatientResponseDTO> createPatient(@RequestBody PatientRequestDTO patientRequestDTO){

        Optional<PatientResponseDTO> result = patientService.create(patientRequestDTO);
      if(result.isPresent()){
          return ResponseEntity.status(HttpStatus.CREATED).body(result.get());
      }
      return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id){
        if (patientService.delete(id)){
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }





}
