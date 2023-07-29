package ht.project.controller;

import java.io.IOException;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import ht.project.entity.Admin;
import ht.project.entity.BpResults;
import ht.project.entity.BsResults;
import ht.project.entity.Comment;
import ht.project.entity.Community;
import ht.project.entity.Ecg;
import ht.project.entity.Health;
import ht.project.entity.Likes;
import ht.project.entity.User;
import ht.project.mapper.HtMapper;

@RestController
public class HtRESTController {
	@Autowired
	private HtMapper mapper;

	// 커뮤니티 좋아요
	@RequestMapping(value = "/postLike", method = { RequestMethod.POST, RequestMethod.GET })
	public Community postLike(@RequestParam(value = "p_num", required = false) Integer p_num,
			@RequestParam(value = "likes", required = false) Integer likes,
			@RequestParam(value = "action", required = false) Integer action, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");

		System.out.println("누른 id :" + user_id);

		System.out.println("받아온like " + p_num + likes);
		System.out.println("받아온 action: " + action);

		if (action != null) {
			if (action == 1) {
				mapper.insertLike(p_num, user_id);
			} else if (action == -1) {
				mapper.deleteLike(p_num, user_id);
			}
		}

		mapper.updateLikes(p_num, likes);

		Community community = new Community();
		community.setP_num(p_num);
		community.setLikes(likes);

		System.out.println("update된 like의" + p_num + likes);

		return community;
	}

	// 초기 좋아요 띄우기
	@RequestMapping(value = "/likeStatus", method = { RequestMethod.POST, RequestMethod.GET })
	public ArrayList<Likes> likeStatus(HttpSession session) {

		String user_id = (String) session.getAttribute("user_id");
		ArrayList<Likes> likeStatus = mapper.likeStatus(user_id);

		System.out.println("좋아요 상태" + likeStatus);
		return likeStatus;

	}

	// 댓글 등록
	@RequestMapping("/commentReg")
	public ArrayList<Comment> commentReg(Comment comm) { // content 와 p_num

		System.out.println("ajax에서 넘어온 내용과 p_num >>" + comm);

		mapper.commentReg(comm);

		ArrayList<Comment> commRes = mapper.commentShow(comm);

		System.out.println("select p_num 해당되는 댓글들 >> " + commRes);

		return commRes;

	}

	// 초기 댓글리스트 띄우기
	@RequestMapping("/getComments")
	public ArrayList<Comment> getComments() {

		ArrayList<Comment> commRes = mapper.initialComm(); // Comment를 select all -> commRes
		System.out.println("맨 처음 띄울 댓글 객체 select all >> " + commRes);

		return commRes;
	}

	// 파일 첨부
	private String uploadFolder = "C:\\Users\\smhrd\\Desktop\\user_ecg";

	@RequestMapping(value = "/upload", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Map<String, String> uploadFile(@RequestParam("file") MultipartFile file, HttpSession session) {
		Map<String, String> response = new HashMap<>();

		if (file.isEmpty()) {
			return null;
		}

		try {
			System.out.println("saveFile 메서드 실행됨.");
			String fileName = FilenameUtils.getBaseName(file.getOriginalFilename());
			String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename());
			String generatedFileName = fileName + "." + fileExtension;

			Path targetLocation = Paths.get(uploadFolder, generatedFileName);
			Files.createDirectories(targetLocation.getParent()); // 폴더 생성
			Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);
			System.out.println("1." + fileName);
			System.out.println("2." + fileExtension);
			System.out.println("3." + generatedFileName);
			String user_id = (String) session.getAttribute("user_id");
			System.out.println("4." + user_id);

			response.put("fileName", fileName);
			response.put("fileExtension", fileExtension);
			response.put("user_id", user_id);
			String filePath = targetLocation.toString();
	        response.put("filePath", filePath);
	        System.out.println("5." + filePath);

			return response;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value = "/getRes", method = {RequestMethod.POST})
	public ArrayList<Admin> getRes(){
		
		ArrayList<Admin> list = mapper.getRes();
		
		return list;
	}
	
	
	@RequestMapping(value = "/getHealth", method = {RequestMethod.POST})
	public ArrayList<Admin> getHealth(){
		
		ArrayList<Admin> list = mapper.getHealth();
		
		return list;
	}
	
	@RequestMapping(value = "/getDeep", method = {RequestMethod.POST})
	public ArrayList<Admin> getDeep(){
		
		ArrayList<Admin> list = mapper.getDeep();
		
		return list;
	}
	
	@GetMapping("/getEcgDetails")
	public ArrayList<Ecg> getEcgData(@RequestParam("ecg_id") int ecgNum, Model model) {
	    System.out.println("과연 아이디가 찍힐까요? " + ecgNum);

	    ArrayList<Ecg> detailEcg = mapper.getEcgDetails(ecgNum);

	    Map<String, String> cssClassMap = new HashMap<>();
	    cssClassMap.put("sr", "result_1");
	    cssClassMap.put("af", "result_2");
	    cssClassMap.put("sb", "result_2");
	    cssClassMap.put("gsvt", "result_3");

	    // MyEcgList 객체 리스트에 대해 조건에 따라 클래스를 동적으로 설정
	    for (Ecg ecg : detailEcg) {
	        String result = ecg.getResults();
	        String cssClass = cssClassMap.getOrDefault(result, "result_3");
	        ecg.setCssClass(cssClass);
	    }

	    // Model에 ECG 정보를 저장하여 뷰로 전달합니다.
	    model.addAttribute("ecgData", detailEcg);
	    
	    // 뷰 이름을 반환합니다. 뷰 이름은 화면에 표시할 HTML 템플릿 파일명입니다.
	    return detailEcg;
	}
	
	// 중복 아이디 확인 
	@RequestMapping("/idcheck")
	public Map<Object, Object> idcheck(String user_id) {
		
		System.out.println("ajax로 받아온 >> "+user_id);
		
		Map<Object, Object> map = new HashMap<>();
		String overlap;
		
			// 중복 검사 실패
			User user = mapper.findByUsername(user_id);
			System.out.println("User테이블 select 해온 것 >> "+user);
			
			
	        if (user == null) {
//	        String userid = user.getUser_id();
	     	 overlap = "pass";
				 
			}else {
				// 중복 검사 실패
				overlap = "fail";
			}
	        map.put("overlap", overlap);
	        System.out.println(map);
	        return map;
	
	}

	
}
