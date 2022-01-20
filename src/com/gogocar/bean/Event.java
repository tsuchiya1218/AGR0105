package com.gogocar.bean;

public class Event {
    private Integer eventId;

    private String eventStarttime;

    private String eventEndtime;

    private String eventImage;

    private String eventInfo;

    
    
    public Event(Integer eventId, String eventStarttime, String eventEndtime, String eventImage, String eventInfo) {
		super();
		this.eventId = eventId;
		this.eventStarttime = eventStarttime;
		this.eventEndtime = eventEndtime;
		this.eventImage = eventImage;
		this.eventInfo = eventInfo;
	}
    
    

	public Event() {
		super();
		// TODO 自動生成されたコンストラクター・スタブ
	}



	public Integer getEventId() {
        return eventId;
    }

    public void setEventId(Integer eventId) {
        this.eventId = eventId;
    }

    public String getEventStarttime() {
        return eventStarttime;
    }

    public void setEventStarttime(String eventStarttime) {
        this.eventStarttime = eventStarttime == null ? null : eventStarttime.trim();
    }

    public String getEventEndtime() {
        return eventEndtime;
    }

    public void setEventEndtime(String eventEndtime) {
        this.eventEndtime = eventEndtime == null ? null : eventEndtime.trim();
    }

    public String getEventImage() {
        return eventImage;
    }

    public void setEventImage(String eventImage) {
        this.eventImage = eventImage == null ? null : eventImage.trim();
    }

    public String getEventInfo() {
        return eventInfo;
    }

    public void setEventInfo(String eventInfo) {
        this.eventInfo = eventInfo == null ? null : eventInfo.trim();
    }



	@Override
	public String toString() {
		return "Event [eventId=" + eventId + ", eventStarttime=" + eventStarttime + ", eventEndtime=" + eventEndtime
				+ ", eventImage=" + eventImage + ", eventInfo=" + eventInfo + "]";
	}
    
    
}