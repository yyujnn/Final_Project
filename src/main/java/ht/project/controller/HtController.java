package ht.project.controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.omg.CORBA.CODESET_INCOMPATIBLE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ht.project.entity.Admin;
import ht.project.entity.BpResults;
import ht.project.entity.BsResults;
import ht.project.entity.Community;
import ht.project.entity.Ecg;
import ht.project.entity.Health;
import ht.project.entity.User;
import ht.project.mapper.HtMapper;

@Controller
public class HtController {

	@Autowired
	HtMapper mapper;

	// login 페이지로 이동
	@RequestMapping("/login")
	public String login(@RequestParam(required = false) String returnUrl, HttpSession session) {
		// returnUrl을 세션에 저장
		if (returnUrl != null && !returnUrl.isEmpty()) {
			session.setAttribute("returnUrl", returnUrl);
		}
		return "login";
	}

	// 로그인 프로세스 (로그인 로직)
	@RequestMapping("/loginProcess")
	public String loginProcess(@ModelAttribute("user") User user, HttpSession session) {
		User loginUser = mapper.login(user);
		mapper.access(user);
		if (loginUser != null) {
			session.setAttribute("user_id", loginUser.getUser_id());
			// returnUrl을 세션에서 읽어와서 리다이렉트합니다.
			String returnUrl = (String) session.getAttribute("returnUrl");
			if (returnUrl != null && !returnUrl.isEmpty()) {
				session.removeAttribute("returnUrl"); // 사용 후 세션에서 해당 정보를 제거
				return "redirect:" + returnUrl;
			}
			// 로그인 후 기본 페이지로 이동합니다.
			return "redirect:/index";
		}
		// 로그인 실패 시 로그인 페이지로 리다이렉트합니다.
		return "redirect:/login";
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		// 세션에서 로그인 정보를 제거합니다.
		session.removeAttribute("user_id");
		// 세션을 완전히 무효화하여 초기화합니다.
		session.invalidate();
		// 로그아웃 후 리다이렉트할 페이지를 지정합니다.
		return "redirect:/index";
	}

	// 회원가입 기능 - db에 insert
	@RequestMapping("/join")
	public String join(User vo) {

		System.out.println("회원가입 user " + vo);
		mapper.join(vo);

		return "redirect:/login";
	}

	@RequestMapping("/wait")
	public String waitPage() {

		return "waitPage";
	}

	// 메인 페이지
	@RequestMapping("/index")
	public String hearTrack(HttpSession session) {

		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			// 로그인이 되어 있는 경우
			System.out.println("인덱스 userid : " + user_id);
		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("인덱스: 로그인되어 있지 않음");
		}
		return "index";
	}

	// 커뮤니티 페이지
	@RequestMapping("/community")
	public String community(HttpSession session, Model model, Community vo) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			// 로그인이 되어 있는 경우
			System.out.println("커뮤니티 userid : " + user_id);
			User userInfo = mapper.getUserInfo(user_id);
			model.addAttribute("userInfo", userInfo);
		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("커뮤니티: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/community";
		}

		// 커뮤니티 페이지 로직 처리 (리스트 출력)
		ArrayList<Community> list = mapper.getCommunityList();

		for (Community community : list) {
			User user = mapper.getUserInfo(community.getUser_id());
			community.setUser(user);
		}

		// 카드 출력 ecg , health
		for (Community community : list) {
            if (community.getEcg_num() != null) {
                Ecg ecg = mapper.getEcgInfo(community.getEcg_num());
                community.setEcg(ecg);
            }
            if (community.getH_num() != null) {
                Health health = mapper.getHealthInfo(community.getH_num());
                community.setHealth(health);
            }
        }
		// p_num 컬럼을 내림차순으로 정렬
		list.sort(Comparator.comparingInt(Community::getP_num).reversed());

		model.addAttribute("comlist", list);

		return "community";
	}

	@RequestMapping("/register")
	public String register(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("user_id");

		if (user_id != null) {

			User userInfo = mapper.getUserInfo(user_id);
			model.addAttribute("userInfo", userInfo);

			Ecg LatestEcg = mapper.getLatestEcg(user_id);
			Health LatestBp = mapper.getLatestBp(user_id);
			Health LatestBs = mapper.getLatestBs(user_id);

			model.addAttribute("LatestEcg", LatestEcg);
			model.addAttribute("LatestBp", LatestBp);
			model.addAttribute("LatestBs", LatestBs);
			
			// 커뮤니티 페이지 로직 처리 (리스트 출력)
			ArrayList<Community> list = mapper.getCommunityList();
			// p_num 컬럼을 내림차순으로 정렬
			list.sort(Comparator.comparingInt(Community::getP_num).reversed());

			model.addAttribute("comlist", list);


		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("커뮤니티: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/community";
		}
		return "register";
	}

	@RequestMapping(value = "/registerForm", method = { RequestMethod.POST, RequestMethod.GET })
	public String Register(Community com, HttpSession session,@RequestParam("check") String check) {
		String user_id = (String) session.getAttribute("user_id");
		com.setUser_id(user_id);
		System.out.println("registerForm" + com);
		System.out.println("check"+check);
		
		 if ("ecg".equals(check)) {
		        // ECG 버튼이 선택되었습니다.
		        // 이곳에서 ECG 값에 대한 처리를 하세요.
			 Ecg latestEcg = mapper.getLatestEcg(user_id);
			 com.setEcg_num(latestEcg.getEcg_num());
		    } else if ("bs".equals(check)) {
		        // 혈당 버튼이 선택되었습니다.
		        // 이곳에서 혈당 값에 대한 처리를 하세요.
		    	Health latestBs = mapper.getLatestBs(user_id);
		    	com.setH_num(latestBs.getH_num());
		    } else if ("bp".equals(check)) {
		        // 혈압 버튼이 선택되었습니다.
		        // 이곳에서 혈압 값에 대한 처리를 하세요.
		    	Health latestBp = mapper.getLatestBp(user_id);
		    	com.setH_num(latestBp.getH_num());
		    }

		mapper.insertCommunity(com);

		System.out.println("insert함 Form" + com);

		return "redirect:/community";
	}

	@RequestMapping("/healthRecord")
	public String healthRecord(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			// 로그인이 되어 있는 경우
			System.out.println("건강기록 userid : " + user_id);
			User userInfo = mapper.getUserInfo(user_id);
			model.addAttribute("userInfo", userInfo);

			Ecg LatestEcg = mapper.getLatestEcg(user_id);
			Health LatestBp = mapper.getLatestBp(user_id);
			Health LatestBs = mapper.getLatestBs(user_id);

			// 결과에 따른 CSS 클래스를 설정하는 Map 생성
			Map<String, String> cssClassMap = new HashMap<>();
			cssClassMap.put("sr", "result_1");
			cssClassMap.put("af", "result_2");
			cssClassMap.put("sb", "result_2");
			cssClassMap.put("gsvt", "result_3");

			// LatestEcg 객체에 대해 조건에 따라 클래스를 동적으로 설정
			if (LatestEcg != null) {
				String result = LatestEcg.getResults();
				String cssClass = cssClassMap.getOrDefault(result, "result_3");
				LatestEcg.setCssClass(cssClass);
			}else {
				LatestEcg = new Ecg();
				LatestEcg.setHr(0);
				LatestEcg.setResultsText("-");
				LatestEcg.setCssClass("-");
			}
			
			// LatestBp 객체에 대해 조건에 따라 클래스를 동적으로 설정
			if (LatestBp != null) {
			    BpResults LatestBpResult = LatestBp.determineBpResult();
			    LatestBp.setResultText(LatestBpResult.getResultText());
			    LatestBp.setCssClass(LatestBpResult.getCssClass());
			} else {
			    LatestBp = new Health();
			    LatestBp.setBp_high(0);
			    LatestBp.setBp_low(0);
			    LatestBp.setResultText("정보없음");
			}

			// LatestBs 객체에 대해 조건에 따라 클래스를 동적으로 설정
			if (LatestBs != null) {
			    BsResults LatestBsResult = LatestBs.determineBsResult();
			    LatestBs.setResultText(LatestBsResult.getResultText());
			    LatestBs.setCssClass(LatestBsResult.getCssClass());
			} else {
			    LatestBs = new Health();
			    LatestBs.setBp_high(0);
			    LatestBs.setBp_low(0);
			    LatestBs.setResultText("정보없음");
			}
			
			


			model.addAttribute("LatestEcg", LatestEcg);
			model.addAttribute("LatestBp", LatestBp);
			model.addAttribute("LatestBs", LatestBs);

			ArrayList<Health> MyBpList = mapper.getMyBpList(user_id);
			ArrayList<Health> MyBsList = mapper.getMyBsList(user_id);
			ArrayList<Ecg> MyEcgList = mapper.getMyEcgList(user_id);

			// MyEcgList 객체 리스트에 대해 조건에 따라 클래스를 동적으로 설정
			for (Ecg ecg : MyEcgList) {
				String result = ecg.getResults();
				String cssClass = cssClassMap.getOrDefault(result, "result_3");
				ecg.setCssClass(cssClass);
			}

			for (Health health : MyBpList) {
				BpResults bpResult = health.determineBpResult();
				health.setCssClass(bpResult.getCssClass());
				health.setResultText(bpResult.getResultText());
			}

			for (Health health : MyBsList) {
				BsResults bsResult = health.determineBsResult();
				health.setCssClass(bsResult.getCssClass());
				health.setResultText(bsResult.getResultText());
			}

			model.addAttribute("MyBpList", MyBpList);
			model.addAttribute("MyBsList", MyBsList);
			model.addAttribute("MyEcgList", MyEcgList);

		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("건강기록: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/healthRecord";
		}

		return "healthRecord";
	}

	// ecg 검사
	@RequestMapping("/ecgCheck")
	public String ecgCheck(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			System.out.println("심전도 검사 userid : " + user_id);
		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("심전도 검사: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/ecgCheck";
		}

		return "ecgCheck";
	}

	// ecg 결과
	@RequestMapping("/ecgResult")
	public String ecgResult(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			System.out.println("심전도 결과 userid : " + user_id);
			User userInfo = mapper.getUserInfo(user_id);
			model.addAttribute("userInfo", userInfo);

			Ecg LatestEcg = mapper.getLatestEcg(user_id);
			model.addAttribute("LatestEcg", LatestEcg);

			System.out.println(LatestEcg.getResults() + LatestEcg.getResultsText());

			// 조건에 따라 클래스를 동적으로 설정
			String cssClass;
			if (LatestEcg.getResults().equals("sr")) {
				cssClass = "result_1";
			} else if (LatestEcg.getResults().equals("af")) {
				cssClass = "result_2";
			} else if (LatestEcg.getResults().equals("sb")) {
				cssClass = "result_2";
			} else if (LatestEcg.getResults().equals("gsvt")) {
				cssClass = "result_3";
			} else {
				cssClass = "result_3";
			}
			model.addAttribute("cssClass", cssClass);

		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("심전도 결과: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/ecgResult";
		}

		return "ecgResult";
	}

	// 혈압 검사
	@RequestMapping("/bpCheck")
	public String bpCheck(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			System.out.println("혈압 검사 userid : " + user_id);
		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("혈압 검사: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/bpCheck";
		}

		return "bpCheck";
	}

	// 혈압 결과
	@RequestMapping("/bpResult")
	public String bpResult(HttpSession session, Model model, Health vo) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			System.out.println("혈압 결과 userid : " + user_id);
			vo.setUser_id(user_id);
			System.out.println(vo);
			// 사용자가 입력한 혈압 데이터 가져오기
			System.out.println("최고 혈압" + vo.getBp_high() + "최저 혈압" + vo.getBp_low());

			// 등록
			mapper.bpRegister(vo);

			// select
			Health health = mapper.getLatestBp(user_id);
			System.out.println("select임" + health);

			// 혈압 결과를 판단하여 BpResults 열거형 상수를 얻기
			BpResults bpHighResult = health.bpHigh();
			BpResults bpLowResult = health.bpLow();

			health.setCssClass(bpHighResult.getCssClass());
			health.setResultText(bpHighResult.getResultText());
			health.setCssCircle(bpHighResult.getCssCircle());

			health.setCssClass(bpLowResult.getCssClass());
			health.setResultText(bpLowResult.getResultText());
			health.setCssCircle(bpLowResult.getCssCircle());

			// Model에 HealthInfo 데이터담 기
			model.addAttribute("health", health);
			model.addAttribute("bpHighResult", bpHighResult);
			model.addAttribute("bpLowResult", bpLowResult);

		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("혈압 결과: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/bpResult";
		}
		return "bpResult";
	}

	// 혈당 검사
	@RequestMapping("/bsCheck")
	public String bsCheck(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			System.out.println("혈당 검사 userid : " + user_id);
		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("혈당 검사: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/bsCheck";
		}

		return "bsCheck";
	}

	// 혈당 결과
	@RequestMapping("/bsResult")
	public String bsResult(HttpSession session, Model model, Health vo) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			System.out.println("혈당 결과 userid : " + user_id);
			vo.setUser_id(user_id);
			System.out.println(vo);
			// 사용자가 입력한 혈압 데이터 가져오기
			System.out.println("공복 혈당" + vo.getBs_emp() + "식후 혈당" + vo.getBs_ful());

			// 등록
			mapper.bsRegister(vo);

			// select
			Health health = mapper.getLatestBs(user_id);
			System.out.println("혈당 select임" + health);

			BsResults bsEmpResult = health.bsEmp();
			BsResults bsFulResult = health.bsFul();

			health.setResultText(bsEmpResult.getResultText());
			health.setCssCircle(bsEmpResult.getCssCircle());

			health.setResultText(bsFulResult.getResultText());
			health.setCssCircle(bsFulResult.getCssCircle());

			// Model에 HealthInfo 데이터담 기
			model.addAttribute("health", health);
			model.addAttribute("bsFulResult", bsFulResult);
			model.addAttribute("bsEmpResult", bsEmpResult);

		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("혈압 결과: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/bsResult";
		}
		return "bsResult";
	}

	// admin-User 페이지로 이동
	@RequestMapping("/adminUser")
	public String admin_user(Model model) {
		// 유저 전체 리스트 받아오기
		ArrayList<Admin> list = mapper.getUserList();
		model.addAttribute("userList", list);

		return "Admin_User";
	}

	// admin-Ecg 페이지로 이동
	@RequestMapping("/adminEcg")
	public String admin(Model model) {
		ArrayList<Admin> list = mapper.getEcgList();
		model.addAttribute("ecgList", list);

		return "Admin_ECG";
	}

	// admin-Ecg 페이지로 이동 
	@RequestMapping("/addwrite")
	public String addwrite() {
		
		return "addwrite";
	}
	
	@RequestMapping(value = "/addwrite_frame", method = RequestMethod.GET)
	public String addWriteFrame() {
	    return "addwrite_frame";
	}
	
	// 커뮤니티 페이지
	@RequestMapping("/choose")
	public String choose(HttpSession session, Model model, Community vo) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			// 로그인이 되어 있는 경우
			System.out.println("커뮤니티 userid : " + user_id);
			User userInfo = mapper.getUserInfo(user_id);
			model.addAttribute("userInfo", userInfo);
		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("커뮤니티: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/community";
		}

		// 커뮤니티 페이지 로직 처리 (리스트 출력)
		ArrayList<Community> list = mapper.getchoose();

		for (Community community : list) {
			User user = mapper.getUserInfo(community.getUser_id());
			community.setUser(user);
		}

		// 카드 출력 ecg , health
		for (Community community : list) {
            if (community.getEcg_num() != null) {
                Ecg ecg = mapper.getEcgInfo(community.getEcg_num());
                community.setEcg(ecg);
            }
            if (community.getH_num() != null) {
                Health health = mapper.getHealthInfo(community.getH_num());
                community.setHealth(health);
            }
        }
		// p_num 컬럼을 내림차순으로 정렬
		list.sort(Comparator.comparingInt(Community::getP_num).reversed());

		model.addAttribute("comlist", list);

		return "community";
	}
	// 커뮤니티 페이지
	@RequestMapping("/base")
	public String base(HttpSession session, Model model, Community vo) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			// 로그인이 되어 있는 경우
			System.out.println("커뮤니티 userid : " + user_id);
			User userInfo = mapper.getUserInfo(user_id);
			model.addAttribute("userInfo", userInfo);
		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("커뮤니티: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/community";
		}

		// 커뮤니티 페이지 로직 처리 (리스트 출력)
		ArrayList<Community> list = mapper.getbase();

		for (Community community : list) {
			User user = mapper.getUserInfo(community.getUser_id());
			community.setUser(user);
		}

		// 카드 출력 ecg , health
		for (Community community : list) {
            if (community.getEcg_num() != null) {
                Ecg ecg = mapper.getEcgInfo(community.getEcg_num());
                community.setEcg(ecg);
            }
            if (community.getH_num() != null) {
                Health health = mapper.getHealthInfo(community.getH_num());
                community.setHealth(health);
            }
        }
		// p_num 컬럼을 내림차순으로 정렬
		list.sort(Comparator.comparingInt(Community::getP_num).reversed());

		model.addAttribute("comlist", list);

		return "community";
	}
}
