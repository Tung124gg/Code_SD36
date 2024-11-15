<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<!doctype html>
<html lang="en">
<head>
    <title>Thương hiệu</title>
    <style>
        .label{
            margin-bottom: 10px;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>
<div class="container">
    <h1 style="line-height: 100px; text-align: center; color: red">
        Thương Hiệu
    </h1>
    <div>
        <%--@elvariable id="th" type=""--%>
        <sf:form
                modelAttribute="th"
                action="${action}"
                method="POST"
                enctype="multipart/form-data"

        >
            <div class="row">
                <div class="col-6 label">
                    <label class="label">Tên thương hiệu</label>
                    <sf:input path="tenThuongHieu"   cssClass="form-control ten" />
                    <div>
                        <span id="error-ten" style="color: red; margin-top: 10px"></span>
                    </div>
                </div>
                <div class="col-6">
                    <label class="label">Ghi chú </label>
                    <sf:input path="ghiChu" cssClass="form-control ghiChu" required="true"/>
<%--                    <div>--%>
<%--                        <sf:errors path="ghiChu" cssStyle="color: red"></sf:errors>--%>
<%--                    </div>--%>
                    <div>
                        <span id="error-GhiChu" style="color: red; margin-top: 10px"></span>
                    </div>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-6">
                    <label class="label">Ngày tạo</label>
                    <sf:input path="ngayTao" cssClass="form-control" readonly="true" />
                </div>
                <div class="col-6">
                    <label class="label">Ngày sửa</label>
                    <sf:input path="ngaySua" cssClass="form-control"  readonly="true"/>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-6">
                    <label class="label">Trạng thái</label>
                    <div style="margin-top: 8px">
                        <div class="form-check form-check-inline">
                            <sf:radiobutton class="form-check-input" path="trangThai" id="inlineRadio1" value="1"></sf:radiobutton>
                            <label class="form-check-label" for="inlineRadio1">Còn</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <sf:radiobutton class="form-check-input" path="trangThai" id="inlineRadio2" value="0"></sf:radiobutton>
                            <label class="form-check-label" for="inlineRadio2">Hết</label>
                        </div>
                    </div>
                </div>
            </div>
            <p style="text-align: right">
                <button type="submit"  style="margin-right: 0px; margin-bottom: 190px" class="btn btn-primary update">Sửa</button>
            </p>

        </sf:form>
    </div>
</div>
<%@ include file="../templates/Admin/Layouts/GiayTheThao/_FooterGiayTheThao.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>
<script>
    var ghiChu = document.getElementsByClassName('ghiChu')[0];
    var ten = document.getElementsByClassName('ten')[0];
    function focusTenInput(){
        ten.addEventListener("focus", function() {
            document.getElementById('error-ten').innerHTML="";
        });

    }
    focusTenInput();
    function focusGhiChuInput(){

        ghiChu.addEventListener("focus", function() {
            document.getElementById('error-GhiChu').innerHTML="";
        });
    }
    focusGhiChuInput();

    function validateInput() {
        var btnSua = document.getElementsByClassName('update')[0];
        btnSua.onclick = function (){
            var ten = document.getElementsByClassName('ten')[0].value.trim().length;
            var ghiChu = document.getElementsByClassName('ghiChu')[0].value.trim().length;

            var confirmUpdate = confirm('Bạn chắc chắn muốn sửa không?');

            if (!confirmUpdate) {
                console.log('ten: ', ten);
                console.log('ghi chu: ', ghiChu);

                return false;
            } else {
                if(ten<1&&ghiChu<1){
                    document.getElementById('error-GhiChu').innerHTML = "Không để trống";
                    document.getElementById('error-ten').innerHTML = "Không để trống";
                    return false;
                }
                if(ten<1){
                    document.getElementById('error-ten').innerHTML = "Không để trống";
                    return false;
                }
                if(ghiChu<1){
                    document.getElementById('error-GhiChu').innerHTML = "Không để trống";
                    return false;
                }
                return true;
            }
        }

    }
    validateInput();
</script>
</body>
</html>