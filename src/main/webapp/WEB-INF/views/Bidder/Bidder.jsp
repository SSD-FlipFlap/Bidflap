<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/resources/css/bidder/bidder.css">
    <title>경매페이지-로그인</title>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const participateButton = document.querySelector(".participate-button");
            const modalOverlay = document.querySelector(".modal-overlay");
            const closeButton = document.querySelector(".close-btn");
            const cancelButton = document.querySelector(".cancel-btn");

            participateButton.addEventListener("click", function() {
                modalOverlay.classList.add("show");
            });

            closeButton.addEventListener("click", function() {
                modalOverlay.classList.remove("show");
            });

            cancelButton.addEventListener("click", function() {
                modalOverlay.classList.remove("show");
            });
        });
    </script>

</head>
<body>
<%@ include file="../Header.jsp" %>

<div class="bidder-container">
    <div class="image-placeholder"></div>
    <div class="left-container">
        <div class="image-frame">
            <img class="product-image" src="https://via.placeholder.com/420x420" />
            <img class="rotate-image" src="https://via.placeholder.com/32x32" />
        </div>
        <div class="profile">
            <img class="profile-image" src="https://via.placeholder.com/110x110" />
            <span class="profile-name">가을이 님</span>
            <br/>
            <span class="profile-start-time">2024년 4월 11일 9시 경매 시작하셨습니다.</span>

        </div>
    </div>
    <div class="right-container">
        <div class="product-container">
            <div class="hashtag">#웨어러블</div>
            <div class="product-name">에어팟 프로맥스 실버</div>
            <div class="product-price">
                <a class="highest-bid">최고입찰가</a>
                <div class="price-value">300,000원</div>
            </div>
            <div class="product-description">설명글: 에어팟프로맥스 실버 와 예쁘다~~~ 사고싶다 와앙아아ㅏ아아아아아아아아아ㅏ아아아설명설명 어쩌고저쩌고,, 긴 글 글자수 채우기,,, 으아아아아아아아아아아아아아아아 상품설명은 얼마나 길어야 좋은걸까? 모르겠ㄷ...경매품에 대한 수락 혹은 거부의사를 3일 안에 전달해야합니다.<br/><br/> 낙찰 수락 시 ,결제가 가능하며 이후 보증금이 반환됩니다.  <br/>
                낙찰 수락 후 결제를 취소하는 경우, 보증금은 돌려받을 수 없습니다.  <br/>
                낙찰 거부시, 다음 순위의 참여자에게 기회가 넘어갑니다. 경매글 훔쳐오기...</div>
        </div>
        <div class="button-container">
            <div class="button-left">
                <div class="unavailable">구매불가능</div>
            </div>
            <div class="button-right">
                <button class="participate-button">경매참여</button>
            </div>
        </div>
        <div class="like-unavailable">좋아요 불가능</div>
        <div class="auction-info">경매 시작 가능 | 10명 이상 좋아요</div>
    </div>
</div>
<div class="modal-overlay">
    <div class="modal">
        <div class="modal-header">
            <h2>경매 참여자에게 알립니다.</h2>
            <%--            <button class="close-btn">&times;</button>--%>
        </div>
        <div class="modal-body">
            <!-- 팝업 내용 -->
            <p>경매 참여시 안전 거래를 위해 판매가 일정 금액 이상일 경우 가격의 5%,<br/> 미만일 경우 기본 금액의 보증금을 납부해야합니다. <br/><br/>
                낙찰 시 경매품에 대한 수락 혹은 거부의사를 3일 안에 전달해야합니다.<br/><br/> 낙찰 수락 시 ,결제가 가능하며 이후 보증금이 반환됩니다.  <br/>
                낙찰 수락 후 결제를 취소하는 경우, 보증금은 돌려받을 수 없습니다.  <br/>
                낙찰 거부시, 다음 순위의 참여자에게 기회가 넘어갑니다. </p>
            <label for="confirmation-checkbox">
                <input type="checkbox" id="confirmation-checkbox"> 위 사항을 확인했습니다.
            </label>
            <br/><br/>
            <button class="participate-button2">경매참여</button>
        </div>
    </div>
</div>
</body>
</html>
