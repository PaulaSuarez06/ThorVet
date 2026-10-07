package thorvet.repository;

import thorvet.entity.Patient;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PatientRepository extends JpaRepository<Patient,Long> {


    Optional<Patient> findById(Long id);
    Optional<Patient> findByChipNumber(String chipNumber);
    Optional<Patient> findByName(String name);

}
