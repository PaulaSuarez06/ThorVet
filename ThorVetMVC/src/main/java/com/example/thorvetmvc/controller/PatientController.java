package com.example.thorvetmvc.controller;

import com.example.thorvetmvc.dto.PatientRequestDto;
import com.example.thorvetmvc.dto.PatientResponseDto;
import com.example.thorvetmvc.service.PatientService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/mascotas")
@RequiredArgsConstructor
@Slf4j
public class

PatientController {

    private final PatientService patientService;

    // Vista de solo listado: ya no arma el formulario, así "/mascotas" queda
    // como la pantalla de consulta y "/mascotas/nueva" como la de alta.
    @GetMapping
    public String list(Model model) {
        log.trace("Accediendo al listado de pacientes");

        List<PatientResponseDto> patients = patientService.getAllPatients();

        model.addAttribute("patients", patients);

        return "mascotas";
    }

    // Vista de solo formulario. Necesita su propio GET (en vez de reusar el
    // de arriba) porque el botón "Registrar mascota" del listado tiene que
    // poder navegar a una URL propia, y porque el form necesita un
    // PatientRequestDto vacío en el modelo para que th:field pueda bindear.
    @GetMapping("/nueva")
    public String nuevo(Model model) {
        log.trace("Accediendo al formulario de alta de mascotas");

        if (!model.containsAttribute("patient")) {
            model.addAttribute("patient", new PatientRequestDto());
        }

        return "mascota-form";
    }

    @PostMapping("/create")
    public String create(@ModelAttribute("patient") PatientRequestDto patientDto,
                         Model model,
                         RedirectAttributes redirectAttributes) {

        PatientRequestDto createdPatient = patientService.createPatient(patientDto);

        // Si la API no pudo crear el paciente, volvemos al formulario (no al
        // listado) para que el usuario vea el error justo donde estaba.
        if (createdPatient == null) {
            redirectAttributes.addFlashAttribute("mensajeError", "No se pudo registrar la mascota.");
            return "redirect:/mascotas/nueva";
        }

        // El alta sí termina en el listado, para ver la mascota recién creada.
        redirectAttributes.addFlashAttribute("mensajeExito", "Mascota registrada correctamente.");
        return "redirect:/mascotas";

    }
}
