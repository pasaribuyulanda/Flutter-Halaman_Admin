CREATE DATABASE pptsb;

CREATE TABLE Pusat (
    Id_pusat INT PRIMARY KEY,
    Kode_pusat VARCHAR(50),
    Nama_pusat VARCHAR(100),
    Alamat_pusat VARCHAR(100),
    Nama_kepala_pusat VARCHAR(100)
);

CREATE TABLE Regional (
    Id_regional INT PRIMARY KEY,
    Kode_regional VARCHAR(50),
    Nama_regional VARCHAR(100),
    Alamat_regional VARCHAR(100),
    Nama_kepala_regional VARCHAR(100),
    Id_pusat INT,
    FOREIGN KEY (Id_pusat) REFERENCES Pusat(Id_pusat)
);

CREATE TABLE Cabang (
    Id_cabang INT PRIMARY KEY,
    Kode_cabang VARCHAR(50),
    Nama_cabang VARCHAR(100),
    Alamat_cabang VARCHAR(100),
    Nama_kepala_cabang VARCHAR(100),
    Tgl_berdiri DATE,
    Id_regional INT,
    FOREIGN KEY (Id_regional) REFERENCES Regional(Id_regional)
);

CREATE TABLE Sektor (
    Id_sektor INT PRIMARY KEY,
    Kode_sektor VARCHAR(50),
    Nama_sektor VARCHAR(100),
    Alamat_sektor VARCHAR(100),
    Nama_kepala_sektor VARCHAR(100),
    Tgl_berdiri_sektor DATE,
    Id_cabang INT,
    FOREIGN KEY (Id_cabang) REFERENCES Cabang(Id_cabang)
);

CREATE TABLE Status (
    Id_status INT PRIMARY KEY,
    Keterangan VARCHAR(100)
);

CREATE TABLE Hubungan_Keluarga (
    Id_hubungan_keluarga INT PRIMARY KEY,
    Keterangan VARCHAR(100)
);

CREATE TABLE Pekerjaan (
    Id_pekerjaan INT PRIMARY KEY,
    Nama_pekerjaan VARCHAR(100)
);

CREATE TABLE Pendidikan (
    Id_pendidikan INT PRIMARY KEY,
    Tingkat_pendidikan VARCHAR(100)
);

CREATE TABLE Anggota (
    Id_anggota INT PRIMARY KEY,
    Nama_depan VARCHAR(100),
    Nama_belakang VARCHAR(100),
    Gelar_depan VARCHAR(20),
    Gelar_belakang VARCHAR(20),
    Tempat_lahir VARCHAR(100),
    Jenis_kelamin VARCHAR(15),
    Golongan_darah VARCHAR(10),
    No_telepon INT,
    Foto VARCHAR(50),
    Id_status INT,
    Id_hubungan_keluarga INT,
    Id_pekerjaan INT,
    Id_pendidikan INT,
    FOREIGN KEY (Id_status) REFERENCES Status(Id_status),
    FOREIGN KEY (Id_hubungan_keluarga) REFERENCES Hubungan_Keluarga(Id_hubungan_keluarga),
    FOREIGN KEY (Id_pekerjaan) REFERENCES Pekerjaan(Id_pekerjaan),
    FOREIGN KEY (Id_pendidikan) REFERENCES Pendidikan(Id_pendidikan)
);

CREATE TABLE Jabatan (
    Id_jabatan INT PRIMARY KEY,
    Nama_jabatan VARCHAR(100)
);

CREATE TABLE Bidang (
    Id_bidang INT PRIMARY KEY,
    Nama_bidang VARCHAR(100)
);

CREATE TABLE Pejabat_Struktural (
    Id_pejabat_struktural INT PRIMARY KEY,
    Tgl_SK_Pengangkatan DATE,
    Awal_tahun_jabatan DATE,
    Akhir_tahun_jabatan DATE,
    Nomor_SK_Pengangkatan VARCHAR(50),
    Id_jabatan INT,
    Id_anggota INT,
    Id_status INT,
    Id_bidang INT,
    FOREIGN KEY (Id_jabatan) REFERENCES Jabatan(Id_jabatan),
    FOREIGN KEY (Id_anggota) REFERENCES Anggota(Id_anggota),
    FOREIGN KEY (Id_status) REFERENCES Status(Id_status),
    FOREIGN KEY (Id_bidang) REFERENCES Bidang(Id_bidang)
);

CREATE TABLE Subdistrict (
    Subdis_Id INT PRIMARY KEY,
    Subdis_name VARCHAR(100)
);

CREATE TABLE Registration (
    Id_registration INT PRIMARY KEY,
    No_registration VARCHAR(20),
    Tgl_registration DATE,
    Alamat VARCHAR(100),
    Id_sektor INT,
    Subdis_Id INT,
    FOREIGN KEY (Id_sektor) REFERENCES Sektor(Id_sektor),
    FOREIGN KEY (Subdis_Id) REFERENCES Subdistrict(Subdis_Id)
);

CREATE TABLE Det_registration (
    Id_det_registration INT PRIMARY KEY,
    Id_registration INT,
    Id_anggota INT,
    Id_status INT,
    FOREIGN KEY (Id_registration) REFERENCES Registration(Id_registration),
    FOREIGN KEY (Id_anggota) REFERENCES Anggota(Id_anggota),
    FOREIGN KEY (Id_status) REFERENCES Status(Id_status)
);

CREATE TABLE Head_movement_registration (
    Id_movement_registration INT PRIMARY KEY,
    No_movement_registration VARCHAR(20),
    Tgl_movement DATE,
    File_movement_letter VARCHAR(20),
    Alamat VARCHAR(100),
    Id_sektor INT,
    Id_registration INT,
    Id_status INT,
    Subdis_Id INT,
    FOREIGN KEY (Id_sektor) REFERENCES Sektor(Id_sektor),
    FOREIGN KEY (Id_registration) REFERENCES Registration(Id_registration),
    FOREIGN KEY (Id_status) REFERENCES Status(Id_status),
    FOREIGN KEY (Subdis_Id) REFERENCES Subdistrict(Subdis_Id)
);

CREATE TABLE Detail_movement (
    Id_detail_movement_registration INT,
    Id_movement_registration INT,
    Id_anggota INT,
    FOREIGN KEY (Id_movement_registration) REFERENCES Head_movement_registration(Id_movement_registration),
    FOREIGN KEY (Id_anggota) REFERENCES Anggota(Id_anggota)
);
