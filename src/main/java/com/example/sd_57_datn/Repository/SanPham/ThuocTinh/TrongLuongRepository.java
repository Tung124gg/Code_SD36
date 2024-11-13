package com.example.sd_57_datn.Repository.SanPham.ThuocTinh;


import com.example.sd_57_datn.Model.TrongLuong;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface TrongLuongRepository extends JpaRepository<TrongLuong, UUID> {

    List<TrongLuong> findByTenTrongLuongContainingOrderById(String tenTrongLuong);

}
