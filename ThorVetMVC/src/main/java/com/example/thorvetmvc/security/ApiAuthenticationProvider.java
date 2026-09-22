package com.example.thorvetmvc.security;

import com.example.thorvetmvc.dto.AuthRequestDto;
import com.example.thorvetmvc.dto.AuthResponseDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.WebClientResponseException;

import java.util.List;

@Component
@RequiredArgsConstructor
@Slf4j
public class ApiAuthenticationProvider implements AuthenticationProvider {

    private final WebClient webClient;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = authentication.getName();
        String password = authentication.getCredentials().toString();

        try {
            AuthResponseDto response = webClient.post()
                    .uri("/auth/login")
                    .bodyValue(new AuthRequestDto(username, password))
                    .retrieve()
                    .bodyToMono(AuthResponseDto.class)
                    .block();

            if (response == null || response.getToken() == null) {
                throw new BadCredentialsException("La API no ha devuelto un token válido");
            }

            log.trace("Login correcto en la API para el usuario {}", username);
            return new UsernamePasswordAuthenticationToken(
                    username,
                    response.getToken(),
                    List.of(new SimpleGrantedAuthority("ROLE_USER")));

        } catch (WebClientResponseException.Unauthorized | WebClientResponseException.Forbidden e) {
            throw new BadCredentialsException("Usuario o contraseña incorrectos");
        } catch (WebClientResponseException e) {
            log.error("Error inesperado llamando a la API de login: {}", e.getStatusCode());
            throw new BadCredentialsException("No se ha podido validar el usuario");
        }
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
    }
}
