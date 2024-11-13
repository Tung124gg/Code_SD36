package com.example.sd_57_datn.Repository.SanPham.ThuocTinh;

import com.example.sd_57_datn.Model.DeGiay;
import java.util.UUID;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DeGiayRepository extends JpaRepository<DeGiay, UUID> {

    Page<DeGiay> findByTenDeGiayContaining(String ten, Pageable pageable);

}
