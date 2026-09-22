package es.daw.thorvet.mapper;


import es.daw.thorvet.dto.vets.VetResponseDTO;
import es.daw.thorvet.entity.Vet;
import org.springframework.stereotype.Component;

@Component
public class VetMapper {


public VetResponseDTO toVetResponseDTO(Vet vet){
    if (vet == null){
        return null;
    }


    return VetResponseDTO.builder()
            .license_number(vet.getLicenseNumber())
            .full_name(vet.getFullName())
            .email(vet.getEmail())
            .active(vet.isActive())
            .build();
}




}
