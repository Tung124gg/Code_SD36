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
<div class="mt-8">
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
                                    <span class="h-8 w-8 text-center p rounded-full bg-gray-300 text-white mr-2">2</span>
                                    <span class="text-gray-300">Thanh toán</span>
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
    <div class="w-[80%] mx-auto grid grid-cols-12 mt-12 gap-4">
        <div class="col-span-9">
            <h2 class="font-bold text-xl uppercase">Giỏ hàng của bạn</h2>
            <span id="total-quantity">${gioHang.size()}</span> <span>sản phẩm</span>
            <div class="overflow-x-auto">
                <table class="table">
                    <!-- head -->
                    <thead>
                    <tr>
                        <th>
                            <label>
                                <input type="checkbox" class="checkbox" />
                            </label>
                        </th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${gioHang}" var="item">
                        <!-- row 1 -->
                        <tr class="gio-hang">
                            <th>
                                <label>
                                    <input type="checkbox" class="checkbox" />
                                </label>
                            </th>
                            <td>
                                <div class="flex items-center gap-3">
                                    <div class="avatar">
                                        <div class="mask mask-squircle h-12 w-12">
                                            <img
                                                    src=${item.giayTheThaoChiTiet.giayTheThao.getAnhDau()}
                                                    alt="Avatar Tailwind CSS Component" />
                                        </div>
                                    </div>
                                    <div>
                                        <div class="font-bold">${item.giayTheThaoChiTiet.giayTheThao.tenGiayTheThao}</div>
                                        <div class="text-sm opacity-50 flex justify-between items-center gap-4">
                                            <span>Kích thước: ${item.giayTheThaoChiTiet.size.size}</span>
                                            <span class="inline-block text-yellow-300 my-2 w-6 h-[1px] bg-yellow-300"></span>
                                            <span>Màu sắc: ${item.giayTheThaoChiTiet.mauSac.tenMauSac}</span>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <span  class="column-don-gia"> ${item.donGia}</span>

                                <span class="badge badge-ghost badge-sm">VND</span>
                            </td>
                            <td>
                                <span>x</span>
                                <span class="column-so-luong">${item.soLuong}</span>
                            </td>
                            <th>
                                <button data-id = "${item.id}" onclick="handleRemoveCart(this)" class="btn btn-outline btn-error">Xóa</button>
                            </th>
                        </tr>
                        <c:set var="totalAmount" value="${totalAmount + item.donGia * item.soLuong}" />
                        <c:set var="totalQuantity" value="${totalQuantity + item.soLuong}" />
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-span-3 flex flex-col gap-6">
            <h2 class="font-bold text-xl uppercase">Thêm voucher</h2>
            <h3>Dùng mã vourcher ngay</h3>
            <select class="select select-accent w-full max-w-xs" onchange="handleChangeVoucher()">
                <option disabled selected>Chọn vourcher</option>
                <c:forEach items="${chuongTrinhGiamGiaHoaDon}" var="voucher">
                    <option value="${voucher.id}" data-value = "${voucher.phanTramGiam}">${voucher.tenChuongTrinh}</option>
                </c:forEach>
            </select>
            <div class="flex justify-between">
                <p >Tạm tính</p>
                <div>
                    <span id="total-amount">${totalAmount} </span> <span>VND</span>
                </div>
            </div>
            <div class="flex justify-between border-b pb-4">
                <p>Giảm giá</p>
                <p>
                    <span id="voucher-value">0</span> <span>VND</span>
                </p>
            </div>
            <div class="flex justify-between">
                <p>Tổng thanh toán</p>
                <p>
                    <span id="total-amount-after">${totalAmount} </span> <span>VND</span>
                </p>
            </div>
            <a href="${pageContext.request.contextPath}/thanh-toan/85FE1849-1EA4-4FF5-8865-0B8F6A70ADFF" class="btn text-white bg-orange-500 w-full">Mua hàng</a>
        </div>
    </div>
</div>
<script>
    function handleRemoveCart(e) {
        const itemId = e.getAttribute('data-id');
        window.location.href = `http://localhost:8080/gio-hang/delete/` + itemId;
        // const size = document.querySelector('#total-quantity');
        // e.closest('tr').remove();
        // const totalAmount = document.querySelector('#total-amount');
        // const totalAmountAfter = document.querySelector('#total-amount-after');
        // const voucherValue = document.querySelector('#voucher-value');
        //
        // const listGioHang = document.querySelectorAll('.gio-hang');
        // let totalAmountValue = 0;
        // listGioHang.forEach(gioHang => {
        //     const donGia = gioHang.querySelector(".column-don-gia").textContent;
        //     const soLuong = gioHang.querySelector(".column-so-luong").textContent;
        //     totalAmountValue += parseInt(donGia) * parseInt(soLuong);
        // });

        totalAmount.innerHTML = totalAmountValue;
        size.innerHTML = parseInt(size.textContent) - 1;
        totalAmountAfter.innerHTML = totalAmountValue - parseInt(voucherValue.textContent);

    }

    function handleChangeVoucher() {
        const select = document.querySelector('select');
        const totalAmount = document.querySelector('#total-amount');
        const totalAmountAfter = document.querySelector('#total-amount-after');
        const voucherValue = document.querySelector('#voucher-value');
        const value = select.options[select.selectedIndex].getAttribute('data-value');

        const valueVoucher = parseInt(totalAmount.textContent) * value / 100;

        totalAmountAfter.innerHTML = parseInt(totalAmount.textContent) - valueVoucher;
        voucherValue.innerHTML = valueVoucher;
    }
</script>
</body>
</html>
