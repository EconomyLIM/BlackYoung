<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/inc/include.jspf" %>

<fieldset class="search-period mgT30">
		
		<div class="select_con">
			<p>구매기간</p>
			<ul class="select-month">
				<li class="on"><button type="button" data-month="-1">1개월</button></li>
				<li><button type="button" data-month="-3">3개월</button></li>
				<li><button type="button" data-month="-6">6개월</button></li>
				<li><button type="button" data-month="-12">12개월</button></li>
				
			</ul>
			
			
			<div class="select-range">
				<select id="cal-start-year" title="년도를 선택하세요" style="width:76px;"></select>
				<label for="cal-start-year">년</label>
				
				<select id="cal-start-month" title="달월을 선택하세요" style="width:60px;"></select>
				<label for="cal-start-month">월</label>
				
				<select id="cal-start-day" title="날일을 선택하세요" style="width:60px;"></select>
				<label for="cal-start-day">일</label>
				
				<span class="des">~</span>
				
				<select id="cal-end-year" title="년도를 선택하세요" style="width:76px;"></select>
				<label for="cal-end-year">년</label>
				
				<select id="cal-end-month" title="달월을 선택하세요" style="width:60px;"></select>
				<label for="cal-end-month">월</label>
				
				<select id="cal-end-day" title="날일을 선택하세요" style="width:60px;"></select>
				<label for="cal-end-day">일</label>
			</div>
		</div>
		 
		<button type="button" class="btnLookup" id="do-search-period">조회</button>
	</fieldset>
