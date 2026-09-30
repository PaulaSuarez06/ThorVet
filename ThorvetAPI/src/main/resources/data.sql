INSERT INTO vets (license_number, full_name, email, active) VALUES
('VET-001', 'Laura Martinez', 'laura.martinez@thorvet.es', true),
('VET-002', 'Carlos Ruiz', 'carlos.ruiz@thorvet.es', true),
('VET-003', 'Sofia Fernandez', 'sofia.fernandez@thorvet.es', false);

INSERT INTO owners (full_name, dni, email, phone, address, active) VALUES
('Ana Garcia', '11111111A', 'ana.garcia@example.com', '600111222', 'Calle Mayor 1, Madrid', true),
('Pedro Lopez', '22222222B', 'pedro.lopez@example.com', '600333444', 'Avenida Sol 5, Valencia', true),
('Marta Sanchez', '33333333C', 'marta.sanchez@example.com', '600555666', 'Plaza Norte 3, Sevilla', true);

INSERT INTO patients (chip_number, name, species, breed, date_of_birth, weight_kg, owner_id, active) VALUES
('CHIP-0001', 'Toby', 'DOG', 'Labrador', '2020-05-10', 28.50, 1, true),
('CHIP-0002', 'Luna', 'CAT', 'Siames', '2021-08-22', 4.20, 2, true),
('CHIP-0003', 'Rex', 'DOG', 'Pastor Aleman', '2019-01-15', 32.00, 3, true);

INSERT INTO medical_services (id, code, name, base_price, active) VALUES
(1, 'CONS-GEN', 'Consulta general', 25.00, true),
(2, 'VAC-RAB', 'Vacuna antirrabica', 18.50, true),
(3, 'CIR-ESTER', 'Esterilizacion', 120.00, true);

ALTER TABLE medical_services ALTER COLUMN id RESTART WITH 4;
