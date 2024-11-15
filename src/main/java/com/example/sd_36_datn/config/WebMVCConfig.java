package com.example.sd_36_datn.config;

import com.example.sd_36_datn.filter.adminInterceptor;
import com.example.sd_36_datn.filter.LogGinInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebMVCConfig implements WebMvcConfigurer {

	//Cấu hình cho file ảnh
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry
          .addResourceHandler("/resources/**")
          .addResourceLocations("/resources/");	
        registry
        .addResourceHandler("/upload/**")
        .addResourceLocations("/upload/");
    }


    //Todo code quên mật khẩu khách hàng



    //Todo code phân quyền cho bên Admin

    @Autowired
    LogGinInterceptor logGinInterceptor;

    @Autowired
    adminInterceptor adminInterceptor;

    public void addInterceptors(InterceptorRegistry registry){

        //Member
        registry.addInterceptor(logGinInterceptor)
                .addPathPatterns(
                        //Trang chủ
                        "/TrangChu/Admin/home",
                        "/BanHangTaiQuay",
                        //Giầy thể thao
                        "/GiayTheThao/listGiayTheThao",
                        //Khách hàng
                        "/KhachHang/list",
                        //Phiếu giao hàng
                        "/PhieuGiaoHang/listPhieuGiaoHang",
                        //Xác nhận thông tin đơn hàng
                        "/Admin/xacNhanDonHangKhachHangAll",
                        "/Admin/xacNhanDonHangKhachHang",
                        "/Admin/XacNhanHoaDonDangDongGoi",
                        "/Admin/HoaDon/XacNhanHoaDonKhachHangDangGiao",
                        "/Admin/HoaDon/XacNhanHoaDonGiaoHangThanhCongHoanThanh",
                        //Thay đổi thông tin cá nhân
                        "/TrangChu/ThongTinCaNhan/Admin"


                );

        //Dành cho Admin
        registry.addInterceptor(adminInterceptor)
                .addPathPatterns(
                        //Todo gắn link check phân quyền admin
                        //Giầy thể thao
                        "/BanHangTaiQuay",
                        "/GiayTheThao/create",
                        "/GiayTheThao/update/{id}",
                        "/GiayTheThao/exportPDF",
                        "/GiayTheThao/exportExcal",
                        //Nhân viên hoặc user
                        "/user/view-add",
                        "/user/hien-thi",
                        "/user/detail/{id}",
                        //Màu sắc
                        "/MauSac/list",
                        "/MauSac/view-create",
                        "/MauSac/edit/{id}",
                        "/MauSac/search",
                        "/MauSac/delete/{id}",
                        //Bảng size
                        "/Size/hien-thi",
                        "/Size/view-add",
                        "/Size/delete/{id}",
                        "/Size/detail/{id}",
                        //Bảng khuyễn mại
                        "/chuongTrinhGiamGia/sanPham",
                        "/chuongTrinhGiamGia/sanPham/createForm",
                        "/chuongTrinhGiamGia/hoaDon",
                        "/chuongTrinhGiamGia/hoaDon/createForm",
                        "/chuongTrinhGiamGia/hoaDon/history",
                        //Dây giầy
                        "/dayGiay/hien-thi",
                        "/dayGiay/view-add",
                        "/dayGiay/detail/{id}",
                        //Thương hiệu
                        "/thuongHieu",
                        "/thuongHieu/create",
                        "/thuongHieu/edit/{id}",
                        //Xóa đơn hàng khi hủy
                        "/Admin/HoaDon/DonHangBiHuy"

                        );
    }
}
