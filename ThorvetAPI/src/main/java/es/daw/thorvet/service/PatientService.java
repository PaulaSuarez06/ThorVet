package es.daw.thorvet.service;


import es.daw.thorvet.dto.patients.PatientRequestDTO;
import es.daw.thorvet.dto.patients.PatientResponseDTO;
import es.daw.thorvet.entity.Owner;
import es.daw.thorvet.entity.Patient;
import es.daw.thorvet.mapper.PatientMapper;
import es.daw.thorvet.repository.OwnerRepository;
import es.daw.thorvet.repository.PatientRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class PatientService {


    private final PatientRepository patientRepository;
    private final OwnerRepository ownerRepository;
    private final PatientMapper patientMapper;

    public List<PatientResponseDTO> findAll(){
        return patientRepository.findAll().stream()
                .map(patientMapper::toResponseDTO)
                .toList();
    }


    public Optional<PatientResponseDTO> create(PatientRequestDTO patientRequestDTO){
       Optional<Owner> owner = ownerRepository.findById(patientRequestDTO.OWNER_ID());
       if (owner.isEmpty()) {
           return Optional.empty();
       }

       Patient patient = patientMapper.toEntity(patientRequestDTO);
       patientMapper.setOwner(patient, owner.get());
       Patient savedPatient = patientRepository.save(patient);
       return Optional.of(patientMapper.toResponseDTO(savedPatient));
    }


}






