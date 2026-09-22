package es.daw.thorvet.mapper;


import es.daw.thorvet.dto.medicalService.MedicalServiceResponseDTO;
import es.daw.thorvet.entity.MedicalService;
import org.springframework.stereotype.Component;

@Component
public class MedicalServiceMapper {

    public MedicalServiceResponseDTO toResponseDTO(MedicalService medicalService) {
        if (medicalService == null) {
            return null;
        }
        return MedicalServiceResponseDTO.builder()
                .id(medicalService.getId())
                .name(medicalService.getName())
                .code(medicalService.getCode())
                .base_price(medicalService.getBasePrice())
                .active(medicalService.isActive())
                .build();
    }

    public MedicalServiceResponseDTO toMedicalServiceResponseDTO(MedicalService medicalService) {
        return toResponseDTO(medicalService);
    }
}
