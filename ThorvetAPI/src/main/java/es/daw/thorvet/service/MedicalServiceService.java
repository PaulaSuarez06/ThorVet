package es.daw.thorvet.service;

import es.daw.thorvet.dto.medicalService.MedicalServiceResponseDTO;
import es.daw.thorvet.mapper.MedicalServiceMapper;
import es.daw.thorvet.repository.MedicalServiceRepository;
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

