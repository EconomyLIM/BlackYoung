package com.blackolive.app.domain.head;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MsgCardDTO {
	private String msgCardId;
	private String msgCardCategory;
	private String msgCardSrc;
}
