package com.example.sd_57_datn.Service.impl;


import com.example.sd_57_datn.Model.GiayTheThao;

import java.util.List;
import java.util.UUID;

public interface GiayTheThaoImpl {

    public List<GiayTheThao> getAll();

    public List<GiayTheThao> getAllWithoutInCTGGCTSP(UUID id);

    public GiayTheThao getOne(UUID id);

}
