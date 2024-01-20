package com.blackolive.app.service.counselor;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blackolive.app.domain.counselor.Criteria;
import com.blackolive.app.domain.counselor.FaqVO;
import com.blackolive.app.domain.counselor.noticeVO;
import com.blackolive.app.mapper.counselor.CounselorFaqMapper;
import com.blackolive.app.mapper.counselor.CounselorNoticeMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CounselorServiceImpl implements CounselorService {

	@Autowired
	private CounselorFaqMapper faqMapper;
	
	@Autowired
	private CounselorNoticeMapper noticeMapper;
	
	//faq
	@Override
	public List<FaqVO> faqlistwithMinorservice(String askCategoryMajor, String askCategoryMinor, Criteria criteria) throws ClassNotFoundException, SQLException {
		log.info(">> faqlistwithMinorservice called");
		return this.faqMapper.faqlistwithMinor(askCategoryMajor, askCategoryMinor, criteria);
	}

	@Override
	public List<FaqVO> faqlistwithMajorservice(String askCategoryMajor, Criteria criteria) throws ClassNotFoundException, SQLException {
		log.info(">> faqlistwithMajorservice called");
		return this.faqMapper.faqlistwithMajor(askCategoryMajor, criteria);
	}

	@Override
	public int getTotalservice(Criteria criteria) throws ClassNotFoundException, SQLException {
		log.info(">> getTotal called");
		String keyword = criteria.getKeyword();
		return this.faqMapper.getTotal(keyword);
	}

	@Override
	public List<FaqVO> faqlistsearchwithpagingservice(Criteria criteria) throws ClassNotFoundException, SQLException {
		log.info(">> faqlistsearchwithpaging called");		
		return this.faqMapper.faqlistsearchwithpaging(criteria);
	}

	@Override
	public int getMinorTagTotalservice(String askCategoryMajor, String askCategoryMinor)
			throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return this.faqMapper.getMinorTagTotal(askCategoryMajor, askCategoryMinor);
	}

	@Override
	public int getMajorTagTotalservice(String askCategoryMajor) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return this.faqMapper.getMajorTagTotal(askCategoryMajor);
	}

	
	//공지사항
	@Override
	public List<noticeVO> getNoticeListservice(Criteria criteria) throws ClassNotFoundException, SQLException {
		
		return this.noticeMapper.getnoticeList(criteria);
	}
	
	
	@Override
	public int noticetotal(Criteria criteria) throws ClassNotFoundException, SQLException {
		
		return this.noticeMapper.getnoticetotal(criteria);
	}

	@Override
	public noticeVO getNoticeDetailservice(String noticeId) throws ClassNotFoundException, SQLException {
		
		return this.noticeMapper.getnoticedetail(noticeId);
	}

	@Override
	public List<noticeVO> getNoticewithcategoryservice(Criteria criteria, String tabs)
			throws ClassNotFoundException, SQLException {
		
		return this.noticeMapper.getnoticewithcategory(criteria, tabs);
	}


}
