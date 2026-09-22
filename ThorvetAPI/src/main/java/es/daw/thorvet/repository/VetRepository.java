package es.daw.thorvet.repository;

import es.daw.thorvet.entity.Vet;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VetRepository extends JpaRepository<Vet,Long> {

     // Métodos heredados de JpaRepository:
    // - List<Vet> findAll()
    // - Optional<Vet> findById(Long id)
    // - Vet save(Vet vet)
    // - void deleteById(Long id)

    // Métodos de consulta personalizados (opcional):
}
