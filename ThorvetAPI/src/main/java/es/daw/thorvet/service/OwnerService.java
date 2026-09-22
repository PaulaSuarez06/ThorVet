package es.daw.thorvet.service;


import es.daw.thorvet.dto.owners.OwnerRequestDTO;
import es.daw.thorvet.entity.Owner;
import es.daw.thorvet.mapper.OwnerMapper;
import es.daw.thorvet.repository.OwnerRepository;
import es.daw.thorvet.dto.owners.OwnerResponseDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class OwnerService {


    private final OwnerRepository ownerRepository;
    private final OwnerMapper ownerMapper;

    public List <OwnerResponseDTO> findAll(){
        return ownerRepository.findAll().stream()
                .map(ownerMapper::toResponseDTO)
                .toList();
    }

    /**
     * Busca un propietario por su ID.
     *
     * @param id el ID del propietario
     * @return Optional con el DTO del propietario si existe, vacío si no existe
     */
    public Optional<OwnerResponseDTO> findById(Long id) {
        return ownerRepository.findById(id)
                .map(ownerMapper::toResponseDTO);
    }

    public Optional<OwnerResponseDTO> create(OwnerRequestDTO ownerRequestDTO){
        Owner owner = ownerMapper.toEntity(ownerRequestDTO);
        Owner savedOwner = ownerRepository.save(owner);
        return Optional.of(ownerMapper.toResponseDTO(savedOwner));
    }

    public boolean delete(Long id) {
        if(ownerRepository.existsById(id)){
            ownerRepository.deleteById(id);
            return true;
        }
        return false;
    }
}
