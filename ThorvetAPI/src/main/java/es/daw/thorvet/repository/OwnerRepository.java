package es.daw.thorvet.repository;

import es.daw.thorvet.entity.Owner;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface OwnerRepository extends JpaRepository<Owner, Long> {

    // Métodos heredados de JpaRepository:
    // - List<Owner> findAll()
    // - Optional<Owner> findById(Long id)
    // - Owner save(Owner owner)
    // - void deleteById(Long id)

    // Métodos de consulta personalizados (opcional):
    Optional<Owner> findByDni(String dni);

    Optional<Owner> findByEmail(String email);
}
