package com.example.sd_57_datn.Service.KhachHang;



import com.example.sd_57_datn.Model.KhachHang;

import java.util.UUID;

public interface KhachHangImpl {

    KhachHang findById(UUID id);

    KhachHang findByEmail(String email);

    void update(UUID id, KhachHang update);

}
