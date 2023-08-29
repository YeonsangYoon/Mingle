<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <div class="product-cell image">공간이름</div>
            <div class="product-cell category">카테고리</div>
            <div class="product-cell status-cell">예약일</div>
            <div class="product-cell sales">시간</div>
            <div class="product-cell stock">인원</div>
            <div class="product-cell price">총 금액<</div>
        </div>
        <div class="products-row">
            <button class="cell-more-button">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical"><circle cx="12" cy="12" r="1"/><circle cx="12" cy="5" r="1"/><circle cx="12" cy="19" r="1"/></svg>
            </button>
            <div class="product-cell image">
                <img src="https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80" alt="product">
                <span>Ocean</span>
            </div>
            <div class="product-cell category"><span class="cell-label">카테고리</span>Furniture</div>
            <div class="product-cell status-cell">
                <span class="cell-label">예약일</span>
                <span class="status active">Active</span>
            </div>
            <div class="product-cell sales"><span class="cell-label">시간</span>11</div>
            <div class="product-cell stock"><span class="cell-label">인원</span>36</div>
            <div class="product-cell price"><span class="cell-label">총 금액</span>$560</div>
        </div>
    </div>
</div>