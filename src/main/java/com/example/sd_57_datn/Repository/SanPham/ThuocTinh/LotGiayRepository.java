package com.example.sd_57_datn.Repository.SanPham.ThuocTinh;

import com.example.sd_57_datn.Model.LotGiay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;


@Repository
public interface LotGiayRepository extends JpaRepository<LotGiay, UUID> {
}
