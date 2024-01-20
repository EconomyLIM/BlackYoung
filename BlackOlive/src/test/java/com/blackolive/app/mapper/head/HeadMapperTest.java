package com.blackolive.app.mapper.head;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.blackolive.app.domain.head.ExampleDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class HeadMapperTest {
	
	@Autowired
	private HeadMapper headMapper;

	@Test
	public void test() {
		 try {
			ExampleDTO dto = this.headMapper.getExample();
			log.info(">>>> " + dto);
		} catch (SQLException e) { 
			e.printStackTrace();
		}
		 
	}

}
