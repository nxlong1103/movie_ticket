<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Vé đã đặt</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: #ffffff;
            font-family: 'Segoe UI', sans-serif;
            font-size: 1.05rem;
        }
        h2 {
            font-weight: bold;
            margin-bottom: 30px;
            color: #ff4d6d;
            font-size: 2rem;
        }
        p {
            color: yellow;
        }
        .ticket-card {
            background-color: #1f1f1f;
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 0 15px rgba(255, 77, 109, 0.2);
            transition: transform 0.3s ease;
        }
        .ticket-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 0 25px rgba(255, 77, 109, 0.4);
        }
        .card-title {
            color: #fff;
            font-size: 1.6rem;
            font-weight: bold;
        }
        .badge {
            font-size: 1rem;
            padding: 6px 14px;
            border-radius: 8px;
        }
        .bg-success { background-color: #4caf50 !important; }
        .bg-danger { background-color: #e74c3c !important; }
        .bg-secondary { background-color: #6c757d !important; }
        .qr {
            width: 180px;
            height: 180px;
            border-radius: 10px;
            margin-top: 10px;
            border: 2px solid rgba(255, 255, 255, 0.1);
        }
        .movie-img {
            max-width: 100%;
            max-height: 600px;
            border-radius: 12px;
            border: 2px solid rgba(255, 77, 109, 0.3);
            transition: transform 0.3s ease;
        }
        .movie-img:hover {
            transform: scale(1.02);
        }
        .form-select {
            background-color: #222;
            color: #fff;
            border: 1px solid #555;
            font-size: 1rem;
        }
        .form-select:focus {
            border-color: #ff4d6d;
            box-shadow: 0 0 0 0.2rem rgba(255, 77, 109, 0.25);
        }
        .btn-danger {
            background-color: #ff4d6d;
            border: none;
            font-size: 1rem;
        }
        .btn-danger:hover {
            background-color: #e63a55;
        }
        .ticket-card p small,
        .ticket-card p.text-muted {
            color: #bbbbbb !important;
            font-size: 1rem;
        }
        .ticket-card strong {
            color: #f2f2f2;
        }
        @media (max-width: 768px) {
            .ticket-card .row {
                flex-direction: column;
            }
            .movie-img {
                margin-bottom: 20px;
                max-height: 250px;
            }
            .card-title {
                font-size: 1.3rem;
                text-align: center;
            }
            .form-select {
                width: 100% !important;
            }
        }
    </style>
    <link rel="stylesheet" href="{{ asset('css/footer.css') }}">
    <link rel="stylesheet" href="{{ asset('css/header.css') }}">
</head>
<body>
@include('layouts.header')

<div class="container mt-5">
    <h2 class="mb-4">🎟 Vé đã đặt của bạn</h2>
    <div class="alert alert-warning text-white" style="background-color: #2d2d2d; border: 1px solid #ff4d6d;">
        <strong>🔔 Lưu ý khi đến rạp:</strong><br>
        1️⃣ Vui lòng đưa mã QR hoặc mã giao dịch bên dưới cho nhân viên để kiểm tra.<br>
        2️⃣ Bạn có thể chụp màn hình hoặc mở trang này trực tiếp tại quầy check-in.<br>
        3️⃣ Vé chỉ có hiệu lực trong thời gian suất chiếu, hãy đến sớm ít nhất 15 phút nhé!
    </div>

    <!-- Bộ lọc trạng thái -->
    <div class="mb-4 d-flex align-items-center gap-3">
        <label for="filter-status" class="form-label mb-0">Lọc theo trạng thái:</label>
        <select id="filter-status" class="form-select w-auto">
            <option value="all">Tất cả (thành công)</option>
            <option value="upcoming">Mới đặt</option>
        </select>
    </div>

    @php
        $completedBookings = $bookings->where('vnpay_payment_status', 'completed');
        $latestCompleted = $completedBookings->sortByDesc('created_at')->first();
    @endphp

    <div id="booking-list">
        @forelse($completedBookings as $booking)
            @php
                $showtimeDate = \Carbon\Carbon::parse($booking->showtime->start_time);
                $isUpcoming = $showtimeDate->isToday() || $showtimeDate->isFuture();
                $isMostRecent = $latestCompleted && $latestCompleted->id === $booking->id;
            @endphp

            <div class="card mb-3 ticket-card booking-item"
                 data-status="{{ $booking->vnpay_payment_status }}"
                 data-upcoming="{{ $isUpcoming ? 'true' : 'false' }}"
                 data-recent="{{ $isMostRecent ? 'true' : 'false' }}">
                <div class="row g-0">
                    <!-- Ảnh phim -->
                    <div class="col-md-6 d-flex align-items-center justify-content-center">
                        <img src="{{ asset('images/' . $booking->movie->image) }}"
                             class="movie-img"
                             alt="{{ $booking->movie->title }}">
                    </div>
                    <!-- Thông tin vé -->
                    <div class="col-md-6">
                        <div class="card-body">
                            <h5 class="card-title">🎬 {{ $booking->movie->title }}</h5>
                            <p><strong>Suất chiếu:</strong> {{ $booking->showtime->start_time }}</p>
                            <p><strong>Phòng:</strong> {{ $booking->showtime->screen_id }}</p>
                            <p><strong>Trạng thái thanh toán:</strong>
                                <span class="badge bg-success">Đã thanh toán</span>
                            </p>
                            <p><strong>Ghế:</strong>
                                @foreach($booking->bookingDetails as $detail)
                                    <span class="badge bg-secondary">{{ $detail->seat->seat_number }}</span>
                                @endforeach
                            </p>
                            <p><strong>Tổng tiền:</strong> {{ number_format($booking->total_price) }}đ</p>
                            <p class="text-muted"><small>Ngày đặt: {{ $booking->created_at->format('d/m/Y H:i') }}</small></p>

                            @if($booking->vnp_txn_ref)
                                <p><strong>Mã giao dịch:</strong> {{ $booking->vnp_txn_ref }}</p>
                                <p><strong>QR Code:</strong></p>
                                <img class="qr"
                                     src="https://api.qrserver.com/v1/create-qr-code/?data={{ $booking->vnp_txn_ref }}&size=120x120"
                                     alt="QR Code">
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        @empty
            <div class="alert alert-info">Bạn chưa có vé đã thanh toán nào.</div>
        @endforelse
    </div>
</div>

@include('layouts.footer')

<script>
    document.getElementById('filter-status').addEventListener('change', function () {
        const selected = this.value;
        const items = document.querySelectorAll('.booking-item');

        items.forEach(item => {
            const isRecent = item.getAttribute('data-recent') === 'true';
            const show = selected === 'all' || (selected === 'upcoming' && isRecent);
            item.style.display = show ? 'block' : 'none';
        });
    });
</script>
<script src="{{ asset('js/home.js') }}"></script>
</body>
</html>
