CREATE TABLE vai_tro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten_vai_tro VARCHAR(100),
    mo_ta TEXT
);

CREATE TABLE tai_khoan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ho_ten VARCHAR(150),
    email VARCHAR(150) UNIQUE,
    mat_khau VARCHAR(255),
    vai_tro_id INT,
    trang_thai VARCHAR(50),
    ngay_tao DATETIME,
    FOREIGN KEY (vai_tro_id) REFERENCES vai_tro(id)
);

CREATE TABLE dang_nhap_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tai_khoan_id INT,
    thoi_gian DATETIME,
    ip VARCHAR(50),
    trang_thai VARCHAR(50),
    FOREIGN KEY (tai_khoan_id) REFERENCES tai_khoan(id)
);

CREATE TABLE dang_ky (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ho_ten VARCHAR(150),
    email VARCHAR(150) UNIQUE,
    mat_khau VARCHAR(255),
    ngay_tao DATETIME,
    trang_thai VARCHAR(50)
);


CREATE TABLE danh_muc_tour (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten_danh_muc VARCHAR(150),
    mo_ta TEXT
);


CREATE TABLE tour (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten_tour VARCHAR(255),
    loai_tour VARCHAR(100),
    danh_muc_id INT,
    lich_trinh TEXT,
    hinh_anh TEXT,
    gia DECIMAL(12,2),
    so_cho INT,
    ngay_khoi_hanh DATE,
    ngay_ket_thuc DATE,
    trang_thai VARCHAR(50),
    FOREIGN KEY (danh_muc_id) REFERENCES danh_muc_tour(id)
);

CREATE TABLE tour_dich_vu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tour_id INT,
    ten_dich_vu VARCHAR(200),
    gia DECIMAL(12,2),
    mo_ta TEXT,
    FOREIGN KEY (tour_id) REFERENCES tour(id)
);


CREATE TABLE danh_sach_tour (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tour_id INT,
    ten_tour VARCHAR(255),
    ngay_tao DATETIME,
    trang_thai VARCHAR(50),
    FOREIGN KEY (tour_id) REFERENCES tour(id)
);


CREATE TABLE booking (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tour_id INT,
    khach_hang VARCHAR(150),
    so_dien_thoai VARCHAR(20),
    email VARCHAR(150),
    so_luong INT,
    tong_tien DECIMAL(12,2),
    trang_thai VARCHAR(50),
    ngay_dat DATETIME,
    FOREIGN KEY (tour_id) REFERENCES tour(id)
);

CREATE TABLE khach_doan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    ho_ten VARCHAR(150),
    tuoi INT,
    gioi_tinh VARCHAR(10),
    phong VARCHAR(20),
    ghi_chu TEXT,
    FOREIGN KEY (booking_id) REFERENCES booking(id)
);


CREATE TABLE huong_dan_vien (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ho_ten VARCHAR(150),
    sdt VARCHAR(20),
    email VARCHAR(150),
    kinh_nghiem TEXT,
    khu_vuc VARCHAR(100),
    trang_thai VARCHAR(50)
);

CREATE TABLE tour_hdv (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tour_id INT,
    hdv_id INT,
    nhiem_vu VARCHAR(255),
    FOREIGN KEY (tour_id) REFERENCES tour(id),
    FOREIGN KEY (hdv_id) REFERENCES huong_dan_vien(id)
);


CREATE TABLE hdv_van_hanh (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hdv_id INT,
    tour_id INT,
    ngay DATE,
    mo_ta_cong_viec TEXT,
    ghi_chu TEXT,
    FOREIGN KEY (hdv_id) REFERENCES huong_dan_vien(id),
    FOREIGN KEY (tour_id) REFERENCES tour(id)
);

CREATE TABLE hdv_lich_trinh (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hdv_id INT,
    ngay DATE,
    gio_bat_dau TIME,
    gio_ket_thuc TIME,
    noi_dung_cong_viec TEXT,
    FOREIGN KEY (hdv_id) REFERENCES huong_dan_vien(id)
);


CREATE TABLE bao_cao_tour (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tour_id INT,
    doanh_thu DECIMAL(12,2),
    chi_phi DECIMAL(12,2),
    loi_nhuan DECIMAL(12,2),
    thoi_gian_tao DATETIME,
    FOREIGN KEY (tour_id) REFERENCES tour(id)
);
