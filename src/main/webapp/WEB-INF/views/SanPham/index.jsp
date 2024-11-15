<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.14/dist/full.min.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />

    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#da373d',
                    }
                }
            }
        }
    </script>
    <style>
        .swiper {
            width: 100%;
            height: 100%;
        }

        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .swiper-slide img {
            display: block;
            width: 70%;
            height: 70%;
            object-fit: cover;
        }

        input[type='number']::-webkit-inner-spin-button,
        input[type='number']::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .custom-number-input input:focus {
            outline: none !important;
        }

        .custom-number-input button:focus {
            outline: none !important;
        }
    </style>
    <title>User</title>
</head>
<body>
<%@ include file="../templates/header.jsp" %>
<div class="w-[80%] mx-auto grid grid-cols-12 mt-8 gap-8">
    <div class="col-span-6">
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                <c:forEach var="image" items="${images}">
                    <div class="swiper-slide">
                        <img src="${image.link}"/>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="h-12 flex gap-4 h-[100px] overflow-auto">
            <c:forEach var="image" items="${images}">
                <img src="${image.link}" class="border">
            </c:forEach>
        </div>
    </div>
    <div class="col-span-6">
        <div class="breadcrumbs text-sm">
            <ul>
                <li><a>Home</a></li>
                <li><a>Documents</a></li>
                <li>Add Document</li>
            </ul>
        </div>
        <h2 class="font-bold text-4xl my-4">${giayTheThao.tenGiayTheThao}</h2>
        <h3 class="font-semibold text-2xl text-red-500 my-2">${giayTheThao.giaBan} VND</h3>
        <p>Chọn kích thước</p>
        <div class="flex gap-4 p-4">
            <c:forEach var="size" items="${sizes}">
                <button data-size="${size.id}" onclick="handleClickSize(this)"
                        class="btn btn-size">${size.size}</button>
            </c:forEach>
        </div>
        <p>Chọn màu sắc</p>
        <div class="flex gap-4 p-4">
            <c:forEach var="color" items="${mauSacs}">
                <button data-color="${color.id}" onclick="handleClickColor(this)"
                        class="btn btn-color">${color.tenMauSac}</button>
            </c:forEach>
        </div>
        <div class="flex py-4 border-b">
            <div class="custom-number-input h-10 w-32">
                <div class="flex flex-row h-10 w-full rounded-lg relative bg-transparent mt-1">
                    <button data-action="decrement"
                            class=" bg-gray-300 text-gray-600 hover:text-gray-700 hover:bg-gray-400 h-full w-20 rounded-l cursor-pointer outline-none">
                        <span class="m-auto text-2xl font-thin">−</span>
                    </button>
                    <input type="number"
                           class="outline-none focus:outline-none text-center w-full bg-gray-300 font-semibold text-md hover:text-black focus:text-black  md:text-basecursor-default flex items-center text-gray-700  outline-none"
                           name="custom-input-number" value="1"></input>
                    <button data-action="increment"
                            class="bg-gray-300 text-gray-600 hover:text-gray-700 hover:bg-gray-400 h-full w-20 rounded-r cursor-pointer">
                        <span class="m-auto text-2xl font-thin">+</span>
                    </button>
                </div>

            </div>
            <div class="flex flex-1 justify-end gap-4">
                <button onclick="handleThemSanPham()" id="addToCartBtn" class="btn btn-outline btn-success" disabled>Thêm vào giỏ hàng</button>
            </div>
        </div>
        <form id="addProductForm" action="/gio-hang" method="post" style="display: none;">
            <input type="hidden" name="chiTietId" id="productDetailId">
            <input type="hidden" name="soLuong" id="quantity">
            <input type="hidden" name="khachHangId" id="userId" value="85FE1849-1EA4-4FF5-8865-0B8F6A70ADFF">
        </form>
        <div class="flex justify-between my-2">
            <div>
                <p class="text-lg font-semibold">Mã</p>
                <p>${giayTheThao.id}</p>
            </div>
            <div>
                <p class="text-lg font-semibold">Thương hiệu</p>
                <p>${giayTheThao.thuongHieu.tenThuongHieu}</p>
            </div>
            <div>
                <p class="text-lg font-semibold">Số lượng hàng có sẵn</p>
                <p id="quantity-remain">0</p>
            </div>
        </div>

    </div>
    <script>
        let selectedSize = null;
        let selectedColor = null;
        const giayTheThaoChiTiet = ${giayTheThaoChiTiet};
        let giayTheoThaoDangChon = null;

        var swiper = new Swiper(".mySwiper", {
            spaceBetween: 30,
            centeredSlides: true,
            autoplay: {
                delay: 2000,
                disableOnInteraction: false,
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
        });

        function handleThemSanPham() {
            const soLuong = document.querySelector('input[name="custom-input-number"]').value;
            const size = selectedSize;
            const color = selectedColor;

            if (!size || !color || !soLuong) {
                alert("Vui lòng chọn đầy đủ thông tin sản phẩm.");
                return;
            }

            const form = document.getElementById('addProductForm');

            form.querySelector('#productDetailId').value = giayTheoThaoDangChon.id;
            form.querySelector('#quantity').value = soLuong;
            form.submit();
        }

        function handleClickSize(e) {
            const buttons = document.querySelectorAll('.btn-size');
            buttons.forEach(button => {
                button.classList.remove('bg-black');
                button.classList.remove('text-white');
            });
            e.classList.add('bg-black');
            e.classList.add('text-white');
            selectedSize = e.getAttribute('data-size');
            updateQuantity();
        }

        function handleClickColor(e) {
            const buttons = document.querySelectorAll('.btn-color');
            buttons.forEach(button => {
                button.classList.remove('bg-black');
                button.classList.remove('text-white');
            });
            e.classList.add('bg-black');
            e.classList.add('text-white');
            selectedColor = e.getAttribute('data-color');
            updateQuantity();
        }

        function updateQuantity() {
            const quantity = document.getElementById('quantity-remain');
            const addToCartBtn = document.getElementById('addToCartBtn');
            const buyNowBtn = document.getElementById('buyNowBtn');

            const value = giayTheThaoChiTiet.find(giayTheThaoChiTiet => giayTheThaoChiTiet.size.id == selectedSize && giayTheThaoChiTiet.mauSac.id == selectedColor);
            giayTheoThaoDangChon = value;
            if (!value) {
                quantity.innerText = 0;
                addToCartBtn.disabled = true;
                buyNowBtn.disabled = true;
                return;
            }

            quantity.innerText = value.soLuong;

            // Kiểm tra số lượng và vô hiệu hóa hoặc bật các nút
            if (value.soLuong > 0) {
                addToCartBtn.disabled = false;
                buyNowBtn.disabled = false;
            } else {
                addToCartBtn.disabled = true;
                buyNowBtn.disabled = true;
            }
        }

        function decrement(e) {
            const btn = e.target.parentNode.parentElement.querySelector(
                'button[data-action="decrement"]'
            );
            const target = btn.nextElementSibling;
            let value = Number(target.value);
            value--;
            target.value = value;
        }

        function increment(e) {
            const btn = e.target.parentNode.parentElement.querySelector(
                'button[data-action="decrement"]'
            );
            const target = btn.nextElementSibling;
            let value = Number(target.value);
            value++;
            target.value = value;
        }

        const decrementButtons = document.querySelectorAll(
            `button[data-action="decrement"]`
        );

        const incrementButtons = document.querySelectorAll(
            `button[data-action="increment"]`
        );

        decrementButtons.forEach(btn => {
            btn.addEventListener("click", decrement);
        });

        incrementButtons.forEach(btn => {
            btn.addEventListener("click", increment);
        });


    </script>
</body>
</html>
