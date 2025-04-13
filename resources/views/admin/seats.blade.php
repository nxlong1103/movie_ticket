<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Ghế</title>

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
            <h2 class="text-center fw-bold">💺 Quản Lý Ghế</h2>

            @if(session('success'))
                <div class="alert alert-success">{{ session('success') }}</div>
            @endif

            <form method="POST" action="{{ route('admin.seats.store') }}" class="row mb-4">
                @csrf
                <div class="col-md">
                    <input type="text" name="seat_number" class="form-control" placeholder="Số ghế (VD: A1)" required>
                </div>
                <div class="col-md">
                    <select name="seat_type" class="form-control">
                        <option value="standard">Ghế thường</option>
                        <option value="VIP">Ghế VIP</option>
                    </select>
                </div>
                <div class="col-md">
                    <input type="number" name="price" class="form-control" placeholder="Giá ghế" required>
                </div>
                <div class="col-md">
                    <select name="screen_id" class="form-control">
                        @foreach ($screens as $screen)
                            <option value="{{ $screen->id }}">{{ $screen->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-auto">
                    <button class="btn btn-primary">Thêm</button>
                </div>
            </form>

            <table class="table table-striped table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Số ghế</th>
                        <th>Loại</th>
                        <th>Giá</th>
                        <th>Phòng chiếu</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($seats as $seat)
                        <tr>
                            <td>{{ $seat->id }}</td>
                            <td>{{ $seat->seat_number }}</td>
                            <td>{{ ucfirst($seat->seat_type) }}</td>
                            <td>{{ number_format($seat->price) }}đ</td>
                            <td>{{ $seat->screen->name ?? 'N/A' }}</td>
                            <td>
                                <form action="{{ route('admin.seats.destroy', $seat->id) }}" method="POST" onsubmit="return confirm('Xóa ghế này?')">
                                    @csrf
                                    @method('DELETE')
                                    <button class="btn btn-danger btn-sm">
                                        <i class="fas fa-trash"></i> Xóa
                                    </button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>

        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
