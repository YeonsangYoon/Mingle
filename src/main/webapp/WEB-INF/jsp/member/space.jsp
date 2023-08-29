<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="app-content">
    <div class="app-content-header">
        <h1 class="app-content-headerText">공간 대여 목록</h1>
    </div>
    <div class="app-content-actions">
        <input class="search-bar" placeholder="Search..." type="text">
        <div class="app-content-actions-wrapper">
            <button class="action-button list active" title="List View">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list"><line x1="8" y1="6" x2="21" y2="6"/><line x1="8" y1="12" x2="21" y2="12"/><line x1="8" y1="18" x2="21" y2="18"/><line x1="3" y1="6" x2="3.01" y2="6"/><line x1="3" y1="12" x2="3.01" y2="12"/><line x1="3" y1="18" x2="3.01" y2="18"/></svg>
            </button>
            <button class="action-button grid" title="Grid View">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-grid"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
            </button>
        </div>
    </div>
    <div class="products-area-wrapper tableView">
        <div class="products-header">
            <div class="product-cell image" style="flex: 2">공간이름</div>
            <div class="product-cell category">카테고리</div>
            <div class="product-cell status-cell">예약일</div>
            <div class="product-cell sales">시간</div>
            <div class="product-cell stock" style="flex: 0.5">인원</div>
            <div class="product-cell price" style="flex: 0.5">총 금액</div>
        </div>
        <c:forEach items="${bList}" var="vo">
        <div class="products-row">
            <div class="product-cell image" style="flex: 2">
                <img src=${vo.poster} alt="product">
                <span>${vo.title}</span>
            </div>
            <div class="product-cell category">
                <span class="cell-label">카테고리</span>
                ${vo.category}
            </div>
            <div class="product-cell status-cell">
                <span class="cell-label">예약일</span>
                <fmt:formatDate value="${vo.bk_date}" pattern="yyyy.MM.dd"/>
            </div>
            <div class="product-cell sales">
                <span class="cell-label">시간</span>
                ${vo.startsat}시 ~ ${vo.endsat}시
            </div>
            <div class="product-cell stock" style="flex: 0.5">
                <span class="cell-label">인원</span>
                ${vo.person}
            </div>
            <div class="product-cell price" style="flex: 0.5">
                <span class="cell-label">총 금액</span>
                <fmt:formatNumber value="${vo.amount }" pattern="#,###" />원
            </div>
        </div>
        </c:forEach>
    </div>
    <div class="product__pagination">
        <ul>
            <li>
                <span onclick="movePage(1)"><i class="fa fa-angle-double-left"></i></span>
            </li>
            <li>
                <span onclick="movePage(${startpage-1})"><i class="fa fa-angle-left"></i></span>
            </li>
            <c:forEach begin="${startpage}" end="${endpage}" var="i">
            <li>
                <span onclick="movePage(${i})">${i}</span>
            </li>
            </c:forEach>
            <li>
                <span onclick="movePage(${endpage + 1})"><i class="fa fa-angle-right"></i></span>
            </li>
            <li>
                <span onclick="movePage(${totalpage})"><i class="fa fa-angle-double-right"></i></span>
            </li>
        </ul>
    </div>
</div>
<script>
    function movePage(page){
        if(page < 1 || page > ${totalpage}){
            return;
        }
        location.href = '/mingle/mypage/space.do?page=' + page;
    }
</script>
