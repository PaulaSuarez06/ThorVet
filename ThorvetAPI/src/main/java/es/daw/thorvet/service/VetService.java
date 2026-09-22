package es.daw.thorvet.service;


import es.daw.thorvet.dto.vets.VetResponseDTO;
import es.daw.thorvet.mapper.VetMapper;
import es.daw.thorvet.repository.VetRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class VetService {


    private final VetRepository vetRepository;
    private final VetMapper vetMapper;


    public Page<VetResponseDTO> findAll(Pageable pageable) {

        return vetRepository.findAll(pageable).map(vetMapper::toVetResponseDTO);
    }
}
