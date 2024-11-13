package com.example.sd_57_datn.Repository.SanPham.ThuocTinh;


import com.example.sd_57_datn.Model.KieuBuoc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface KieuBuocRepository extends JpaRepository<KieuBuoc, UUID> {

    List<KieuBuoc> findByTenKieuBuocContainingOrderById(String tenKieuBuoc);

}
