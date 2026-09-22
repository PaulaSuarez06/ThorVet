package com.example.thorvetmvc.dto;

import java.math.BigDecimal;
import java.time.LocalDate;

public record PatientResponseDto(
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
