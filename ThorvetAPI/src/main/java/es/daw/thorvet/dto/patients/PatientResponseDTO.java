package es.daw.thorvet.dto.patients;

import lombok.Builder;

import java.math.BigDecimal;
import java.time.LocalDate;

@Builder
public record PatientResponseDTO(
        Long ID,
        String CHIP_NUMBER,
        String NAME,
        String SPECIES,
        String BREED,
        LocalDate DATE_OF_BIRTH,
        BigDecimal WEIGHT_KG,
        Long OWNER_ID,
        String OWNER_FULL_NAME,
        boolean ACTIVE
) {
}
