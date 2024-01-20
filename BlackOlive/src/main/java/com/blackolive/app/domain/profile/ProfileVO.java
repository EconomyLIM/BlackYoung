package com.blackolive.app.domain.profile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProfileVO {
	
	private String nickname;				//프로필 닉네임
	private String profileContent;			//프로필 소개
	private String skintoneId;				//프로필 스킨톤 id
	private String skintoneName;			//프로필 스킨톤 이름
	private String skintypeId;				//프로필 스킨타입 id
	private String skintypeName;			//프로필 스킨타입 이름
	private String profileImg;				//프로필 이미지
	
	private int reviewLikeTotal;			//리뷰 도움이 되요 총 개수
	private int follower;					//프로필 팔로워 수
	private int following;					//프로필 팔로잉 수
	
}
