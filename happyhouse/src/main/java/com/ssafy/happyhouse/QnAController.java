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

import com.ssafy.happyhouse.model.QnADto;
import com.ssafy.happyhouse.model.service.QnAService;

/**
 * 모든 RestAPI구현 클래스는 SelectALL, SelectOne 먼저, 그다음 Insert, Update, Delete 순으로 메소드 나열
 * @author multicampus
 *
 */
@RestController
@CrossOrigin(origins = "*", maxAge = 6000)
@RequestMapping("/qna")
public class QnAController {
	@Autowired
	private QnAService ser;
	
	@GetMapping(headers = { "Content-type=application/json" })
	public List<QnADto> selectAll() throws Exception {
		return ser.selectAll();
	}
	
	@GetMapping(value="/{no}", headers = { "Content-type=application/json" })
	public QnADto selectOneByNo(@PathVariable int no) throws Exception {
		return ser.selectOneByNo(no);
	}
	
	@PostMapping(headers = { "Content-type=application/json" })
	public void insert(@RequestBody QnADto qna) throws Exception {
		ser.insert(qna);
	}
	
	
	@PutMapping(headers = { "Content-type=application/json" })
	public void update(@RequestBody QnADto qna) throws Exception {
		ser.update(qna);
	}
	
	@DeleteMapping(value="/{no}", headers = { "Content-type=application/json"})
	public void delete(@PathVariable int no) throws Exception {
		ser.delete(no);
	}
}
