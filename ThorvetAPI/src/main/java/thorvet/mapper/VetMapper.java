package thorvet.mapper;


import thorvet.dto.vets.VetRequestDTO;
import thorvet.dto.vets.VetResponseDTO;
import thorvet.entity.Vet;
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

public Vet toEntity(VetRequestDTO vetRequestDTO){
    if (vetRequestDTO == null){
        return null;
    }

    Vet vet = new Vet();
    vet.setLicenseNumber(vetRequestDTO.license_number());
    vet.setFullName(vetRequestDTO.full_name());
    vet.setEmail(vetRequestDTO.email());
    vet.setActive(vetRequestDTO.active());
    return vet;
}






}
