package com.example.thorvetmvc.service;

import com.example.thorvetmvc.dto.PatientRequestDto;
import com.example.thorvetmvc.dto.PatientResponseDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class PatientService {

    private final WebClient webClient;

    public List<PatientResponseDto> getAllPatients() {
        List<PatientResponseDto> patients = webClient.get()
                .uri("/api/patient")
                .retrieve()
                .bodyToFlux(PatientResponseDto.class)
                .collectList()
                .block();

        log.trace("Pacientes recibidos de la API: {}", patients == null ? 0 : patients.size());

        return patients;
    }

    public PatientRequestDto createPatient (PatientRequestDto patientDto){
        PatientRequestDto patients;

        try{
            patients = webClient
                    .post()
                    .uri("/api/patient")
                    .bodyValue(patientDto)
                    .retrieve()
                    .bodyToMono(PatientRequestDto.class)
                    .block();
        } catch (Exception e){
            log.error("Error al crear el paciente: {}", e.getMessage());
            return null;
        }
        return patients;
    }



}
