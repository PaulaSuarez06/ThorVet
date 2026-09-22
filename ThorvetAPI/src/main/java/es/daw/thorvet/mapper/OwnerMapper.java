package es.daw.thorvet.mapper;

import es.daw.thorvet.dto.owners.OwnerRequestDTO;
import es.daw.thorvet.dto.owners.OwnerResponseDTO;
import es.daw.thorvet.entity.Owner;
import org.springframework.stereotype.Component;

/**
 * Mapper para convertir entre la entidad Owner y sus DTOs.
 */
@Component
public class OwnerMapper {

    /**
     * Convierte una entidad Owner a OwnerResponseDTO.
     *
     * @param owner la entidad Owner
     * @return el DTO de respuesta
     */
    public OwnerResponseDTO toResponseDTO(Owner owner) {
        if (owner == null) {
            return null;
        }

        return OwnerResponseDTO.builder()
                .DNI(owner.getDni())
                .FULL_NAME(owner.getFullName())
                .EMAIL(owner.getEmail())
                .PHONE(owner.getPhone())
                .ADDRESS(owner.getAddress())
                .build();
    }

    /**
     * Convierte un OwnerResponseDTO a entidad Owner.
     * Útil para operaciones de creación.
     *
     * @param dto el DTO de respuesta
     * @return la entidad Owner
     */
    public Owner toEntity(OwnerRequestDTO dto) {
        if (dto == null) {
            return null;
        }

        Owner owner = new Owner();
        owner.setDni(dto.DNI());
        owner.setFullName(dto.FULL_NAME());
        owner.setEmail(dto.EMAIL());
        owner.setPhone(dto.PHONE());
        owner.setAddress(dto.ADDRESS());
        owner.setActive(true); // Por defecto activo
        return owner;
    }




}
