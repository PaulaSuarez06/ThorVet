package es.daw.thorvet.dto.owners;


public record OwnerRequestDTO(
        String DNI,
        String FULL_NAME,
        String ADDRESS,
        String EMAIL,
        String PHONE
){}
