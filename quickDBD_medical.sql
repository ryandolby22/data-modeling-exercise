-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

DROP DATABASE IF EXISTS  med_center;

CREATE DATABASE med_center;

\c med_center

CREATE TABLE "Doctors" (
    "id" INTEGER   NOT NULL,
    "Name" TEXT   NOT NULL,
    "Speciality" TEXT   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Patients" (
    "id" INTEGER   NOT NULL,
    "PhoneNumber" INTEGER   NOT NULL,
    "email" TEXT   NOT NULL,
    "DOB" TEXT   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diseases" (
    "id" INTEGER   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_Diseases" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diagnoses" (
    "id" INTEGER   NOT NULL,
    "name" TEXT   NOT NULL,
    "diseases.id" INTEGER   NOT NULL,
    "visits.id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Diagnoses" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Visits" (
    "id" INTEGER   NOT NULL,
    "date" DATE   NOT NULL,
    "doctor.id" INTEGER   NOT NULL,
    "patient.id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Visits" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_diseases.id" FOREIGN KEY("diseases.id")
REFERENCES "Diseases" ("id");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_visits.id" FOREIGN KEY("visits.id")
REFERENCES "Visits" ("id");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_doctor.id" FOREIGN KEY("doctor.id")
REFERENCES "Doctors" ("id");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_patient.id" FOREIGN KEY("patient.id")
REFERENCES "Patients" ("id");

CREATE INDEX "idx_Doctors_Name"
ON "Doctors" ("Name");

CREATE INDEX "idx_Doctors_Speciality"
ON "Doctors" ("Speciality");

CREATE INDEX "idx_Diseases_name"
ON "Diseases" ("name");

CREATE INDEX "idx_Diagnoses_name"
ON "Diagnoses" ("name");

CREATE INDEX "idx_Visits_date"
ON "Visits" ("date");

