package com.example.sd_36_datn_tung.Controller.SanPham;

import com.example.sd_36_datn_tung.Model.GiayTheThao;
import com.example.sd_36_datn_tung.Model.GiayTheThaoChiTiet;
import com.example.sd_36_datn_tung.Model.GioHangChiTiet;
import com.example.sd_36_datn_tung.Repository.GiayTheThao.ImageRepository;
import com.example.sd_36_datn_tung.Service.GiayTheThao.GiayTheThaoChiTietService;
import com.example.sd_36_datn_tung.Service.GiayTheThao.GiayTheThaoService;
import com.example.sd_36_datn_tung.Service.SanPham.MauSacService;
import com.example.sd_36_datn_tung.Service.SanPham.SizeService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
@SessionAttributes("gioHang")
public class SanPhamController {
    private final GiayTheThaoService giayTheThaoService;
    private final ImageRepository imageRepository;
    private final SizeService sizeService;
    private final GiayTheThaoChiTietService giayTheThaoChiTietService;
    private final MauSacService mauSacService;

    @GetMapping("/san-pham/{id}")
    public String sanPham(@PathVariable UUID id, Model model, @ModelAttribute("gioHang") List<GioHangChiTiet> gioHang) throws JsonProcessingException {
        GiayTheThao giayTheThao = giayTheThaoService.getOne(id);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(giayTheThaoChiTietService.getAllByGiayTheThao(giayTheThao));
        model.addAttribute("giayTheThao", giayTheThao);
        model.addAttribute("gioHang", gioHang);
        model.addAttribute("images", imageRepository.getImageByIdGiayTheThao(id));
        model.addAttribute("sizes", sizeService.getAllByIdGtt(id));
        model.addAttribute("mauSacs", mauSacService.getAllByIdGtt(id));
        model.addAttribute("giayTheThaoChiTiet", json);
        return "SanPham/index";
    }

//    @PostMapping("/san-pham/{idChiTiet}")
//    public String sanPhamPost(@PathVariable UUID idChiTiet, Model model) throws JsonProcessingException {
//        GiayTheThaoChiTiet giayTheThaoChiTiet = giayTheThaoChiTietService.getOne(idChiTiet);
//
//    }
}
