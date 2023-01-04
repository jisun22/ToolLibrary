package com.naver.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ToolController {
	@Autowired
	private ToolDAO toolDAO;   

	@Autowired
	private MyPageDAO myPageDAO;   
	
	
	@RequestMapping( value="/toolRentDetail.do" )
	public ModelAndView toolRentDetail(
			@RequestParam(value="toolNo") int toolNo
			,@RequestParam(value="jijumNo") int jijumNo
			) {
		ModelAndView mav = new ModelAndView();
		
		List<Map> jijums = this.toolDAO.getToolDetailFromJijum(jijumNo);
		List<Map> tools = this.toolDAO.getToolDetailFromTool(toolNo);
		
		//System.out.print(jijums.get(0));
		//System.out.print(tools.get(0));
		mav.addObject("tools",tools.get(0));
		mav.addObject("jijums",jijums.get(0));
		
		mav.setViewName("toolRentDetail.jsp");
		
		return mav;
	
	}	
	
	@RequestMapping( value="/toolRentBook.do" )
	public ModelAndView toolRentBook(

			@RequestParam(value="toolNo") int toolNo
			,@RequestParam(value="jijumNo") int jijumNo
			,HttpSession session
			) {
		ModelAndView mav = new ModelAndView();
		List<Map> jijums = this.toolDAO.getToolDetailFromJijum(jijumNo);
		List<Map> tools = this.toolDAO.getToolDetailFromTool(toolNo);
		

		String email = (String)session.getAttribute("email");

		List<Map<String,String>> memberInfo =  this.myPageDAO.getMemberInfo(email);

		
		mav.addObject("tools",tools.get(0));
		mav.addObject("jijums",jijums.get(0));
		mav.addObject("memberInfo",memberInfo);
		
		
		
		mav.setViewName("toolRentBook.jsp");
		
		return mav;
	}
	
	
	/*
	@RequestMapping( value="/toolRentMainForm.do")
	public ModelAndView toolRentMainForm() {
		
		ModelAndView  mav = new ModelAndView();
		
		List<Map> jijums =  this.toolDAO.getJijum();
		//List<Map> locations =  this.toolDAO.getLocation();
		List<Map> bigSorts =  this.toolDAO.getBigSort();
		List<Map> smallSorts =  this.toolDAO.getSmallSort();
		List<Map> toolLists =  this.toolDAO.getToolList();
		//mav.addObject("locations", locations);
		mav.addObject("jijums", jijums);
		mav.addObject("bigSorts", bigSorts);
		mav.addObject("smallSorts", smallSorts);
		mav.addObject("toolLists", toolLists);
		
		mav.setViewName("toolRentMainForm.jsp");
		return mav;
	}*/
	
	@RequestMapping( value="/toolRentMainForm.do")
	public ModelAndView toolRentMainForm(
			
			@RequestParam(value="selJijumNo", required=false ) Object selJijumNo  
				,@RequestParam(value="selBigSort", required=false ) Object selBigSort
				,@RequestParam(value="selKeyword", required=false ) Object selKeyword
				,@RequestParam(value="selSmallSort", required=false ) Object selSmallSort
				,@RequestParam(value="selPageCnt", required=false ) Object selPageCnt
			) {
		
		ModelAndView  mav = new ModelAndView();
		if(selJijumNo==null) {selJijumNo = "";}
		if(selBigSort==null) {selBigSort = "";}
		if(selKeyword==null) {selKeyword = "";}
		if(selSmallSort==null) {selSmallSort="";}
		if(selPageCnt==null) {selPageCnt="1";}
		
		
		Map searchList = new HashMap();
		Map searchList2 = new HashMap();
		searchList.put("selJijumNo", selJijumNo);
		searchList.put("selBigSort", selBigSort);
		searchList.put("selKeyword", selKeyword);
		searchList.put("selSmallSort", selSmallSort);
		int i = Integer.valueOf((String) selPageCnt);
		
		//int startCnt = 0;
		//int endCnt = 1000;

		//searchList.put("startCnt", startCnt);
		//searchList.put("endCnt", endCnt);
		
		
		
		int startCnt = i*10-9;
		
		int endCnt = i*10;
		//List<Map> toolLists2 =  this.toolDAO.getToolList(searchList2);
	
		
		
		
		searchList.put("startCnt", startCnt);
		searchList.put("endCnt", endCnt);
		//System.out.print(searchList.get("selJijumNo"));
		//System.out.print(toolDTO.getSelJijumNo());
		//System.out.print(toolDTO.getSelBigSort());
		//System.out.print(toolDTO.getSelSmallSort());
		//System.out.print(toolDTO.getSelKeyword());
	
		//System.out.print(selJijumNo.getClass());
		//System.out.print(Integer.valueOf((String)selJijumNo) );
		
		//mav.addObject("selJijumNo",toolDTO.getSelJijumNo());
		//mav.addObject("selBigSort",toolDTO.getSelBigSort());
		//mav.addObject("selSmallSort",toolDTO.getSelSmallSort());
		//mav.addObject("selKeyword",toolDTO.getSelKeyword());
		List<Map> jijums =  this.toolDAO.getJijum();
		List<Map> bigSorts =  this.toolDAO.getBigSort();
		List<Map> smallSorts =  this.toolDAO.getSmallSort();
		List<Map> toolLists =  this.toolDAO.getToolList(searchList);
		List<Map> toolLists2 =  this.toolDAO.getToolList2(searchList);
		mav.addObject("jijums", jijums);
		mav.addObject("bigSorts", bigSorts);
		mav.addObject("smallSorts", smallSorts);
		mav.addObject("toolLists", toolLists);
		mav.addObject("selPageCnt",selPageCnt);
		System.out.print(toolLists2.size());
		mav.addObject("toolLists2",toolLists2);
		//mav.addObject("toolLists2", toolLists2 );
		mav.setViewName("toolRentMainForm.jsp");
		return mav;
	}
	/*
	@RequestMapping( value="/toolRentMainForm.do")
	public ModelAndView toolRentMainForm(
			
		//	@RequestParam(value="selJijumNo", required=false ) int selJijumNo
		//	,@RequestParam(value="selBigSort", required=false ) int selBigSort

		//	,@RequestParam(value="selSmallSort", required=false ) int selSmallSort
		//	,@RequestParam(value="selKeyword", required=false ) String selKeyword
			) {
		ModelAndView  mav = new ModelAndView();
		List<Map> jijums =  this.toolDAO.getJijum();
		//List<Map> locations =  this.toolDAO.getLocation();
		List<Map> bigSorts =  this.toolDAO.getBigSort();
		List<Map> smallSorts =  this.toolDAO.getSmallSort();
		List<Map> toolLists =  this.toolDAO.getToolList();
		//mav.addObject("locations", locations);
		//mav.addObject("selJijumNo", selJijumNo);
		//mav.addObject("selBigSort", selBigSort);
		//mav.addObject("selSmallSort", selSmallSort);
		//mav.addObject("selKeyword", selKeyword);
		//mav.setViewName("toolRentMainForm.jsp");
		return mav;
	}*/
	
	
	
	
	
	
	
	
	
	
	@RequestMapping( value="/upToolStatusProc.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8")

	@ResponseBody
	public int toolStatusProc(

			@RequestParam(value="toolNo") int toolNo
			,@RequestParam(value="jijumNo") int jijumNo

			,@RequestParam(value="selectedDate") String selectedDate
			,@RequestParam(value="toolName") String toolName
			,HttpSession session
			) {
		
		int upToolCnt = this.toolDAO.upToolStatus(toolNo);
		System.out.print("그래도 요기까진");
		Map bookInfo = new HashMap();
		
		bookInfo.put("email",(String)session.getAttribute("email"));
		bookInfo.put("toolNo",toolNo);
		bookInfo.put("jijumNo",jijumNo);
		bookInfo.put("selectedDate",selectedDate);
		bookInfo.put("toolName",toolName);
		System.out.print("요기도?");
		System.out.print(bookInfo);
		
		int insertOnBookingCnt = this.toolDAO.insertToolRentBooktoOnBooking(bookInfo);
		
		
		int resultCnt = upToolCnt + insertOnBookingCnt;
		
		
		
		
		
		return resultCnt;
	}
	
	
	
	
}
