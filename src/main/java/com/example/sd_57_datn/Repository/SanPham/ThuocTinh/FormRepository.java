package com.example.sd_57_datn.Repository.SanPham.ThuocTinh;

import com.example.sd_57_datn.Model.Form;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FormRepository extends JpaRepository<Form, UUID> {

    List<Form> findByTenFormContainingOrderById(String tenForm);

}