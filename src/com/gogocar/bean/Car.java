package com.gogocar.bean;

public class Car {
    private Integer id;

    private String carno;

    private String brandname;

    private String image;

    private String color;

    private String addtime;

    private String status;

    private String price;

    private String info;

    
    
    public Car(Integer id, String carno, String brandname, String image, String color, String addtime, String status,
			String price, String info) {
		super();
		this.id = id;
		this.carno = carno;
		this.brandname = brandname;
		this.image = image;
		this.color = color;
		this.addtime = addtime;
		this.status = status;
		this.price = price;
		this.info = info;
	}
    
    

	public Car() {
		super();
		// TODO 自動生成されたコンストラクター・スタブ
	}



	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCarno() {
        return carno;
    }

    public void setCarno(String carno) {
        this.carno = carno == null ? null : carno.trim();
    }

    public String getBrandname() {
        return brandname;
    }

    public void setBrandname(String brandname) {
        this.brandname = brandname == null ? null : brandname.trim();
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color == null ? null : color.trim();
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? null : addtime.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price == null ? null : price.trim();
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info == null ? null : info.trim();
    }



	@Override
	public String toString() {
		return "Car [id=" + id + ", carno=" + carno + ", brandname=" + brandname + ", image=" + image + ", color="
				+ color + ", addtime=" + addtime + ", status=" + status + ", price=" + price + ", info=" + info + "]";
	}
    
    
}