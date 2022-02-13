package kr.co.todaydaeng.admin.model.service;

import java.util.HashMap;

import kr.co.todaydaeng.admin.model.vo.AdminVO;

public interface ManageService {

	String selectAdminIDCheck(String chkID);

	int insertAdminAccount(AdminVO avo);

	int updateAdminGrade(HashMap<String, Object> map);

	int updateMemberStatus(HashMap<String, Object> map);

}
