<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thanh Toán Thành Công</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f0fff0;
            font-family: 'Segoe UI', sans-serif;
            text-align: center;
            padding: 5rem 1rem;
        }
        .success-box {
            background: white;
            border-radius: 1rem;
            padding: 3rem;
            box-shadow: 0 0 20px rgba(0, 128, 0, 0.2);
            display: inline-block;
        }
        .success-icon {
            font-size: 4rem;
            color: green;
        }
        .btn-home {
            margin-top: 2rem;
        }
    </style>
</head>
<body>
    <div class="success-box">
        <div class="success-icon">✅</div>
        <h2 class="mt-4">Thanh Toán Thành Công</h2>
        <p>Cảm ơn bạn đã thanh toán đơn hàng.</p>
        <a href="{{ route('my.tickets') }}" class="btn btn-success btn-home">Xem vé của tôi</a>
    </div>
</body>
</html>
