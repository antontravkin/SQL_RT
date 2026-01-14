-- создаём базу данных для урока
CREATE DATABASE lesson1;

-- подключаемся к ней
\c lesson1

-- создаём таблицу
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

-- проверяем таблицы
\dt

-- добавляем данные
INSERT INTO students (name, age) VALUES
('Anton', 23),
('Maria', 22);

-- смотрим данные
SELECT * FROM students;
