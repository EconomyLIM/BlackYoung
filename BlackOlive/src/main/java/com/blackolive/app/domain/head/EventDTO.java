package com.blackolive.app.domain.head;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EventDTO {
	private String eventId;
	private String proDisplayId;
	private String eventTitle;
	private String eventSubTitle;
	private String eventDetail;
	private String eventType;
	private String eventCategory;
	private String eventImgSrc;
	private String eventDetailImgSrc;
	private Date eventStartdate;
	private Date eventEnddate;
	private String eventVideoSrc;
}
