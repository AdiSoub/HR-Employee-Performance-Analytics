
-- HR & Employee Performance Project - Full SQL Script

-- Drop existing tables
DROP TABLE IF EXISTS attendance, leaves, trainings, evaluations, salaries, positions, employees, departments;

-- Create departments table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name TEXT,
    location TEXT
);

INSERT INTO departments (department_name, location) VALUES
('HR', 'Amman'),
('IT', 'Zarqa'),
('Finance', 'Irbid'),
('Marketing', 'Aqaba'),
('Operations', 'Amman'),
('Legal', 'Zarqa');

-- Create employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    full_name TEXT,
    department_id INT REFERENCES departments(department_id),
    hire_date DATE,
    gender TEXT,
    status TEXT
);

INSERT INTO employees (full_name, department_id, hire_date, gender, status) VALUES
('Rana Dabbas', 1, '2020-03-01', 'Female', 'Active'),
('Omar Saleh', 2, '2019-08-15', 'Male', 'Active'),
('Lina Haddad', 3, '2021-05-12', 'Female', 'Inactive'),
('Khaled Ahmad', 4, '2022-01-20', 'Male', 'Active');

-- Create salaries table
CREATE TABLE salaries (
    salary_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id),
    effective_date DATE,
    monthly_salary NUMERIC
);

INSERT INTO salaries (employee_id, effective_date, monthly_salary) VALUES
(1, '2022-01-01', 950), (1, '2023-01-01', 1050),
(2, '2021-06-01', 880), (2, '2022-06-01', 940),
(3, '2022-03-01', 1020), (4, '2023-02-01', 1100);

-- Create evaluations table
CREATE TABLE evaluations (
    eval_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id),
    eval_date DATE,
    score NUMERIC,
    comments TEXT
);

INSERT INTO evaluations (employee_id, eval_date, score, comments) VALUES
(1, '2023-01-15', 4.7, 'Excellent'),
(2, '2023-01-10', 4.2, 'Good progress'),
(3, '2023-03-10', 3.9, 'Needs improvement'),
(4, '2023-04-01', 4.5, 'Strong leadership');

-- Create trainings table
CREATE TABLE trainings (
    training_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id),
    training_name TEXT,
    training_date DATE,
    duration_hours INT
);

INSERT INTO trainings (employee_id, training_name, training_date, duration_hours) VALUES
(1, 'Advanced Excel', '2023-02-10', 6),
(2, 'Data Analysis', '2023-03-05', 8),
(4, 'Project Management', '2023-03-20', 5);

-- Create attendance table
CREATE TABLE attendance (
    attendance_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id),
    date DATE,
    status TEXT
);

INSERT INTO attendance (employee_id, date, status) VALUES
(1, '2023-04-01', 'Present'), (1, '2023-04-02', 'Absent'),
(2, '2023-04-01', 'Present'), (2, '2023-04-02', 'Present'),
(3, '2023-04-01', 'Present'), (4, '2023-04-01', 'Absent');

-- Create positions table
CREATE TABLE positions (
    position_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id),
    title TEXT,
    level TEXT
);

INSERT INTO positions (employee_id, title, level) VALUES
(1, 'HR Officer', 'Mid'),
(2, 'IT Analyst', 'Mid'),
(3, 'Accountant', 'Junior'),
(4, 'Marketing Lead', 'Senior');

-- Create leaves table
CREATE TABLE leaves (
    leave_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id),
    leave_type TEXT,
    start_date DATE,
    end_date DATE
);

INSERT INTO leaves (employee_id, leave_type, start_date, end_date) VALUES
(1, 'Sick', '2023-03-10', '2023-03-12'),
(2, 'Annual', '2023-03-20', '2023-03-25'),
(4, 'Unpaid', '2023-04-05', '2023-04-10');
