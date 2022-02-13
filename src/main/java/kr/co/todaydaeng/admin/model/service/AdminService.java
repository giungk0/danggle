package kr.co.todaydaeng.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.todaydaeng.admin.model.vo.AdminVO;
import kr.co.todaydaeng.member.model.vo.Member;

public interface AdminService {

	AdminVO selectAdminLogin(HashMap<String, String> map);

	String selectAdminEmailCheck(String chkMail);

	int updateAdminAccount(AdminVO avo);

	int updateAdminPWD(HashMap<String, String> mapPwd);

	AdminVO selectAdminAccount(String adminID);

	ArrayList<AdminVO> selectAdminList();

	int selectAdminNew();

	ArrayList<AdminVO> selectAdminSearch(HashMap<String, String> findMap);

	ArrayList<Member> selectMemberList(HashMap<String, Integer> pageNum);

	String memberPageNavi(int currentPage, int recordCountPerPage, int naviCountPerPage);

	int selectMemberCount();


}
