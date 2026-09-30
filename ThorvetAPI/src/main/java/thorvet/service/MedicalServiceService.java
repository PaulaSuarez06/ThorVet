package thorvet.service;

import thorvet.dto.medicalService.MedicalServiceResponseDTO;
import thorvet.mapper.MedicalServiceMapper;
import thorvet.repository.MedicalServiceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MedicalServiceService {

    private final MedicalServiceRepository medicalServiceRepository;
    private final MedicalServiceMapper medicalServiceMapper;

    public List<MedicalServiceResponseDTO> findAll() {
        return medicalServiceRepository.findAll().stream()
                .map(medicalServiceMapper::toResponseDTO)
                .toList();
    }
}

