package com.example.sd_57_datn.Home;

import com.example.sd_57_datn.Model.GioHangChiTiet;
import com.example.sd_57_datn.Service.GiayTheThao.GiayTheThaoService;
import com.example.sd_57_datn.Service.GioHangService;
import com.example.sd_57_datn.Service.SanPham.ThuongHieuService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
@SessionAttributes("gioHang")
public class HomeController {
    private final ThuongHieuService thuongHieuService;
    private final GiayTheThaoService giayTheThaoService;
    private final GioHangService cartService;

    @ModelAttribute("gioHang")
    public List<GioHangChiTiet> createGioHang(HttpSession session) {
        UUID maKhachHang = UUID.fromString(session.getAttribute("maKH").toString());
        return cartService.getListGioHangChiTiet(maKhachHang);
    }

    @GetMapping("/")
    public String home(Model model, @ModelAttribute("gioHang") List<GioHangChiTiet> gioHang, HttpSession session) {

        model.addAttribute("gioHang", gioHang);
        session.setAttribute("thuongHieus", thuongHieuService.findAll());
        model.addAttribute("giayTheThaoMoi", giayTheThaoService.getSanPhamMoi());
        model.addAttribute("giayTheThaoGiaRe", giayTheThaoService.getSanPhamGiaThanhThap());
        return "index";
    }
}
