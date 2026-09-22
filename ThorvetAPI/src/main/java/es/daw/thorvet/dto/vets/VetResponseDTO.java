package es.daw.thorvet.dto.vets;


import lombok.Builder;

@Builder
public record VetResponseDTO(
        //    license_number VARCHAR(40)  NOT NULL,
//    full_name      VARCHAR(120) NOT NULL,
//    email          VARCHAR(150) NOT NULL,
//    active         BOOLEAN NOT NULL

         String license_number,
         String full_name,
        String email,
         Boolean active
)
{}
