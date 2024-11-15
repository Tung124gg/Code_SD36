<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.14/dist/full.min.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <title>User</title>
</head>
<body>
<%@ include file="../templates/header.jsp" %>
<div class="my-8">
    <div class="border-b">
        <div class="w-[80%] mx-auto">
            <div class="grid grid-cols-2 pb-4">
                <div class="text-2xl font-bold">Trạng thái đơn hàng</div>
                <div>
                    <div class="breadcrumbs text-sm">
                        <ul class="text-lg font-semibold">
                            <li class="text-yellow-300">
                                <a>
                                    <span class="h-8 w-8 text-center p rounded-full bg-yellow-500 text-white mr-2">1</span>
                                    Giỏ hàng
                                </a>
                            </li>
                            <li>
                                <a>
                                    <span class="h-8 w-8 text-center p rounded-full bg-yellow-500 text-white mr-2">2</span>
                                    <span class="text-yellow-500">Thanh toán</span>
                                </a>
                            </li>
                            <li>
                      <span class="inline-flex items-center gap-2">
                        <span class="h-8 w-8 text-center p rounded-full bg-gray-300 text-white mr-2">3</span>
                        <span class="text-gray-300">Đặt hàng thành công</span>
                      </span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="w-[80%] mx-auto grid grid-cols-2 mt-12 gap-8">
        <div class="">
            <h2 class="font-bold text-xl uppercase">Thông báo</h2>
            <h3>Kiểm tra các mặt hàng một lần nữa trước khi thanh toán</h3>
            <div>
                <c:forEach items="${gioHangChiTiets}" var="item">
                    <div class="grid grid-cols-3 gap-2 py-4 border-b-2 border-dashed">
                        <img class="w-20 h-20" src="${item.giayTheThaoChiTiet.giayTheThao.getAnhDau()}">
                        <div class="col-span-2">
                            <p>${item.giayTheThaoChiTiet.giayTheThao.tenGiayTheThao}</p>
                            <p class="py-2">${item.giayTheThaoChiTiet.giayTheThao.thuongHieu.tenThuongHieu}</p>
                            <div class="flex justify-between">
                                <p>x${item.soLuong}</p>
                                <p class="py-2">${item.donGia} VND</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class=" flex flex-col gap-6">
            <h2 class="font-bold text-xl uppercase">Chi tiết thanh toán</h2>
            <h3>lorem</h3>
            <form class="grid grid-cols-2 gap-4">
                <div class="flex flex-col gap-8">
                    <input type="text" placeholder="Type here" class="input input-bordered w-full max-w-xs" />
                    <select class="select select-bordered w-full max-w-xs">
                        <option disabled selected>Who shot first?</option>
                        <option>Han Solo</option>
                        <option>Greedo</option>
                    </select>
                    <select class="select select-bordered w-full max-w-xs">
                        <option disabled selected>Who shot first?</option>
                        <option>Han Solo</option>
                        <option>Greedo</option>
                    </select>
                </div>
                <div class="flex flex-col gap-8">
                    <input type="text" placeholder="Type here" class="input input-bordered w-full max-w-xs" />
                    <select class="select select-bordered w-full max-w-xs">
                        <option disabled selected>Who shot first?</option>
                        <option>Han Solo</option>
                        <option>Greedo</option>
                    </select>
                    <input type="text" placeholder="Type here" class="input input-bordered w-full max-w-xs" />
                </div>
            </form>
            <p>Chon phuong thuc thanh toan</p>
            <div>
                <div class="flex mb-4">
                    <input id="radio-1" type="radio" name="radio-1" class="radio mr-4" checked="checked" />
                    <label for="radio-1">Thanh toan khi nhan hang</label>
                </div>
                <div class="flex ">
                    <input id="radio-2" type="radio" name="radio-1" class="radio  mr-4" />
                    <label for="radio-2">Thanh toan qua the ngan hang</label>
                </div>
            </div>
            <button class="btn btn-wide">Thanh toan</button>
        </div>
    </div>
</div>
</body>
</html>
