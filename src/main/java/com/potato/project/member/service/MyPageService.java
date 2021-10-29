package com.potato.project.member.service;

import java.util.List;

import com.potato.project.common.vo.RentalVO;
import com.potato.project.content.vo.QnaVO;
import com.potato.project.member.vo.MemberVO;

public interface MyPageService {
	
	//나의 도서관 대출 예약 반납 카운트용 추가 --1025 봉
	MemberVO memberBookSituation(MemberVO memberVO);
	
	//----------------------내정보 시작----------------
	//내정보 조회
	MemberVO selectMemberInfo(MemberVO memberVO);
	
	//전화번호 길이 조회
	MemberVO selectTellCnt(MemberVO memberVO);
	
	//전화번호 다시 하나씩 뺴오기
	MemberVO selectTell(MemberVO memberVO);
	
	//회원정보수정
	void updateMyInfo(MemberVO memberVO);
	
	//회원 비밀번호 수정
	boolean updatePw(MemberVO memberVO);
	
	//회원 탈퇴
	boolean checkMemberquit(MemberVO memberVO);
	//---------------------내정보 끝---------------
	
	
	//-----------------내문의 내역 시작-----------------
	//문의 조회
	List<QnaVO> myQnaList(MemberVO memberVO);
	//-----------------내문의 내역 끝-----------------
	
	
	//-------------------내 대출/예약현황 시작--------------------
	List<RentalVO> selectRentalList(MemberVO memberVO);
	
	
}
