package com.example.sd_36_datn.ThanhToan;

import com.example.sd_36_datn.Service.GioHangService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.UUID;

@Controller
@RequiredArgsConstructor
@RequestMapping("/thanh-toan")
public class ThanhToanController {

        private final GioHangService gioHangService;
        @GetMapping("{idKhachHang}")
        public String thanhToan(@PathVariable UUID idKhachHang, Model model){
            model.addAttribute("gioHangChiTiets", gioHangService.getListGioHangChiTiet(idKhachHang));
            return "ThanhToan/index";
        }
}
