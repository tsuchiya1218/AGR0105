package com.gogocar.bean;

public class Carorder {
    private Integer id;

    private Integer userId;

    private Integer carId;

    private String orderPrice;

    private String startTime;

    private String endTime;

    private String orderStatus;

    
    
    public Carorder(Integer id, Integer userId, Integer carId, String orderPrice, String startTime, String endTime,
			String orderStatus) {
		super();
		this.id = id;
		this.userId = userId;
		this.carId = carId;
		this.orderPrice = orderPrice;
		this.startTime = startTime;
		this.endTime = endTime;
		this.orderStatus = orderStatus;
	}
    
    

	public Carorder() {
		super();
		// TODO 自動生成されたコンストラクター・スタブ
	}



	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCarId() {
        return carId;
    }

    public void setCarId(Integer carId) {
        this.carId = carId;
    }

    public String getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(String orderPrice) {
        this.orderPrice = orderPrice == null ? null : orderPrice.trim();
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime == null ? null : startTime.trim();
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime == null ? null : endTime.trim();
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus == null ? null : orderStatus.trim();
    }


	@Override
	public String toString() {
		return "Order [id=" + id + ", userId=" + userId + ", carId=" + carId + ", orderPrice=" + orderPrice
				+ ", startTime=" + startTime + ", endTime=" + endTime + ", orderStatus=" + orderStatus + "]";
	}
    
    
}