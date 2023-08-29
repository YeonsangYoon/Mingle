<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="app-content">
    <div class="app-content-header">
        <h1 class="app-content-headerText">스터디 좋아요 목록</h1>
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
            <div class="product-cell title" style="flex: 2">스터디 제목</div>
            <div class="product-cell onoff" style="flex: 0.5">진행방식</div>
            <div class="product-cell period" style="flex: 0.5">진행기간</div>
            <div class="product-cell recruit" style="flex: 0.5">모집인원</div>
            <div class="product-cell deadline" style="flex: 0.5">모집마감일</div>
        </div>
        <div class="products-row">
            <div class="product-cell title" style="flex: 2">
                <span>★ 카카오 갑시다</span>
            </div>
            <div class="product-cell onoff" style="flex: 0.5">
                <span class="cell-label">진행방식</span>
                온라인
            </div>
            <div class="product-cell period" style="flex: 0.5">
                <span class="cell-label">진행기간</span>
                3개월
            </div>
            <div class="product-cell recruit" style="flex: 0.5">
                <span class="cell-label">모집인원</span>
                1명
            </div>
            <div class="product-cell deadline" style="flex: 0.5">
                <span class="cell-label">모집마감일</span>
				2023-08-29
            </div>
        </div>
        <div class="products-row">
            <div class="product-cell title" style="flex: 2">
                <span>★ 강남~사당 부근 MongoDB 스터디 모집합니다! (Real MongoDB 책)</span>
            </div>
            <div class="product-cell onoff" style="flex: 0.5">
                <span class="cell-label">진행방식</span>
                온/오프라인
            </div>
            <div class="product-cell period" style="flex: 0.5">
                <span class="cell-label">진행기간</span>
                5개월
            </div>
            <div class="product-cell recruit" style="flex: 0.5">
                <span class="cell-label">모집인원</span>
                4명
            </div>
            <div class="product-cell deadline" style="flex: 0.5">
                <span class="cell-label">모집마감일</span>
				2023-08-30
            </div>
        </div>
        <div class="products-row">
            <div class="product-cell title" style="flex: 2">
                <span>★ 성장에 진심인 사람들이 모이는 미라클 모닝 WAIM 8기(7.31~8.26) 멤버 모집!</span>
            </div>
            <div class="product-cell onoff" style="flex: 0.5">
                <span class="cell-label">진행방식</span>
                온라인
            </div>
            <div class="product-cell period" style="flex: 0.5">
                <span class="cell-label">진행기간</span>
                1개월
            </div>
            <div class="product-cell recruit" style="flex: 0.5">
                <span class="cell-label">모집인원</span>
                인원미정
            </div>
            <div class="product-cell deadline" style="flex: 0.5">
                <span class="cell-label">모집마감일</span>
				2023-08-26
            </div>
        </div>
    </div>
</div>