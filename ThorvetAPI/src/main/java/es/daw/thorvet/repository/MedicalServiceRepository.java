package es.daw.thorvet.repository;

import es.daw.thorvet.entity.MedicalService;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MedicalServiceRepository extends JpaRepository <MedicalService, Integer>
{
}
