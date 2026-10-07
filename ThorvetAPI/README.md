# ThorVet API

API REST para la gestión de una clínica veterinaria. Permite administrar propietarios, mascotas (pacientes), veterinarios y servicios médicos, con autenticación mediante JWT y persistencia en PostgreSQL.

## Tecnologías

- Java 17 o superior
- Spring Boot 4.0.3
- Spring Data JPA (Hibernate)
- Spring Security + JWT (jjwt 0.12.6)
- PostgreSQL
- MapStruct y Lombok
- Maven (incluye el wrapper `mvnw`)
- Docker (Dockerfile incluido)

## Requisitos previos

- JDK 17 o superior
- PostgreSQL instalado y en marcha (puerto 5432 por defecto)
- Un cliente SQL como pgAdmin, y Postman para probar la API (opcional)

## Configuración de la base de datos

1. Crea la base de datos:

   ```sql
   CREATE DATABASE thorvet;
   ```

2. Conéctate a `thorvet` y ejecuta, **una sola vez y en este orden**, los scripts del proyecto:

    1. `schema.sql`: crea todas las tablas. Incluye `DROP TABLE IF EXISTS`, así que **borra los datos** si se vuelve a ejecutar.
    2. `data.sql`: carga datos de ejemplo (propietarios, mascotas, veterinarios y servicios).

3. Configura la conexión en `src/main/resources/application.properties`:

   ```properties
   spring.datasource.url=jdbc:postgresql://localhost:5432/thorvet
   spring.datasource.username=${DB_USER}
   spring.datasource.password=${DB_PASSWORD}

   spring.jpa.hibernate.ddl-auto=validate
   spring.sql.init.mode=never
   ```

   Con `ddl-auto=validate`, Hibernate solo comprueba que las tablas coincidan con las entidades; no las crea ni las modifica. Con `spring.sql.init.mode=never`, Spring no vuelve a ejecutar los scripts SQL al arrancar.

## Variables de entorno

| Variable | Descripción | Obligatoria |
|---|---|---|
| `DB_USER` | Usuario de PostgreSQL (por ejemplo, `postgres`) | Sí |
| `DB_PASSWORD` | Contraseña del usuario de PostgreSQL | Sí |
| `JWT_SECRET` | Clave secreta para firmar los tokens JWT | No (hay un valor por defecto solo para desarrollo) |
| `JWT_EXPIRATION` | Duración del token en horas (por defecto, 2) | No |

En IntelliJ se pueden definir en *Run → Edit Configurations → Environment variables*, con el formato `DB_USER=postgres;DB_PASSWORD=tu_contraseña`.


## Ejecución

Desde la carpeta `ThorvetAPI`:

```bash
./mvnw spring-boot:run
```

En Windows:

```bash
mvnw.cmd spring-boot:run
```

La API arranca en `http://localhost:8083`.

## Autenticación

La API usa JWT. El flujo es:

1. Registra un usuario con `POST /auth/register` (devuelve un token).
2. Si ya tienes usuario, obtén un token con `POST /auth/login`.
3. Envía el token en las peticiones protegidas con la cabecera:

   ```
   Authorization: Bearer <token>
   ```

Ejemplo de cuerpo para registro y login:

```json
{
  "username": "usuario",
  "password": "contraseña"
}
```

Reglas de acceso:

- `/auth/**`: público.
- Peticiones `GET`: públicas.
- El resto de peticiones (`POST`, `PUT`, `DELETE`...): requieren token.

## Endpoints

| Método | Ruta | Descripción |
|---|---|---|
| POST | `/auth/register` | Registra un usuario y devuelve un token |
| POST | `/auth/login` | Inicia sesión y devuelve un token |
| GET | `/api/owner` | Lista los propietarios |
| GET | `/api/owner/{id}` | Obtiene un propietario por id |
| POST | `/api/owner` | Crea un propietario |
| DELETE | `/api/owner/{id}` | Elimina un propietario |
| GET | `/api/patient` | Lista las mascotas |
| GET | `/api/patient/{name}` | Busca una mascota por nombre |
| POST | `/api/patient` | Crea una mascota |
| DELETE | `/api/patient/{id}` | Elimina una mascota |
| GET | `/api/vet` | Lista los veterinarios |
| POST | `/api/vet` | Crea un veterinario |
| DELETE | `/api/vet/{id}` | Elimina un veterinario |
| GET | `/api/services` | Lista los servicios médicos |

## Modelo de datos

Tablas principales:

- `owners`: propietarios.
- `patients`: mascotas, cada una asociada a un propietario.
- `vets`: veterinarios.
- `medical_services`: servicios y precios base.
- `app_users`, `roles`, `user_roles`: usuarios de la API y sus roles.

El esquema SQL también define las tablas `vet_specialties`, `appointments`, `invoices` e `invoice_lines`, que están previstas para futuras funcionalidades (especialidades, citas y facturación) y aún no tienen entidades ni endpoints en la API.

## Docker

El proyecto incluye un `Dockerfile` multietapa que compila la API con Maven y la ejecuta con un JRE ligero. El puerto se puede cambiar con la variable `PORT` (por defecto, 8083).

## Autoría

Proyecto desarrollado por PaulaSuarez06.