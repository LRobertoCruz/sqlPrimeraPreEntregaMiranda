-- Se crea la base de datos para el curso
CREATE DATABASE afectt;

-- Se selecciona la base de datos con la que se va a trabajar
USE afectt;

-- Creamos las tablas

-- Creación de la tabla de Profesores
CREATE TABLE profesores (
    pro_id INTEGER PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador único del profesor',
    pro_dni VARCHAR(10) UNIQUE COMMENT 'Número de identificación único del profesor',
    pro_nombre VARCHAR(120) COMMENT 'Nombre del profesor',
    pro_apellido VARCHAR(120) COMMENT 'Apellido del profesor',
    pro_sexo CHAR(1) COMMENT 'Sexo del profesor',
    pro_fecha_nacimiento DATE COMMENT 'Fecha de nacimiento del profesor',
    pro_telefono VARCHAR(20) COMMENT 'Número de teléfono del profesor',
    pro_email VARCHAR(60) COMMENT 'Dirección de correo electrónico del profesor'
);

-- Creación de la tabla de Alumnos
CREATE TABLE alumnos (
    alu_id INTEGER PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador único del alumno',
    alu_dni VARCHAR(10) UNIQUE COMMENT 'Número de identificación único del alumno',
    alu_nombre VARCHAR(120) COMMENT 'Nombre del alumno',
    alu_apellido VARCHAR(120) COMMENT 'Apellido del alumno',
    alu_sexo CHAR(1) COMMENT 'Sexo del alumno',
    alu_telefono VARCHAR(20) COMMENT 'Número de teléfono del alumno',
    alu_email VARCHAR(60) COMMENT 'Dirección de correo electrónico del alumno'
);

-- Creación de la tabla de Cursos
CREATE TABLE cursos (
    cur_id INTEGER PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador único del curso',
    cur_nombre VARCHAR(100) COMMENT 'Nombre del curso',
    cur_duracion INTEGER COMMENT 'Duración del curso en meses',
    cur_tarifa DECIMAL(10,2) COMMENT 'Tarifa mensual del curso',
    cur_precio_final DECIMAL(10,2) COMMENT 'Precio final del curso',
    cur_cupo_disponibilidad INTEGER COMMENT 'Cupo disponible para el curso',
    cur_descripcion VARCHAR(256) COMMENT 'Descripción del curso',
    cur_id_titular INTEGER COMMENT 'ID del profesor titular del curso',
    FOREIGN KEY (cur_id_titular) REFERENCES profesores(pro_id)
);

-- Creación de la tabla de Recibos
CREATE TABLE recibos (
    rec_id INTEGER PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador único del recibo',
    rec_id_curso INTEGER COMMENT 'ID del curso asociado al recibo',
    rec_dni_alumno VARCHAR(10) COMMENT 'DNI del alumno asociado al recibo',
    rec_fecha_pago DATE COMMENT 'Fecha de pago del recibo',
    rec_nro_cuota INTEGER COMMENT 'Número de cuota del recibo',
    FOREIGN KEY (rec_id_curso) REFERENCES cursos(cur_id),
    FOREIGN KEY (rec_dni_alumno) REFERENCES alumnos (alu_dni)
);


-- Ejemplos de datos para la tabla de Profesores
INSERT INTO profesores (pro_id, pro_nombre, pro_apellido, pro_dni, pro_sexo, pro_fecha_nacimiento, pro_telefono, pro_email)
VALUES
    (1, 'Juan', 'Perez', '12345678', 'M', '1980-05-15', '123456789', 'juan@example.com'),
    (2, 'María', 'López', '87654321', 'F', '1985-10-20', '987654321', 'maria@example.com');

-- Ejemplos de datos para la tabla de Alumnos
INSERT INTO alumnos (alu_id, alu_nombre, alu_apellido, alu_dni, alu_sexo, alu_telefono, alu_email)
VALUES
    (1, 'Luis', 'García', '11111111', 'M', '555-123456', 'luis@example.com'),
    (2, 'Ana', 'Martínez', '22222222', 'F', '555-654321', 'ana@example.com');

-- Ejemplos de datos para la tabla de Cursos
INSERT INTO cursos (cur_id, cur_nombre, cur_duracion, cur_tarifa, cur_precio_final, cur_cupo_disponibilidad, cur_descripcion, cur_id_titular)
VALUES
    (1, 'Matemáticas Básicas', 6, 100, 600, 20, 'Curso introductorio de matemáticas', 1),
    (2, 'Historia del Arte', 8, 120, 960, 15, 'Exploración de movimientos artísticos', 2);

-- Ejemplos de datos para la tabla de Recibos
INSERT INTO recibos (rec_id, rec_id_curso, rec_dni_alumno, rec_fecha_pago, rec_nro_cuota)
VALUES
    (1, 1, '11111111', '2024-04-01', 1),
    (2, 1, '11111111', '2024-04-01', 2),
    (3, 2, '22222222', '2024-04-02', 1);
