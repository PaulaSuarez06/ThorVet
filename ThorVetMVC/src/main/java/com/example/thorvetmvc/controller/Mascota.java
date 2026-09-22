package com.example.thorvetmvc.controller;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PastOrPresent;
import jakarta.validation.constraints.Positive;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Mascota {

    @NotBlank(message = "El número de chip es obligatorio")
    @JsonProperty("CHIP_NUMBER")
    private String chipNumber;

    @NotBlank(message = "El nombre es obligatorio")
    @JsonProperty("NAME")
    private String name;

    @NotBlank(message = "La especie es obligatoria")
    @JsonProperty("SPECIES")
    private String species;

    @JsonProperty("BREED")
    private String breed;

    @NotNull(message = "La fecha de nacimiento es obligatoria")
    @PastOrPresent(message = "La fecha de nacimiento no puede ser futura")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    @JsonProperty("DATE_OF_BIRTH")
    private LocalDate dateOfBirth;

    @NotNull(message = "El peso es obligatorio")
    @Positive(message = "El peso debe ser mayor que cero")
    @JsonProperty("WEIGHT_KG")
    private BigDecimal weightKg;

    @NotNull(message = "El propietario es obligatorio")
    @Positive(message = "El ID del propietario no es válido")
    @JsonProperty("OWNER_ID")
    private Long ownerId;

    public String getChipNumber() {
        return chipNumber;
    }

    public void setChipNumber(String chipNumber) {
        this.chipNumber = chipNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public BigDecimal getWeightKg() {
        return weightKg;
    }

    public void setWeightKg(BigDecimal weightKg) {
        this.weightKg = weightKg;
    }

    public Long getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Long ownerId) {
        this.ownerId = ownerId;
    }
}
