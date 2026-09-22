package es.daw.thorvet.dto.patients;

import java.math.BigDecimal;
import java.time.LocalDate;

public record PatientRequestDTO(
        String CHIP_NUMBER,
        String NAME,
        String SPECIES,
        String BREED,
        LocalDate DATE_OF_BIRTH,
        BigDecimal WEIGHT_KG,
        Long OWNER_ID
) {
}
