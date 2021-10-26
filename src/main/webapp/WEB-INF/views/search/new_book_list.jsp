<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TITLE</title>
<script type="text/javascript" src="/resources/search/js/search_form.js?ver=1" ></script>
<style type="text/css">
.content {
	background-color: white;
}
.bookTitle {
	font-size: 22px;
	font-weight: bold;
}
.bookTitle:hover {
	text-decoration: underline 2px black;
	cursor: pointer;
	color: black;
}
.titleA:hover {
	color: black;
}
.page-link {
	color: black;
}
.page-item.active .page-link {
    z-index: 3;
	background-color: #6c757d;
	color: white;
    border-color: #6c757d;
</style>
</head>
<body>

<div class="row justify-content-center">
	<div class="col-8">
		<h1 class="display-6 text-center">신착도서</h1>
		<hr>
		<h5>도서관에 새로 들어온 책을 안내해드립니다.</h5>
		<div class="row justify-content-center">
			<div class="col-12">
			<table class="table table-hover table-bordered caption-top">
					<c:forEach var="book" items="${bookList }" varStatus="status">
					<tr>
						<td><span>${status.count }.</span>
							<div class="bookTitle"><a class="titleA" href="/search/bookDetail?bookCode=${book.bookCode }&menuCode=${menuVO.menuCode}">${book.title }</a></div>
							<div class="mt-2">${book.writer } / ${book.publisher } / ${book.pubDate }</div>
							<div class="mt-2"><c:if test="${book.status eq 0 }">대출 가능</c:if><c:if test="${book.status eq 1 }">대출중</c:if><c:if test="${book.status eq 2 }">예약중</c:if>
							&nbsp;/&nbsp;${book.area }</div>
						</td>
						<td class="text-center">
							<img style="width: 100px;" src="/resources/bookImgUpload/${book.bookImgVO.attachedImgName }" alt="#">
						</td>
					</tr>
					</c:forEach>
			</table>
			</div>
			<div class="col-12">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
					 <c:if test="${bookVO.prev }">
						<li class="page-item">
						<a class="page-link" href="/search/newBookList?nowPage=${bookVO.startPage - 1 }&menuCode=${menuVO.menuCode}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
						</a>
						</li>
					 </c:if> 
						<c:forEach var="pageNum" begin="${bookVO.startPage }" end="${bookVO.endPage }">
							<li class="page-item  <c:if test="${bookVO.nowPage eq pageNum }">active</c:if>  ">
							<a class="page-link" href="/search/newBookList?nowPage=${pageNum }&menuCode=${menuVO.menuCode}">${pageNum }</a>
							</li>
						</c:forEach>
					<c:if test="${bookVO.next }">
						<li class="page-item">
						<a class="page-link" href="/search/newBookList?nowPage=${bookVO.endPage + 1 }&menuCode=${menuVO.menuCode}" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
						</a>
						</li>
					</c:if>
					</ul>
				</nav>
			</div>			
		</div>
	</div>
</div>
</body>
</html>


