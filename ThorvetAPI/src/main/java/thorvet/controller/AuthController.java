package thorvet.controller;


import thorvet.dto.auth.AuthRequest;
import thorvet.dto.auth.AuthResponse;
import thorvet.dto.auth.RegisterRequest;
import thorvet.entity.AppUser;
import thorvet.entity.Role;
import thorvet.repository.AppUserRepository;
import thorvet.repository.RoleRepository;
import thorvet.service.config.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashSet;
import java.util.Set;


@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final JwtService jwtService;
    private final AppUserRepository appUserRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;

    @PostMapping("/login")
    public ResponseEntity<AuthResponse> login(@RequestBody AuthRequest request){
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword())
        );

        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        String token = jwtService.generateToken(userDetails);

        return ResponseEntity.ok(new AuthResponse(token) );

    }

    // Registro de usuario: crea el AppUser en BD (persistido, no en memoria)
    // y le asigna el rol por defecto ROLE_USER.
    @PostMapping("/register")
    public ResponseEntity<AuthResponse> register(@RequestBody RegisterRequest request){
        // Evitamos duplicados: si el username ya existe, devolvemos 409 Conflict
        if (appUserRepository.findByUsername(request.getUsername()).isPresent()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }

        // El rol se busca o se crea si es la primera vez que se registra alguien
        Role userRole = roleRepository.findByName("ROLE_USER")
                .orElseGet(() -> roleRepository.save(new Role(null, "ROLE_USER", new HashSet<>())));

        AppUser user = new AppUser();
        user.setUsername(request.getUsername());
        // La contraseña NUNCA se guarda en texto plano: se cifra con BCrypt
        // (el mismo PasswordEncoder que usa el AuthenticationProvider para comparar en el login)
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setEnabled(true);
        user.setRoles(Set.of(userRole));

        appUserRepository.save(user);

        // Tras registrar, generamos directamente el token para no obligar a loguearse aparte
        String token = jwtService.generateToken(user);

        return ResponseEntity.status(HttpStatus.CREATED).body(new AuthResponse(token));
    }

}
