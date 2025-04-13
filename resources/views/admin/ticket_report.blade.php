<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Báo Cáo Vé Bán</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="{{ asset('css/admin/admin.css') }}">
</head>
<body>
<div class="d-flex">
    <!-- Sidebar -->
    @include('admin.layouts.admin_menu')

    <!-- Nội dung chính -->
    <div class="main-content p-4 w-100">
        <h2 class="text-center fw-bold">🎟️ Báo Cáo Vé Bán Theo Phim & Suất Chiếu</h2>

        <!-- Bộ lọc -->
        <form method="GET" action="{{ route('admin.ticket_report.index') }}" class="row g-3 mb-4">
            <div class="col-md-5">
                <label>Chọn phim:</label>
                <select name="movie_id" class="form-select">
                    <option value="">Tất cả phim</option>
                    @foreach ($movies as $movie)
                        <option value="{{ $movie->id }}" {{ request('movie_id') == $movie->id ? 'selected' : '' }}>
                            {{ $movie->title }}
                        </option>
                    @endforeach
                </select>
            </div>

            <div class="col-md-5">
                <label>Suất chiếu:</label>
                <select name="showtime_id" class="form-select">
                    <option value="">Tất cả suất chiếu</option>
                    @foreach ($showtimes as $showtime)
                        <option value="{{ $showtime->id }}" {{ request('showtime_id') == $showtime->id ? 'selected' : '' }}>
                            {{ \Carbon\Carbon::parse($showtime->start_time)->format('H:i d/m/Y') }}
                        </option>
                    @endforeach
                </select>
            </div>

            <div class="col-md-2 d-flex align-items-end">
                <button type="submit" class="btn btn-primary w-100">🔍 Lọc</button>
            </div>
        </form>

        <!-- Xử lý dữ liệu báo cáo -->
        @php
        $query = \DB::table('bookings')
            ->join('movies', 'bookings.movie_id', '=', 'movies.id')
            ->join('showtimes', 'bookings.showtime_id', '=', 'showtimes.id')
            ->join('users', 'bookings.user_id', '=', 'users.id')
            ->leftJoin('booking_details', 'bookings.id', '=', 'booking_details.booking_id')
            ->leftJoin('seats', 'booking_details.seat_id', '=', 'seats.id')
            ->where('bookings.vnpay_payment_status', 'completed');
    
        if (request('movie_id')) {
            $query->where('bookings.movie_id', request('movie_id'));
        }
    
        if (request('showtime_id')) {
            $query->where('bookings.showtime_id', request('showtime_id'));
        }
    
        $report = $query
            ->select(
                'bookings.id as booking_id',
                'movies.title as movie_title',
                'showtimes.start_time',
                'users.name as user_name',
                'bookings.total_price',
                \DB::raw('GROUP_CONCAT(seats.seat_number ORDER BY seats.seat_number SEPARATOR ", ") as seat_list')
            )
            ->groupBy('bookings.id', 'movies.title', 'showtimes.start_time', 'users.name', 'bookings.total_price')
            ->orderBy('showtimes.start_time')
            ->get();
    @endphp
    
        <!-- Bảng kết quả -->
        <div class="card">
            <div class="card-body">
                <table class="table table-bordered table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>#</th>
                            <th>Phim</th>
                            <th>Suất chiếu</th>
                            <th>Người đặt</th>
                            <th>Ghế đã đặt</th>
                            <th>Tổng tiền (VNĐ)</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($report as $index => $item)
                        <tr>
                            <td>{{ $index + 1 }}</td>
                            <td>{{ $item->movie_title }}</td>
                            <td>{{ \Carbon\Carbon::parse($item->start_time)->format('H:i d/m/Y') }}</td>
                            <td>{{ $item->user_name ?? 'Ẩn danh' }}</td>
                            <td>{{ $item->seat_list ?? '-' }}</td>
                            <td>{{ number_format($item->total_price, 0, ',', '.') }} đ</td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="6" class="text-center">Không có dữ liệu.</td>
                        </tr>
                        @endforelse
                    </tbody>
                    
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
