package thorvet.service;


import thorvet.dto.patients.PatientRequestDTO;
import thorvet.dto.patients.PatientResponseDTO;
import thorvet.entity.Owner;
import thorvet.entity.Patient;
import thorvet.mapper.PatientMapper;
import thorvet.repository.OwnerRepository;
import thorvet.repository.PatientRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

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

    public boolean delete(Long id){
        if(patientRepository.existsById(id)){
            patientRepository.deleteById(id);
            return true;
        }
        return false;
    }


    public Optional<PatientResponseDTO> findByName(String name) {
        return patientRepository.findByName(name)
                .map(patientMapper::toResponseDTO);
    }
}






