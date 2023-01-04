create database db_TMDT
use db_TMDT

create table tblKhachHang
(
 iMaKH int identity(1,1),
 sHoTen nvarchar(50) not null,
 sTaiKhoan varchar(50) unique,
 sMatKhau varchar(50) not null,
 sDiaChi nvarchar(100),
 sDienThoai varchar(15),
 constraint PK_KH primary key(iMaKH)
)

create table tblLoaiHang
(
 iMaLH int identity(1,1),
 sTenLoaiHang nvarchar(50) not null,
 constraint PK_LoaiHang primary key(iMaLH)
)

create table tblNoiBan
(
 iMaNoiBan int identity(1,1),
 sTenNoiBan nvarchar(50) not null,
 sDiaChi nvarchar(100),
 sTaiKhoan varchar(50),
 sMatKhau varchar(50) not null,
 sDiaChi nvarchar(100),
 sDienThoai varchar(15),
 constraint PK_NoiBan primary key(iMaNoiBan)
)

create table tblHang
(
 iMaHang int identity(1,1),
 sTenHang nvarchar(100) not null,
 fGiaBan float check(fGiaBan >=0),
 sMoTa nvarchar(Max),
 AnhBia varchar(50),
 iSoLuongCon int,
 iMaLH int,
 iMaNoiBan int,
 constraint PK_Hang primary key(iMaHang),
 constraint FK_LoaiHang foreign key(iMaLH) references tblLoaiHang(iMaLH),
 constraint FK_NoiBan foreign key(iMaNoiBan) references tblNoiBan(iMaNoiBan)
)

create table tblDonDatHang
(
 iMaDonHang int identity(1,1),
 bDaThanhToan bit,
 bTinhTrangGiaoHang bit,
 dNgayDat date default getdate(),
 dNgayGiao date default getdate()+3,
 iMaKH int,
 constraint PK_DonDatHang primary key(iMaDonHang),
 constraint FK_KhachHang foreign key(iMaKH) references tblKhachHang(iMaKH)
)

create table tblChiTietDonDatHang
(
 iMaDonHang int,
 iMaHang int,
 iSoLuong int check(iSoLuong>0),
 fDonGia float check(fDonGia>0),
 constraint PK_ChiTietDonDatHang primary key(iMaDonHang,iMaHang),
 constraint FK_DonDatHang foreign key(iMaDonHang) references tblDonDatHang(iMaDonHang),
 constraint FK_Hang foreign key(iMaHang) references tblHang(iMaHang)
)

alter trigger trgCapNhatSoLuongHang
on tblChiTietDonDatHang
for insert, update
as
begin
declare @SLmua int, @maHang int,@SlCon int
select @SLmua=iSoLuong, @maHang=iMaHang  from inserted
select @SlCon=iSoLuongCon from tblHang where iMaHang=@maHang
if(@SLmua < @SlCon)
begin
	update tblHang
	set iSoLuongCon=iSoLuongCon-@SLmua
	where iMaHang=@maHang
end
else
begin
 print N'Số lượng mua vượt quá số lượng còn'
 rollback tran
end
end

create proc prThemKH(@hoten nvarchar(50),@taikhoan varchar(50),@matkhau varchar(50),@diachi nvarchar(100),@sdt varchar(15))
as
begin
	insert into tblKhachHang
	values(@hoten,@taikhoan,@matkhau,@diachi,@sdt)
end

exec prThemKH N'Vương Quang Huy','huy123','12345',N'Hà Nội','0123456789'


create proc prThemLoaiHang(@tenLH nvarchar(50))
as
begin
	insert into tblLoaiHang
	values(@tenLH)
end

exec prThemLoaiHang N'Đồ điện tử'
exec prThemLoaiHang N'Đồ cho trẻ'
exec prThemLoaiHang N'Quần áo'
exec prThemLoaiHang N'Đồ gia dụng'

create proc prThemNoiBan(@tennoiban nvarchar(50),@diachi nvarchar(100))
as
begin
	insert into tblNoiBan
	values(@tennoiban,@diachi)
end

exec prThemNoiBan 'VinMart',N'Hà Nội'

create proc prThemHang(@tenhang nvarchar(50),@giaban float, @mota nvarchar(max),@anhbia varchar(50),@soluongcon int,@maLh int,@manoiban int)
as
begin
	insert into tblHang
	values(@tenhang,@giaban,@mota,@anhbia,@soluongcon,@maLh,@manoiban)
end

exec prThemHang 'SamSung Galaxy S20',30000000,N'Bộ nhớ 128Gb','SSS20.jpg',2,1,1
exec prThemHang 'SamSung Galaxy S22 ultra',30000000,N'Bộ nhớ 128Gb','s22ultra.jpg',3,1,1
exec prThemHang 'Áo trẻ em',100000,N'Áo khoác','aotreem.jpg)',3,2,1
exec prThemHang 'Áo da nam',200000,N'Áo da','aodanam.jpg)',3,3,1
exec prThemHang 'Chảo chống dính tefal',250000,N'Chảo chống dính tefal','chaochongdinhtefal.jpg)',3,4,1

create proc prThemDonDatHang(@thanhtoan bit,@giaohang bit,@maKH int)
as
begin
	insert into tblDonDatHang(bDaThanhToan,bTinhTrangGiaoHang,iMaKH)
	values(@thanhtoan,@giaohang,@maKH)
end

exec prThemDonDatHang 0,0,1

select * from tblDonDatHang

create proc prThemChiTietDonDatHang(@madonhang int,@mahang int,@sl int,@dongia float)
as
begin
	insert into tblChiTietDonDatHang
	values(@madonhang,@mahang,@sl,@dongia)
end

exec prThemChiTietDonDatHang 1,2,1,30000000
exec prThemChiTietDonDatHang 1,3,1,30000000



create proc themTKKhachHang(@hoten nvarchar(50),@taikhoan varchar(50),@matkhau varchar(50),@diachi nvarchar(100),@sdt varchar(15))
as
begin
	insert into tblKhachHang(sHoTen, sTaiKhoan,sMatKhau,sDiaChi,sDienThoai)
	values(@hoten,@taikhoan,@matkhau,@diachi,@sdt)
end


create proc laytkKhachHang_TK_Mk(@taikhoan varchar(50),@matkhau varchar(50))
as
begin
	select * 
	from tblKhachHang
	where sTaiKhoan=@taikhoan and sMatKhau=@matkhau
end

create proc laytkKhachHang_TK(@taikhoan varchar(50))
as
begin
	select * 
	from tblKhachHang
	where sTaiKhoan=@taikhoan
end

create proc quenMK(@taikhoan varchar(50),@matkhau varchar(50))
as
begin
	update tblKhachHang
	set sMatKhau=@matkhau
	where sTaiKhoan=@taikhoan
end

create proc themTKBanHang(@tennoiban nvarchar(50),@taikhoan varchar(50),@matkhau varchar(50),@diachi nvarchar(100),@sdt varchar(15))
as
begin
	insert into tblNoiBan(sTenNoiBan,sTaiKhoan,sMatKhau,sDiaChi,sDienThoai)
	values(@tennoiban,@taikhoan,@matkhau,@diachi,@sdt)
end

create proc laytkBanHang_TK_Mk(@taikhoan varchar(50),@matkhau varchar(50))
as
begin
	select * 
	from tblNoiBan
	where sTaiKhoan=@taikhoan and sMatKhau=@matkhau
end


create proc layToanBoMatHang
as
begin
	select *
	from tblHang
end

create proc layMatHangTheoMa(@maMH int)
as
begin
	select *
	from tblHang
	where iMaHang=@maMH
end

create proc layMatHangTheoMavahientennhacc(@maMH int)
as
begin
	select *
	from tblHang, tblNoiBan
	where iMaHang=@maMH and tblHang.iMaNoiBan=tblNoiBan.iMaNoiBan
end 

exec layMatHangTheoMavahientennhacc 2

create proc layLoaiHangDienTu
as
begin
	select *
	from tblHang
	where iMaLH=1
end

create proc layLoaiHangDoTreem
as
begin
	select *
	from tblHang
	where iMaLH=2
end

create proc layLoaiHangQuanAo
as
begin
	select *
	from tblHang
	where iMaLH=3
end

create proc layLoaiHangDoGiaDung
as
begin
	select *
	from tblHang
	where iMaLH=4
end

create proc TimKiem(@filter nvarchar(100))
as
begin
	select *
	from tblHang
	where sTenHang like N'%chảo%'
end

exec TimKiem 'SamSung'

create view vvHang_LoaiHang
as
	select tblLoaiHang.iMaLH,sTenLoaiHang,iMaHang,sTenHang,sMoTa,AnhBia,fGiaBan,iSoLuongCon,iMaNoiBan
	from tblLoaiHang,tblHang
	where tblLoaiHang.iMaLH=tblHang.iMaLH

create proc prLayHangHoaTheoNguoiBan(@taikhoan varchar(50))
as
begin
	declare @manoiban int
	select @manoiban=iMaNoiBan
	from tblNoiBan
	where @taikhoan=sTaiKhoan
	select iMaHang, sTenHang,sTenLoaiHang,AnhBia,sMoTa,iSoLuongCon,fGiaBan
	from vvHang_LoaiHang
	where iMaNoiBan=@manoiban

end

exec prLayHangHoaTheoNguoiBan 'FPTShop@gmail.com'


create proc themSp(@tenhang nvarchar(100),@gia float,@mota nvarchar(max),@anh varchar(50),@soluong int,@maLH int,@manoiban int)
as
begin
	insert into tblHang(sTenHang,fGiaBan,sMoTa,AnhBia,iSoLuongCon,iMaLH,iMaNoiBan)
	values (@tenhang,@gia,@mota,@anh,@soluong,@maLH,@manoiban)
end

create proc suaSp(@maMH int,@tenhang nvarchar(100),@gia float,@mota nvarchar(max),@anh varchar(50),@soluong int,@maLH int)
as
begin
	update tblHang
	set sTenHang=@tenhang,fGiaBan=@gia,sMoTa=@mota,AnhBia=@anh,iSoLuongCon=@soluong,iMaLH=@maLH
	where iMaHang=@maMH
end

create proc xoaSp(@maMH int)
as
begin
	delete from tblHang
	where iMaHang=@maMH
end


create proc layLoaiHang
as
begin
	select * from tblHang
end