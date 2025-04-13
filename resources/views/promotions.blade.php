<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Khuyến mãi - AoMongLove Cinema</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- CSS Custom -->
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('css/footer.css') }}">
    <link rel="stylesheet" href="{{ asset('css/header.css') }}">

    <style>
        body {
            background-color: #000;
            color: white;
        }

        .promo-section {
            padding: 60px 0;
            border-bottom: 1px solid #333;
        }

        .promo-title {
            font-size: 24px;
            font-weight: bold;
            color: #fff;
        }

        .promo-btn {
            background-color: #fde047;
            color: black;
            font-weight: bold;
        }

        .promo-img {
            width: 100%;
            border-radius: 12px;
            box-shadow: 0 0 10px #000;
        }

        .black-bg {
            background-color: #000 !important;
        }

        footer {
            margin-top: 40px;
        }
    </style>
</head>
<body>
    @include('layouts.header')

    <main class="main-container">

        <!-- KM1 -->
        <div class="promo-section container d-md-flex align-items-center gap-4">
            <div class="col-md-6 mb-4">
                <h2 class="promo-title">C'STUDENT - 45K CHO HỌC SINH SINH VIÊN</h2>
                <p>Đồng giá 45K/2D cho HSSV/GV/U22 cả tuần tại mọi cụm rạp Cinestar</p>
                <h5>Điều kiện</h5>
                <ul>
                    <li>HSSV xuất trình thẻ hoặc CCCD dưới 22 tuổi</li>
                    <li>Giảng viên xuất trình thẻ giảng viên</li>
                </ul>
                <h5>Lưu ý</h5>
                <ul>
                    <li>Mỗi thẻ mua được một vé</li>
                    <li>Không áp dụng ngày Lễ, Tết, hoặc suất có phụ thu</li>
                </ul>
                <a href="#" class="btn promo-btn mt-2">ĐẶT VÉ NGAY</a>
            </div>
            <div class="col-md-6">
                <img src="{{ asset('images/banner/45pt.jpg') }}" alt="Khuyến mãi học sinh" class="promo-img">
            </div>
        </div>

        <!-- KM2 -->
        <div class="promo-section container d-md-flex align-items-center gap-4 black-bg">
            <div class="col-md-6">
                <img src="{{ asset('images/banner/45pt2.jpg') }}" alt="Happy Hour 10h" class="promo-img">
            </div>
            <div class="col-md-6">
                <h2 class="promo-title">C'TEN - HAPPY HOUR - 45K/2D MỐC 10H</h2>
                <p>Áp dụng giá 45K/2D và 55K/3D cho khách hàng xem phim trước 10h sáng hoặc sau 10h tối.</p>
                <h5>Điều kiện</h5>
                <ul>
                    <li>Áp dụng tại App/Web Cinestar hoặc mua trực tiếp tại rạp</li>
                </ul>
                <h5>Lưu ý</h5>
                <ul>
                    <li>Không áp dụng cho các ngày Lễ/Tết</li>
                </ul>
                <a href="#" class="btn promo-btn mt-2">ĐẶT VÉ NGAY</a>
            </div>
        </div>

        <!-- KM3 -->
        <div class="promo-section container d-md-flex align-items-center gap-4">
            <div class="col-md-6 mb-4">
                <h2 class="promo-title">C'MONDAY - HAPPY DAY - ĐỒNG GIÁ 45K/2D</h2>
                <p>Đồng giá 45K/2D, 55K/3D vào thứ 2 hàng tuần</p>
                <h5>Điều kiện</h5>
                <ul>
                    <li>Áp dụng cho các suất chiếu vào ngày thứ 2 hàng tuần</li>
                    <li>Mua vé tại App/Web Cinestar hoặc tại rạp</li>
                </ul>
                <h5>Lưu ý</h5>
                <ul>
                    <li>Không áp dụng ngày Lễ/Tết</li>
                </ul>
                <a href="#" class="btn promo-btn mt-2">ĐẶT VÉ NGAY</a>
            </div>
            <div class="col-md-6">
                <img src="{{ asset('images/banner/45pt3.jpg') }}" alt="Happy Monday" class="promo-img">
            </div>
        </div>

        <!-- KM4 -->
        <div class="promo-section container d-md-flex align-items-center gap-4 black-bg">
            <div class="col-md-6">
                <img src="{{ asset('images/banner/45pt4.jpg') }}" alt="Member Day" class="promo-img">
            </div>
            <div class="col-md-6">
                <h2 class="promo-title">C'MEMBER - NGÀY THÀNH VIÊN - 45K/2D</h2>
                <p>Áp dụng cho thành viên C'FRIEND hoặc C'VIP của Cinestar vào thứ 4 hàng tuần</p>
                <h5>Điều kiện</h5>
                <ul>
                    <li>Khách là thành viên C'FRIEND hoặc C'VIP</li>
                    <li>Áp dụng khi mua trực tiếp tại rạp</li>
                </ul>
                <h5>Lưu ý</h5>
                <ul>
                    <li>Giảm thêm 10% giá bắp nước cho C'FRIEND, 15% cho C'VIP</li>
                    <li>Không áp dụng ngày Lễ/Tết</li>
                </ul>
                <a href="#" class="btn promo-btn mt-2">ĐẶT VÉ NGAY</a>
            </div>
        </div>

    </main>

    @include('layouts.footer')

    <!-- JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="{{ asset('js/home.js') }}"></script>
</body>
</html>
