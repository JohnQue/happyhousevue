package com.ssafy.happyhouse;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.AttentionDto;
import com.ssafy.happyhouse.model.service.AttentionService;

/**
 * 모든 RestAPI구현 클래스는 SelectALL, SelectOne 먼저, 그다음 Insert, Update, Delete 순으로 메소드 나열
 * @author multicampus
 *
 */
@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/attention")
public class AttentionController {

	@Autowired
	private AttentionService ser;

	@GetMapping(headers = { "Content-type=application/json" })
	public List<AttentionDto> selectAll() throws Exception {
		return ser.selectAll();
//		String spp = map.get("spp");
//		map.put("spp", spp != null ? spp : "10");
//		try {
//			List<AttentionDto> list = ser.selectAll();
//			PageNavigation pageNavigation = ser.makePageNavigation(map);
//			return list;
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}
	
	@GetMapping(value = "/{no}", headers = { "Content-type=application/json" })
	public AttentionDto selectOneByNo(@PathVariable int no) throws Exception {
		return ser.selectOneByNo(no);
	}
	
	@PostMapping(headers = { "Content-type=application/json" })
	public void insert(@RequestBody AttentionDto qna) throws Exception {
		ser.insert(qna);
	}

	@PutMapping(headers = { "Content-type=application/json" })
	public void update(@RequestBody AttentionDto qna) throws Exception {
		ser.update(qna);
	}

	@DeleteMapping(value = "/{no}", headers = { "Content-type=application/json" })
	public void delete(@PathVariable int no) throws Exception {
		ser.delete(no);
	}

//	@PostMapping(value = "/write")
//	public String write(AttentionDto attentionDto, Model model, HttpSession session) {
//		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
//		if(memberDto != null) {
//			attentionDto.setWriter(memberDto.getUserid());
//			try {
//				service.create(attentionDto);
//				return "redirect:/attention";
//			} catch (Exception e) {
//				e.printStackTrace();
//				model.addAttribute("msg", "글작성 중 문제가 발생했습니다.");
//				return "error/error";
//			}
//		}
//		else {
//			model.addAttribute("msg", "로그인 후 사용 가능한 페이지입니다.");
//			return "error/error";
//		}
//	}
//	
//	
//	@GetMapping
//	public String list(@RequestParam Map<String, String> map, Model model) {
//		String spp = map.get("spp");
//		map.put("spp", spp != null ? spp : "10");
//		try {
//			List<AttentionDto> list = service.listAttention(map);
////			PageNavigation pageNavigation = service.makePageNavigation(map);
//			model.addAttribute("attentions", list);
////			model.addAttribute("navigation", pageNavigation);
//			return "attention/attentionList";
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			model.addAttribute("msg", "글목록 생성 중 문제가 발생했습니다.");
//			return "error/error";
//		}
//		
//	}
//	
//	@GetMapping(value = "/modify")
//	public String modify(@RequestParam("no") int no, Model model) {
//		try {
//			AttentionDto attentionDto = service.getAttention(no);
//			model.addAttribute("attention", attentionDto);
//			return "attention/attentionModify";
//			} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("msg", "글수정 처리 중 문제가 발생했습니다.");
//			return "error/error";
//			}
//	}
//	
//	@PostMapping(value = "/modify")
//	public String modify(AttentionDto attentionDto, Model model, HttpSession session) {
//		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
//		if(memberDto != null) {
//			attentionDto.setWriter(memberDto.getUserid());
//			try {
//					service.update(attentionDto);
//					return "redirect:/attention";
//				} catch (Exception e) {
//					e.printStackTrace();
//					model.addAttribute("msg", "글수정중 문제가 발생했습니다.");
//					return "error/error";
//				}
//			} else {
//			model.addAttribute("msg", "로그인 후 사용 가능한 페이지입니다.");
//			return "error/error";
//		}
//	}
//	
//	@GetMapping(value = "/delete")
//	public String delete(@RequestParam("no") int no, Model model) {
//		try {
//			service.delete(no);
//			return "redirect:/attention";
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("msg", "글삭제 처리 중 문제가 발생했습니다.");
//			return "error/error";
//		}
//	}
//	
//	@GetMapping(value = "/detail")
//	public String detail(@RequestParam("no") int no, Model model) {
//		try {
//			AttentionDto attention = service.getAttention(no);
//			model.addAttribute("dto", attention);
//			return "attention/attentionCheck";
//		} catch (SQLException e) {
//			e.printStackTrace();
//			model.addAttribute("msg", "글을 불러오는데 문제가 발생했습니다.");
//			return "error/error";
//		}
//
//	}

}
