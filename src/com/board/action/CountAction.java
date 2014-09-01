package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.controller.CommandAction;
import com.board.dao.BoardMyBatisDao;
import com.board.dto.Board;

public class CountAction implements CommandAction {
	
	
	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
		Board article = BoardMyBatisDao.getInstance().getArticle(boardSeq);
		String regIp = request.getRemoteAddr();
		if(!regIp.equals(article.getRegIp())) {
			int count = article.getCount();
			article.setCount(++count);
			BoardMyBatisDao.getInstance().setArticleCount(article);
		}
		request.setAttribute("url", "content.do?boardSeq="+boardSeq);

		return "redirect2.jsp";
	}

}
