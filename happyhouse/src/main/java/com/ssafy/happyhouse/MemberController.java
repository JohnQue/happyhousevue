package com.ssafy.happyhouse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.JwtService;
import com.ssafy.happyhouse.model.service.MemberService;

@CrossOrigin(origins = {"*"}, maxAge = 6000)
@RestController
@RequestMapping(value = "/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private JwtService jwtService;

	@PostMapping("/confirm/login")
	public ResponseEntity<Map<String, Object>> login(@RequestBody MemberDto memberDto, HttpServletResponse res, HttpSession session){
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = null;
		try {
			MemberDto loginUser = memberService.login(memberDto);
			
			if(loginUser != null) {
				String token = jwtService.create(loginUser);
				
				resultMap.put("auth-token", token);
				resultMap.put("user-id", loginUser.getUserid());
				resultMap.put("user-name", loginUser.getName());
				resultMap.put("user-type", loginUser.getUserType());
				status = HttpStatus.ACCEPTED;
			} else {
				resultMap.put("message", "로그인 실패");
				status = HttpStatus.ACCEPTED;
			}
		}catch(Exception e) {
			resultMap.put("message", e.getMessage());
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String,Object>>(resultMap, status);
	}
	
	@PostMapping(value = "/confirm/join")
	public void join(@RequestBody MemberDto memberDto) throws Exception {
		System.out.println(memberDto);
		memberService.join(memberDto);
	}
//	
//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public String login(@RequestParam Map<String, String> map, HttpSession session) {
//		try {
//			System.out.println(map.get("userid")+ " " +map.get("password"));
//			MemberDto memberDto = ser.login(map);
//			System.out.println(memberDto.getUserid());
//			if(memberDto != null) {
//				session.setAttribute("userinfo", memberDto);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return "redirect:/";
//	}
//	
//	@RequestMapping(value = "/logout", method = RequestMethod.GET)
//	public String logout(HttpSession session) {
//		session.invalidate();
//		return "redirect:/";
//	}
//	
//	@RequestMapping(value = "/register", method = RequestMethod.POST)
//	public String register(MemberDto dto) {
//		try {
//			ser.register(dto);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "redirect:/";
//	}
//	
//	@RequestMapping(value = "/update", method = RequestMethod.GET)
//	public String update() {
//		return "member/update";
//	}	
//	
//	@RequestMapping(value = "/updateComplete", method = RequestMethod.POST)
//	public String updateComplete(MemberDto dto) {
//		System.out.println(dto);
//		try {
//			ser.update(dto);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "redirect:/";
//	}
//	
	@GetMapping(value = "/admin")
	public List<MemberDto> admin() {
		return memberService.selectAll();
	}
	
	@DeleteMapping(value = "/admin/{userid}")
	public void delete(@PathVariable String userid) throws Exception {
		memberService.delete(userid);
	}
//	
//	@GetMapping(value = "/delete")
//	public String delete(@RequestParam("id") String id, Model model) {
//		try {
//			ser.delete(id);
//			return "redirect:/member/admin";
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("msg", "글삭제 처리 중 문제가 발생했습니다.");
//			return "error/error";
//		}
//	}
	
}
