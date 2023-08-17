package kr.co.book.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.mypage.service.TrackerService;

/*
 * TrackerController : 트래커 컨트롤러
 * @author 이수연
 */
@Controller
public class TrackerController {
	
	@Autowired TrackerService TrackerService;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	//트래커에 추가할 책 검색 페이지 이동
	@RequestMapping(value = "/mypage/trackerSearch.go")
	public String tracker() {		
		return "/tracker/trackerSearch";
	}
	
	//트래커에 추가할 책 검색
	@GetMapping(value = "/mypage/trackerSearch.do")
	public ModelAndView trackerBookSearch(String searchType, String searchValue) throws Exception {	
		return TrackerService.trackerBookSearch(searchType,searchValue);
	}
	
	//트래커 추가 페이지로 이동
	@GetMapping(value = "/mypage/tracker/add/{state}/book.go") 	//state : read OR reading
	public String trackerAddBookGo(@RequestParam HashMap<String, Object> params, Model model,@PathVariable String state) throws Exception {
		//isbn이 null이 아니면
		if(!params.get("isbn").equals("undefined")) {
			//해당 책 정보 내려보내기
			model.addAttribute("isbn",params.get("isbn"));
			model.addAttribute("cover",params.get("cover"));
			model.addAttribute("jsp",params.get("jsp"));
		}else { //isbn이 null이면
			model.addAttribute("msg","해당 도서는 추가할 수 없습니다.");
		}
		return "/tracker/trackerAdd"+state+"Book";
	}
	
	//트래커에 완독 / 읽고 있는 책 추가
	@GetMapping(value = "/mypage/tracker/add/{state}/book.ajax") //state : read OR reading
	@ResponseBody
	public HashMap<String, Object> trackerAddBook(HttpSession session, @PathVariable String state, @RequestParam HashMap<String, Object> params) throws Exception {
		
		HashMap<String, Object> map =  new HashMap<String, Object>();
		int loginIdx = (int) session.getAttribute("loginIdx");
		params.put("loginIdx", loginIdx);
		params.put("state", state);
		
		//트래커에 해당 도서 추가
		boolean success = TrackerService.trackerAddBook(params);
		
		map.put("success",success);
		return map;
	}
	
	//읽고 있는 책 등록 시 총페이지 수 불러오기
	@GetMapping(value = "/mypage/getTotalPage.ajax")
	@ResponseBody
	public HashMap<String, Object> getTotalPage(HttpSession session, @RequestParam HashMap<String, Object> params) throws Exception {
		
		HashMap<String, Object> map =  new HashMap<String, Object>();
		
		int loginIdx = (int) session.getAttribute("loginIdx");
		params.put("loginIdx", loginIdx);
		
		//해당 도서의 총 페이지 수 불러오기
		int totalPage = TrackerService.getTotalPage(params);

		map.put("totalPage",totalPage);
		return map;
	}
	
	//트래커 리스트로 이동
	@GetMapping(value = "/mypage/trackerList.go")
	public ModelAndView trackerListGo(HttpSession session) throws Exception {
		int loginIdx = (int) session.getAttribute("loginIdx");
		return TrackerService.trackerList(loginIdx);
	}
	
	//트래커 디테일로 이동
	@GetMapping(value = "/mypage/trackerDetail.go")
	public ModelAndView trackerDetail(HttpSession session, String trackerIdx) throws Exception {
		return TrackerService.trackerDetail(trackerIdx);
	}

	//트래커 업데이트 페이지로 이동
	@GetMapping(value = "/mypage/trackerUpdateBook.go")
	public String trackerUpdateBookGo(@RequestParam HashMap<String, Object> params, Model model) throws Exception {	
		//해당 도서 정보 내려보내기
		model.addAttribute("isbn",params.get("isbn"));
		model.addAttribute("readPage",params.get("readPage"));
		model.addAttribute("startDate",params.get("startDate"));
		model.addAttribute("jsp",params.get("jsp"));
		return "/tracker/trackerAddReadingBook";
	}
	
	//트래커 도서정보 수정
	@GetMapping(value = "/mypage/trackerUpdateBook.ajax")
	@ResponseBody
	public HashMap<String, Object> trackerUpdateBook(HttpSession session, @RequestParam HashMap<String, Object> params) throws Exception {
		int loginIdx = (int) session.getAttribute("loginIdx");
		params.put("loginIdx", loginIdx);			
		return TrackerService.trackerUpdateBook(params);
	}
	
	//트래커 도서정보 삭제
	@GetMapping(value = "/mypage/trackerDeleteBook.ajax")
	@ResponseBody
	public HashMap<String, Object> trackerDeleteBook(HttpSession session, String isbn) throws Exception {
		int loginIdx = (int) session.getAttribute("loginIdx");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//삭제완료되면 success 내려보내기
		if(TrackerService.trackerDeleteBook(isbn,loginIdx) == 1) {
			map.put("success", "success");
		}
		
		return map;
	}
	
	//메모 저장
	@PostMapping(value = "/mypage/trackerAddMemo.ajax")
	@ResponseBody
	public HashMap<String, Object> trackerAddMemo(HttpSession session, @RequestParam HashMap<String, Object> params) throws Exception {

		int loginIdx = (int) session.getAttribute("loginIdx");		
		params.put("loginIdx", loginIdx);
		
		return TrackerService.trackerAddMemo(params);
	}
	
	//메모 리스트 출력
	@PostMapping(value = "/mypage/getMemoList.ajax")
	@ResponseBody
	public HashMap<String, Object> getMemoList(String trackerIdx) throws Exception {
		return TrackerService.getMemoList(trackerIdx);
	}
	
	//메모 삭제
	@PostMapping(value = "/mypage/memoDelete.ajax")
	@ResponseBody
	public HashMap<String, Object> memoDelete(@RequestParam HashMap<String, Object> params) throws Exception {
		return TrackerService.memoDelete(params);
	}
	
	//메모 수정 페이지 이동
	@GetMapping(value = "/mypage/trackerMemoUpdate.go")
	public String trackerMemoUpdateGo(@RequestParam HashMap<String, Object> params, Model model) throws Exception {	
		//기존 메모내용 가져와서 메모정보와 함께 내려보내기
		String content = TrackerService.getContent(params);
		model.addAttribute("content",content);
		model.addAttribute("trackerIdx",params.get("trackerIdx"));
		model.addAttribute("memoIdx",params.get("memoIdx"));
		model.addAttribute("jsp",params.get("jsp"));
		return "/tracker/trackerMemoUpdate";
	}
	
	//메모 수정
	@PostMapping(value = "/mypage/trackerMemoUpdate.ajax")
	@ResponseBody
	public HashMap<String, Object> trackerMemoUpdate(@RequestParam HashMap<String, Object> params) throws Exception {	
		return TrackerService.memoUpdate(params);		
	}
	
	
	
	//ClubController에서 사용
	
	//모임 도서 검색
	@GetMapping(value = "/clubBookSearch.do")
	public ModelAndView clubBookSearch2(String searchValue) throws Exception {
		return TrackerService.clubBookSearch("title",searchValue);
	}
	
	//마이페이지에서 모임 도서 검색
	@GetMapping(value = "/mypage/clubBookSearch.do")
	public ModelAndView clubBookSearch(String searchValue) throws Exception {
		return TrackerService.clubBookSearch("title",searchValue);
	}
	
	
}
