-- DATABASE
CREATE DATABASE IF NOT EXISTS db_pertemuan4_sintia;
USE db_pertemuan4_sintia;

-- TABEL MAHASISWA
CREATE TABLE mahasiswa (
    nim VARCHAR(15) PRIMARY KEY,
    nama VARCHAR(100),
    nilai_akhir INT
);

INSERT INTO mahasiswa VALUES
('IK2411053','Sintia',92),
('IK2411054','Nabila',78),
('IK2411055','Rizky',67),
('IK2411056','Putri',55),
('IK2411057','Arman',45);

-- QUERY CASE
SELECT 
    nim, nama, nilai_akhir,
    CASE
        WHEN nilai_akhir >= 85 THEN 'A'
        WHEN nilai_akhir >= 75 THEN 'B'
        WHEN nilai_akhir >= 65 THEN 'C'
        WHEN nilai_akhir >= 50 THEN 'D'
        ELSE 'E'
    END AS grade
FROM mahasiswa;

-- PROCEDURE KUIS
DELIMITER //

CREATE PROCEDURE cek_predikat_mahasiswa(IN p_nilai INT)
BEGIN
    DECLARE v_predikat VARCHAR(50);
    DECLARE v_status VARCHAR(20);

    IF p_nilai BETWEEN 90 AND 100 THEN
        SET v_predikat = 'Sangat Memuaskan';
    ELSEIF p_nilai BETWEEN 80 AND 89 THEN
        SET v_predikat = 'Memuaskan';
    ELSEIF p_nilai BETWEEN 70 AND 79 THEN
        SET v_predikat = 'Baik';
    ELSEIF p_nilai BETWEEN 60 AND 69 THEN
        SET v_predikat = 'Cukup';
    ELSE
        SET v_predikat = 'Kurang';
    END IF;

    IF p_nilai >= 70 THEN
        SET v_status = 'Lulus';
    ELSE
        SET v_status = 'Tidak Lulus';
    END IF;

    SELECT 
        p_nilai AS nilai,
        v_predikat AS predikat,
        v_status AS status;
END //

DELIMITER ;
