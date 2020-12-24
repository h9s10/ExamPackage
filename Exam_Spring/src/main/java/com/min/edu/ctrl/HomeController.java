package com.min.edu.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.min.edu.dtos.Answerboard_DTO;
import com.min.edu.dtos.Member_DTO;
import com.min.edu.model.Answerboard_IService;
import com.min.edu.model.Member_IService;

@Controller
public class HomeController {

	@Autowired
	private Answerboard_IService aiService;
	
	@Autowired
	private Member_IService miService;
	
	// 로그인 화면으로 이동
	@RequestMapping(value="/loginForm.do", method=RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}
	
	// 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(Member_DTO dto,HttpServletResponse response, HttpSession session) throws IOException {
		Member_DTO loginDto = miService.loginMember(dto);
		if(loginDto == null) { // 로그인에 실패할 경우 alert로 메세지를 띄워준 후 다시 로그인페이지로 이동
			response.setContentType("text/html; charset=UTF-8;");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('잘못된 입력정보 입니다.')</script>;");
			out.flush();
			return "loginForm";
		}else { // 로그인에 성공할 경우 게시글 전체보기 페이지로 이동
			session.setAttribute("loginDto", loginDto);
			return "redirect:/boardList.do";
		}
	}
	
	// 로그아웃
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		Member_DTO mDto = (Member_DTO)session.getAttribute("loginDto");
		if(mDto != null) {
			session.removeAttribute("loginDto");
		}
		return "redirect:/loginForm.do";
	}
	
	// 회원가입 페이지로 이동
	@RequestMapping(value = "/signupForm.do", method = RequestMethod.GET)
	public String signupForm() {
		return "signupForm";
	}
	
	// 회원가입
	@RequestMapping(value="/signup.do", method=RequestMethod.POST)
	public String signup(Member_DTO dto, HttpServletResponse response) throws IOException {
		boolean isc = miService.signupMember(dto);
		if(isc) { // 회원가입에 성공할 경우 로그인 페이지로 이동
			return "redirect:/loginForm.do";
		}else { // 회원가입에 실패할 경우 alert로 메세지를 띄워줌
			response.setContentType("text/html; charset=UTF-8;");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('잘못된 입력정보 입니다.')</script>;");
			out.flush();
			return null;
		}
	}

	// 아이디 중복 체크 (중복된 아이디라면 true)
	@RequestMapping(value="/idChk.do", method = RequestMethod.POST)
	@ResponseBody
	public String idChk(String id) {
		boolean isc = miService.idDuplicateCheck(id);
		return isc?"true":"false";
	}
	
	// 전체 글 목록 페이지로 이동
	@RequestMapping(value = "/boardList.do", method=RequestMethod.GET)
	public String boardList(Model model) {
		List<Answerboard_DTO> lists = null;
		Map<String, String> map = null;	
		lists= aiService.selectDynamic(map);
		model.addAttribute("lists", lists);
		return "boardList";
	}
	
	// 상세글 페이지로 이동
	@RequestMapping(value = "/boardOne.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardOne(Model model, String seq) {
		Map<String, String> map= new HashMap<String, String>();
		map.put("seq", seq);
		List<Answerboard_DTO> lists = aiService.selectDynamic(map);
		model.addAttribute("lists", lists);
		
		Answerboard_DTO dto = aiService.selectDetailBoard(seq);
		model.addAttribute("dto", dto);
		
		return "boardOne";
	}
	
	// 상세 글 삭제
	@RequestMapping(value = "/del.do", method= RequestMethod.GET)
	public String del(String[] seq, Model model) {
		int cnt = aiService.multiDelete(seq);
		if(cnt>0) {
			return "redirect:/boardList.do";
		}else {
			return "error";
		}
	}
	
	
	// 글 수정 페이지로 이동
	@RequestMapping(value = "/modifyForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String modifyForm(Model model, String seq) {
		Answerboard_DTO dto = aiService.selectDetailBoard(seq);
		model.addAttribute("dto", dto);
		
		
		Map<String, String> map= new HashMap<String, String>();
		map.put("seq", seq);
		List<Answerboard_DTO> lists = aiService.selectDynamic(map);
		model.addAttribute("lists", lists);
		
		return "modifyForm";
	}
	
	// 글 수정
	@RequestMapping(value = "/modify.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String modify(Model model, String seq, String content) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq", seq);
		map.put("content", content);
		model.addAttribute("seq", seq);
		boolean isc = aiService.modifyBoard(map);
		return isc?"redirect:/boardList.do":"error";
	}
	
	// 답글 입력 페이지로 이동
	@RequestMapping(value = "/replyForm.do", method =  {RequestMethod.POST, RequestMethod.GET})
	public String replyForm(Model model, String seq) {
		Answerboard_DTO dto = aiService.selectDetailBoard(seq);
		model.addAttribute("dto", dto);
		return "replyForm";
	}
	
	// 답글 입력
	@RequestMapping(value = "/reply.do", method =  RequestMethod.POST)
	public String reply(Model model, String seq,String id, String title, String content) {
		Answerboard_DTO dto = new Answerboard_DTO(Integer.parseInt(seq), id, title, content);
		model.addAttribute("seq",seq);
		boolean isc = aiService.reply(dto);
		if(isc) {
			return "redirect:/boardList.do";
		}else {
			return "error";
		}
	}
	
	// 다중삭제
	@RequestMapping(value = "/multidel.do", method = RequestMethod.POST)
	public String multidel(String[] ch, Model model) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("seqs", ch);
		aiService.multiDelete2(map);
		
		List<Answerboard_DTO> lists = null;
		Map<String, String> maps = null;	
		lists= aiService.selectDynamic(maps);
		model.addAttribute("lists", lists);
		return "redirect:/boardList.do"; 
	}
	
	// 새글 작성 페이지로 이동
	@RequestMapping(value = "/writeFrom.do", method = RequestMethod.GET)
	public String writeFrom() {
		return "writeFrom";
	}
	
	// 새글 작성
	@RequestMapping(value="/write.do" , method = RequestMethod.POST)
	public String write(String id, String title, String content, Model model) {
		Answerboard_DTO dto = new Answerboard_DTO(id, title, content);
		aiService.insertBoard(dto);
		
		List<Answerboard_DTO> lists = null;
		Map<String, String> maps = null;	
		lists= aiService.selectDynamic(maps);
		model.addAttribute("lists", lists);
		return "redirect:/boardList.do";
	}
	
}
