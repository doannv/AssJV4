package entity;

public class Product {
	private String masp;
	private String maloai;
	private String tensp;
	private String img;
	private int gia;
	private int soluong;
	private String chitiet;
	private String ghichu;
	public Product(String masp, String maloai, String tensp, String img, int gia, int soluong, String chitiet,
			String ghichu) {
		super();
		this.masp = masp;
		this.maloai = maloai;
		this.tensp = tensp;
		this.img = img;
		this.gia = gia;
		this.soluong = soluong;
		this.chitiet = chitiet;
		this.ghichu = ghichu;
	}
	public Product() {
		
	}
	public String getMasp() {
		return masp;
	}
	public void setMasp(String masp) {
		this.masp = masp;
	}
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	public String getTensp() {
		return tensp;
	}
	public void setTensp(String tensp) {
		this.tensp = tensp;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public String getChitiet() {
		return chitiet;
	}
	public void setChitiet(String chitiet) {
		this.chitiet = chitiet;
	}
	public String getGhichu() {
		return ghichu;
	}
	public void setGhichu(String ghichu) {
		this.ghichu = ghichu;
	}
	
}
