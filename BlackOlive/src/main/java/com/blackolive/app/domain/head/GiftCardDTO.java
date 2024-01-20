package com.blackolive.app.domain.head;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GiftCardDTO {
	private String giftcardId;
	private String giftcardName;
	private String giftcardCategory;
	private String giftcardImgSrc;
}
