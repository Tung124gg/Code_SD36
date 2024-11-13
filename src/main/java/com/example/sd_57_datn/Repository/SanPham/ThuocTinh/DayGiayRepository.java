package com.example.sd_57_datn.Repository.SanPham.ThuocTinh;


import com.example.sd_57_datn.Model.DayGiay;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DayGiayRepository extends JpaRepository<DayGiay, UUID> {

    List<DayGiay> findByTenDayGiayContainingOrderById(String tenDayGiay);

}
