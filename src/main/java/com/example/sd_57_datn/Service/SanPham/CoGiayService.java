package com.example.sd_57_datn.Service.SanPham;

import com.example.sd_57_datn.Model.CoGiay;
import com.example.sd_57_datn.Repository.SanPham.ThuocTinh.CoGiayRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CoGiayService {

    @Autowired
    private CoGiayRepository coGiayRepository;

    public List<CoGiay> findCoGiay(String tenCoGiay) {
        if (tenCoGiay != null) {
            return coGiayRepository.findByTenCoGiayContaining(tenCoGiay);
        } else {
            return coGiayRepository.findAll();
        }
    }
}
