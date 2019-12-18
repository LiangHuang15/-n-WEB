create database QLDT;

use QLDT;

create table NhaSanXuat 
(
	MaNSX nvarchar(6) primary key,  
	TenNSX nvarchar(255), 
	QuocGia nvarchar(255)
);

create table DienThoai
(
	MaDT int primary key  auto_increment,
	MaNSX nvarchar(6), 
    TenDT nvarchar(255) unique , 
    MoTa longtext , 
    GiaDT float,
    KichThuoc nvarchar(255),
	MauSac nvarchar(255),
    TrongLuong nvarchar(255),
    DungLuong nvarchar(255),
    HDH nvarchar(255),
    CPU nvarchar(255), 
    Camera nvarchar(255), 
    ThoiGianBH nvarchar(255),
	Bluetooth nvarchar(255),
    Wifi nvarchar(255),
    Sim nvarchar(255),
    Pin nvarchar(255),
    NgaySX date,
	Trang_Thai nvarchar(255) default 'Chưa cập nhật',
    foreign key (MaNSX) references NhaSanXuat(MaNSX) 
); 

create table KhachHang
(
	MaKH  int  primary key auto_increment,
    TenKH nvarchar(255),
	Email nvarchar(255) unique,
    SDT nvarchar(12) unique, 
    DiaChi nvarchar(255) 
);

create table Nhanvien
(
	MaNV int  primary key auto_increment,
    TenNV nvarchar(255) ,
	Email nvarchar(255) unique, 
	NgaySinh date, 
	SDT nvarchar(12), 
	DiaChi nvarchar(255), 
	GioiTinh nvarchar(10)
);


create table KhuyenMai
(
	MaKM nvarchar(6) primary key,
    TenKM nvarchar(255),
    NgayBD date,
    NgayKT date, 
	PhanTram int
);

create table HoaDon 
(
	MaHD int  primary key auto_increment,
    MaNV int ,
    MaKH int , 
	MaKM nvarchar(6), 
    NgayLap timestamp default current_timestamp ,
	TinhTrang nvarchar(255), 
	TongTien float default 0, 
    foreign key (MaNV) references NhanVien(MaNV),
    foreign key (MaKH) references KhachHang(MaKH),
	foreign key (MaKM) references KhuyenMai(MaKM)
); 

create table CTHD 
(
	MaDT int,
    MaHD int,
	MaKM nvarchar(6),
    SoLuong int, 
	DonGia float,  
	constraint pk_CTHD primary key  (MaDT,MaHD,MaKM),
	constraint fk_CTHD_DienThoai  foreign key (MaDT) references DienThoai(MaDT), 
    constraint fk_CTHD_HoaDon  foreign key (MaHD) references HoaDon(MaHD),
	constraint fk_CTHD_KhuyenMai  foreign key (MaKM) references KhuyenMai(MaKM)
);

create table DanhGia 
(
	MaKH int , 
	MaDT int, 
	MaHD int, 
	ChiTiet nvarchar(255), 
	MucDo int , 
	check (MucDo>=1 and MucDo<=5) ,
	constraint pk_DanhGia primary key (MaDT,MaKH,MaHD), 
	constraint fk_DanhGia_DienThoai  foreign key (MaDT) references DienThoai(MaDT), 
    constraint fk_DanhGia_HoaDon  foreign key (MaHD) references HoaDon(MaHD),
	constraint fk_DanhGia_KhachHang  foreign key (MaKH) references KhachHang(MaKH)
);


create table TonKho
(	
	MaKho int  primary key auto_increment, 
	MaDT int , 
	SoLuongTon int , 
	foreign key (MaDT) references DienThoai(MaDT)
);

create table Img
(
	imgId int primary key auto_increment,
    img1 nvarchar(255),
    img2 nvarchar(255),
    img3 nvarchar(255),
    MaDT int,
     foreign key (MaDT) references DienThoai(MaDT)
);

insert into NhaSanXuat values('NSX001','APPLE','Hoa Ky');
insert into NhaSanXuat values('NSX002','SAMSUNG','Han Quoc');
insert into NhaSanXuat values('NSX003','HUAWEI','Trung Quoc');
insert into NhaSanXuat values('NSX004','XIAOMI','Trung Quoc');
insert into NhaSanXuat values('NSX005','OPPO','Trung Quoc');

insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX ) values('NSX001','iPhone 11 Pro Max 512GB',N'Để tìm kiếm một chiếc smartphone có hiệu năng mạnh mẽ và có thể sử dụng mượt mà trong 2-3 năm tới thì không có chiếc máy nào xứng đang hơn chiếc iPhone 11 Pro Max 512GB mới ra mắt trong năm 2019 của Apple.','43990000',N'Dài 158 mm - Ngang 77.8 mm - Dày 8.1 mm','Green','226 g','512GB','iOS 13',N'Apple A13 Bionic 6 nhân','3 camera 12 MP & 12 MP',N'1 Năm','LE, A2DP, v5.0','Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi hotspot','Nano SIM & eSIM','3969 mAh','2019-11-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX001','iPhone 11 Pro Max 256GB',N'Để tìm kiếm một chiếc smartphone có hiệu năng mạnh mẽ và có thể sử dụng mượt mà trong 2-3 năm tới thì không có chiếc máy nào xứng đang hơn chiếc iPhone 11 Pro Max 256GB mới ra mắt trong năm 2019 của Apple.','37990000',N'Dài 158 mm - Ngang 77.8 mm - Dày 8.1 mm','Black','226 g','256GB','iOS 13',N'Apple A13 Bionic 6 nhân','3 camera 12 MP & 12 MP',N'1 Năm','LE, A2DP, v5.0','Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi hotspot','Nano SIM & eSIM','3969 mAh','2019-11-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX001','iPhone 11 Pro Max 64GB',N'Để tìm kiếm một chiếc smartphone có hiệu năng mạnh mẽ và có thể sử dụng mượt mà trong 2-3 năm tới thì không có chiếc máy nào xứng đang hơn chiếc iPhone 11 Pro Max 64GB mới ra mắt trong năm 2019 của Apple.','33990000',N'Dài 158 mm - Ngang 77.8 mm - Dày 8.1 mm','Gold','226 g','64GB','iOS 13',N'Apple A13 Bionic 6 nhân','3 camera 12 MP & 12 MP',N'1 Năm','LE, A2DP, v5.0','Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi hotspot','Nano SIM & eSIM','3969 mAh','2019-11-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX ) values('NSX001','iPhone 11 Pro 256GB',N'iPhone 11 Pro 256GB có lẽ sẽ là chiếc iPhone được nhiều người dùng lựa chọn khi nó sở hữu mức giá tốt hơn chiếc iPhone 11 Pro Max nhưng vẫn sở hữu tất cả những ưu điểm trên người anh em của mình.','34990000',N'Dài 144 mm - Ngang 71.4 mm - Dày 8.1 mm','Gold','188 g','256GB','iOS 13',N'Apple A13 Bionic 6 nhân','3 camera 12 MP & 12 MP',N'1 Năm','LE, A2DP, v5.0','Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi hotspot','Nano SIM & eSIM','3046 mAh','2019-11-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX ) values('NSX001','iPhone 11 Pro 64GB',N'iPhone 11 Pro 256GB có lẽ sẽ là chiếc iPhone được nhiều người dùng lựa chọn khi nó sở hữu mức giá tốt hơn chiếc iPhone 11 Pro Max nhưng vẫn sở hữu tất cả những ưu điểm trên người anh em của mình.','30990000',N'Dài 144 mm - Ngang 71.4 mm - Dày 8.1 mm','Gold','188 g','64GB','iOS 13',N'Apple A13 Bionic 6 nhân','3 camera 12 MP & 12 MP',N'1 Năm','LE, A2DP, v5.0','Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi hotspot','Nano SIM & eSIM','3046 mAh','2019-11-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX001','iPhone 11 64GB',N'Sau bao nhiêu chờ đợi cũng như đồn đoán thì cuối cùng Apple đã chính thức giới thiệu bộ 3 siêu phẩm iPhone 11 mạnh mẽ nhất của mình vào tháng 9/2019. Có mức giá rẻ nhất nhưng vẫn được nâng cấp mạnh mẽ như chiếc iPhone Xr năm ngoái, đó chính là phiên bản iPhone 11 64GB.','21990000',N'Dài 150.9 mm - Ngang 75.7 mm - Dày 8.3 mm','Black','194 g','64GB','iOS 13',N'Apple A13 Bionic 6 nhân','Chính 12 MP & Phụ 12 MP',N'1 Năm','LE, A2DP, v5.0','Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi hotspot','Nano SIM & eSIM','3110 mAh','2019-11-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX001','iPhone 11 128GB',N'Được xem là phiên bản iPhone "giá rẻ" trong bộ 3 iPhone mới ra mắt nhưng iPhone 11 128GB vẫn sở hữu cho mình rất nhiều ưu điểm mà hiếm có một chiếc smartphone nào khác sở hữu.','23990000',N'Dài 150.9 mm - Ngang 75.7 mm - Dày 8.3 mm','Black','194 g','128GB','iOS 13',N'Apple A13 Bionic 6 nhân',N'Chính 12 MP & Phụ 12 MP',N'1 Năm','LE, A2DP, v5.0','Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi hotspot','Nano SIM & eSIM','3110 mAh','2019-11-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX001','iPhone Xs Max 64GB',N'Hoàn toàn xứng đáng với những gì được mong chờ, phiên bản cao cấp nhất iPhone Xs Max 64 GB của Apple năm nay nổi bật với chip A12 Bionic mạnh mẽ, màn hình rộng đến 6.5 inch, cùng camera kép trí tuệ nhân tạo và Face ID được nâng cấp.','27990000',N'Dài 157.5 mm - Ngang 77.4 mm - Dày 7.7 mm','Black','208 g','64GB','iOS 12',N'Apple A12 Bionic 6 nhân',N'Chính 12 MP & Phụ 12 MP',N'1 Năm','LE, A2DP, v5.0','Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi hotspot','Nano SIM & eSIM','3174 mAh','2018-11-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX001','iPhone Xs Max 128GB',N'Sau 1 năm mong chờ, chiếc smartphone cao cấp nhất của Apple đã chính thức ra mắt mang tên iPhone Xs Max 256 GB. Máy các trang bị các tính năng cao cấp nhất từ chip A12 Bionic, dàn loa đa chiều cho tới camera kép tích hợp trí tuệ nhân tạo.','33990000',N'Dài 157.5 mm - Ngang 77.4 mm - Dày 7.7 mm','Black','208 g','128GB','iOS 12','Apple A12 Bionic 6 nhân',N'Chính 12 MP & Phụ 12 MP',N'1 Năm','LE, A2DP, v5.0','Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi hotspot','Nano SIM & eSIM','3174 mAh','2018-11-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX001','iPhone Xs 256GB',N'Chiếc điện thoại iPhone mới đã chính thức được ra mắt vào đêm 12/9 theo giờ Việt Nam, trong đó có phiên bản iPhone Xs 256GB với bộ nhớ khủng, cấu hình mạnh mẽ với chip Apple A12 và những tính năng đẳng cấp khác.','29990000',N'Dài 143.6 mm - Ngang 70.9 mm - Dày 7.7 mm','Black','177 g','256GB','iOS 12',N'Apple A12 Bionic 6 nhân',N'Chính 12 MP & Phụ 12 MP',N'1 Năm','LE, A2DP, v5.0','Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi hotspot','Nano SIM & eSIM','2658 mAh','2018-11-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX001','iPhone Xs 64GB',N'Đến hẹn lại lên, năm nay Apple giới thiệu tới người dùng thế hệ tiếp theo với 3 phiên bản, trong đó có cái tên iPhone Xs 64 GB với những nâng cấp mạnh mẽ về phần cứng đến hiệu năng, màn hình cùng hàng loạt các trang bị cao cấp khác.','24990000',N'Dài 143.6 mm - Ngang 70.9 mm - Dày 7.7 mm','Black','177 g','64GB','iOS 12',N'Apple A12 Bionic 6 nhân',N'Chính 12 MP & Phụ 12 MP','1 Năm','LE, A2DP, v5.0','Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi hotspot','Nano SIM & eSIM','2658 mAh','2018-11-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX001','iPhone X 64GB',N'iPhone X 64 GB là cụm từ được rất nhiều người mong chờ muốn biết và tìm kiếm trên Google bởi đây là chiếc điện thoại mà Apple kỉ niệm 10 năm iPhone đầu tiên được bán ra.','19990000',N'Dài 143.6 mm - Ngang 70.9 mm - Dày 7.7 mm','Black','174 g','64GB','iOS 12','Apple A11 Bionic 6 nhân',N'Chính 12 MP & Phụ 12 MP',N'1 Năm','LE, A2DP, v5.0','Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi hotspot','Nano SIM & eSIM','2716 mAh','2017-09-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX002','Samsung Galaxy Note 10+','Trông ngoại hình khá giống nhau, tuy nhiên Samsung Galaxy Note 10+ sở hữu khá nhiều điểm khác biệt so với Galaxy Note 10 và đây được xem là một trong những chiếc máy đáng mua nhất trong năm 2019, đặc biệt dành cho những người thích một chiếc máy màn hình lớn, camera chất lượng hàng đầu.','23990000','Dài 162.3 mm - Ngang 77.2 mm - Dày 7.9 mm','Black','196 g','256GB','Android 9.0 (Pie)','Exynos 9825 8 nhân 64-bit','Chính 12 MP & Phụ 12 MP, 16 MP, TOF 3D','1 Năm','LE, A2DP, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano (SIM 2 chung khe thẻ nhớ)','4300 mAh','2019-11-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX002','Samsung Galaxy S10+ (512GB)','Samsung Galaxy S10+ 512GB - phiên bản kỷ niệm 10 năm chiếc Galaxy S đầu tiên ra mắt, là một chiếc smartphone hội tủ đủ các yếu tố mà bạn cần ở một chiếc máy cao cấp trong năm 2019.','22990000','Dài 157.6 mm - Ngang 74.1 mm - Dày 7.8 mm','Grey','175 g','512GB','Android 9.0 (Pie)','Exynos 9820 8 nhân 64-bit','Chính 12 MP & Phụ 12 MP, 16 MP, TOF 3D','1 Năm','LE, A2DP, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano (SIM 2 chung khe thẻ nhớ)','4300 mAh','2019-02-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX002','Samsung Galaxy Note 10','Nếu như từ trước tới nay dòng Galaxy Note của Samsung thường ít được các bạn nữ sử dụng bởi kích thước màn hình khá lớn khiến việc cầm nắm trở nên khó khăn thì Samsung Galaxy Note 10 sẽ là chiếc smartphone nhỏ gọn, phù hợp với cả những bạn có bàn tay nhỏ.','19990000','Dài 151 mm - Ngang 71.8 mm - Dày 7.9 mm','Black','168 g','256GB','Android 9.0 (Pie)','Exynos 9825 8 nhân 64-bit','Chính 12 MP & Phụ 12 MP, 16 MP','1 Năm','LE, A2DP, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano','4300 mAh','2019-08-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX002','Samsung Galaxy Note 9','Mang lại sự cải tiến đặc biệt trong cây bút S Pen, siêu phẩm Samsung Galaxy Note 9 còn sở hữu dung lượng pin khủng lên tới 4.000 mAh cùng hiệu năng mạnh mẽ vượt bậc, xứng đáng là một trong những chiếc điện thoại cao cấp nhất của Samsung.','22990000','Dài 161.9 mm - Ngang 76.4 mm - Dày 8.8 mm','Black','201 g','128GB','Android 8.1 (Oreo)','Exynos 9810 8 nhân 64-bit','Chính 12 MP & Phụ 12 MP','1 Năm','LE, A2DP, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano (SIM 2 chung khe thẻ nhớ)','4000 mAh','2018-08-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX002','Samsung Galaxy A9 (2018)','Samsung Galaxy A9 (2018) là chiếc điện thoại đầu tiên của Samsung sở hữu hệ thống camera ấn tượng với 4 thấu kính cùng hàng loạt các nâng cấp đáng giá về cấu hình và tính năng hiện đại khác.','10990000','Dài 162.5 mm - Ngang 77 mm - Dày 7.8 mm','Black','183 g','128GB','Android 8.0 (Oreo)','Qualcomm Snapdragon 660 8 nhân','Chính 24 MP & Phụ 10 MP, 8 MP, 5 MP','1 Năm','LE, A2DP, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano','3800 mAh','2018-08-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX003','Huawei P30 Pro','Huawei P30 Pro là một bước đột phá của Huawei cũng như camera trên smartphone khi đem lại khả năng zoom như một "kính viễn vọng".','20690000','Dài 158 mm - Ngang 73.4 mm - Dày 8.41 mm','Black','192 g','256GB','Android 9.0 (Pie)','Hisilicon Kirin 980 8 nhân 64-bit','Chính 40 MP & Phụ 20 MP, 8 MP, TOF 3D','1 Năm','LE, A2DP, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','	2 SIM Nano (SIM 2 chung khe thẻ nhớ)','4200 mAh','2019-03-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX003','Huawei P30 Lite','Mới đây Huawei đã chính thức giới thiệu chiếc Huawei P30 Lite bên cạnh các sản phẩm khác trong dòng P30 series và chiếc smartphone được định hướng tới phân khúc tầm trung.','6020000','Dài 152.9 mm - Ngang 72.7 mm - Dày 7.4 mm','Black','159 g','128GB','Android 9.0 (Pie)','HiSilicon Kirin 710','Chính 24 MP & Phụ 8 MP, 2 MP','1 Năm','apt-X, EDR, LE, A2DP, v4.2','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano (SIM 2 chung khe thẻ nhớ)','3340 mAh','2019-03-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX003','Huawei Y9 Prime (2019)','Huawei Y9 Prime (2019) là phiên bản kế nhiệm của chiếc Y9 Prime (2018) đã ra mắt năm ngoái và cũng là chiếc điện thoại đầu tiên của Huawei được trang bị công nghệ camera trượt và màn hình tràn viền ra bốn cạnh.','5490000','Dài 163.45 mm - Ngang 77.26 mm - Dày 8.85 mm','Black','196.8 g','128GB','Android 9.0 (Pie)','HiSilicon Kirin 710F 8 nhân','Chính 16 MP & Phụ 8 MP, 2 MP','1 Năm','LE, A2DP, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano (SIM 2 chung khe thẻ nhớ)','4000 mAh','2019-06-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX003','Huawei Nova 3i','Với những smartphone như Nova 2i hay Nova 3e thì Huawei đã và đang tạo nên những cơn sốt rất lớn trong phân khúc tầm trung và cái tên mới Huawei Nova 3i được cải tiến và nâng cấp nhiều điểm mới, hứa hẹn sẽ mang lại làn gió mới cho thị trường.','5390000','Dài 157.6 mm - Ngang 75.2 mm - Dày 7.6 mm','Black','169 g','128GB','Android 8.1 (Oreo)','HiSilicon Kirin 710','Chính 16 MP & Phụ 2 MP','1 Năm','LE, A2DP, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano (SIM 2 chung khe thẻ nhớ)','3340 mAh','2018-07-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX003','Huawei Y7 Pro (2019)','Hoàn toàn lột xác so với phiên bản tiền nhiệm, Y7 Pro (2019) đã giúp Huawei có thêm điểm cộng trong mắt người dùng nhờ việc đem thiết kế mặt lưng gradient, màn hình giọt nước và pin khủng lên chiếc smartphone giá rẻ của mình.','3140000','Dài 158.9 mm - Ngang 76.9 mm - Dày 8.1 mm','Black','168 g','32GB','Android 8.1 (Oreo)','Qualcomm Snapdragon 450 8 nhân 64-bit','Chính 13 MP & Phụ 2 MP','1 Năm','LE, A2DP, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano (SIM 2 chung khe thẻ nhớ)','4000 mAh','2018-12-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX004','Xiaomi Mi 9 SE','Vẫn như thường lệ thì bên cạnh chiếc flagship Xiaomi Mi 9 cao cấp của mình thì Xiaomi cũng giới thiệu thêm phiên bản rút gọn là chiếc Xiaomi Mi 9 SE. Máy vẫn sở hữu cho mình nhiều trang bị cao cấp tương tự đàn anh.','7490000','Dài 147.5 mm - Ngang 70.5 mm - Dày 7.5 mm','Black','155 g','64GB','Android 9.0 (Pie)','Snapdragon 712 8 nhân 64-bit','Chính 48 MP & Phụ 13 MP, 8 MP','1 Năm','A2DP, LE, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano','3070 mAh','2019-06-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX004','Xiaomi Mi 9T','Xiaomi Mi 9T (tên khác là Redmi K20) là chiếc smartphone vừa được giới thiệu gây rất nhiều chú ý với người dùng bởi nó hội tụ đủ 3 yếu tố "ngon bổ rẻ".','7990000','Dài 156.7 mm - Ngang 74.3 mm - Dày 8.8 mm','Black','191 g','64GB','Android 9.0 (Pie)','Snapdragon 730 8 nhân','Chính 48 MP & Phụ 13 MP, 8 MP','1 Năm','A2DP, LE, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano','4000 mAh','2019-07-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX004','Xiaomi Redmi Note 8','Vào đầu tháng 10/2019 Xiaomi đã ra mắt một smartphone tầm trung mới nhất của họ mang tên Xiaomi Redmi Note 8 4GB/128GB. Chiếc điện thoại gây ấn tượng với thiết kế màn hình giọt nước thời trang, bộ 4 camera chất lượng cao, vi xử lý hiệu năng tốt đi kèm giá bán vô cùng hấp dẫn.','5490000','Dài 158.3 mm - Ngang 75.3 mm - Dày 8.4 mm','Black','190 g','128GB','Android 9.0 (Pie)','Qualcomm Snapdragon 665 8 nhân','Chính 48 MP & Phụ 13 MP, 8 MP','1 Năm','A2DP, LE, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano','4000 mAh','2019-10-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX004','Xiaomi Redmi Note 7','Xiaomi Redmi Note 7 4GB/64GB là chiếc smartphone giá rẻ mới được giới thiệu vào đầu năm 2019 với nhiều trang bị đáng giá như thiết kế notch giọt nước hay camera lên tới 48 MP.','4490000','Dài 159.2 mm - Ngang 75.2 mm - Dày 8.1 mm','Black','186 g','64GB','Android 9.0 (Pie)','Qualcomm Snapdragon 660 8 nhân','Chính 48 MP & Phụ 15 MP','1 Năm','A2DP, LE, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano','4000 mAh','2019-03-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX004','Xiaomi Mi A3','Xiaomi đã và đang khá thành công với các sản phẩm thuộc dòng Mi A của mình và mới đây hãng đã tiếp tục cho ra mắt phiên bản nâng cấp là chiếc Xiaomi Mi A3 (Mi CC9e) với cải tiến mạnh mẽ về camera và hiệu năng bên trong.','4490000','Dài 153.5 mm - Ngang 71.9 mm - Dày 8.5 mm','Black','173.8 g','64GB','Android 9.0 (Pie)','Qualcomm Snapdragon 665 8 nhân','Chính 48 MP & Phụ 8 MP, 2 MP','1 Năm','A2DP, LE, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano','4030 mAh','2019-03-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX005','OPPO Reno 10x Zoom Edition','Những chiếc flagship trong năm 2019 không chỉ có một camera chụp ảnh đẹp, chụp xóa phông ảo diệu mà còn phải "chụp thật xa" và với chiếc OPPO Reno 10x Zoom Edition chính thức gia nhập thị trường "smartphone có camera siêu zoom".','16990000','Dài 162 mm - Ngang 77.2 mm - Dày 9.3 mm','Black','210 g','256GB','Android 9.0 (Pie)','Snapdragon 855 8 nhân 64-bit','Chính 48 MP & Phụ 13 MP, 8 MP','1 Năm','A2DP, LE, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano','4065 mAh','2019-06-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX005','OPPO Reno2','Sau sự thành công của chiếc OPPO Reno với thiết kế mới lạ, camera chất lượng thì mới đây OPPO tiếp tục giới thiệu phiên bản nâng cấp của chiếc smartphone này là chiếc OPPO Reno2.','14990000','Dài 160 mm - Ngang 74.3 mm - Dày 9.5 mm','Black','189 g','256GB','Android 9.0 (Pie)','Snapdragon 730G 8 nhân','Chính 48 MP & Phụ 13 MP, 8 MP, 2 MP','1 Năm','A2DP, LE, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano','4000 mAh','2019-10-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX005','OPPO Reno','Những năm gần đây OPPO luôn tạo được dấu ấn trên các sản phẩm mới của mình và smartphone vừa ra mắt OPPO Reno là một ví dụ điển hình.','9990000','Dài 156.6 mm - Ngang 74.3 mm - Dày 9 mm','Black','185 g','256GB','Android 9.0 (Pie)','Snapdragon 710 8 nhân 64-bit','	Chính 48 MP & Phụ 5 MP','1 Năm','A2DP, LE, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano','3765 mAh','2019-06-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX005','OPPO F11 Pro 128GB','Lâu nay, những chiếc điện thoại của OPPO thường được đánh giá cao ở camera selfie và với OPPO F11 Pro 128GB thì ngoài thế mạnh về camera trước với hệ thống trượt, OPPO làm người ta phải ấn tượng thêm cả về camera sau.','7490000','Dài 161.3 mm - Ngang 76.1 mm - Dày 8.8 mm','Black','190 g','128GB','Android 9.0 (Pie)','MediaTek Helio P70 8 nhân','Chính 48 MP & Phụ 5 MP','1 Năm','A2DP, LE, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano','4000 mAh','2019-05-01');
insert into DienThoai (MaNSX,TenDT,MoTa,GiaDT,KichThuoc ,MauSac ,TrongLuong,DungLuong ,HDH ,CPU, Camera , ThoiGianBH ,Bluetooth ,Wifi,Sim ,Pin ,NgaySX )values('NSX005','OPPO A9 (2020)','Kế thừa phiên bản OPPO A7 đã từng gây hot trước đó, OPPO A9 (2020) có nhiều sự cải tiến hơn về màn hình, camera và hiệu năng trải nghiệm.','6990000','Dài 163.6 mm - Ngang 75.6 mm - Dày 9.1 mm','Black','195 g','128GB','Android 9.0 (Pie)','Qualcomm Snapdragon 665 8 nhân','Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP','1 Năm','A2DP, LE, apt-X, v5.0','Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot','2 SIM Nano','5000 mAh','2019-09-01');





insert into Nhanvien (TenNV,Email,NgaySinh,SDT,DiaChi,GioiTinh)values ('Phan Trong Nhan','phantrongnhan@gmail.com','1999-10-10','0123456789','LongAn','Nam');
insert into Nhanvien (TenNV,Email,NgaySinh,SDT,DiaChi,GioiTinh)values ('Tran Trong Nghia','trantrongnghia@gmail.com','1999-10-10','0123456789','An Giang','Nam');
insert into Nhanvien (TenNV,Email,NgaySinh,SDT,DiaChi,GioiTinh)values ('Nguyen Duong Hieu Han','hieuhan@gmail.com','1999-10-10','0123456789','Quang Ngai','Nu');
insert into Nhanvien (TenNV,Email,NgaySinh,SDT,DiaChi,GioiTinh)values ('Huynh Chi Luong','huynhchiluong@gmail.com','1999-10-10','0123456789','TPHCM','Nam');
insert into Nhanvien (TenNV,Email,NgaySinh,SDT,DiaChi,GioiTinh)values ('Nguyen Thi Ngoc Diep','ngocdiep@gmail.com','1999-10-10','0123456789','Dong Nai','Nu');
insert into Nhanvien (TenNV,Email,NgaySinh,SDT,DiaChi,GioiTinh)values ('Nguyen Thi Ngoc Lan','ngoclan@gmail.com','1999-10-10','0123456789','TPHCM','Nam');
insert into Nhanvien (TenNV,Email,NgaySinh,SDT,DiaChi,GioiTinh)values ('Nguyen Thi Lan','thilan@gmail.com','1999-10-10','0123456789','LongAn','Nam');
insert into Nhanvien (TenNV,Email,NgaySinh,SDT,DiaChi,GioiTinh) values ('Nguyen Thi Han ','thihan@gmail.com','1999-10-10','0123456789','An Giang','Nam');
insert into Nhanvien (TenNV,Email,NgaySinh,SDT,DiaChi,GioiTinh)values ('Nguyen Thi Han Han ','hanhan@gmail.com','1999-10-10','0123456789','Quang Ngai','Nam');
insert into Nhanvien (TenNV,Email,NgaySinh,SDT,DiaChi,GioiTinh)values ('Tran Bat Nghia','batnghia@gmail.com','1999-10-10','0123456789','TPHCM','Nam');
insert into Nhanvien (TenNV,Email,NgaySinh,SDT,DiaChi,GioiTinh)values ('Huynh Bat Luong','luongluongbat@gmail.com','1999-10-10','0123456789','LongAn','Nam');

insert into KhuyenMai values ('KM002','Khuyen mai 2%','2019-09-10','2019-09-30',2);
insert into KhuyenMai values ('KM005','Khuyen mai 5%','2019-09-10','2019-09-30',5);
insert into KhuyenMai values ('KM007','Khuyen mai 7%','2019-09-10','2019-09-30',7);
insert into KhuyenMai values ('KM010','Khuyen mai 10%','2019-09-10','2019-09-30',10);
insert into KhuyenMai values ('KM015','Khuyen mai 15%','2019-09-10','2019-09-30',15);
insert into KhuyenMai values ('KM020','Khuyen mai 20%','2019-09-10','2019-09-30',20);


insert into KhachHang (TenKH,Email,SDT,DiaChi)values(N'Lệ Tư lam','lamtule@gmail.com','0134586258','TPHCM');
insert into KhachHang  (TenKH,Email,SDT,DiaChi)values(N'Hoàng Thiên minh','minhthienhoang@gmail.com','0928356812',N'Long An');
insert into KhachHang (TenKH,Email,SDT,DiaChi)values(N'Trịnh Công cong','congcong152@gmail.com','0325585426',N'Hải Phòng');
insert into KhachHang (TenKH,Email,SDT,DiaChi)values(N'Hồ Cẩm Đào','camhodao123@gmail.com','0389562485',N'Lào Cai');
insert into KhachHang (TenKH,Email,SDT,DiaChi)values(N'Hoa Văn tuyệt','ngahfisnh@gmail.com','0823568426',N'Nam Định');
insert into KhachHang (TenKH,Email,SDT,DiaChi)values(N'Hồ Ánh dương','duonganhhongyet@gmail.com','0632586235',N'Thái Nguyên');
insert into KhachHang (TenKH,Email,SDT,DiaChi)values(N'Dương Thùy mị','mimithuy@gmail.com','0124625685','TPHCM');
insert into KhachHang (TenKH,Email,SDT,DiaChi)values(N'Kim Tử hoàn','hoanhoantu@gmail.com','0358645236','TPHCM');
insert into KhachHang (TenKH,Email,SDT,DiaChi)values(N'Vương Thanh bình','thanhthanhbinh@gmail.com','0456283589','TPHCM');
insert into KhachHang (TenKH,Email,SDT,DiaChi)values(N'Nguyễn phương','nnphuong56@gmail.com','0356823459','Long An');
insert into KhachHang (TenKH,Email,SDT,DiaChi)values(N'Nguyễn Thị Kim ngân','ngancute@gmail.com','0356842684',N'Hải Phòng');
insert into KhachHang (TenKH,Email,SDT,DiaChi)values(N'Phạm An nhiên','nhiennhienan@gmail.com','0782368235',N'Lào Cai');
insert into KhachHang (TenKH,Email,SDT,DiaChi)values(N'Nguyễn Phú trọng','trongtorngphu@gmail.com','0895621485',N'Lào Cai');
insert into KhachHang (TenKH,Email,SDT,DiaChi)values(N'Nguyễn Dương Ngọc trường','truongtruong56@gmail.com','0256854287',N'Nam Định');
insert into KhachHang (TenKH,Email,SDT,DiaChi)values(N'Thới Nguyễn phương','phuonthoinguyen@gmail.com','0723598234',N'Hải Dương');


insert into HoaDon(MaKH,MaNV,MaKM,TinhTrang) values ('1','1','KM002','Thanh toan');
insert into HoaDon(MaKH,MaNV,MaKM,TinhTrang) values ('1','2','KM005','Thanh toan');
insert into HoaDon(MaKH,MaNV,MaKM,TinhTrang) values ('1','2','KM002','Chua Thanh toan');
insert into HoaDon(MaKH,MaNV,MaKM,TinhTrang) values ('1','2','KM005','Thanh toan');
insert into HoaDon(MaKH,MaNV,MaKM,TinhTrang) values ('2','3','KM002','Thanh toan');
insert into HoaDon(MaKH,MaNV,MaKM,TinhTrang) values ('2','4','KM005','Thanh toan');
insert into HoaDon(MaKH,MaNV,MaKM,TinhTrang) values ('2','5','KM010','Thanh toan');
insert into HoaDon(MaKH,MaNV,MaKM,TinhTrang) values ('4','6','KM020','Thanh toan');
insert into HoaDon(MaKH,MaNV,MaKM,TinhTrang) values ('2','5','KM010','Thanh toan');




insert into CTHD values ('1','1','KM010','2','79182000');
insert into CTHD values ('2','2','KM005','2','79182000');
insert into CTHD values ('3','1','KM002','3','79182000');
insert into CTHD values ('4','3','KM010','5','79182000');
insert into CTHD values ('5','4','KM005','2','79182000');
insert into CTHD values ('6','2','KM010','1','79182000');
insert into CTHD values ('7','4','KM015','3','79182000');
insert into CTHD values ('8','4','KM020','2','79182000');
insert into CTHD values ('9','2','KM002','1','79182000');
insert into CTHD values ('1','5','KM002','1','79182000');
insert into CTHD values ('3','6','KM005','1','79182000');
insert into CTHD values ('9','7','KM002','1','79182000');
insert into CTHD values ('5','8','KM002','1','79182000');
insert into CTHD values ('1','8','KM002','1','79182000');
insert into CTHD values ('7','9','KM010','1','79182000');


insert into DanhGia values('1','1','1','khong co gi het','5');
insert into TonKho (MaDT,SoLuongTon) values ('1','20');
insert into TonKho (MaDT,SoLuongTon)values ('2','23');
insert into TonKho (MaDT,SoLuongTon)values ('3','42');
insert into TonKho (MaDT,SoLuongTon)values ('4','15');
insert into TonKho (MaDT,SoLuongTon)values ('5','21');
insert into TonKho (MaDT,SoLuongTon)values ('6','50');
insert into TonKho (MaDT,SoLuongTon)values ('7','43');
insert into TonKho (MaDT,SoLuongTon)values ('8','65');
insert into TonKho (MaDT,SoLuongTon)values ('9','34');
insert into TonKho (MaDT,SoLuongTon)values ('10','25');
insert into TonKho (MaDT,SoLuongTon)values ('11','76');
insert into TonKho (MaDT,SoLuongTon)values ('12','14');
insert into TonKho (MaDT,SoLuongTon)values ('13','35');
insert into TonKho (MaDT,SoLuongTon)values ('14','15');
insert into TonKho (MaDT,SoLuongTon)values ('15','24');
insert into TonKho (MaDT,SoLuongTon)values ('16','87');
insert into TonKho (MaDT,SoLuongTon)values ('17','57');
insert into TonKho (MaDT,SoLuongTon)values ('18','78');
insert into TonKho (MaDT,SoLuongTon)values ('19','54');
insert into TonKho (MaDT,SoLuongTon)values ('20','15');
insert into TonKho (MaDT,SoLuongTon)values ('21','56');
insert into TonKho (MaDT,SoLuongTon)values ('22','54');
insert into TonKho (MaDT,SoLuongTon)values ('23','35');
insert into TonKho (MaDT,SoLuongTon)values ('24','12');
insert into TonKho (MaDT,SoLuongTon)values ('25','45');
insert into TonKho (MaDT,SoLuongTon)values ('26','26');
insert into TonKho (MaDT,SoLuongTon)values ('27','34');
insert into TonKho (MaDT,SoLuongTon)values ('28','24');
insert into TonKho (MaDT,SoLuongTon)values ('29','41');
insert into TonKho (MaDT,SoLuongTon)values ('30','27');
insert into TonKho (MaDT,SoLuongTon)values ('31','31');
insert into TonKho (MaDT,SoLuongTon)values ('32','35');



insert into Img(img1,img2,img3,MaDT) values ('img/iphone/iPhone_11_Pro_Max1.png','img/iphone/iPhone_11_Pro_Max.png','img/iphone/iphone-11-pro-max-3.jpg',1);
insert into Img(img1,img2,img3,MaDT) values ('img/iphone/iPhone_11_Pro_Max1.png','img/iphone/iPhone_11_Pro_Max.png','img/iphone/iphone-11-pro-max-3.jpg',2);
insert into Img(img1,img2,img3,MaDT) values ('img/iphone/iPhone_11_Pro_Max1.png','img/iphone/iPhone_11_Pro_Max.png','img/iphone/iphone-11-pro-max-3.jpg',3);
insert into Img(img1,img2,img3,MaDT) values ('img/iphone/iPhone_11_Pro_Max1.png','img/iphone/iPhone_11_Pro_Max.png','img/iphone/iphone-11-pro-3.jpg',4);
insert into Img(img1,img2,img3,MaDT) values ('img/iphone/iPhone_11_Pro_Max1.png','img/iphone/iPhone_11_Pro_Max.png','img/iphone/iphone-11-pro-3.jpg',5);
insert into Img(img1,img2,img3,MaDT) values ('img/iphone/iphone-11.png','img/iphone/iphone-11-2.png','img/iphone/iphone-11-3.jpg',6);
insert into Img(img1,img2,img3,MaDT) values ('img/iphone/iphone-11.png','img/iphone/iphone-11-2.png','img/iphone/iphone-11-3.jpg',7);
insert into Img(img1,img2,img3,MaDT) values ('img/iphone/iphone-xs-max-1.png','img/iphone/iPhone-Xs-Max-2.png','img/iphone/iphone-xs-max-3.jpg',8);
insert into Img(img1,img2,img3,MaDT) values ('img/iphone/iphone-xs-max-1.png','img/iphone/iPhone-Xs-Max-2.png','img/iphone/iphone-xs-max-3.jpg',9);
insert into Img(img1,img2,img3,MaDT) values ('img/iphone/iphone-xs-max-1.png','img/iphone/iPhone-Xs-Max-2.png','img/iphone/iphone-xs-max-3.jpg',10);
insert into Img(img1,img2,img3,MaDT) values ('img/iphone/iphone-xs-max-1.png','img/iphone/iPhone-Xs-Max-2.png','img/iphone/iphone-xs-max-3.jpg',11);
insert into Img(img1,img2,img3,MaDT) values ('img/iphone/iphone-x.jpeg','img/iphone/iphone-x.png','img/iphone/iphone-x.jpg',12);
insert into Img(img1,img2,img3,MaDT) values ('img/samsung/samsung-galaxy-note-10.jpg','img/samsung/samsung-galaxy-note-10-2.png','img/samsung/samsung-galaxy-note-10-3.jpg',13);
insert into Img(img1,img2,img3,MaDT) values ('img/samsung/samsung-galaxy-note-10.jpg','img/samsung/samsung-galaxy-note-10-2.png','img/samsung/samsung-galaxy-note-10-3.jpg',15);
insert into Img(img1,img2,img3,MaDT) values ('img/samsung/samsung-galaxy-s10.jpg','img/samsung/samsung-galaxy-s10.jpg','img/samsung/samsung-galaxy-s10-3.jpg',14);
insert into Img(img1,img2,img3,MaDT) values ('img/samsung/samsung-galaxy-note-9.jpg','img/samsung/61seKW0ojYL._SX679_.jpg','img/samsung/samsung-galaxy-note-9-3.jpg',16);
insert into Img(img1,img2,img3,MaDT) values ('img/samsung/samsung-galaxy-a9-2018.png','img/samsung/samsung-galaxy-a9-2018.png','img/samsung/samsung-galaxy-a9-2018-9-1.jpg',17);
insert into Img(img1,img2,img3,MaDT) values ('img/huawei/p30.jpeg','img/huawei/p30-pro.jpg','img/huawei/p30-pro-3.jpg',18);
insert into Img(img1,img2,img3,MaDT) values ('img/huawei/p30-pro.jpg','img/huawei/HUAWEI-P30.jpg','img/huawei/p30-3.jpg',19);
insert into Img(img1,img2,img3,MaDT) values ('img/huawei/huawei-y9-prime-2019.jpg','img/huawei/huawei-y9-prime-2019-2.jpg','img/huawei/huawei-y9-prime-2019-tgdd-13.jpg',20);
insert into Img(img1,img2,img3,MaDT) values ('img/huawei/huawei-nova-3i-trang-1-400x460.png','img/huawei/nova-3i_vvwf-lr.jpg','img/huawei/huawei-nova-3i-ar-stickers.gif',21);
insert into Img(img1,img2,img3,MaDT) values ('img/huawei/huawei-y7-pro-2019-do-400x460.png','img/huawei/636816047325780051_huawei-y7-pro-xanh-1.png','img/huawei/Productpage-PC.jpg',22);
insert into Img(img1,img2,img3,MaDT) values ('img/xiaomi/xiaomi-mi-9-se-400x460.png','img/xiaomi/3fea35eb-c397-49ea-9565-11b39206e628.jpg','img/xiaomi/Xiaomi-Mi-9-SE-2.jpg',23);
insert into Img(img1,img2,img3,MaDT) values ('img/xiaomi/xiaomi-mi-9t-red-400x460.png','img/xiaomi/xiaomi-mi-9t-red-400x460.png','img/xiaomi/xiaomi-mi-9t-14.jpg',24);
insert into Img(img1,img2,img3,MaDT) values ('img/xiaomi/xiaomi-redmi-note-8-32gb-white-200x200.jpg','img/xiaomi/xiaomi-redmi-note-8-32gb-white-400x460.png','img/xiaomi/xiaomi-redmi-note-8-32gb-tgdd12.jpg',25);
insert into Img(img1,img2,img3,MaDT) values ('img/xiaomi/xiaomi-redmi-note-7-200x200.jpg','img/xiaomi/xiaomi-redmi-note-7-400x460.png','img/xiaomi/vi-vn-xiaomi-redmi-note-7-cauhinh.jpg',26);
insert into Img(img1,img2,img3,MaDT) values ('img/xiaomi/xiaomi-mi-a3-white-600x600.jpg','img/xiaomi/xiaomi-mi-a3-white-400x460.png','img/xiaomi/vi-vn-xiaomi-mi-a3-thietke.jpg',27);
insert into Img(img1,img2,img3,MaDT) values ('img/oppo/oppo-reno-10x-zoom-edition-black-600x600.jpg','img/oppo/1356032819.jpeg','img/oppo/oppo-reno-10x-zoom-edition5.jpg',28);
insert into Img(img1,img2,img3,MaDT) values ('img/oppo/5da6bbce2c99d-reno_2f_2.jpg','img/oppo/5da6bbce2c99d-reno_2f_2.jpg','img/oppo/1994689.jpeg',29);
insert into Img(img1,img2,img3,MaDT) values ('img/oppo/oppo-reno-pink-400x460.png','img/oppo/oppo-reno-pink-400x460.png','img/oppo/oppo-reno-tgdd-12.jpg',30);
insert into Img(img1,img2,img3,MaDT) values ('img/oppo/oppo-f11-pro-128gb-600x600.jpg','img/oppo/oppo-f11-pro-128gb-1-400x460.png','img/oppo/oppo-f11-pro-128gb-tgdd-18.jpg',31);
insert into Img(img1,img2,img3,MaDT) values ('img/oppo/oppo-a9-white-2-600x600.jpg','img/oppo/oppo-a9-white-1-400x460.png','img/oppo/vi-vn-oppo-a9-game-boost.jpg',32);
