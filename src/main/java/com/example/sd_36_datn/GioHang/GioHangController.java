package com.example.sd_36_datn.GioHang;

import com.example.sd_36_datn.Model.GioHangChiTiet;
import com.example.sd_36_datn.Service.GiamGia.ChuongTrinhGiamGiaHoaDonService;
import com.example.sd_36_datn.Service.GioHangService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.UUID;

@Controller()
@RequestMapping("/gio-hang")
@RequiredArgsConstructor
public class GioHangController {
    private final GioHangService cartService;
    private final ChuongTrinhGiamGiaHoaDonService chuongTrinhGiamGiaHoaDonService;

    @GetMapping
    public String gioHang(Model model, HttpSession session){
        UUID maKhachHang = UUID.fromString(session.getAttribute("maKh").toString());
        model.addAttribute("gioHang", cartService.getListGioHangChiTiet(maKhachHang));
        model.addAttribute("chuongTrinhGiamGiaHoaDon", chuongTrinhGiamGiaHoaDonService.getList());
        return "GioHang/index";
    }

    @PostMapping
    public String themSanPhamVaoGioHang(
            @RequestParam UUID chiTietId,
            @RequestParam int soLuong,
            RedirectAttributes model,
            HttpSession session) {
        try {
            // Kiểm tra xem có maKhachHang trong session hay không (người dùng đã đăng nhập)
            Object maKhachHangObj = session.getAttribute("maKh");
            if (maKhachHangObj == null) {
                // Nếu không có maKhachHang trong session, chuyển hướng đến trang đăng nhập
                model.addFlashAttribute("error", "Bạn cần đăng nhập để thêm sản phẩm vào giỏ hàng.");
                return "redirect:UserLog/login"; // Đảm bảo rằng đường dẫn này là đúng với URL của trang đăng nhập
            }

            // Chuyển đổi maKhachHang từ session
            UUID maKhachHang = UUID.fromString(maKhachHangObj.toString());

            // Thêm sản phẩm vào giỏ hàng
            GioHangChiTiet gioHangChiTiet = cartService.addToCart(chiTietId, soLuong, maKhachHang);

            // Cập nhật giỏ hàng trong session
            session.setAttribute("gioHang", cartService.getListGioHangChiTiet(maKhachHang));

            // Thêm thông báo thành công
            model.addFlashAttribute("success", "Thêm sản phẩm vào giỏ hàng thành công");

            // Chuyển hướng đến trang chi tiết sản phẩm
            return "redirect:/san-pham/" + gioHangChiTiet.getGiayTheThaoChiTiet().getGiayTheThao().getId();
        } catch (Exception e) {
            // Xử lý ngoại lệ và thông báo lỗi
            model.addFlashAttribute("error", "Có lỗi xảy ra khi thêm sản phẩm vào giỏ hàng: " + e.getMessage());
        }

        // Quay lại trang chủ hoặc trang khác khi có lỗi
        return "redirect:/";
    }


    @GetMapping("/delete/{id}")
    public String xoaSanPhamKhoiGioHang(@PathVariable UUID id, HttpSession session) {
        cartService.delete(id);
        session.setAttribute("gioHang", cartService.getListGioHangChiTiet(UUID.fromString("85FE1849-1EA4-4FF5-8865-0B8F6A70ADFF")));
        return "redirect:/gio-hang";
    }

}
