package com.example.sd_57_datn.Service.impl;


import com.example.sd_57_datn.Model.DeGiay;
import java.util.UUID;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface DeGiayImpl {

    public void add(DeGiay deGiay);
    public void update(DeGiay deGiay, UUID id);
    //    public void delete(UUID id);
    public Page<DeGiay> search(Pageable pageable, String name);
    public Page<DeGiay> pagination(Pageable pageable);

}
