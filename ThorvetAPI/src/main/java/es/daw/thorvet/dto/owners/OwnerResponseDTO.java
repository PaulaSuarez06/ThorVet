package es.daw.thorvet.dto.owners;


import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class OwnerResponseDTO {

    private String DNI;
    private String FULL_NAME;
    private String ADDRESS;
    private String EMAIL;
    private String PHONE;
}
