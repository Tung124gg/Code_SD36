create database SD36
go
use SD36

---create bảng chất liệu
create table ChatLieu
(
  
     Id_ChatLieu			UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
	 tenChatLieu			nvarchar(max)							null,
	 ghiChu					nvarchar(max)							null,						
	 ngayTao				Date									null,
	 ngaySua				Date									null,
	 trangThai				int										null

)



---create bảng Dây giầy
create table DayGiay
(

	Id_DayGiay					UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
	tenDayGiay					nvarchar(max)							null,
	chieuDaiDayGiay				nvarchar(max)						    null,	
	ghiChu						nvarchar(max)							null,
	ngayTao						Date									null,
	ngaySua						Date									null,
	trangThai					int										null

)

---create bảng thương hiệu
create table ThuongHieu
(

	Id_ThuongHieu					UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
	tenThuongHieu					nvarchar(max)							null,
	ghiChu							nvarchar(max)							null,
	ngayTao							Date									null,
	ngaySua							Date									null,
	trangThai						int										null

)

---create bảng Sản Phẩm

create table GiayTheThao
(
    Id_GiayTheThao              UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
	Id_ChatLieu					UNIQUEIDENTIFIER							,
	Id_LotGiay					UNIQUEIDENTIFIER							,
	Id_DeGiay					UNIQUEIDENTIFIER						    ,
	Id_DayGiay					UNIQUEIDENTIFIER							,
	Id_ThuongHieu				UNIQUEIDENTIFIER							,
	gioiTinh					nvarchar(5)								null,
	tenGiayTheThao				nvarchar(max)							null,
	giaBan						DECIMAL(20, 0) DEFAULT 0				null,
	soTienGiamGia				DECIMAL(20, 0) DEFAULT 0				null,
	moTa						nvarchar(max)							null,
	ghiChu						nvarchar(max)							null,
	ngayTao						Date									null,
	ngaySua						Date									null,
	trangThai					int										null
	 Constraint FK_GiayTheThao_ChatLieu					Foreign key(Id_ChatLieu)			References ChatLieu,
	 Constraint FK_GiayTheThao_LotGiay					Foreign key(Id_LotGiay)				References LotGiay,
	 Constraint FK_GiayTheThao_DayGiay					Foreign key(Id_DayGiay)				References DayGiay,
	 Constraint FK_GiayTheThao_ThuongHieu				Foreign key(Id_ThuongHieu)			References ThuongHieu,


)
---create bảng image
create table Image
(
	
	Id_Image              UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
	Id_GiayTheThao		  UNIQUEIDENTIFIER							,
	Url_Image			  nvarchar(max)							null,
	ghiChu			      nvarchar(max)							null,
	ngayTao				  Date								    null,
	ngaySua				  Date									null,
	trangThai			  int									null

	Constraint FK_Image_GiayTheThao					Foreign key(Id_GiayTheThao)		References GiayTheThao,

)
---create bảng chương trình giảm giá
create table ChuongTrinhGiamGiaGiayTheThao
(
	
	Id_ChuongTrinhGiamGiaGiayTheThao              UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
	tenChuongTrinhGiamGia						  nvarchar(max)							  null,
	phanTramGiam								  int									  null,
	ngayBatDau									  Date									  null,
	ngayKetThuc									  Date									  null,
	ghiChu										  nvarchar(max)							  null,
	ngayTao										  Date								      null,
	ngaySua										  Date									  null,
	trangThai									  int									  null

)
---create bảng chương trình giảm giá chi tiết giầy thể thao
create table ChuongTrinhGiamGiaChiTietGiayTheThao
(
	
	Id_ChuongTrinhGiamGiaChiTietGiayTheThao              UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
	Id_ChuongTrinhGiamGiaGiayTheThao					 UNIQUEIDENTIFIER							 ,
	Id_GiayTheThao										 UNIQUEIDENTIFIER							 ,
	soTienDaGiam										 DECIMAL(20, 0) DEFAULT 0				 null,
	ghiChu												 nvarchar(max)							 null,			
	ngayTao												 Date								     null,
	ngaySua												 Date									 null,
	trangThai											 int									 null

	Constraint FK_ChuongTrinhGiamGiaChiTietGiayTheThao_ChuongTrinhGiamGiaGiayTheThao		  Foreign key(Id_ChuongTrinhGiamGiaGiayTheThao)		References ChuongTrinhGiamGiaGiayTheThao,
	Constraint FK_ChuongTrinhGiamGiaChiTietGiayTheThao_GiayTheThao							  Foreign key(Id_GiayTheThao)						References GiayTheThao

)
---create bảng Size
create table Size
(
	
	Id_Size              UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
	size			     nvarchar(max)							 null,
	ghiChu				 nvarchar(max)							 null,
	ngayTao				 Date								     null,
	ngaySua				 Date									 null,
	trangThai			 int									 null

)
---create table Màu sắc
create table MauSac
(
	
	Id_MauSac              UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
	tenMauSac			   nvarchar(max)								null,
	ghiChu				   nvarchar(max)							null,
	ngayTao				   Date										null,
	ngaySua				   Date										null,
	trangThai			   int										null

)
---create bảng Chi tiết sản phẩm
create table GiayTheThaoChiTiet
(
	
	Id_GiayTheThaoChiTiet					UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
	Id_GiayTheThao							UNIQUEIDENTIFIER							,
	Id_Size									UNIQUEIDENTIFIER							,
	Id_MauSac								UNIQUEIDENTIFIER							,
	soLuong									int										null,	
	ghiChu									nvarchar(max)							null,	
	ngayTao									Date									null,
	ngaySua									Date									null,
	trangThai								int										null

	 Constraint FK_GiayTheThaoChiTiet_GiayTheThao			Foreign key(Id_GiayTheThao)			References GiayTheThao,
     Constraint FK_GiayTheThaoChiTiet_Size					Foreign key(Id_Size)				References Size,
     Constraint FK_ChiTietSanPham_MauSac					Foreign key(Id_MauSac)				References MauSac,

)
---create table User
create table Users
( 

        Id_User				  UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
		maUser				  nvarchar(20)							 unique,
	    Url_Image			  nvarchar(max)							   null,
		email			      nvarchar(50)							   null,
		matKhau				  nvarchar(30)							   null,
		tenUser				  nvarchar(30)							   null,
		gioiTinh			  nvarchar(5)							   null,
		ngaySinh              Date									   null,
		maCCCD				  nvarchar(30)							   null,
		hoKhau				  nvarchar(30)							   null,
		soDienThoai			  nvarchar(30)							   null,
		diaChi				  nvarchar(max)							   null,	
		ghiChu				  nvarchar(max)							   null,
		ngayTao				  Date									   null,
		ngaySua				  Date									   null,
		trangThai			  int									   null,
	    role				  nvarchar(30)							   null,


)
---create bảng 


create table KhachHang
(
 
       Id_KhachHang			  UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
	   maKhachHang			  nvarchar(30)							unique,
	   Url_Image			  nvarchar(max)							null,
	   email			      nvarchar(30)							   null,
	   matKhau				  nvarchar(30)							   null,
	   tenKhachHang			  nvarchar(max)							   null,
	   gioiTinh				  nvarchar(5)							   null,
	   ngaySinh				  Date									   null,
	   soDienThoai			  nvarchar(30)							   null,
	   diaChi				  nvarchar(max)							   null,
	   thanhPho				  nvarchar(max)							   null,
	   huyen				  nvarchar(max)							   null,
	   xa				      nvarchar(max)							   null,
	   ghiChu				  nvarchar(max)							   null,
	   ngayTao				  Date									   null,
	   ngaySua				  Date									   null,
	   trangThai			  int									   null,

)
---create bảng HoaDon
create table HoaDon
(
      Id_HoaDon						   UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
	  Id_KhachHang					   UNIQUEIDENTIFIER							   ,	
	  Id_User						   UNIQUEIDENTIFIER							   ,
	  maHoaDon						   nvarchar(50)							 unique,
	  thanhTien						   DECIMAL(20, 0) DEFAULT 0			       null,
	  phiShip						   DECIMAL(20, 0) DEFAULT 0			       null,
	  ghiChu						   nvarchar(max)						   null,
	  mess							   nvarchar(max)						   null,
	  ngayTao						   DATETIME								   null,
	  ngayThanhToan					   DATETIME								   null,
	  ngaySua						   DATETIME								   null,
	  hinhThuc						   int									   null,
	  hinhThucThanhToan				   int									   null,
	  trangThaiMoney				   int									   null,
	  trangThai					       int									   null,
	 Constraint FK_HoaDon_KhachHang						Foreign key(Id_KhachHang)			References KhachHang,
	 Constraint FK_HoaDon_Users							Foreign key(Id_User)				References Users,

)
---create bảng chương trình giảm giá hóa đơn
create table ChuongTrinhGiamGiaHoaDon
(
        Id_ChuongTrinhGiamGiaHoaDon			UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
		tenChuongTrinh						nvarchar(max)							null,
		phanTramGiam						int										null,
        soLuongSanPham						int										null,
		soTienHoaDon						DECIMAL(20, 0) DEFAULT 0				null,
		ngayBatDau							Date									null,
		ngayKetThuc							Date									null,
		ghiChu							    nvarchar(max)							null,
		ngayTao							    Date									null,
		ngaySua								Date									null,
		trangThai							int										null,

)
---create bảng chương trình giảm giá chi tiết hóa đơn
create table ChuongTrinhGiamGiaChiTietHoaDon
(
           Id_ChuongTrinhGiamGiaChiTietHoaDon			UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
           Id_ChuongTrinhGiamGiaHoaDon			        UNIQUEIDENTIFIER							,
		   Id_HoaDon									UNIQUEIDENTIFIER							,
		   soTienDaGiam									DECIMAL(20, 0) DEFAULT 0				null,
		   ghiChu										nvarchar(max)							null,
		   ngayTao										Date									null,
		   ngaySua										Date									null,
		   trangThai									int										null,
        
		Constraint FK_ChuongTrinhGiamGiaChiTietHoaDon_ChuongTrinhGiamGiaHoaDon  Foreign key(Id_ChuongTrinhGiamGiaHoaDon) References ChuongTrinhGiamGiaHoaDon,
		Constraint FK_ChuongTrinhGiamGiaChiTietHoaDon_HoaDon					Foreign key(Id_HoaDon) References HoaDon,
      
)
---create phiếu giảm giá hóa đơn
create table PhieuGiamGiaHoaDon
(
      Id_PhieuGiamGiaHoaDon							UNIQUEIDENTIFIER DEFAULT NEWID()	PRIMARY KEY,
	  tenPhieuGiamGiaHoaDon						    nvarchar(max)								null,
	  phanTramGiam									int											null,
	  ghiChu										nvarchar(max)								null,
	  ngayTao										Date										null,
	  ngaySua										Date										null,
	  trangThai									    int											null,

)
---create table bảng PhieuGiamGiaHoaDonChiTiet
create table PhieuGiamGiaHoaDonChiTiet
(

		Id_PhieuGiamGiaHoaDonChiTiet				UNIQUEIDENTIFIER DEFAULT NEWID()   PRIMARY KEY,
		Id_PhieuGiamGiaHoaDon						UNIQUEIDENTIFIER							  ,
		Id_HoaDon									UNIQUEIDENTIFIER							  ,
		tenPhieuGiamGiaHoaDonChiTiet				nvarchar(max)							    null,
		soTienHoaDonDaGiam							DECIMAL(20, 0) DEFAULT 0				    null,
		soLuongPhieu								int											null,								
		ghiChu										nvarchar(max)								null,
		ngayTao										Date										null,
	    ngaySua										Date										null,
	    trangThai									    int										null,

		Constraint FK_PhieuGiamGiaHoaDonChiTiet_PhieuGiamGiaHoaDon		Foreign key(Id_PhieuGiamGiaHoaDon) References PhieuGiamGiaHoaDon,
		Constraint FK_PhieuGiamGiaHoaDonChiTiet_HoaDon					Foreign key(Id_HoaDon) References HoaDon,
      
)
---create bảng Hóa Đơn Chi Tiết
create table HoaDonChiTiet
(
   
     Id_HoaDonChiTiet			UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
	 Id_HoaDon					UNIQUEIDENTIFIER							,
	 Id_GiayTheThaoChiTiet		UNIQUEIDENTIFIER							,
	 soLuong					int										 null,
	 donGia						DECIMAL(20, 0) DEFAULT 0			     null,	
     ghiChu						nvarchar(max)							 null,
	 ngayTao				    DATETIME								 null,
	 ngaySua					DATETIME								 null,
	 trangThai					int										 null,

	 Constraint FK_HoaDonChiTiet_HoaDon							Foreign key(Id_HoaDon)								References HoaDon,
	 Constraint FK_HoaDonChiTiet_GiayTheThaoChiTiet				Foreign key(Id_GiayTheThaoChiTiet)				References GiayTheThaoChiTiet,

)

---create bảng Giỏ Hàng
create table GioHang
(
			
      Id_GioHang				UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
	  Id_User					UNIQUEIDENTIFIER DEFAULT NEWID()			,
	  Id_KhachHang				UNIQUEIDENTIFIER DEFAULT NEWID()			,
	  ghiChu					nvarchar(max)							 null,
	  ngayTao					Date									 null,
	  ngaySua					Date									 null,
	  trangThai					int										 null,

	 Constraint FK_GioHang_KhachHang					Foreign key(Id_KhachHang)					References KhachHang,

)
---create bảng Giỏ hàng chi tiết
create table GioHangChiTiet
(
	
	 Id_GioHangChiTiet				UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
	 Id_GiayTheThaoChiTiet			UNIQUEIDENTIFIER DEFAULT NEWID(),
	 Id_GioHang						UNIQUEIDENTIFIER DEFAULT NEWID(),
	 soLuong					    int										null,
	 donGia							DECIMAL(20, 0) DEFAULT 0			    null,
	 donGiaKhiGiam					DECIMAL(20, 0) DEFAULT 0			    null,	
	 ngayTao						Date									null,
	 ngaySua						Date									null,
	 trangThai					    int									    null,

	 Constraint FK_GioHangChiTiet_GiayTheThaoChiTiet					Foreign key(Id_GiayTheThaoChiTiet)					References GiayTheThaoChiTiet,
	 Constraint FK_GioHangChiTiet_GioHang								Foreign key(Id_GioHang)								References GioHang,

)



---insert dữ liệu bảng chương trình giảm giá hóa đơn
insert into ChuongTrinhGiamGiaHoaDon(tenChuongTrinh, phanTramGiam , soLuongSanPham , soTienHoaDon , ngayBatDau , ngayKetThuc , ghiChu ,ngayTao, trangThai) values(N'Chương trình khai xuân giảm giá hóa đơn',5,4,300000,'2023-09-27','2023-10-01',N'Chương trình giảm giá có hạn','2023-09-27',1)
insert into ChuongTrinhGiamGiaHoaDon(tenChuongTrinh, phanTramGiam , soLuongSanPham , soTienHoaDon , ngayBatDau , ngayKetThuc , ghiChu ,ngayTao, trangThai) values(N'Chương trình vui tết trung thu',10,6,200000,'2023-09-27','2023-10-01',N'Chương trình giảm giá có hạn','2023-09-27',1)
insert into ChuongTrinhGiamGiaHoaDon(tenChuongTrinh, phanTramGiam , soLuongSanPham , soTienHoaDon , ngayBatDau , ngayKetThuc , ghiChu ,ngayTao, trangThai) values(N'Chương trình vui tết thiếu nhi 1/6',20,4,300000,'2023-09-27','2023-10-01',N'Chương trình giảm giá có hạn','2023-09-27',1)
insert into ChuongTrinhGiamGiaHoaDon(tenChuongTrinh, phanTramGiam , soLuongSanPham , soTienHoaDon , ngayBatDau , ngayKetThuc , ghiChu ,ngayTao, trangThai) values(N'Chương trình khai chương quán',5,4,300000,'2023-09-27','2023-10-01',N'Chương trình giảm giá có hạn','2023-09-27',1)

select * from ChuongTrinhGiamGiaHoaDon
---delete from ChuongTrinhGiamGiaHoaDon where Id_ChuongTrinhGiamGiaHoaDon = '20750783-4D49-4C6E-8CEA-FD720529EA35'
---delete from ChuongTrinhGiamGiaHoaDon

---insert dữ liệu bảng chương trình giảm giá giầy thể thao
insert into ChuongTrinhGiamGiaGiayTheThao(tenChuongTrinhGiamGia, phanTramGiam , ngayBatDau , ngayKetThuc , ghiChu ,ngayTao, trangThai) values(N'Chương trình giảm giá giầy thể thao 1/6',5,'2023-09-27','2023-10-01',N'Chương trình giảm giá có hạn','2023-09-27',1)
insert into ChuongTrinhGiamGiaGiayTheThao(tenChuongTrinhGiamGia, phanTramGiam , ngayBatDau , ngayKetThuc , ghiChu ,ngayTao, trangThai) values(N'Chương trình giảm giá giầy thể thao 2/6',8,'2023-09-27','2023-10-01',N'','2023-09-27',1)
insert into ChuongTrinhGiamGiaGiayTheThao(tenChuongTrinhGiamGia, phanTramGiam , ngayBatDau , ngayKetThuc , ghiChu ,ngayTao, trangThai) values(N'Chương trình giảm giá giầy thể thao ngày 6/6',7,'2023-09-27','2023-10-01',N'','2023-09-27',0)
insert into ChuongTrinhGiamGiaGiayTheThao(tenChuongTrinhGiamGia, phanTramGiam , ngayBatDau , ngayKetThuc , ghiChu ,ngayTao, trangThai) values(N'Chương trình giảm giá giầy thể thao ngày vàng nhân đôi 1/1',10,'2023-09-27','2023-10-01',N'','2023-09-27',1)

select * from ChuongTrinhGiamGiaGiayTheThao
---delete from ChuongTrinhGiamGiaGiayTheThao where Id_ChuongTrinhGiamGiaGiayTheThao 
---delete from ChuongTrinhGiamGiaGiayTheThao
---insert bảng chất liệu

insert into ChatLieu(tenChatLieu,ghiChu,ngayTao,ngaySua,trangThai) values(N'Chất liệu da Kangaroo',N'Chất liệu da sản phẩm này tốt','2023-12-12','',1)
insert into ChatLieu(tenChatLieu,ghiChu,ngayTao,ngaySua,trangThai) values(N'Chất liệu da bê',N'','2023-12-12','',0)
insert into ChatLieu(tenChatLieu,ghiChu,ngayTao,ngaySua,trangThai) values(N'Chất liệu da dê',N'Chất liệu da sản phẩm này tốt','2023-12-12','',0)
insert into ChatLieu(tenChatLieu,ghiChu,ngayTao,ngaySua,trangThai) values(N'Chất liệu da bò',N'Chất liệu cao cấp đắt tiền','2023-12-23','',1)
insert into ChatLieu(tenChatLieu,ghiChu,ngayTao,ngaySua,trangThai) values(N'Chất liệu da PU',N'Chất liệu da sản phẩm này tốt','2023-12-12','',1)
insert into ChatLieu(tenChatLieu,ghiChu,ngayTao,ngaySua,trangThai) values(N'Chất liệu da Microfiber',N'Chất liệu da cao cấp','2023-12-12','',0)
insert into ChatLieu(tenChatLieu,ghiChu,ngayTao,ngaySua,trangThai) values(N'Nikeskin',N'Chất liệu da sản phẩm này tốt','2023-12-12','',1)
insert into ChatLieu(tenChatLieu,ghiChu,ngayTao,ngaySua,trangThai) values(N'FluroSkin',N'Chất liệu da sản phẩm này tốt','2023-12-12','',1)
insert into ChatLieu(tenChatLieu,ghiChu,ngayTao,ngaySua,trangThai) values(N'Chất liệu K-Leather',N'','2023-12-12','',0)
insert into ChatLieu(tenChatLieu,ghiChu,ngayTao,ngaySua,trangThai) values(N'Chất liệu Calfskin Leather',N'Đắt tiền','2023-12-12','',1)

select * from ChatLieu
---insert into bảng lót giầy
insert into LotGiay(tenLotGiay,ghiChu,ngayTao,ngaySua,trangThai) values(N'Lót giầy Mika','Tốt','2021-12-12','',1)
insert into LotGiay(tenLotGiay,ghiChu,ngayTao,ngaySua,trangThai) values(N'Lót giầy Miko','Tốt','2021-12-12','',1)
insert into LotGiay(tenLotGiay,ghiChu,ngayTao,ngaySua,trangThai) values(N'Lót giầy Kamito','Tốt','2021-12-12','',1)
insert into LotGiay(tenLotGiay,ghiChu,ngayTao,ngaySua,trangThai) values(N'Lót giầy Mizuno','Tốt','2021-12-12','',1)
insert into LotGiay(tenLotGiay,ghiChu,ngayTao,ngaySua,trangThai) values(N'Lót giầy Unisex','Tốt','2021-12-12','',1)
insert into LotGiay(tenLotGiay,ghiChu,ngayTao,ngaySua,trangThai) values(N'Lót giầy Ximo','Tốt','2021-12-12','',1)
insert into LotGiay(tenLotGiay,ghiChu,ngayTao,ngaySua,trangThai) values(N'Lót giầy thể thao 4D','Tốt','2021-12-12','',1)
insert into LotGiay(tenLotGiay,ghiChu,ngayTao,ngaySua,trangThai) values(N'Lót giầy thể thao 5D','Tốt','2021-12-12','',1)
insert into LotGiay(tenLotGiay,ghiChu,ngayTao,ngaySua,trangThai) values(N'Lót giầy thể thao Xilones','Tốt','2021-12-12','',1)

select * from LotGiay


---insert into dây giầy
insert into DayGiay(tenDayGiay,chieuDaiDayGiay,ghiChu,ngayTao,ngaySua,trangThai) values(N'Dây dây Mizuno xanh','800mm','','','',1)
insert into DayGiay(tenDayGiay,chieuDaiDayGiay,ghiChu,ngayTao,ngaySua,trangThai) values(N'Dây dây Mika ','1m','','','',1)
insert into DayGiay(tenDayGiay,chieuDaiDayGiay,ghiChu,ngayTao,ngaySua,trangThai) values(N'Dây dây Miko ','600mm','','','',1)
insert into DayGiay(tenDayGiay,chieuDaiDayGiay,ghiChu,ngayTao,ngaySua,trangThai) values(N'Dây dây Unisex ','600mm','','','',1)
insert into DayGiay(tenDayGiay,chieuDaiDayGiay,ghiChu,ngayTao,ngaySua,trangThai) values(N'Dây dây Ximo ','850mm','','','',1)
insert into DayGiay(tenDayGiay,chieuDaiDayGiay,ghiChu,ngayTao,ngaySua,trangThai) values(N'Dây dây 4D ','1m2','','','',1)
insert into DayGiay(tenDayGiay,chieuDaiDayGiay,ghiChu,ngayTao,ngaySua,trangThai) values(N'Dây dây 6D ','300mm','','','',1)
insert into DayGiay(tenDayGiay,chieuDaiDayGiay,ghiChu,ngayTao,ngaySua,trangThai) values(N'Dây dây cao cấp ','400mm','','','',1)
insert into DayGiay(tenDayGiay,chieuDaiDayGiay,ghiChu,ngayTao,ngaySua,trangThai) values(N'Dây dây vải ','1m2','','','',1)
select * from DayGiay

---insert into thương hiệu 

insert into ThuongHieu(tenThuongHieu,ghiChu,ngayTao,ngaySua,trangThai) values(N'Like',N'Cao cấp','2023-12-12','',1)
insert into ThuongHieu(tenThuongHieu,ghiChu,ngayTao,ngaySua,trangThai) values(N'Mizuno',N'Cao cấp','2023-12-12','',1)
insert into ThuongHieu(tenThuongHieu,ghiChu,ngayTao,ngaySua,trangThai) values(N'GuGCi',N'Cao cấp','2023-12-12','',1)
insert into ThuongHieu(tenThuongHieu,ghiChu,ngayTao,ngaySua,trangThai) values(N'Mika',N'Cao cấp','2023-12-12','',1)
insert into ThuongHieu(tenThuongHieu,ghiChu,ngayTao,ngaySua,trangThai) values(N'Miko',N'Cao cấp','2023-12-12','',1)
insert into ThuongHieu(tenThuongHieu,ghiChu,ngayTao,ngaySua,trangThai) values(N'Simo',N'Cao cấp','2023-12-12','',1)
insert into ThuongHieu(tenThuongHieu,ghiChu,ngayTao,ngaySua,trangThai) values(N'Kamito',N'Cao cấp','2023-12-12','',1)
insert into ThuongHieu(tenThuongHieu,ghiChu,ngayTao,ngaySua,trangThai) values(N'UNisex',N'Cao cấp','2023-12-12','',1)

select * from ThuongHieu

---insert dữ liệu bảng giầy thể thao
---insert into dữ liệu bảng màu sắc 
insert into MauSac(tenMauSac,ghiChu,ngayTao,ngaySua,trangThai) values(N'Đỏ','','','','')
insert into MauSac(tenMauSac,ghiChu,ngayTao,ngaySua,trangThai) values(N'Cam','','','','')
insert into MauSac(tenMauSac,ghiChu,ngayTao,ngaySua,trangThai) values(N'Xanh','','','','')
insert into MauSac(tenMauSac,ghiChu,ngayTao,ngaySua,trangThai) values(N'Vàng','','','','')
insert into MauSac(tenMauSac,ghiChu,ngayTao,ngaySua,trangThai) values(N'Tím','','','','')
insert into MauSac(tenMauSac,ghiChu,ngayTao,ngaySua,trangThai) values(N'Hường','','','','')

---insert into dữ liệu bảng size
insert into Size(size,ghiChu,ngayTao,ngaySua,trangThai) values('38','','','','')
insert into Size(size,ghiChu,ngayTao,ngaySua,trangThai) values('39','','','','')
insert into Size(size,ghiChu,ngayTao,ngaySua,trangThai) values('40','','','','')
insert into Size(size,ghiChu,ngayTao,ngaySua,trangThai) values('41','','','','')
insert into Size(size,ghiChu,ngayTao,ngaySua,trangThai) values('42','','','','')
insert into Size(size,ghiChu,ngayTao,ngaySua,trangThai) values('43','','','','')
insert into Size(size,ghiChu,ngayTao,ngaySua,trangThai) values('44','','','','')
insert into Size(size,ghiChu,ngayTao,ngaySua,trangThai) values('45','','','','')



INSERT INTO KhachHang (maKhachHang, Url_Image, email, matKhau, tenKhachHang, gioiTinh, ngaySinh, soDienThoai, diaChi, thanhPho, huyen, xa, ghiChu, ngayTao, ngaySua, trangThai)
VALUES 
    ('KH001', NULL, 'khach1@example.com', 'password1', 'Nguyen Van A', 'Nam', '1990-01-01', '0123456789', '123 Main St', 'Hanoi', 'Hoan Kiem', 'Dong Xuan', 'VIP customer', '2024-10-01', NULL, 1),
    ('KH002', NULL, 'khach2@example.com', 'password2', 'Le Thi B', 'Nu', '1992-02-02', '0987654321', '456 Side St', 'HCMC', 'District 1', 'Ben Nghe', 'Regular customer', '2024-10-02', NULL, 1),
    ('KH003', NULL, 'khach3@example.com', 'password3', 'Tran Van C', 'Nam', '1985-03-03', '0112233445', '789 Another St', 'Da Nang', 'Hai Chau', 'Thach Thang', 'New customer', '2024-10-03', NULL, 0),
    ('KH004', NULL, 'khach4@example.com', 'password4', 'Pham Thi D', 'Nu', '1998-04-04', '0122334455', '321 Market St', 'Hue', 'Phu Vang', 'Phu Thuong', 'Frequent buyer', '2024-10-04', NULL, 1),
    ('KH005', NULL, 'khach5@example.com', 'password5', 'Vo Van E', 'Nam', '2000-05-05', '0988776655', '654 River Rd', 'Can Tho', 'Ninh Kieu', 'An Khanh', 'Preferred customer', '2024-10-05', NULL, 1);

select * from Users
---insert dữ liệu cho bảng giầy thể thao

SELECT SUM(hd.thanhTien) FROM HoaDon hd WHERE hd.trangThai = 3
select sum(hd.thanhTien) from HoaDon hd
SELECT COUNT(hd.maHoaDon) FROM HoaDon hd WHERE hd.trangThai = 3 

SELECT SUM(h.soLuong * h.donGia) FROM HoaDonChiTiet h
SELECT SUM(sp.soLuong) FROM GiayTheThaoChiTiet sp



select * from MauSac
select * from Image
select * from GioHang
select * from Size
select * from MauSac
select * from GiayTheThao 
select * from GiayTheThaoChiTiet 

select * from KhachHang
select * from HoaDon
select * from GiayTheThaoChiTiet
select * from HoaDonChiTiet

select * from GioHang
select * from GioHangChiTiet
select * from HoaDon
select * from HoaDonChiTiet

delete from GioHangChiTiet
delete from HoaDon
delete from HoaDonChiTiet



select * from GiayTheThaoChiTiet
select * from Users
select * from KhachHang
select * from Users


--- 1 là trạng thái đã được kích hoạt
--- 0 là trạng thái chưa được kích hoạt

select * from ChuongTrinhGiamGiaChiTietGiayTheThao
select * from ChuongTrinhGiamGiaGiayTheThao

---Ghi chú
/*
  Trạng thái của chương trình giảm giá giầy thể thao 

   1		: là còn hạn
  -1		: là hết hạn
*/

select * from ChuongTrinhGiamGiaHoaDon


/*

			delete from GiayTheThao 
			delete from GiayTheThaoChiTiet
			delete from Image
			delete from GioHang 
			delete from GioHangChiTiet where Id_GiayTheThaoChiTiet = 'A4FA1D36-6F37-4BDC-82DA-5BA961052725'
			delete from KhachHang where Id_KhachHang = 'E4FDA8D1-0099-462B-A0DB-F7545A786B4E'
			delete from GioHang where Id_GioHang = '51DE497D-9652-4B0C-B5A2-AE0AC5E99988'
			delete from HoaDon
			delete from HoaDonChiTiet
			delete from Users
			delete from ChuongTrinhGiamGiaChiTietGiayTheThao
			delete from ChuongTrinhGiamGiaGiayTheThao
			delete from ChuongTrinhGiamGiaChiTietHoaDon
			delete from ChuongTrinhGiamGiaHoaDon
			delete from ViTien
			delete from GiaoDichViChiTiet
 
*/


/*

   Chú thích:

   Hóa đơn sẽ có các trạng thái 

   Hình thức (Mua hàng) --- hinhThuc
				 
				  0 : là oneline
			      1 : là tại quầy

  Hình thức thanh toán(Hình thức thanh toán)   --- hinhThucThanhToan
				
				  0: là thanh toán tại quầy
				  1: là thanh toán bằng ví điện tử
				  2: là thanh toán bằng momo
				  3: là thanh toán khi nhận hàng

   TrangThaiMoney (Trạng thái thanh toán) ---trangThaiMoney

			      0	: là chưa thanh toán
				  1	: là đã thanh toán

   Trạng thái (Trạng thái đơn hàng)  ---trangThai
			
				  0: là chưa thanh toán xong
				  1: là chờ xác nhận
				  2: là đang đóng gói hàng
				  3: là đang giao
				  4: là giao hàng thành công
				  5: là hủy đơn hàng

*/
select * from GiayTheThao
delete GiayTheThao where tenGiayTheThao = 'Nike Air Force'
select * from Users
select * from KhachHang
Insert into Users(maUser, email, matKhau, tenUser, gioiTinh, ngaySinh, soDienThoai, diaChi, trangThai, role)
values (N'NV001','tungnv@gmail.com',123456789, 'tung01', N'Nam', '2003-11-11', 0968433742, N'namdinh', 0, 'ADMIN')

-- on
select * from hoadon where maHoaDon = 'MaHD233750' 
--off
select * from hoadon where maHoaDon = 'MaHD05957'