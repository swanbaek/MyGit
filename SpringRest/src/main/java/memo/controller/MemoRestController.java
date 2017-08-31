package memo.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import memo.model.MemoVO;
import memo.service.MemoService;
/*RestController는 별도의 뷰를 제공하지 않는 형태. json이나 xml 등으로 응답 데이터를 받을 때 사용
 * -[1] 메소드에서  문자열을 반환하면  text/html형태
 * -[2] 메소드에서 객체를 반환하면 application/json형태
 *메소드 방식에 따라 처리 로직을 달리한다.
 *  /memos  GET : 메모 목록을 리턴 
 *  /memos/{idx} GET: 특정한 메모글을 리턴
 *  /memos		POST: 새로운 메모글을 생성
 *  /memos/{idx} PUT: 특정 메모글을 수정
 *  /memos/{idx} DELETE: 특정 메모글을 삭제
 * */
@RestController
public class MemoRestController {
	private Logger log=LoggerFactory.getLogger(MemoRestController.class);
	@Autowired
	private MemoService mservice;
	
	@GetMapping("/memos")
	//@RequestMapping(value="/memos",method=RequestMethod.GET)
	public List<MemoVO> memoList(){
		log.info("GET memos");
		List<MemoVO> mlist=mservice.listMemo();
		return mlist;
	}
	
	@GetMapping("/memos/{idx}")
	//@RequestMapping(value="/memos/{idx}",method=RequestMethod.GET)
	public MemoVO memo(@PathVariable("idx")int idx){
		MemoVO memo=mservice.getMemo(idx);
		return memo;
	}
	
	@PostMapping("/memos")	
//@RequestMapping(value="/memos",method=RequestMethod.POST)
	public ModelMap memoInsert(@RequestParam("mfile") MultipartFile mfile, @ModelAttribute("memo") MemoVO memo){
		log.info("POST memo={}", memo);
		log.info("POST mfile={}", mfile);
		int n=mservice.createMemo(memo);
		ModelMap m=new ModelMap();
		m.addAttribute("result",n);
		return m;
	}
	
	@PutMapping("/memos")
	//@RequestMapping(value="/memos",method=RequestMethod.PUT)
	public ModelMap memoUpdate(MemoVO memo){
		int n=mservice.updateMemo(memo);
		ModelMap m=new ModelMap();
		m.addAttribute("result",n);
		return m;
	}
	
	@DeleteMapping("/memos/{idx}")
	//@RequestMapping(value="/memos/{idx}",method=RequestMethod.DELETE)
	public ModelMap memoDelete(@PathVariable("idx") int idx){
		log.info("DELETE memos idx={}",idx);
		int n=mservice.deleteMemo(idx);
		ModelMap m=new ModelMap();
		m.addAttribute("result",n);
		return m;
	}
	
	@PostMapping(value="/ajaxUpload")
	public ResponseEntity<String> uploadAjax(MultipartFile file,HttpServletRequest req) throws Exception{
		String upDir=req.getServletContext().getRealPath("/Upload");
		
		System.out.println("upDir=="+upDir);
		System.out.println("originalNmae="+file.getOriginalFilename());
		System.out.println("size="+file.getSize());
		System.out.println("contentType="+file.getContentType());
		
		file.transferTo(new File(upDir, file.getOriginalFilename()));
		
		return new ResponseEntity<String>(file.getOriginalFilename(),HttpStatus.OK);
	}

}
