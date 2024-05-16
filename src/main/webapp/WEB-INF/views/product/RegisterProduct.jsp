<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/resources/css/product/RegisterProduct.css">
    <title>상품 정보</title>
</head>
<body>
<%@ include file="../Header2.jsp"%>
<h1>상품정보</h1>
<form action="/product/registerdo" method="post" enctype="multipart/form-data">
    <div id="productContainer"><br/>
<%--        <label for="product_img" class="product_img"></label>--%>
        <div id="productPreviewContainer">
            <img id="productPreview" src="/resources/img/CameraImg.svg">
        </div>
        <input type="file" id="product_img" name="product_filepath" accept="image/*" onchange="previewProfile(event)">
    </div>

    <div class="product-name">상품명
        <input type="text" id="productName" name="title" class="input-style">
    </div>

    <div class="product-category">카테고리</div>

    <div class="product-category2">
        <input type="checkbox" id="mobile" name="category[]" value="MOBILE">
        <label for="mobile">휴대폰</label>

        <input type="checkbox" id="tablet" name="category[]" value="TABLET">
        <label for="tablet">태블릿</label>

        <input type="checkbox" id="camera" name="category[]" value="CAMERA">
        <label for="camera">카메라</label>

        <input type="checkbox" id="pc_parts" name="category[]" value="PC_PARTS">
        <label for="pc_parts">PC 부품</label>

        <br/>
        <input type="checkbox" id="wearable" name="category[]" value="WEARABLE">
        <label for="wearable">웨어러블</label>

        <input type="checkbox" id="pc_notebook" name="category[]" value="PC_NOTEBOOK">
        <label for="pc_notebook">PC/노트북</label>

        <input type="checkbox" id="accessory" name="category[]" value="ACCESSORY">
        <label for="accessory">악세사리</label>

        <input type="checkbox" id="etc" name="category[]" value="ETC">
        <label for="etc">기타</label>
    </div>
    <br/>

    <div class="line"></div>

    <!-- 가격 입력 -->
    <div class="price">가격
        <input type="text" id="price" name="price" class="input-style">
    </div>

    <!-- 설명 -->
    <div class="description">설명</div>

    <!-- 설명 칸-->
    <div class="rectangle-180">
    <textarea class="description-text" name="description" rows="4" cols="50"><%
        String description = request.getParameter("description");
        if (description != null && !description.trim().isEmpty()) {
            out.print(description.trim());
        }
    %></textarea>
    </div>

    <div>
        <button type="submit">등록</button>
    </div>
</form>
</body>
</html>