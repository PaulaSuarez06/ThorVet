package thorvet.service;


import thorvet.dto.vets.VetRequestDTO;
import thorvet.dto.vets.VetResponseDTO;
import thorvet.entity.Vet;
import thorvet.mapper.VetMapper;
import thorvet.repository.VetRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class VetService {


    private final VetRepository vetRepository;
    private final VetMapper vetMapper;


    public Page<VetResponseDTO> findAll(Pageable pageable) {

        return vetRepository.findAll(pageable).map(vetMapper::toVetResponseDTO);
    }


    public Optional<VetResponseDTO> create(VetRequestDTO vetRequestDTO){

        Vet vet = vetMapper.toEntity(vetRequestDTO);
        Vet savedVet = vetRepository.save(vet);
        return Optional.of(vetMapper.toVetResponseDTO(savedVet));
    }


    public boolean delete(Long id){
        if(vetRepository.existsById(id)){
            vetRepository.deleteById(id);
            return true;
        }
        return false;
    }



}
