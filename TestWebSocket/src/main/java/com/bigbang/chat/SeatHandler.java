package com.bigbang.chat;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
//출처: http://highlighttt.tistory.com/12 [떼이커의 이야기]
//		http://blog.naver.com/hjpw237/220924203033
//https://github.com/sockjs/sockjs-client 에서 sockjs를 다운로드 받아사용하자
// webapp/js/폴더아래 sockjs.js파일을 가져다 놓는다.



public class SeatHandler extends TextWebSocketHandler{
	
	//세션을 모두 저장한다.
    //방법 1 :  1:1 채팅
//    private Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();
    
    //방법 2 : 전체 채팅
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    
    
    private static Logger logger = LoggerFactory.getLogger(SeatHandler.class);
    
    /**
     * 클라이언트 연결 이후에 실행되는 메소드
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
            throws Exception {
        //맵을 쓸때 방법
//        sessions.put(session.getId(), session);
        //List쓸때 방법
        sessionList.add(session);
         //0번째 중괄호에 session.getId()을 넣으라는뜻
        logger.info("{} 연결됨", session.getId());
        for(WebSocketSession sess : sessionList){
        	for(String st:seat){
        	sess.sendMessage(new TextMessage(st));
        	}
        }
        
    }
    
    /**
     * 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행되는 메소드
     */
    Set<String> seat=new HashSet<>();
    @Override
    protected void handleTextMessage(WebSocketSession session,
            TextMessage message) throws Exception {
        
        //0번째에 session.getId() 1번째에 message.getPayload() 넣음
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
    //    logger.info("{}로부터 {}받음", new String[]{session.getId(),message.getPayload()});
        
        //연결된 모든 클라이언트에게 메시지 전송 : 리스트 방법
        for(WebSocketSession sess : sessionList){
           // sess.sendMessage(new TextMessage(sess.getId()+"##" + message.getPayload()));
        	String str=message.getPayload();        	
        	sess.sendMessage(new TextMessage(str));
        	seat.add(str);
        }
        
        // 맵 방법.
        /*Iterator<String> sessionIds = sessions.ketSet().iterator();
        String sessionId = "";
        while (sessionIds.hasNext()) {
            sessionId = sessionIds.next();
            sessions.get(sessionId).sendMessage(new TextMessage("echo:" + message.getPayload()));
            
        }*/
        
        //연결되어 있는 모든 클라이언트들에게 메시지를 전송한다.
//        session.sendMessage(new TextMessage("echo:" + message.getPayload()));
    }
    
    /**
     * 클라이언트 연결을 끊었을 때 실행되는 메소드
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session,
            CloseStatus status) throws Exception {
        //List 삭제
        sessionList.remove(session);
        
        //Map 삭제
//        sessions.remove(session.getId());
        
        logger.info("{} 연결 끊김.", session.getId());
    }



}