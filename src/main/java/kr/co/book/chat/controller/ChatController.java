package kr.co.book.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.chat.dto.ChatDTO;
import kr.co.book.chat.service.ChatService;
import kr.co.book.transaction.service.ChangeService;
import kr.co.book.transaction.service.RentService;


@Controller
public class ChatController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ChatService service;
	@Autowired ChangeService chgservice;
	@Autowired RentService rentservice;
	
	@RequestMapping(value = "/message_list.go")
	public String message_list(HttpServletRequest request, HttpSession session) {

		return "/chat/message_list";
	}
	
	// 대화중인 대화 방
		@RequestMapping(value = "/message_ajax_list.do")
		public String message_ajax_list(HttpServletRequest request, HttpSession session) {
			
			logger.info("컨트롤 시작");
			String MEMBER_IDX = session.getAttribute("loginIdx").toString();
					
			logger.info("세션?");
			ChatDTO dto = new ChatDTO();
			dto.setMEMBER_IDX(MEMBER_IDX);
			logger.info("컨트롤 서비스 전");
			// 메세지 리스트
			ArrayList<ChatDTO> list = service.messageList(dto);

			request.setAttribute("list", list);
			logger.info("컨트롤 끝");
			return "/chat/message_ajax_list";
		}
		
		@RequestMapping(value = "/message_content_list.do")
		public String message_content_list(HttpServletRequest request, HttpSession session) {

			String CODE_IDX = request.getParameter("CODE_IDX");
			String IDX = request.getParameter("room");
			String MEMBER_IDX = session.getAttribute("loginIdx").toString();
			ChatDTO dto = new ChatDTO();
			dto.setCODE_IDX(CODE_IDX);
			dto.setIDX(IDX);
			dto.setMEMBER_IDX(MEMBER_IDX);

			// 메세지 내용을 가져온다.
			ArrayList<ChatDTO> clist = service.roomContentList(dto);

			request.setAttribute("clist", clist);

			return "/chat/message_content_list";
		}
		
		// 메세지 보내기
		@ResponseBody
		@RequestMapping(value = "/message_send_inlist.do")
		public void message_send_inlist(@RequestParam String CODE_IDX, @RequestParam String room, @RequestParam String content, HttpSession session) {						

			String sender = session.getAttribute("loginIdx").toString();
			int chat_sender = Integer.parseInt(sender);

			service.messageSendInlist(CODE_IDX,room,chat_sender,content);

		}
		
		// 신청페이지 이동
		@RequestMapping(value="/apply.go")
		public String apply() {

			return "/chat/apply";
		}
		
		// 읽음처리
		@RequestMapping(value="/read_chk.do")
		@ResponseBody
		public int read_chk(HttpSession session, HttpServletRequest request) {
			
			ChatDTO dto = new ChatDTO();
			dto.setCODE_IDX(request.getParameter("CODE_IDX"));
			dto.setIDX(request.getParameter("room"));
			dto.setMEMBER_IDX(session.getAttribute("loginIdx").toString());
			return service.read_chk(dto);
		}
		
		// 메세지에서 사진 보내기
		@RequestMapping(value="/chatphoto.ajax")
		@ResponseBody
		public String chatphoto(MultipartFile photo, @RequestParam HashMap<String, String> params,  HttpSession session){
		
		   logger.info("{}",params);
		   logger.info("{}",photo);
		   String photoroot = service.chatphoto(params, photo, session);
		   
		   return photoroot;
	   }
		
		// 약속잡기
		@RequestMapping(value = "/reservation.go", method = RequestMethod.GET)
		public ModelAndView reservationok(@RequestParam String code_idx, @RequestParam String idx, @RequestParam String other_nick) {
			
			logger.info("컨트롤러는 옴");
			
			logger.info("code: "+code_idx+"idx: "+idx+"other_nick: "+ other_nick);
			
			ModelAndView mav = new ModelAndView("/chat/reservation");
			
			int category = Integer.parseInt(code_idx);
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			// 교환 처음신청 정보 가져오기
			if(category == 2) {
				map = chgservice.chgreservation(idx);
				map.put("CODE_IDX", code_idx);
				map.put("other_nick", other_nick);
			// 대여 처음신청 정보 가져오기
			}else if (category == 3) {
				map = rentservice.rentreservation(idx);
				map.put("CODE_IDX", code_idx);
				map.put("other_nick", other_nick);
			}
			
			mav.addObject("reservation", map);
			
			return mav;
		}
		
		// 대화방에 대한 책 정보
		@RequestMapping(value="/message_librarydetailajax.do")
		@ResponseBody
		public HashMap<String, Object> message_librarydetail(@RequestParam String library) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map = service.message_librarydetail(library);
			
			return map;		
		}
		
		// 책에 대한 모든 대화방 상태
		@RequestMapping(value="/total_stateajax.do")
		@ResponseBody
		public HashMap<String, Object> total_stateajax(@RequestParam String CODE_IDX, @RequestParam String room, @RequestParam String library, HttpSession session) {
			
			logger.info("codeidx"+CODE_IDX+"room"+room+"library"+library);
						HashMap<String, Object> map = new HashMap<String, Object>();
						
			String member_idx = session.getAttribute("loginIdx").toString();
			map = service.total_stateajax(CODE_IDX, room, member_idx,library);
			return map;		
		}
		
		// 약속 잡기 수락
		@RequestMapping(value="/reservationok_ajax.do")
		@ResponseBody
		public int reservationok_ajax(@RequestParam String CODE_IDX, @RequestParam String room, @RequestParam String other_nick, @RequestParam String library, HttpSession session) {
			
			String member_idx = session.getAttribute("loginIdx").toString();
			int success = service.reservationok_ajax(CODE_IDX,room,other_nick,library,member_idx);
			
			
			return success;
		}
		
		// 약속 잡기 거절
		@RequestMapping(value="/reservationno_ajax.do")
		@ResponseBody
		public int reservationno_ajax(@RequestParam String CODE_IDX, @RequestParam String room, @RequestParam String other_nick, @RequestParam String library, HttpSession session) {
			
			String member_idx = session.getAttribute("loginIdx").toString();
			int success = service.reservationno_ajax(CODE_IDX,room,other_nick,library,member_idx);
			
			
			return success;
		}
		
		// 채팅방 나가기
		@RequestMapping(value="/chatout_ajax.do")
		@ResponseBody
		public int chatout_ajax(@RequestParam String CODE_IDX, @RequestParam String room, @RequestParam String other_nick, @RequestParam String library, HttpSession session) {
			
			logger.info("컨트롤 들어옴");
			String member_idx = session.getAttribute("loginIdx").toString();
			int success = service.chatout_ajax(CODE_IDX,room,other_nick,library,member_idx);
			
			
			return success;
		}
		
		
		
}
