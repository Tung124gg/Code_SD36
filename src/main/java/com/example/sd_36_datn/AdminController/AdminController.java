package com.example.sd_57_datn.AdminController;

import com.example.sd_57_datn.Service.GiayTheThao.GiayTheThaoChiTietService;
import com.example.sd_57_datn.Service.HoaDon.HoaDonService;
import com.example.sd_57_datn.Service.KhachHang.KhachHangService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {

    private final KhachHangService khachHangService;
    private final GiayTheThaoChiTietService gttctService;
    private final HoaDonService hoaDonService;

    @GetMapping
    public String admin(Model model){
        model.addAttribute("tab", 1);
        model.addAttribute("list", gttctService.getAll());
        model.addAttribute("listHDC", hoaDonService.hoaDonCho());
        model.addAttribute("listKH", khachHangService.getAll());
        return "Admin/index";
    }

    @GetMapping("/thuong-hieu")
    public String thuongHieu(Model model){
        model.addAttribute("tab", 2);
        return "Admin/index";
    }

    @GetMapping("/khach-hang")
    public String khachHang(Model model){
        model.addAttribute("tab", 4);
        return "Admin/index";
    }
}
