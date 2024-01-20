package com.blackolive.app.controller.brandPage;

import java.net.http.HttpRequest;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.blackolive.app.domain.brandPage.BrandPageDTO;
import com.blackolive.app.service.brandPage.BrandPageService;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping
@Log4j
public class BrandPageAjaxController {

    private final BrandPageService brandPageService;

    @Autowired
    public BrandPageAjaxController(BrandPageService brandPageService) {
        this.brandPageService = brandPageService;
    }

    // http://localhost/getSortBrands?brandId=br_00000107&dispcatno=cate_04&sort=p&_=1703051686107 
    @GetMapping( value =  "/getSortBrands",   produces = "application/text; charset=UTF-8") 
    //@ResponseBody
    public ResponseEntity<String> getSortBrands(
            @RequestParam("brandId") String brandId,
            @RequestParam("sort") String sort,
            @RequestParam("dispcatno") String dispcatno,
            @RequestParam(value = "numOfItems", defaultValue = "8") int numOfItems) {
        log.info("> brandId:" + brandId);
       // log.info("> dispcatno:" + dispcatno);
       // log.info("> sort:" + sort);
        
        

        try {
            List<BrandPageDTO> brandList = brandPageService.getSortBrands(brandId, sort, dispcatno, numOfItems);
            
            
            
            String brandPageHtml = brandPageService.createBrandPageHtml(brandId, sort, dispcatno, numOfItems);
            
            return new ResponseEntity<>(brandPageHtml, HttpStatus.OK);
        } catch (Exception e) {
            log.error("에러: " + e.getMessage());
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}