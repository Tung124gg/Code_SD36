package com.example.sd_57_datn.Repository.SanPham.ThuocTinh;

import com.example.sd_57_datn.Model.HuongDanBaoQuan;
import java.util.List;
import java.util.UUID;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface HuongDanBaoQuanRepository extends JpaRepository<HuongDanBaoQuan, UUID> {

    @Query("select hdbq from HuongDanBaoQuan hdbq where hdbq.id = ?1")
    HuongDanBaoQuan getHuongDanBaoQuanById(UUID id);

    Page<HuongDanBaoQuan> findByTrangThai(int trangThai, Pageable pageable);

    List<HuongDanBaoQuan> findByTenHuongDanBaoQuanContaining(String tenHuongDanBaoQuan);

}
