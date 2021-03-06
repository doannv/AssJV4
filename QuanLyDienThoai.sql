CREATE DATABASE ManagerPhone
USE [ManagerPhone]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 03/03/2018 15:36:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoai] [varchar](50) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
 CONSTRAINT [LoaiSanPham_pk] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai]) VALUES (N'IPHONE', N'Điện thoại iphone')
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai]) VALUES (N'LENOVO', N'Điện thoại lenovo')
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai]) VALUES (N'OPPO', N'Điện thoại oppo')
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai]) VALUES (N'SAMSUNG', N'Điện thoại sam sung')
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai]) VALUES (N'VIVO', N'Điện thoại vivo')
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 03/03/2018 15:36:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[Rol] [int] NOT NULL,
 CONSTRAINT [TaiKhoan_pk] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [MatKhau], [HoTen], [GioiTinh], [DiaChi], [Rol]) VALUES (N'admin', N'admin', N'Huan Pham', N'Nam', N'Nam Dinh', 1)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [MatKhau], [HoTen], [GioiTinh], [DiaChi], [Rol]) VALUES (N'Huanpham', N'huanpham', N'Pham Van Huan', N'Nam ', N'Nam Dinh', 1)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [MatKhau], [HoTen], [GioiTinh], [DiaChi], [Rol]) VALUES (N'KhachHang', N'khachhang', N'Khach Hang', N'Nam', N'Ha Noi', 2)
/****** Object:  Table [dbo].[SanPham]    Script Date: 03/03/2018 15:36:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [varchar](50) NOT NULL,
	[MaLoai] [varchar](50) NOT NULL,
	[TenSanPham] [nvarchar](50) NOT NULL,
	[Anh] [varchar](200) NULL,
	[DonGia] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[ChiTiet] [nvarchar](1000) NOT NULL,
	[GhiChu] [nvarchar](50) NOT NULL,
 CONSTRAINT [SanPham_pk] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoai], [TenSanPham], [Anh], [DonGia], [SoLuong], [ChiTiet], [GhiChu]) VALUES (N'SP1', N'oppo', N'oppo1', NULL, 2002, 10, N'laksdiaisdjjasnnzxck', N'like new')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoai], [TenSanPham], [Anh], [DonGia], [SoLuong], [ChiTiet], [GhiChu]) VALUES (N'SP2', N'Iphone', N'iphone 4s', N'', 202, 21, N'adoanv', N'like new')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoai], [TenSanPham], [Anh], [DonGia], [SoLuong], [ChiTiet], [GhiChu]) VALUES (N'SP3', N'lenovo', N'lenovo1', NULL, 2010, 10, N'1010', N'101')
/****** Object:  Table [dbo].[HoaDon]    Script Date: 03/03/2018 15:36:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaTaiKhoan] [varchar](50) NOT NULL,
	[NgayMuaHang] [datetime] NOT NULL,
	[TongTien] [nvarchar](50) NOT NULL,
	[TrangThai] [int] NOT NULL,
 CONSTRAINT [HoaDon_pk] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDonChiTiet]    Script Date: 03/03/2018 15:36:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDonChiTiet](
	[MaHoaDonCt] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [int] NOT NULL,
	[MaSanPham] [varchar](50) NOT NULL,
	[SoLuong] [int] NOT NULL,
 CONSTRAINT [HoaDonChiTiet_pk] PRIMARY KEY CLUSTERED 
(
	[MaHoaDonCt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_HoaDon_TaiKhoan]    Script Date: 03/03/2018 15:36:42 ******/
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_TaiKhoan] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([MaTaiKhoan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_TaiKhoan]
GO
/****** Object:  ForeignKey [FK_HoaDonChiTiet_HoaDon]    Script Date: 03/03/2018 15:36:42 ******/
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonChiTiet_HoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonChiTiet] CHECK CONSTRAINT [FK_HoaDonChiTiet_HoaDon]
GO
/****** Object:  ForeignKey [FK_HoaDonChiTiet_SanPham]    Script Date: 03/03/2018 15:36:42 ******/
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonChiTiet_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonChiTiet] CHECK CONSTRAINT [FK_HoaDonChiTiet_SanPham]
GO
/****** Object:  ForeignKey [FK_SanPham_LoaiSanPham]    Script Date: 03/03/2018 15:36:42 ******/
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSanPham] ([MaLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
SELECT * FROM dbo.SanPham
