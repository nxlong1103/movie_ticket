<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giới thiệu - Hệ Thống Rạp Chiếu Phim</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
<link rel="stylesheet" href="{{ asset('css/footer.css') }}">
<link rel="stylesheet" href="{{ asset('css/header.css') }}">
    <style>
        body {
            background-color: #000;
            color: white;
        }

        .intro-banner {
            background: url('{{ asset('images/banner/red.jpg') }}') no-repeat center center;
            background-size: cover;
            padding: 100px 30px;
            text-align: center;
        }

        .intro-banner h2 {
            font-size: 36px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .mission-section {
            background-color: #000;
            /* Đổi về nền đen */
            padding: 60px 20px;
            text-align: center;
        }

        .mission-box {
            background-color: #1e40af;
            border-radius: 12px;
            padding: 30px 20px;
            color: white;
            margin-bottom: 20px;
        }

        .mission-box h3 {
            color: #fde047;
            font-weight: bold;
            font-size: 32px;
        }

        .cinema-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            padding: 40px 20px;
            background: linear-gradient(to bottom, #1e293b, #3b0764);
            text-align: center;
        }

        .cinema-grid img {
            width: 100%;
            border-radius: 10px;
            height: 200px;
            object-fit: cover;
        }

        .cinema-title {
            font-weight: bold;
            margin-top: 10px;
            font-size: 16px;
            text-transform: uppercase;
        }
    </style>
</head>

<body>

    @include('layouts.header')

    <main class="main-container">
        <!-- Banner Giới Thiệu -->
        <div class="intro-banner position-relative text-white overflow-hidden" style="min-height: 450px;">
            <!-- Background image -->
            <img src="{{ asset('images/banner/red.jpg') }}" alt="Hệ thống rạp"
                class="w-100 h-100 position-absolute top-0 start-0 object-fit-cover"
                style="filter: brightness(0.5); z-index: 0;">

            <!-- Overlay nội dung -->
            <div
                class="position-relative z-1 d-flex flex-column justify-content-center align-items-center h-100 text-center px-3">
                <h2 class="fw-bold text-uppercase mb-4" style="font-size: 36px;">
                    Hệ thống cụm rạp trên toàn quốc
                </h2>
                <p class="text-white" style="max-width: 850px; font-size: 17px; line-height: 1.8;">
                    Cinestar là một trong những hệ thống rạp chiếu phim được yêu thích nhất tại Việt Nam, cung cấp nhiều
                    mô hình giải trí hấp dẫn như Rạp chiếu phim hiện đại, Nhà hát, Khu vui chơi trẻ em Kidzone, Bowling,
                    Billiards, Games, Phòng Gym, Nhà hàng, và Phố Bia C'Beer.
                    Với mục tiêu trở thành điểm đến giải trí cho mọi gia đình Việt Nam, Cinestar không chỉ chiếu phim
                    bom tấn quốc tế mà còn đồng hành cùng các nhà làm phim Việt Nam, đưa những tác phẩm điện ảnh đặc sắc
                    của Việt Nam đến gần hơn với khán giả.
                </p>
            </div>
        </div>



        <!-- Sứ mệnh -->
        <div class="mission-section">
            <h2 class="mb-5">Sứ mệnh</h2>
            <div class="row justify-content-center">
                <div class="col-md-3 mission-box mx-2">
                    <h3>01</h3>
                    <p>Góp phần tăng trưởng thị phần điện ảnh, văn hóa, giải trí của người Việt Nam</p>
                </div>
                <div class="col-md-3 mission-box mx-2">
                    <h3>02</h3>
                    <p>Phát triển dịch vụ xuất sắc với mức giá tối ưu, phù hợp với thu nhập người Việt</p>
                </div>
                <div class="col-md-3 mission-box mx-2">
                    <h3>03</h3>
                    <p>Mang nghệ thuật điện ảnh, văn hóa Việt hội nhập quốc tế</p>
                </div>
            </div>
        </div>

        <!-- Danh sách rạp -->
        <div class="container py-5" style="background-color: #000; color: white;">


            <div class="row g-4">
                <div class="col-12 col-sm-6 col-md-4 text-center">
                    <img src="{{ asset('images/rap/rap1.jpg') }}" alt="Cinestar Quốc Thanh" class="img-fluid mb-2"
                        style="height: 200px; object-fit: cover; border-radius: 10px;">
                    <div class="fw-bold text-uppercase">AoMongLove Nha Trang</div>
                </div>
                <div class="col-12 col-sm-6 col-md-4 text-center">
                    <img src="{{ asset('images/rap/rap2.jpg') }}" alt="Cinestar Đà Lạt" class="img-fluid mb-2"
                        style="height: 200px; object-fit: cover; border-radius: 10px;">
                    <div class="fw-bold text-uppercase">AoMongLove Đà Lạt</div>
                </div>
                <div class="col-12 col-sm-6 col-md-4 text-center">
                    <img src="{{ asset('images/rap/rap3.jpg') }}" alt="Cinestar HBT" class="img-fluid mb-2"
                        style="height: 200px; object-fit: cover; border-radius: 10px;">
                    <div class="fw-bold text-uppercase">AoMongLove Hai Bà Trưng (TP.HCM)</div>
                </div>
                <div class="col-12 col-sm-6 col-md-4 text-center">
                    <img src="{{ asset('images/rap/rap4.jpg') }}" alt="Cinestar Huế" class="img-fluid mb-2"
                        style="height: 200px; object-fit: cover; border-radius: 10px;">
                    <div class="fw-bold text-uppercase">AoMongLove Huế</div>
                </div>
                <div class="col-12 col-sm-6 col-md-4 text-center">
                    <img src="{{ asset('images/rap/rap5.jpg') }}" alt="Cinestar Bình Dương" class="img-fluid mb-2"
                        style="height: 200px; object-fit: cover; border-radius: 10px;">
                    <div class="fw-bold text-uppercase">AoMongLove Sinh Viên (Bình Dương)</div>
                </div>
                <div class="col-12 col-sm-6 col-md-4 text-center">
                    <img src="{{ asset('images/rap/rap6.jpg') }}" alt="Cinestar Mỹ Tho" class="img-fluid mb-2"
                        style="height: 200px; object-fit: cover; border-radius: 10px;">
                    <div class="fw-bold text-uppercase">AoMongLove Mỹ Tho</div>
                </div>
                <div class="col-12 col-sm-6 col-md-4 text-center">
                    <img src="{{ asset('images/rap/rap4.jpg') }}" alt="Cinestar Kiên Giang" class="img-fluid mb-2"
                        style="height: 200px; object-fit: cover; border-radius: 10px;">
                    <div class="fw-bold text-uppercase">AoMongLove Kiên Giang</div>
                </div>
                <div class="col-12 col-sm-6 col-md-4 text-center">
                    <img src="{{ asset('images/rap/rap3.jpg') }}" alt="Cinestar Lâm Đồng" class="img-fluid mb-2"
                        style="height: 200px; object-fit: cover; border-radius: 10px;">
                    <div class="fw-bold text-uppercase">AoMongLove Lâm Đồng</div>
                </div>
                <div class="col-12 col-sm-6 col-md-4 text-center">
                    <img src="{{ asset('images/rap/rap6.jpg') }}" alt="Gym Kidzone" class="img-fluid mb-2"
                        style="height: 200px; object-fit: cover; border-radius: 10px;">
                    <div class="fw-bold text-uppercase">Gym / Kidzone</div>
                </div>
            </div>
        </div>

        <!-- Trụ sở -->
<!-- Trụ sở -->
<section class="headquarter-overlay text-white py-5">
    <div class="container px-4">
        <div class="position-relative overflow-hidden rounded-4" style="height: 350px;">
            <!-- Ảnh nền -->
            <img src="{{ asset('images/banner/truso.jpg') }}"
                 alt="Headquarter"
                 class="position-absolute w-100 h-100"
                 style="object-fit: cover; z-index: 1;">

            <!-- Overlay màu xanh đậm (nếu muốn) -->
            {{-- <div class="position-absolute top-0 start-0 w-100 h-100" style="background-color: rgba(30, 64, 175, 0.8); z-index: 2;"></div> --}}

            <!-- Nội dung chữ -->
            <div class="position-relative z-3 h-100 d-flex flex-column justify-content-center px-4 px-md-5">
                <h3 class="fw-bold text-warning text-uppercase mb-4" style="font-size: 28px;">
                    Trụ sở | Headquarter
                </h3>
                <p class="mb-3">
                    <i class="fas fa-map-marker-alt me-2 text-warning"></i>
                    135 Hai Bà Trưng, Phường Bến Nghé, Quận 1
                </p>
                <p class="mb-3">
                    <i class="fas fa-envelope me-2 text-warning"></i>
                    mkt.cinestar@gmail.com
                </p>
                <p class="mb-0">
                    <i class="fas fa-phone me-2 text-warning"></i>
                    1900.0085
                </p>
            </div>
        </div>
    </div>
</section>

<!-- HỆ THỐNG CÁC CỤM RẠP -->
<!-- HỆ THỐNG CÁC CỤM RẠP -->
<section class="py-5" style="background-color: #000;">
    <div class="container-fluid px-4">
        <!-- Tiêu đề -->
        <h2 class="text-center fw-bold mb-4 text-uppercase text-white" style="font-size: 36px;">
            Hệ thống các cụm rạp
        </h2>
        <p class="text-center text-white-50 mb-5">
            Các phòng chiếu được trang bị các thiết bị tiên tiến như hệ thống âm thanh vòm, màn hình rộng và độ phân giải cao, tạo nên hình ảnh sắc nét và âm thanh sống động.
        </p>

        <div class="row align-items-start">
            <!-- Bản đồ bên trái -->
            <div class="col-lg-6 mb-4 text-center">
                <img src="{{ asset('images/banner/truongsa.png') }}" alt="Bản đồ cụm rạp"
                class="img-fluid rounded-4 shadow"
                style="max-height: 1000px; object-fit: contain;">
           
            </div>

            <!-- Danh sách rạp bên phải -->
            <div class="col-lg-6">
                @php
                    $theaters = [
                        [
                            'name' => 'AoMongLove QUỐC THANH (TP.HCM)',
                            'address' => '271 Nguyễn Trãi, Quận 1, TP.HCM',
                            'rooms' => 6,
                            'seats' => 930,
                        ],
                        [
                            'name' => 'AoMongLove HAI BÀ TRƯNG (TP.HCM)',
                            'address' => '135 Hai Bà Trưng, Quận 1, TP.HCM',
                            'rooms' => 5,
                            'seats' => 725,
                        ],
                        [
                            'name' => 'AoMongLove SINH VIÊN (BÌNH DƯƠNG)',
                            'address' => 'Đại học Quốc gia, Dĩ An, Bình Dương',
                            'rooms' => 4,
                            'seats' => 881,
                        ],
                        [
                            'name' => 'AoMongLove MỸ THO (TIỀN GIANG)',
                            'address' => '52 Đinh Bộ Lĩnh, TP. Mỹ Tho',
                            'rooms' => 5,
                            'seats' => 912,
                        ],
                        [
                            'name' => 'AoMongLove KIÊN GIANG',
                            'address' => 'Khu phố Rạch Sỏi, Kiên Giang',
                            'rooms' => 4,
                            'seats' => 750,
                        ],
                        [
                            'name' => 'AoMongLove ĐÀ LẠT',
                            'address' => 'Trung tâm TP. Đà Lạt, Lâm Đồng',
                            'rooms' => 5,
                            'seats' => 870,
                        ],
                        [
                            'name' => 'AoMongLove HUẾ',
                            'address' => '1 Lê Lợi, TP. Huế',
                            'rooms' => 5,
                            'seats' => 760,
                        ],
                        [
                            'name' => 'AoMongLove TÂY NINH',
                            'address' => 'Đại học Tây Ninh',
                            'rooms' => 3,
                            'seats' => 600,
                        ],
                        [
                            'name' => 'AoMongLove GYM / KIDZONE',
                            'address' => 'Khu phức hợp giải trí, TP.HCM',
                            'rooms' => 2,
                            'seats' => 300,
                        ],
                        [
                            'name' => 'AoMongLove LÂM ĐỒNG',
                            'address' => 'Huyện Đức Trọng, Lâm Đồng',
                            'rooms' => 4,
                            'seats' => 640,
                        ],
                    ];
                @endphp

                @foreach ($theaters as $theater)
                    <div class="p-4 mb-4 rounded-4 shadow"
                         style="background: linear-gradient(135deg, #4f46e5, #9333ea); color: white;">
                        <h5 class="fw-bold text-uppercase text-warning mb-2">
                            <i class="fas fa-map-marker-alt me-2"></i>{{ $theater['name'] }}
                        </h5>
                        <p class="mb-1">
                            <i class="fas fa-location-dot me-2"></i>{{ $theater['address'] }}
                        </p>
                        <p class="mb-0">
                            <i class="fas fa-film me-2"></i>{{ $theater['rooms'] }} phòng chiếu • {{ $theater['seats'] }} ghế
                        </p>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
</section>


    </main>

    @include('layouts.footer')

    <!-- JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="{{ asset('js/home.js') }}"></script>
</body>

</html>