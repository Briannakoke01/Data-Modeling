-- Doctors Table
CREATE TABLE Doctors (
    doctor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(100) UNIQUE
);


--Patients Table
CREATE TABLE Patients (
    patient_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    phone_number VARCHAR(20),
    address TEXT
);

--Diseases Table
CREATE TABLE Diseases (
    disease_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

--Visits Table
CREATE TABLE Visits (
    visit_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES Patients(patient_id) ON DELETE CASCADE,
    doctor_id INT REFERENCES Doctors(doctor_id) ON DELETE CASCADE,
    visit_date DATE NOT NULL,
    notes TEXT
);

--Diagnoses Table
CREATE TABLE Diagnoses (
    diagnosis_id SERIAL PRIMARY KEY,
    visit_id INT REFERENCES Visits(visit_id) ON DELETE CASCADE,
    disease_id INT REFERENCES Diseases(disease_id) ON DELETE CASCADE,
    diagnosis_date DATE NOT NULL DEFAULT CURRENT_DATE
);
