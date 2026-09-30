package thorvet.dto.vets;

public record VetRequestDTO(
        String license_number,
        String full_name,
        String email,
        Boolean active
) {
}
