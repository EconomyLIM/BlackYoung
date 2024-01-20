package com.blackolive.app.mapper.mainPage;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.mainPage.ExampleDTO1;
import com.blackolive.app.domain.productList.ProductContainer;
import com.blackolive.app.domain.signin.OliveUserDTO;


public interface MainPageMapper {
	
	
	public ExampleDTO1 getExample() throws SQLException;
	
	public OliveUserDTO selectUserInfo(@Param("userId")String userId);
	
	public List<String> similarUser(@Param("gender")int gender,@Param("skintoneId")String skintoneId, @Param("skintypeId")String skintypeId, @Param("beforeBirth")Date beforeBirth,@Param("afterBirth")  Date afterBirth);
	
	public List<String> similarProduct(@Param("userList")List<String>userList);
	
	public List<ProductContainer> similardispl(@Param("displList") List<String> displList);
	
	int insertUserView(@Param("userId")String userId, @Param("categoryMidId")String categoryMidId);
	
	int checkUserVIew(@Param("userId")String userId, @Param("categoryMidId")String categoryMidId);
	
	int updateUserView(@Param("userId")String userId, @Param("categoryMidId")String categoryMidId);
	
	public List<ProductContainer> selectUserVIew(@Param("userId")String userId, @Param("categoryMidId")List<String> categoryMidId);
	
	public List<String> selectcategoryMidId(@Param("userId")String userId);
} // class
