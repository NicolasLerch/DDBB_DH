CREATE DATABASE IF NOT EXISTS playground_db;
USE playground_db;

-- Crear tabla de usuarios
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(100) NOT NULL,
    categoria ENUM('estudiante', 'docente', 'editor', 'administrador') NOT NULL
);

-- Crear tabla de cursos
CREATE TABLE Cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    imagen VARCHAR(255),
    fecha_inicio DATE NOT NULL,
    fecha_finalizacion DATE NOT NULL,
    cupo_maximo INT NOT NULL
);

-- Crear tabla de unidades
CREATE TABLE Unidades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    curso_id INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_inicio DATE NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES Cursos(id)
);

-- Crear tabla de asociación entre usuarios y cursos
CREATE TABLE Usuarios_Cursos (
    usuario_id INT,
    curso_id INT,
    PRIMARY KEY (usuario_id, curso_id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(id)
);

-- Crear tabla de clases
CREATE TABLE clases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    unidad_id INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE NOT NULL,
    visible TINYINT NOT NULL DEFAULT 1,
    FOREIGN KEY (unidad_id) REFERENCES Unidades(id)
);

-- Crear tabla de bloques
CREATE TABLE bloques (
    id INT AUTO_INCREMENT PRIMARY KEY,
    clase_id INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    tipo ENUM('texto', 'video', 'presentacion', 'pdf', 'archivo') NOT NULL,
    contenido TEXT,
    visible TINYINT NOT NULL DEFAULT 1,
    FOREIGN KEY (clase_id) REFERENCES Clases(id)
);

-- Insertar datos en la tabla Usuarios
INSERT INTO Usuarios (nombre, apellido, email, contrasena, categoria) VALUES
('Juan', 'Perez', 'juan@example.com', 'contraseña123', 'estudiante'),
('María', 'García', 'maria@example.com', 'contraseña456', 'docente'),
('Carlos', 'Lopez', 'carlos@example.com', 'contraseña789', 'editor'),
('Ana', 'Martínez', 'ana@example.com', 'contraseñaabc', 'administrador');

INSERT INTO Usuarios (nombre, apellido, email, contrasena, categoria) VALUES
('Luis', 'Hernández', 'luis@example.com', 'contraseña123', 'estudiante'),
('Laura', 'Rodriguez', 'laura@example.com', 'contraseña456', 'docente'),
('Miguel', 'Gomez', 'miguel@example.com', 'contraseña789', 'editor'),
('Sofia', 'Diaz', 'sofia@example.com', 'contraseñaabc', 'administrador'),
('Pedro', 'Martinez', 'pedro@example.com', 'contraseña123', 'estudiante'),
('Lucia', 'Sanchez', 'lucia@example.com', 'contraseña456', 'docente');

-- Insertar datos en la tabla Cursos
INSERT INTO Cursos (titulo, descripcion, imagen, fecha_inicio, fecha_finalizacion, cupo_maximo) VALUES
('Desarrollo Fullstack con Node.js y React', 'Curso intensivo de desarrollo fullstack utilizando Node.js y React.', 'node_react.jpg', '2024-05-01', '2024-07-01', 50),
('Java para principiantes', 'Curso introductorio de Java para quienes desean aprender programación orientada a objetos.', 'java.jpg', '2024-06-01', '2024-08-01', 30),
('JavaScript Avanzado', 'Curso avanzado de JavaScript para desarrolladores con experiencia.', 'javascript.jpg', '2024-05-15', '2024-07-15', 40),
('Diseño Web Responsivo', 'Curso sobre técnicas y herramientas para crear diseños web responsivos y adaptables.', 'responsive_design.jpg', '2024-05-10', '2024-07-10', 35),
('Introducción a HTML y CSS', 'Curso introductorio sobre HTML y CSS para crear páginas web estáticas.', 'html_css.jpg', '2024-05-20', '2024-07-20', 25);

-- Insertar datos en la tabla Unidades
INSERT INTO Unidades (curso_id, titulo, descripcion, fecha_inicio) VALUES
(1, 'Introducción a Node.js', 'Conceptos básicos de Node.js y su uso en el desarrollo web.', '2024-05-01'),
(1, 'Desarrollo con Express.js', 'Creación de servidores web utilizando Express.js.', '2024-05-10'),
(1, 'Desarrollo con React', 'Desarrollo de interfaces de usuario utilizando React.', '2024-05-20'),
(2, 'Conceptos básicos de Java', 'Introducción a la sintaxis y conceptos fundamentales de Java.', '2024-06-01'),
(2, 'Programación orientada a objetos', 'Principios y prácticas de la programación orientada a objetos en Java.', '2024-06-10'),
(3, 'Programación Funcional en JavaScript', 'Uso de funciones de orden superior y programación funcional en JavaScript.', '2024-05-15'),
(4, 'Diseño fluido y flexible', 'Técnicas de diseño para crear interfaces web responsivas.', '2024-05-10'),
(4, 'Media queries y Breakpoints', 'Uso de media queries y breakpoints para adaptar el diseño a diferentes dispositivos.', '2024-05-20'),
(5, 'Estructura HTML', 'Fundamentos de HTML para la creación de la estructura de páginas web.', '2024-05-20'),
(5, 'Estilizado con CSS', 'Uso de CSS para estilizar y dar formato a páginas web.', '2024-06-01');

-- Insertar datos en la tabla Usuarios_Cursos
INSERT INTO Usuarios_Cursos (usuario_id, curso_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(1, 5),
(2, 1),
(3, 2),
(4, 3),
(1, 4),
(2, 5);

INSERT INTO Usuarios_Cursos (usuario_id, curso_id) VALUES
(1, 2),
(1, 3),
(2, 3),
(2, 4);

-- Agregar datos a la tabla Clases
INSERT INTO Clases (unidad_id, titulo, descripcion, fecha_inicio, visible) VALUES
(1, 'Clase 1', 'Descripción de la clase 1', '2024-05-01', 1),
(1, 'Clase 2', 'Descripción de la clase 2', '2024-05-03', 1),
(1, 'Clase 3', 'Descripción de la clase 3', '2024-05-05', 1),
(2, 'Clase 1', 'Descripción de la clase 1', '2024-05-02', 1),
(2, 'Clase 2', 'Descripción de la clase 2', '2024-05-04', 1),
(2, 'Clase 3', 'Descripción de la clase 3', '2024-05-06', 1),
(3, 'Clase 1', 'Descripción de la clase 1', '2024-05-03', 1),
(3, 'Clase 2', 'Descripción de la clase 2', '2024-05-05', 1),
(3, 'Clase 3', 'Descripción de la clase 3', '2024-05-07', 1),
(4, 'Clase 1', 'Descripción de la clase 1', '2024-05-04', 1);

-- Agregar datos a la tabla Bloques
INSERT INTO Bloques (clase_id, titulo, tipo, contenido, visible) VALUES
(1, 'Bloque 1', 'texto', 'Contenido del bloque 1', 1),
(1, 'Bloque 2', 'video', 'https://www.youtube.com/watch?v=video1', 1),
(1, 'Bloque 3', 'presentacion', 'https://drive.google.com/presentation?id=presentacion1', 1),
(2, 'Bloque 1', 'texto', 'Contenido del bloque 1', 1),
(2, 'Bloque 2', 'video', 'https://www.youtube.com/watch?v=video2', 1),
(2, 'Bloque 3', 'presentacion', 'https://drive.google.com/presentation?id=presentacion2', 1),
(3, 'Bloque 1', 'texto', 'Contenido del bloque 1', 1),
(3, 'Bloque 2', 'video', 'https://www.youtube.com/watch?v=video3', 1),
(3, 'Bloque 3', 'presentacion', 'https://drive.google.com/presentation?id=presentacion3', 1),
(4, 'Bloque 1', 'texto', 'Contenido del bloque 1', 1);


-- Obtener los 5 cursos con más unidades
SELECT Cursos.id, Cursos.titulo, COUNT(Unidades.id) AS total_unidades
FROM Cursos
LEFT JOIN Unidades ON Cursos.id = Unidades.curso_id
GROUP BY Cursos.id, Cursos.titulo
ORDER BY total_unidades DESC
LIMIT 5;

-- Obtener la media de unidades por curso: Escribe una consulta que calcule la media de unidades por curso. 
-- Los resultados deben estar agrupados por el título del curso.
SELECT Cursos.titulo, ROUND(AVG(num_unidades), 1) AS media_unidades_por_curso
FROM Cursos
LEFT JOIN (
    SELECT curso_id, COUNT(*) AS num_unidades
    FROM Unidades
    GROUP BY curso_id
) AS UnidadesPorCurso ON Cursos.id = UnidadesPorCurso.curso_id
GROUP BY Cursos.titulo;

-- Obtener los usuarios asociados a más de 3 cursos: Escribe una consulta que devuelva los nombres 
-- de los usuarios que están asociados a más de 3 cursos. 
-- Los resultados deben estar ordenados en orden ascendente por el nombre del usuario.
SELECT Usuarios.nombre, COUNT(Usuarios_Cursos.curso_id) AS num_cursos_asociados
FROM Usuarios
INNER JOIN Usuarios_Cursos ON Usuarios.id = Usuarios_Cursos.usuario_id
GROUP BY Usuarios.id
HAVING COUNT(Usuarios_Cursos.curso_id) > 3
ORDER BY Usuarios.nombre ASC;

-- Obtener las 10 primeras clases que comienzan después de una fecha determinada: 
-- Escribe una consulta que devuelva las 10 primeras clases que comienzan después 
-- de una fecha determinada. Los resultados deben estar ordenados en orden ascendente por la fecha de inicio.
SELECT *
FROM clases
WHERE fecha_inicio > '2024-05-05'
ORDER BY fecha_inicio ASC
LIMIT 10;


-- Obtener el número de bloques por tipo para una clase específica: 
-- Escribe una consulta que devuelva el número de bloques por tipo para una clase específica. 
-- Los resultados deben estar agrupados por el tipo de bloque.
SELECT tipo, COUNT(*) AS num_bloques
FROM Bloques
WHERE clase_id = 1
GROUP BY tipo;

-- Obtener el nombre y el apellido de los usuarios, sustituyendo los valores nulos por una cadena vacía: 
SELECT COALESCE(nombre, '') AS nombre, COALESCE(apellido, '') AS apellido
FROM Usuarios;


-- Obtener los 3 cursos con la mayor cantidad de usuarios: 
-- Escribe una consulta que devuelva los títulos de los 3 cursos que tienen más usuarios asociados. 
-- Los resultados deben estar ordenados en orden descendente por el número de usuarios.
SELECT Cursos.titulo, COUNT(Usuarios_Cursos.usuario_id) AS num_usuarios
FROM Cursos
JOIN Usuarios_Cursos ON Cursos.id = Usuarios_Cursos.curso_id
GROUP BY Cursos.id
ORDER BY num_usuarios DESC
LIMIT 3;

-- Obtener el promedio de clases por unidad para cada curso: 
-- Escribe una consulta que calcule el promedio de clases por unidad para cada curso. 
-- Los resultados deben estar agrupados por el título del curso.
SELECT Cursos.titulo, ROUND(AVG(num_clases_por_unidad), 1) AS promedio_clases_por_unidad
FROM Cursos
LEFT JOIN (
    SELECT Unidades.curso_id, COUNT(Clases.id) AS num_clases_por_unidad
    FROM Unidades
    LEFT JOIN Clases ON Unidades.id = Clases.unidad_id
    GROUP BY Unidades.id
) AS ClasesPorUnidad ON Cursos.id = ClasesPorUnidad.curso_id
GROUP BY Cursos.titulo;

-- Obtener los usuarios con más de 2 cursos que comienzan después de una fecha determinada: 
-- Escribe una consulta que devuelva los nombres de los usuarios que están asociados 
-- a más de 2 cursos que comienzan después de una fecha determinada. 
-- Los resultados deben estar ordenados en orden ascendente por el nombre del usuario.

SELECT Usuarios.nombre
FROM Usuarios
JOIN Usuarios_Cursos ON Usuarios.id = Usuarios_Cursos.usuario_id
JOIN Cursos ON Usuarios_Cursos.curso_id = Cursos.id
WHERE Cursos.fecha_inicio > '2024-05-01'
GROUP BY Usuarios.id
HAVING COUNT(Usuarios_Cursos.curso_id) > 2
ORDER BY Usuarios.nombre ASC;


-- Obtener las 5 últimas unidades que comienzan después de una fecha determinada: 
-- Escribe una consulta que devuelva las 5 últimas unidades que comienzan después de una fecha determinada. 
-- Los resultados deben estar ordenados en orden descendente por la fecha de inicio.
SELECT *
FROM Unidades
WHERE fecha_inicio > '2024-05-01'
ORDER BY fecha_inicio DESC
LIMIT 5;

-- Obtener el número de usuarios por categoría para un curso específico: 
-- Escribe una consulta que devuelva el número de usuarios por categoría para un curso específico. 
-- Los resultados deben estar agrupados por la categoría del usuario.
SELECT Usuarios.categoria, COUNT(*) AS num_usuarios
FROM Usuarios
JOIN Usuarios_Cursos ON Usuarios.id = Usuarios_Cursos.usuario_id
JOIN Cursos ON Usuarios_Cursos.curso_id = Cursos.id
GROUP BY Usuarios.categoria;
