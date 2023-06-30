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

import kr.co.book.chat.dto.ChatDTO;
import kr.co.book.chat.service.ChatService;



@Controller
public class ChatController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ChatService service;
	
	/*
	private final MessageService service;
	
	public MessageController(MessageService service) {
		this.service = service;
	}

	
	@RequestMapping(value="/")
	public String home() {
		
		return "home";
	}
	
	@RequestMapping(value="/login.do")
	public String login(String id,String pw,HttpSession session) {
		logger.info(id,pw);
		HashMap<String, String> map = service.login(id,pw);
		session.setAttribute("MEMBER_IDX", map.get("MEMBER_IDX"));
		session.setAttribute("MEMBER_NICKNAME", map.get("MEMBER_NICKNAME"));
		
		return "home";
	}
	
	*/
	// 메세지 목록
	@RequestMapping(value = "/message_list.go")
	public String message_list(HttpServletRequest request, HttpSession session) {
		/*
		// System.out.println("현대 사용자 nick : " + session.getAttribute("nick"));

		String nick = (String) session.getAttribute("nick");

		MessageDTO to = new MessageDTO();
		to.setNick(nick);

		// 메세지 리스트
		ArrayList<MessageDTO> list = service.messageList(to);

		request.setAttribute("list", list);
		*/
		return "message_list";
	}

	// 메세지 목록
	@RequestMapping(value = "/message_ajax_list.do")
	public String message_ajax_list(HttpServletRequest request, HttpSession session) {
		// System.out.println("현대 사용자 nick : " + session.getAttribute("nick"));
		logger.info("컨트롤 시작");
		String MEMBER_IDX = session.getAttribute("MEMBER_IDX").toString();
				
		logger.info("세션?");
		ChatDTO dto = new ChatDTO();
		dto.setMEMBER_IDX(MEMBER_IDX);
		logger.info("컨트롤 서비스 전");
		// 메세지 리스트
		ArrayList<ChatDTO> list = service.messageList(dto);

		request.setAttribute("list", list);
		logger.info("컨트롤 끝");
		return "message_ajax_list";
	}
	
	@RequestMapping(value = "/message_content_list.do")
	public String message_content_list(HttpServletRequest request, HttpSession session) {

		String CODE_IDX = request.getParameter("CODE_IDX");
		String IDX = request.getParameter("room");
		String MEMBER_IDX = session.getAttribute("MEMBER_IDX").toString();
		ChatDTO to = new ChatDTO();
		to.setCODE_IDX(CODE_IDX);
		to.setIDX(IDX);
		to.setMEMBER_IDX(MEMBER_IDX);
//		to.setRoom(IDX);
//		to.setNick((String) session.getAttribute("nick"));

		// 메세지 내용을 가져온다.
		ArrayList<ChatDTO> clist = service.roomContentList(to);

		request.setAttribute("clist", clist);

		return "message_content_list";
	}

	// 메세지 보내기
	@ResponseBody
	@RequestMapping(value = "/message_send_inlist.do")
	public int message_send_inlist(@RequestParam String CODE_IDX, @RequestParam String room, @RequestParam String other_nick,
			@RequestParam String content, HttpSession session) {
		
		String MEMBER_IDX = session.getAttribute("MEMBER_IDX").toString();
		ChatDTO to = new ChatDTO();
		to.setCODE_IDX(CODE_IDX);
		to.setIDX(room);
		to.setCHAT_SENDER(MEMBER_IDX);
		to.setCHAT_RECIEVER(other_nick);
		to.setCHAT_CHAT(content);

		int flag = service.messageSendInlist(to);

		return flag;
	}
	/*
	// 신청페이지 이동
	@RequestMapping(value="/apply.go")
	public String apply() {

		return "apply";
	}
	*/

	// 읽음처리
	@RequestMapping(value="/read_chk.do")
	@ResponseBody
	public int read_chk(HttpSession session, HttpServletRequest request) {
		
		ChatDTO dto = new ChatDTO();
		dto.setCODE_IDX(request.getParameter("CODE_IDX"));
		dto.setIDX(request.getParameter("IDX"));
		dto.setMEMBER_IDX(session.getAttribute("MEMBER_IDX").toString());
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
	
	
}
