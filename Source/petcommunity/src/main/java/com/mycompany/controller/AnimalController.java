package com.mycompany.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.AnimalVO;
import com.mycompany.domain.MemberVO;
import com.mycompany.domain.MyBuyVO;
import com.mycompany.service.AnimalService;
import com.mycompany.service.BuyService;
import com.mycompany.util.FileUpload;

@Controller
public class AnimalController {

	@Autowired
	private AnimalService animalService;
	@Autowired
	private BuyService buyService;

	/* 
	    * 함수 이름 : animalinsert
	    * 주요 기능 : 반려동물 등록 하는 페이지
	    * 함수 내용 : 로그인 되어 있는 상태에서 해당 세션에 저장된 memberId값과
	    * 		     넘겨받은 반려동물의 정보를 DB에 저장. 
	    * 		     이미지 업로드시 animalId로 디렉토리를 만들어서 파일을 저장.
	    * 
	    *         참고사항 : mycompany.util.FileUpload (이미지파일 업로드)
	    */
	@RequestMapping(value = "animalinsert.do", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	public ModelAndView animalinsert(AnimalVO vo, HttpServletRequest request, MultipartHttpServletRequest mtfRequest)
			throws IOException {

		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("memberVO");

		ModelAndView mv = new ModelAndView();
		int result = animalService.animalinsert(vo, mvo);

		FileUpload.makeDirectory(request.getSession().getServletContext().getRealPath("resources/imgs") + "/animal/");
		FileUpload.uploadFiles(mtfRequest, request.getSession().getServletContext().getRealPath("resources/imgs")
				+ "/animal/" + vo.getAnimalId() + "/");

		if (result > 0) {
			mv.addObject("result", result);
			mv.setViewName("animalresult");

			return mv;
		} else {
			mv.addObject("result", result);
			mv.setViewName("mypageAnimal");
			return mv;
		}
	}

	/* 
	    * 함수 이름 : animalSelect
	    * 주요 기능 : 마이페이지 클릭시 정보 불러옴
	    * 함수 내용 : 로그인 후 마이페이지 클릭시 해당 세션에 저장된 값으로 
	    * 		  animal의 정보와 buy정보를 가져와서 해당 animalId 경로의 이미지를  AnimalVO에  set해줌.
	    */
	@RequestMapping(value = "mypageselect.do")
	public ModelAndView animalSelect(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
		
		List<AnimalVO> list = animalService.animalSelect(mvo);
		
		List<MyBuyVO> list2=buyService.buyList(mvo);
		 	 
		for (AnimalVO i : list) {

			String directoryPath = req.getSession().getServletContext().getRealPath("resources/imgs") + "/animal/"
					+ i.getAnimalId();

			File dir = new File(directoryPath);
			File fileList[] = dir.listFiles();

			if (fileList != null) {
				for (File file : fileList) {
					i.setImgAnimal(file.getName());
				}
			}
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("animalList", list);
		mv.addObject("buyList", list2); 
		mv.setViewName("mypage");
		return mv;

	}

	
	/* 
	    * 함수 이름 : animalDelete
	    * 주요 기능 : 반려동물 정보 삭제
	    * 함수 내용 : 마이페이지에서 삭제하고 싶은 animalId를 받아서 삭제함.
	    * 		     해당 이미지 파일 삭제시 utill.FileUpload 함수를 통해 디렉토리 삭제. 
	    */
	@RequestMapping(value = "animalDelete.do")
	public String animalDelete(AnimalVO vo, HttpServletRequest req) {
		animalService.animalDelete(vo);
		FileUpload.deleteDirectory(
				req.getSession().getServletContext().getRealPath("resources/imgs") + "/animal/" + vo.getAnimalId());
		return "redirect:/mypageselect.do";
	}

	
	/* 
	    * 함수 이름 : animalUpdate
	    * 주요 기능 : 반려동물 정보 수정
	    * 함수 내용 : 마이페이지 동물정보 수정 변경시 수정되는 데이터를 받아서 Update후 다시 마이페이지로 연결
	    */
	@RequestMapping(value = "animalUpdate.do")
	public String animalUpdate(AnimalVO vo) {

		animalService.animalUpdate(vo);
		return "redirect:/mypageselect.do";

	}

}