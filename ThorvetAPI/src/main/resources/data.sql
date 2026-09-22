-- =========================================
-- ROLES
-- =========================================
INSERT INTO roles (name) VALUES
                             ('ROLE_ADMIN'),
                             ('ROLE_STAFF'),
                             ('ROLE_BILLING');

-- =========================================
-- USUARIOS (BCrypt)
-- admin -> admin | staff -> staff | billing -> billing
-- =========================================
INSERT INTO app_users (username, password, enabled)
VALUES ('admin',   '$2b$10$0rmFjxwapwDGRPzYn6l.cODL.VTsvQWiiPQNt.Tur56tLeGKtYqyC', true);

INSERT INTO app_users (username, password, enabled)
VALUES ('staff',   '$2b$10$iyWyRBiPQ8VU4cAez9xgBO4NV55fNSr7QCureJXEW34cYmrpVD7gi', true);

INSERT INTO app_users (username, password, enabled)
VALUES ('billing', '$2b$10$sCj.GyW0T.VARoUscDSnMuqa/4XqW9YB/62JrcNQ5SkVrzYWeggc6', true);

-- Asignación de roles
INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id FROM app_users u, roles r
WHERE u.username = 'admin'   AND r.name = 'ROLE_ADMIN';

INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id FROM app_users u, roles r
WHERE u.username = 'staff'   AND r.name = 'ROLE_STAFF';

INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id FROM app_users u, roles r
WHERE u.username = 'billing' AND r.name = 'ROLE_BILLING';


-- =========================================
-- OWNERS (Dueños/Propietarios) — 20 registros
-- =========================================
INSERT INTO owners (dni, full_name, email, phone, address, active) VALUES
                                                                       ('11111111A', 'Carlos García',      'carlos.garcia@demo.com',   '600100001', 'Calle Mayor 1, Madrid',         true),
                                                                       ('22222222B', 'Laura Martínez',     'laura.martinez@demo.com',  '600100002', 'Av. Libertad 5, Madrid',        true),
                                                                       ('33333333C', 'Pedro Sánchez',      'pedro.sanchez@demo.com',   '600100003', 'C/ Rosales 12, Madrid',         true),
                                                                       ('44444444D', 'Ana López',          'ana.lopez@demo.com',       '600100004', 'Calle Luna 3, Madrid',          true),
                                                                       ('55555555E', 'Miguel Torres',      'miguel.torres@demo.com',   '600100005', 'C/ Sol 7, Madrid',              true),
                                                                       ('66666666F', 'Sofía Romero',       'sofia.romero@demo.com',    '600100006', 'Av. Constitución 22, Madrid',   true),
                                                                       ('77777777G', 'Javier Navarro',     'javier.navarro@demo.com',  '600100007', 'C/ Estrella 9, Madrid',         true),
                                                                       ('88888888H', 'Isabel Moreno',      'isabel.moreno@demo.com',   '600100008', 'C/ Pinos 4, Madrid',            true),
                                                                       ('99999999I', 'David Jiménez',      'david.jimenez@demo.com',   '600100009', 'Calle Río 16, Madrid',          true),
                                                                       ('10101010J', 'Marta Ruiz',         'marta.ruiz@demo.com',      '600100010', 'C/ Mar 2, Madrid',              true),
                                                                       ('11121314K', 'Roberto Díaz',       'roberto.diaz@demo.com',    '600100011', 'Av. Parque 30, Madrid',         true),
                                                                       ('12131415L', 'Patricia Vega',      'patricia.vega@demo.com',   '600100012', 'C/ Olivos 8, Madrid',           true),
                                                                       ('13141516M', 'Álvaro Castro',      'alvaro.castro@demo.com',   '600100013', 'C/ Cedros 15, Madrid',          true),
                                                                       ('14151617N', 'Claudia Ortega',     'claudia.ortega@demo.com',  '600100014', 'C/ Magnolias 6, Madrid',        true),
                                                                       ('15161718O', 'Fernando Molina',    'fernando.molina@demo.com', '600100015', 'Av. Alameda 11, Madrid',        true),
                                                                       ('16171819P', 'Elena Cabrera',      'elena.cabrera@demo.com',   '600100016', 'C/ Abetos 20, Madrid',          true),
                                                                       ('17181920Q', 'Hugo Serrano',       'hugo.serrano@demo.com',    '600100017', 'C/ Robles 3, Madrid',           true),
                                                                       ('18192021R', 'Nuria Blanco',       'nuria.blanco@demo.com',    '600100018', 'C/ Castaños 14, Madrid',        true),
                                                                       ('19202122S', 'Andrés Prieto',      'andres.prieto@demo.com',   '600100019', 'C/ Cipreses 19, Madrid',        true),
                                                                       ('20212223T', 'Beatriz Santos',     'beatriz.santos@demo.com',  '600100020', 'Av. Primavera 27, Madrid',      false); -- inactivo para filtros


-- =========================================
-- PATIENTS → MASCOTAS (30 registros)
-- chip_number: identificador único (como el DNI del paciente original)
-- species: CANINE, FELINE, RABBIT, BIRD, EXOTIC
-- =========================================
INSERT INTO patients (chip_number, name, species, breed, date_of_birth, weight_kg, owner_id, active) VALUES
                                                                                                         ('900111000001','Rocky',    'CANINE',  'Labrador Retriever',    '2019-03-15', 28.5,
                                                                                                          (SELECT id FROM owners WHERE dni='11111111A'), true),
                                                                                                         ('900111000002','Luna',     'FELINE',  'Persa',                 '2020-07-22', 4.2,
                                                                                                          (SELECT id FROM owners WHERE dni='22222222B'), true),
                                                                                                         ('900111000003','Toby',     'CANINE',  'Bulldog Francés',       '2021-01-10', 11.0,
                                                                                                          (SELECT id FROM owners WHERE dni='33333333C'), true),
                                                                                                         ('900111000004','Mia',      'FELINE',  'Siamés',                '2018-11-05', 3.8,
                                                                                                          (SELECT id FROM owners WHERE dni='44444444D'), true),
                                                                                                         ('900111000005','Max',      'CANINE',  'Golden Retriever',      '2020-05-18', 31.2,
                                                                                                          (SELECT id FROM owners WHERE dni='55555555E'), true),
                                                                                                         ('900111000006','Bella',    'RABBIT',  'Enano Holandés',        '2022-02-14', 1.5,
                                                                                                          (SELECT id FROM owners WHERE dni='66666666F'), true),
                                                                                                         ('900111000007','Coco',     'CANINE',  'Chihuahua',             '2019-08-30', 2.1,
                                                                                                          (SELECT id FROM owners WHERE dni='77777777G'), true),
                                                                                                         ('900111000008','Nala',     'FELINE',  'Maine Coon',            '2021-04-27', 6.3,
                                                                                                          (SELECT id FROM owners WHERE dni='88888888H'), true),
                                                                                                         ('900111000009','Bruno',    'CANINE',  'Pastor Alemán',         '2018-09-14', 35.0,
                                                                                                          (SELECT id FROM owners WHERE dni='99999999I'), true),
                                                                                                         ('900111000010','Kira',     'CANINE',  'Border Collie',         '2022-03-09', 18.7,
                                                                                                          (SELECT id FROM owners WHERE dni='10101010J'), true),
                                                                                                         ('900111000011','Pipa',     'FELINE',  'Europeo Común',         '2020-12-23', 3.5,
                                                                                                          (SELECT id FROM owners WHERE dni='11121314K'), true),
                                                                                                         ('900111000012','Nico',     'CANINE',  'Beagle',                '2019-07-07', 13.4,
                                                                                                          (SELECT id FROM owners WHERE dni='12131415L'), true),
                                                                                                         ('900111000013','Lola',     'CANINE',  'Caniche',               '2021-06-19', 5.8,
                                                                                                          (SELECT id FROM owners WHERE dni='13141516M'), true),
                                                                                                         ('900111000014','Simba',    'FELINE',  'Bengalí',               '2020-01-28', 5.1,
                                                                                                          (SELECT id FROM owners WHERE dni='14151617N'), true),
                                                                                                         ('900111000015','Thor',     'CANINE',  'Husky Siberiano',       '2019-10-11', 27.6,
                                                                                                          (SELECT id FROM owners WHERE dni='15161718O'), true),
                                                                                                         ('900111000016','Mochi',    'RABBIT',  'Mini Lop',              '2022-08-03', 1.8,
                                                                                                          (SELECT id FROM owners WHERE dni='16171819P'), true),
                                                                                                         ('900111000017','Nemo',     'BIRD',    'Loro Gris Africano',    '2018-05-16', 0.4,
                                                                                                          (SELECT id FROM owners WHERE dni='17181920Q'), true),
                                                                                                         ('900111000018','Gizmo',    'CANINE',  'Shih Tzu',              '2021-02-02', 6.9,
                                                                                                          (SELECT id FROM owners WHERE dni='18192021R'), true),
                                                                                                         ('900111000019','Musa',     'FELINE',  'Ragdoll',               '2020-09-08', 7.2,
                                                                                                          (SELECT id FROM owners WHERE dni='19202122S'), true),
                                                                                                         ('900111000020','Rex',      'CANINE',  'Rottweiler',            '2018-04-04', 42.0,
                                                                                                          (SELECT id FROM owners WHERE dni='20212223T'), true),
                                                                                                         -- Dueños con más de una mascota
                                                                                                         ('900111000021','Daisy',    'CANINE',  'Dachshund',             '2021-11-20', 8.3,
                                                                                                          (SELECT id FROM owners WHERE dni='11111111A'), true),
                                                                                                         ('900111000022','Oliver',   'FELINE',  'British Shorthair',     '2022-06-06', 5.5,
                                                                                                          (SELECT id FROM owners WHERE dni='22222222B'), true),
                                                                                                         ('900111000023','Buddy',    'CANINE',  'Cocker Spaniel',        '2019-12-12', 14.2,
                                                                                                          (SELECT id FROM owners WHERE dni='33333333C'), true),
                                                                                                         ('900111000024','Milo',     'RABBIT',  'Angora',                '2023-01-15', 2.2,
                                                                                                          (SELECT id FROM owners WHERE dni='44444444D'), true),
                                                                                                         ('900111000025','Zoe',      'CANINE',  'Pomerania',             '2022-03-22', 3.1,
                                                                                                          (SELECT id FROM owners WHERE dni='55555555E'), true),
                                                                                                         ('900111000026','Sasha',    'FELINE',  'Azul Ruso',             '2021-07-07', 4.0,
                                                                                                          (SELECT id FROM owners WHERE dni='66666666F'), true),
                                                                                                         ('900111000027','Charlie',  'CANINE',  'Yorkshire Terrier',     '2020-08-18', 3.3,
                                                                                                          (SELECT id FROM owners WHERE dni='77777777G'), true),
                                                                                                         ('900111000028','Kitty',    'BIRD',    'Canario',               '2021-04-10', 0.02,
                                                                                                          (SELECT id FROM owners WHERE dni='88888888H'), true),
                                                                                                         ('900111000029','Zeus',     'CANINE',  'Dogo Argentino',        '2019-05-25', 45.0,
                                                                                                          (SELECT id FROM owners WHERE dni='99999999I'), true),
                                                                                                         ('900111000030','Pelusa',   'FELINE',  'Persa',                 '2023-02-01', 3.9,
                                                                                                          (SELECT id FROM owners WHERE dni='10101010J'), false); -- inactiva para filtros


-- =========================================
-- DOCTORS → VETERINARIOS (6 registros)
-- =========================================
INSERT INTO vets (license_number, full_name, email, active) VALUES
                                                                ('VET-100', 'Dra. Marta López',    'marta@vetclinic.com',     true),
                                                                ('VET-200', 'Dr. Juan Ruiz',       'juan@vetclinic.com',      true),
                                                                ('VET-300', 'Dra. Sofía Vega',     'sofia@vetclinic.com',     true),
                                                                ('VET-400', 'Dr. Pablo Santos',    'pablo@vetclinic.com',     true),
                                                                ('VET-500', 'Dra. Irene Cano',     'irene@vetclinic.com',     true),
                                                                ('VET-600', 'Dr. Marcos Díaz',     'marcos@vetclinic.com',    false); -- inactivo


-- =========================================
-- VET SPECIALTIES
-- =========================================
INSERT INTO vet_specialties (vet_id, specialty, level, active, since_date, consultation_fee_override) VALUES
                                                                                                          (1, 'DERMATOLOGY',       'SENIOR',     true,  '2020-01-01', null),
                                                                                                          (1, 'GENERAL_MEDICINE',  'CONSULTANT', true,  '2017-05-01', 55.00),
                                                                                                          (2, 'GENERAL_MEDICINE',  'CONSULTANT', true,  '2018-01-01', null),
                                                                                                          (3, 'CARDIOLOGY',        'SENIOR',     true,  '2016-09-15', 130.00),
                                                                                                          (3, 'GENERAL_MEDICINE',  'JUNIOR',     true,  '2022-02-01', null),
                                                                                                          (4, 'EXOTIC_ANIMALS',    'CONSULTANT', true,  '2019-03-10', null),
                                                                                                          (5, 'NUTRITION',         'SENIOR',     true,  '2015-06-20', 70.00),
                                                                                                          (6, 'GENERAL_MEDICINE',  'JUNIOR',     false, '2023-01-01', null);


-- =========================================
-- MEDICAL SERVICES → SERVICIOS VETERINARIOS
-- =========================================
INSERT INTO medical_services (code, name, base_price, active) VALUES
                                                                  ('CONS-GEN',   'Consulta general',          50.00,  true),
                                                                  ('DERM-REV',   'Revisión dermatológica',     80.00,  true),
                                                                  ('CARD-ECG',   'ECG / Cardiología',         120.00,  true),
                                                                  ('VAC-MULTI',  'Vacunación múltiple',        45.00,  true),
                                                                  ('VAC-RABIA',  'Vacuna antirrábica',         30.00,  true),
                                                                  ('DESPAR',     'Desparasitación',            25.00,  true),
                                                                  ('CIRUG-MEN',  'Cirugía menor',            200.00,  true),
                                                                  ('NUTRI-PLAN', 'Plan nutricional',           60.00,  true),
                                                                  ('RADIO',      'Radiografía',               90.00,  true),
                                                                  ('LAB-BAS',    'Analítica básica',           70.00,  true);


-- =========================================
-- APPOINTMENTS → CITAS (80 aprox.)
-- Enero 2026 — varios estados y horarios
-- patient_id: 1..30 | vet_id: 1..6
-- =========================================
INSERT INTO appointments (patient_id, vet_id, start_at, end_at, minutes, status, reason, cancellation_reason) VALUES
-- Semana 1
(1,  2, '2026-01-05T09:00:00','2026-01-05T09:30:00', 30, 'COMPLETED', 'Revisión general',      null),
(2,  1, '2026-01-05T10:00:00','2026-01-05T10:30:00', 30, 'CANCELLED', 'Dermatitis',             'Dueño no puede asistir'),
(3,  2, '2026-01-05T11:00:00','2026-01-05T11:30:00', 30, 'SCHEDULED', 'Chequeo anual',          null),
(4,  3, '2026-01-06T09:00:00','2026-01-06T09:45:00', 45, 'COMPLETED', 'Soplo cardíaco',         null),
(5,  4, '2026-01-06T10:00:00','2026-01-06T10:30:00', 30, 'NO_SHOW',   'Control exóticos',       null),
(6,  5, '2026-01-06T11:00:00','2026-01-06T11:30:00', 30, 'COMPLETED', 'Plan nutricional',       null),

-- Semana 2
(7,  2, '2026-01-12T09:00:00','2026-01-12T09:30:00', 30, 'COMPLETED', 'Revisión',               null),
(8,  1, '2026-01-12T10:00:00','2026-01-12T10:30:00', 30, 'COMPLETED', 'Dermatitis crónica',     null),
(9,  3, '2026-01-12T11:00:00','2026-01-12T11:30:00', 30, 'SCHEDULED', 'ECG rutina',             null),
(10, 4, '2026-01-13T09:00:00','2026-01-13T09:30:00', 30, 'CANCELLED', 'Revisión loro',          'Reprograma'),
(11, 5, '2026-01-13T10:00:00','2026-01-13T10:30:00', 30, 'COMPLETED', 'Dieta obesidad',         null),
(12, 2, '2026-01-13T11:00:00','2026-01-13T11:30:00', 30, 'NO_SHOW',   'Chequeo',                null),

-- Semana 3
(13, 2, '2026-01-19T09:00:00','2026-01-19T09:30:00', 30, 'COMPLETED', 'Consulta general',       null),
(14, 2, '2026-01-19T09:30:00','2026-01-19T10:00:00', 30, 'COMPLETED', 'Consulta general',       null),
(15, 2, '2026-01-19T10:00:00','2026-01-19T10:30:00', 30, 'SCHEDULED', 'Chequeo',                null),
(16, 1, '2026-01-19T11:00:00','2026-01-19T11:30:00', 30, 'COMPLETED', 'Dermatitis',             null),
(17, 1, '2026-01-20T09:00:00','2026-01-20T09:30:00', 30, 'CANCELLED', 'Mancha piel',            'No puede asistir'),
(18, 3, '2026-01-20T10:00:00','2026-01-20T10:45:00', 45, 'COMPLETED', 'Dolor torácico',         null),
(19, 3, '2026-01-20T11:00:00','2026-01-20T11:30:00', 30, 'SCHEDULED', 'ECG seguimiento',        null),
(20, 4, '2026-01-21T09:00:00','2026-01-21T09:30:00', 30, 'COMPLETED', 'Control exóticos',       null),
(21, 4, '2026-01-21T10:00:00','2026-01-21T10:30:00', 30, 'NO_SHOW',   'Vacunación loro',        null),
(22, 5, '2026-01-21T11:00:00','2026-01-21T11:30:00', 30, 'COMPLETED', 'Nutrición felino',       null),

-- Semana 4 (pacientes recurrentes)
(1,  2, '2026-01-26T09:00:00','2026-01-26T09:30:00', 30, 'COMPLETED', 'Seguimiento',            null),
(1,  2, '2026-01-27T09:00:00','2026-01-27T09:30:00', 30, 'COMPLETED', 'Revisión general',       null),
(1,  2, '2026-01-28T09:00:00','2026-01-28T09:30:00', 30, 'CANCELLED', 'Revisión',               'Trabajo'),
(2,  1, '2026-01-26T10:00:00','2026-01-26T10:30:00', 30, 'COMPLETED', 'Dermatitis',             null),
(2,  1, '2026-01-28T10:00:00','2026-01-28T10:30:00', 30, 'SCHEDULED', 'Control piel',           null),
(3,  3, '2026-01-26T11:00:00','2026-01-26T11:45:00', 45, 'COMPLETED', 'ECG',                    null),
(4,  4, '2026-01-27T10:00:00','2026-01-27T10:30:00', 30, 'COMPLETED', 'Revisión felino',        null),
(5,  5, '2026-01-28T11:00:00','2026-01-28T11:30:00', 30, 'COMPLETED', 'Dieta seguimiento',      null),
(6,  2, '2026-01-29T09:00:00','2026-01-29T09:30:00', 30, 'SCHEDULED', 'Chequeo conejo',         null),
(7,  2, '2026-01-29T10:00:00','2026-01-29T10:30:00', 30, 'NO_SHOW',   'Chequeo canino',         null),

-- Lote extra paginación
(8,  2, '2026-01-07T09:00:00','2026-01-07T09:30:00', 30, 'COMPLETED', 'Consulta general',       null),
(9,  2, '2026-01-07T10:00:00','2026-01-07T10:30:00', 30, 'COMPLETED', 'Consulta general',       null),
(10, 2, '2026-01-07T11:00:00','2026-01-07T11:30:00', 30, 'CANCELLED', 'Consulta general',       'Reprograma'),
(11, 2, '2026-01-08T09:00:00','2026-01-08T09:30:00', 30, 'COMPLETED', 'Consulta general',       null),
(12, 2, '2026-01-08T10:00:00','2026-01-08T10:30:00', 30, 'SCHEDULED', 'Consulta general',       null),
(13, 2, '2026-01-08T11:00:00','2026-01-08T11:30:00', 30, 'NO_SHOW',   'Consulta general',       null),
(14, 2, '2026-01-09T09:00:00','2026-01-09T09:30:00', 30, 'COMPLETED', 'Consulta general',       null),
(15, 2, '2026-01-09T10:00:00','2026-01-09T10:30:00', 30, 'COMPLETED', 'Consulta general',       null),
(16, 2, '2026-01-09T11:00:00','2026-01-09T11:30:00', 30, 'SCHEDULED', 'Consulta general',       null),

(17, 1, '2026-01-14T09:00:00','2026-01-14T09:30:00', 30, 'COMPLETED', 'Piel / alergia',         null),
(18, 1, '2026-01-14T10:00:00','2026-01-14T10:30:00', 30, 'COMPLETED', 'Piel / alergia',         null),
(19, 1, '2026-01-14T11:00:00','2026-01-14T11:30:00', 30, 'CANCELLED', 'Piel / alergia',         'Viaje'),
(20, 3, '2026-01-15T09:00:00','2026-01-15T09:45:00', 45, 'COMPLETED', 'Cardio felino',          null),
(21, 3, '2026-01-15T10:00:00','2026-01-15T10:45:00', 45, 'SCHEDULED', 'Cardio canino',          null),
(22, 3, '2026-01-15T11:00:00','2026-01-15T11:45:00', 45, 'NO_SHOW',   'Cardio felino',          null),

(23, 4, '2026-01-16T09:00:00','2026-01-16T09:30:00', 30, 'COMPLETED', 'Vacunación conejo',      null),
(24, 4, '2026-01-16T10:00:00','2026-01-16T10:30:00', 30, 'COMPLETED', 'Vacunación conejo',      null),
(25, 4, '2026-01-16T11:00:00','2026-01-16T11:30:00', 30, 'CANCELLED', 'Vacunación',             'Mascota mejoró'),

(26, 5, '2026-01-17T09:00:00','2026-01-17T09:30:00', 30, 'COMPLETED', 'Nutrición canina',       null),
(27, 5, '2026-01-17T10:00:00','2026-01-17T10:30:00', 30, 'SCHEDULED', 'Nutrición felina',       null),
(28, 5, '2026-01-17T11:00:00','2026-01-17T11:30:00', 30, 'NO_SHOW',   'Nutrición',              null),

(29, 2, '2026-01-30T09:00:00','2026-01-30T09:30:00', 30, 'COMPLETED', 'Consulta general',       null),
(30, 2, '2026-01-30T10:00:00','2026-01-30T10:30:00', 30, 'SCHEDULED', 'Consulta general',       null);


-- =========================================
-- INVOICES — citas COMPLETED
-- =========================================
INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'ISSUED', 50.00, 10.50, 60.50, '2026-01-05T12:00:00', null, null
FROM appointments a WHERE a.start_at = '2026-01-05T09:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'PAID', 120.00, 25.20, 145.20, '2026-01-06T13:00:00', '2026-01-06T13:10:00', 'CARD'
FROM appointments a WHERE a.start_at = '2026-01-06T09:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'ISSUED', 80.00, 16.80, 96.80, '2026-01-12T12:30:00', null, null
FROM appointments a WHERE a.start_at = '2026-01-12T10:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'PAID', 60.00, 12.60, 72.60, '2026-01-13T12:00:00', '2026-01-13T12:05:00', 'CASH'
FROM appointments a WHERE a.start_at = '2026-01-13T10:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'ISSUED', 50.00, 10.50, 60.50, '2026-01-19T12:00:00', null, null
FROM appointments a WHERE a.start_at = '2026-01-19T09:00:00';

-- =========================================
-- INVOICE LINES
-- =========================================
INSERT INTO invoice_lines (invoice_id, service_id, quantity, unit_price, vat_rate, discount_type, discount_value, line_total)
SELECT i.id, s.id, 1, 50.00, 'VAT_21', 'NONE', null, 60.50
FROM invoices i JOIN appointments a ON a.id = i.appointment_id
                JOIN medical_services s ON s.code = 'CONS-GEN'
WHERE a.start_at = '2026-01-05T09:00:00';

INSERT INTO invoice_lines (invoice_id, service_id, quantity, unit_price, vat_rate, discount_type, discount_value, line_total)
SELECT i.id, s.id, 1, 120.00, 'VAT_21', 'NONE', null, 145.20
FROM invoices i JOIN appointments a ON a.id = i.appointment_id
                JOIN medical_services s ON s.code = 'CARD-ECG'
WHERE a.start_at = '2026-01-06T09:00:00';

INSERT INTO invoice_lines (invoice_id, service_id, quantity, unit_price, vat_rate, discount_type, discount_value, line_total)
SELECT i.id, s.id, 1, 80.00, 'VAT_21', 'NONE', null, 96.80
FROM invoices i JOIN appointments a ON a.id = i.appointment_id
                JOIN medical_services s ON s.code = 'DERM-REV'
WHERE a.start_at = '2026-01-12T10:00:00';

INSERT INTO invoice_lines (invoice_id, service_id, quantity, unit_price, vat_rate, discount_type, discount_value, line_total)
SELECT i.id, s.id, 1, 60.00, 'VAT_21', 'NONE', null, 72.60
FROM invoices i JOIN appointments a ON a.id = i.appointment_id
                JOIN medical_services s ON s.code = 'NUTRI-PLAN'
WHERE a.start_at = '2026-01-13T10:00:00';

INSERT INTO invoice_lines (invoice_id, service_id, quantity, unit_price, vat_rate, discount_type, discount_value, line_total)
SELECT i.id, s.id, 1, 50.00, 'VAT_21', 'NONE', null, 60.50
FROM invoices i JOIN appointments a ON a.id = i.appointment_id
                JOIN medical_services s ON s.code = 'CONS-GEN'
WHERE a.start_at = '2026-01-19T09:00:00';


-- =========================================
-- EXTRA INVOICES (para /top-services)
-- =========================================

-- CONS-GEN
INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'PAID', 50.00, 10.50, 60.50, '2026-01-07T12:00:00', '2026-01-07T12:05:00', 'CARD'
FROM appointments a WHERE a.start_at = '2026-01-07T09:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'ISSUED', 50.00, 10.50, 60.50, '2026-01-07T13:00:00', null, null
FROM appointments a WHERE a.start_at = '2026-01-07T10:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'PAID', 50.00, 10.50, 60.50, '2026-01-08T12:00:00', '2026-01-08T12:10:00', 'CASH'
FROM appointments a WHERE a.start_at = '2026-01-08T09:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'ISSUED', 50.00, 10.50, 60.50, '2026-01-09T12:00:00', null, null
FROM appointments a WHERE a.start_at = '2026-01-09T09:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'PAID', 50.00, 10.50, 60.50, '2026-01-09T13:00:00', '2026-01-09T13:02:00', 'CARD'
FROM appointments a WHERE a.start_at = '2026-01-09T10:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'PAID', 50.00, 10.50, 60.50, '2026-01-12T12:00:00', '2026-01-12T12:03:00', 'CARD'
FROM appointments a WHERE a.start_at = '2026-01-12T09:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'ISSUED', 50.00, 10.50, 60.50, '2026-01-19T12:10:00', null, null
FROM appointments a WHERE a.start_at = '2026-01-19T09:30:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'PAID', 50.00, 10.50, 60.50, '2026-01-26T12:00:00', '2026-01-26T12:05:00', 'CASH'
FROM appointments a WHERE a.start_at = '2026-01-26T09:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'PAID', 50.00, 10.50, 60.50, '2026-01-27T12:00:00', '2026-01-27T12:08:00', 'CARD'
FROM appointments a WHERE a.start_at = '2026-01-27T09:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'ISSUED', 50.00, 10.50, 60.50, '2026-01-30T12:00:00', null, null
FROM appointments a WHERE a.start_at = '2026-01-30T09:00:00';

-- DERM-REV
INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'PAID', 80.00, 16.80, 96.80, '2026-01-14T12:00:00', '2026-01-14T12:06:00', 'CARD'
FROM appointments a WHERE a.start_at = '2026-01-14T09:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'ISSUED', 80.00, 16.80, 96.80, '2026-01-14T13:00:00', null, null
FROM appointments a WHERE a.start_at = '2026-01-14T10:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'PAID', 80.00, 16.80, 96.80, '2026-01-19T13:00:00', '2026-01-19T13:04:00', 'CASH'
FROM appointments a WHERE a.start_at = '2026-01-19T11:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'PAID', 80.00, 16.80, 96.80, '2026-01-26T13:00:00', '2026-01-26T13:07:00', 'CARD'
FROM appointments a WHERE a.start_at = '2026-01-26T10:00:00';

-- CARD-ECG
INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'PAID', 120.00, 25.20, 145.20, '2026-01-15T12:00:00', '2026-01-15T12:02:00', 'CARD'
FROM appointments a WHERE a.start_at = '2026-01-15T09:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'ISSUED', 120.00, 25.20, 145.20, '2026-01-20T12:00:00', null, null
FROM appointments a WHERE a.start_at = '2026-01-20T10:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'PAID', 120.00, 25.20, 145.20, '2026-01-26T13:30:00', '2026-01-26T13:35:00', 'CASH'
FROM appointments a WHERE a.start_at = '2026-01-26T11:00:00';

-- NUTRI-PLAN
INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'ISSUED', 60.00, 12.60, 72.60, '2026-01-06T12:10:00', null, null
FROM appointments a WHERE a.start_at = '2026-01-06T11:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'PAID', 60.00, 12.60, 72.60, '2026-01-17T12:00:00', '2026-01-17T12:03:00', 'CARD'
FROM appointments a WHERE a.start_at = '2026-01-17T09:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'PAID', 60.00, 12.60, 72.60, '2026-01-21T12:00:00', '2026-01-21T12:06:00', 'CASH'
FROM appointments a WHERE a.start_at = '2026-01-21T11:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'ISSUED', 60.00, 12.60, 72.60, '2026-01-28T12:00:00', null, null
FROM appointments a WHERE a.start_at = '2026-01-28T11:00:00';

-- VAC-MULTI + DESPAR en la MISMA factura (2 líneas) subtotal=45+25=70; IVA=14.70; total=84.70
INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'PAID', 70.00, 14.70, 84.70, '2026-01-16T12:00:00', '2026-01-16T12:05:00', 'CARD'
FROM appointments a WHERE a.start_at = '2026-01-16T09:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'ISSUED', 70.00, 14.70, 84.70, '2026-01-16T13:00:00', null, null
FROM appointments a WHERE a.start_at = '2026-01-16T10:00:00';

INSERT INTO invoices (appointment_id, status, subtotal, tax_total, total, issued_at, paid_at, payment_method)
SELECT a.id, 'PAID', 70.00, 14.70, 84.70, '2026-01-21T12:30:00', '2026-01-21T12:35:00', 'CASH'
FROM appointments a WHERE a.start_at = '2026-01-21T09:00:00';


-- =========================================
-- EXTRA INVOICE LINES
-- =========================================

-- CONS-GEN
INSERT INTO invoice_lines (invoice_id, service_id, quantity, unit_price, vat_rate, discount_type, discount_value, line_total)
SELECT i.id, s.id, 1, 50.00, 'VAT_21', 'NONE', null, 60.50
FROM invoices i JOIN appointments a ON a.id = i.appointment_id
                JOIN medical_services s ON s.code = 'CONS-GEN'
WHERE a.start_at IN (
                     '2026-01-07T09:00:00','2026-01-07T10:00:00','2026-01-08T09:00:00',
                     '2026-01-09T09:00:00','2026-01-09T10:00:00','2026-01-12T09:00:00',
                     '2026-01-19T09:30:00','2026-01-26T09:00:00','2026-01-27T09:00:00',
                     '2026-01-30T09:00:00'
    );

-- DERM-REV
INSERT INTO invoice_lines (invoice_id, service_id, quantity, unit_price, vat_rate, discount_type, discount_value, line_total)
SELECT i.id, s.id, 1, 80.00, 'VAT_21', 'NONE', null, 96.80
FROM invoices i JOIN appointments a ON a.id = i.appointment_id
                JOIN medical_services s ON s.code = 'DERM-REV'
WHERE a.start_at IN (
                     '2026-01-14T09:00:00','2026-01-14T10:00:00',
                     '2026-01-19T11:00:00','2026-01-26T10:00:00'
    );

-- CARD-ECG
INSERT INTO invoice_lines (invoice_id, service_id, quantity, unit_price, vat_rate, discount_type, discount_value, line_total)
SELECT i.id, s.id, 1, 120.00, 'VAT_21', 'NONE', null, 145.20
FROM invoices i JOIN appointments a ON a.id = i.appointment_id
                JOIN medical_services s ON s.code = 'CARD-ECG'
WHERE a.start_at IN (
                     '2026-01-15T09:00:00','2026-01-20T10:00:00','2026-01-26T11:00:00'
    );

-- NUTRI-PLAN
INSERT INTO invoice_lines (invoice_id, service_id, quantity, unit_price, vat_rate, discount_type, discount_value, line_total)
SELECT i.id, s.id, 1, 60.00, 'VAT_21', 'NONE', null, 72.60
FROM invoices i JOIN appointments a ON a.id = i.appointment_id
                JOIN medical_services s ON s.code = 'NUTRI-PLAN'
WHERE a.start_at IN (
                     '2026-01-06T11:00:00','2026-01-17T09:00:00',
                     '2026-01-21T11:00:00','2026-01-28T11:00:00'
    );

-- VAC-MULTI (facturas multi-línea)
INSERT INTO invoice_lines (invoice_id, service_id, quantity, unit_price, vat_rate, discount_type, discount_value, line_total)
SELECT i.id, s.id, 1, 45.00, 'VAT_21', 'NONE', null, 54.45
FROM invoices i JOIN appointments a ON a.id = i.appointment_id
                JOIN medical_services s ON s.code = 'VAC-MULTI'
WHERE a.start_at IN (
                     '2026-01-16T09:00:00','2026-01-16T10:00:00','2026-01-21T09:00:00'
    );

-- DESPAR (mismas facturas multi-línea)
INSERT INTO invoice_lines (invoice_id, service_id, quantity, unit_price, vat_rate, discount_type, discount_value, line_total)
SELECT i.id, s.id, 1, 25.00, 'VAT_21', 'NONE', null, 30.25
FROM invoices i JOIN appointments a ON a.id = i.appointment_id
                JOIN medical_services s ON s.code = 'DESPAR'
WHERE a.start_at IN (
                     '2026-01-16T09:00:00','2026-01-16T10:00:00','2026-01-21T09:00:00'
    );


-- =========================================
-- CITA EXTRA sin factura (para POST /appointments/{id}/invoice)
-- =========================================
INSERT INTO appointments (patient_id, vet_id, start_at, end_at, minutes, status, reason, cancellation_reason)
VALUES (1, 2, '2026-02-02T09:00:00', '2026-02-02T09:30:00', 30, 'COMPLETED', 'Cita extra para facturación', null);