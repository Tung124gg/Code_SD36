package com.example.sd_57_datn.Service.SanPham;


import com.example.sd_57_datn.Model.DeGiay;
import com.example.sd_57_datn.Repository.SanPham.ThuocTinh.DeGiayRepository;
import com.example.sd_57_datn.Service.impl.DeGiayImpl;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class DeGiayService implements DeGiayImpl {

    @Autowired
    private DeGiayRepository repo;


    @Override
    public void add(DeGiay deGiay) {
        this.repo.save(deGiay);
    }

    @Override
    public void update(DeGiay deGiay, UUID id) {
        DeGiay deGiay1 = this.repo.findById(id).get();
        deGiay1.setTenDeGiay(deGiay.getTenDeGiay());
        deGiay1.setGhiChu(deGiay.getGhiChu());
        deGiay1.setNgayTao(deGiay.getNgayTao());
        deGiay1.setNgaySua(deGiay.getNgaySua());
        deGiay1.setTrangThai(deGiay.getTrangThai());
        this.repo.save(deGiay1);
    }

    @Override
    public Page<DeGiay> search(Pageable pageable, String name) {

        return this.repo.findByTenDeGiayContaining(name, pageable);
    }

    @Override
    public Page<DeGiay> pagination(Pageable pageable) {
        return this.repo.findAll(pageable);
    }


}
