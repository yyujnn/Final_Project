package ht.project.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import ht.project.entity.Admin;
import ht.project.entity.Comment;
import ht.project.entity.Community;
import ht.project.entity.Ecg;
import ht.project.entity.Health;
import ht.project.entity.Likes;
import ht.project.entity.User;

public interface HtMapper {

	// 사용자
	User login(User vo);

	void join(User vo);
	
	// 커뮤니티 리스트
	ArrayList<Community> getCommunityList();
	
	// user_id로 user 정보
	User getUserInfo(String user_id);


	// 좋아요 개수
	void updateLikes(Integer p_num , Integer likes);
	

	// 좋아요 추가 
	void insertLike(@Param("p_num") Integer p_num, @Param("user_id") String user_id);

	// 좋아요 삭제
	void deleteLike(@Param("p_num") Integer p_num, @Param("user_id") String user_id);

	ArrayList<Likes> likeStatus(String user_id);

	// 로그인 접근
	void access(User user);

	// comment 등록
	void commentReg(Comment comm);

	// 초기 페이지 로드시 가져올 전체 댓글 데이터
	ArrayList<Comment> initialComm();

	// comment 가져와서 띄우기
	ArrayList<Comment> commentShow(Comment comm);

	// 가장 최근 Health 
	Health getLatestHealth(Health vo);
	
	// 혈압 등록
	void bpRegister(Health vo);

	// 혈당 등록
	void bsRegister(Health vo);

	// 가장 최근 ecg 데이터 가져오기
	Ecg getLatestEcg(String user_id);

	// 가장 최근 Bp, Bs 가져오기
	Health getLatestBp(String user_id);
	Health getLatestBs(String user_id);

	// 나의 건강기록 불러오기
	ArrayList<Health> getMyBpList(String user_id);
	ArrayList<Health> getMyBsList(String user_id);
	ArrayList<Ecg> getMyEcgList(String user_id);

	//Admin-User 페이지 출력 데이터
	ArrayList<Admin> getUserList();
	ArrayList<Admin> getEcgList();
	// 도넛차트에 넣어줄 데이터 불러오기
	ArrayList<Admin> getRes();
	// 건강 정보 불러오는 매퍼
	ArrayList<Admin> getHealth();
	// 분석에 걸린 시간 불러오는 매퍼
	ArrayList<Admin> getDeep();

	ArrayList<Ecg> getEcgDetails(int ecgNum);
	
	// 커뮤니티 등록하기
	void insertCommunity(Community com);

	// 커뮤니티 카드
	Ecg getEcgInfo(Integer ecg_num);

	Health getHealthInfo(Integer h_num);

	ArrayList<Community> getchoose();
	
	User findByUsername(String user_id);

	ArrayList<Community> getbase();
	
	
	
	
	
	


}

