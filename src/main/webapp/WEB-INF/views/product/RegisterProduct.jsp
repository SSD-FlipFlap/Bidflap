<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/resources/css/product/RegisterProduct.css">
    <title>상품 정보</title>
</head>
<body>
<h1>상품정보</h1>
<form action="/register" method="post">
    <div class="product-pic"><br/>
        <div class="camera">
            <img id="cameraImg" src="/resources/img/CameraImg.svg">
        </div>
    </div>

    <div class="product-name">상품명
        <input type="text" id="productName" name="productName" class="input-style">
    </div>

<%--    <!-- 카테고리 -->--%>
    <div class="category">카테고리
    </div>

<%--    <!-- 관심있는 카테고리 -->--%>
    <div class="interest-category">
    <div class="category-list">
        <input type="checkbox" id="mobile" name="category" value="휴대폰">
        <label for="mobile">휴대폰</label>

        <input type="checkbox" id="tablet" name="category" value="태블릿">
        <label for="tablet">태블릿</label>

        <input type="checkbox" id="camera" name="category" value="카메라">
        <label for="camera">카메라</label>

        <input type="checkbox" id="pcParts" name="category" value="PC 부품">
        <label for="pcParts">PC 부품</label>

        <br/>
        <input type="checkbox" id="wearable" name="category" value="웨어러블">
        <label for="wearable">웨어러블</label>

        <input type="checkbox" id="pcNotebook" name="category" value="PC/노트북">
        <label for="pcNotebook">PC/노트북</label>

        <input type="checkbox" id="accessory" name="category" value="악세사리">
        <label for="accessory">악세사리</label>

        <input type="checkbox" id="etc" name="category" value="기타">
        <label for="etc">기타</label>
    </div>
    <br/>
    </div>

    <div class="line">    </div>

    <!-- 가격 입력 -->
    <div class="price">가격
        <input type="text" id="price" name="price" class="input-style">
    </div>

    <!-- 설명 -->
    <div class="description">설명</div>

    <!-- 설명 칸-->
    <div class="rectangle-180">
        <textarea class="description-text" name="description" rows="4" cols="50">
        <%
            String description = request.getParameter("description");
            if (description != null) {
                out.print(description);
            }
        %>
        </textarea>
    </div>

    <!-- 등록 버튼 -->
    <div>
        <button type="submit">등록</button>
    </div>
</form>
</body>
</html>
