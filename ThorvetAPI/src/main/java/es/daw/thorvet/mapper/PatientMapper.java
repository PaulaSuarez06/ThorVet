package es.daw.thorvet.mapper;

import es.daw.thorvet.dto.patients.PatientRequestDTO;
import es.daw.thorvet.dto.patients.PatientResponseDTO;
import es.daw.thorvet.entity.Owner;
import es.daw.thorvet.entity.Patient;
import org.springframework.stereotype.Component;

/**
 * Mapper para convertir entre la entidad Patient y sus DTOs.
 */
@Component
public class PatientMapper {

    /**
     * Convierte una entidad Patient a PatientResponseDTO.
     *
     * @param patient la entidad Patient
     * @return el DTO de respuesta
     */
    public PatientResponseDTO toResponseDTO(Patient patient) {
        if (patient == null) {
            return null;
        }

        return PatientResponseDTO.builder()
                .ID(patient.getId())
                .CHIP_NUMBER(patient.getChipNumber())
                .NAME(patient.getName())
                .SPECIES(patient.getSpecies())
                .BREED(patient.getBreed())
                .DATE_OF_BIRTH(patient.getDateOfBirth())
                .WEIGHT_KG(patient.getWeightKg())
                .OWNER_ID(patient.getOwner() != null ? patient.getOwner().getId() : null)
                .OWNER_FULL_NAME(patient.getOwner() != null ? patient.getOwner().getFullName() : null)
                .ACTIVE(patient.isActive())
                .build();
    }

    /**
     * Convierte un PatientRequestDTO a entidad Patient.
     * El owner debe asignarse aparte (buscándolo por OWNER_ID en el service),
     * ya que el mapper no tiene acceso al repositorio.
     *
     * @param dto el DTO de petición
     * @return la entidad Patient
     */
    public Patient toEntity(PatientRequestDTO dto) {
        if (dto == null) {
            return null;
        }

        Patient patient = new Patient();
        patient.setChipNumber(dto.CHIP_NUMBER());
        patient.setName(dto.NAME());
        patient.setSpecies(dto.SPECIES());
        patient.setBreed(dto.BREED());
        patient.setDateOfBirth(dto.DATE_OF_BIRTH());
        patient.setWeightKg(dto.WEIGHT_KG());
        patient.setActive(true); // Por defecto activo
        return patient;
    }

    /**
     * Asigna el Owner a la entidad Patient.
     * Úsalo en el service tras resolver el Owner por su ID.
     *
     * @param patient la entidad Patient
     * @param owner   el Owner a asignar
     */
    public void setOwner(Patient patient, Owner owner) {
        patient.setOwner(owner);
    }
}
