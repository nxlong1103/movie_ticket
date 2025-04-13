<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán Thất Bại</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #010105;
            color: white;
            font-family: Arial, sans-serif;
        }

        .failed-container {
            max-width: 600px;
            margin: 100px auto;
            text-align: center;
            background-color: #1a1a1a;
            border: 2px solid #ffcc00;
            border-radius: 15px;
            padding: 40px 30px;
            box-shadow: 0 0 20px rgba(255, 204, 0, 0.2);
        }

        .failed-container h2 {
            color: #ff4d4d;
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .failed-container p {
            font-size: 1.1rem;
            color: #ccc;
        }

        .btn-back-home {
            margin-top: 30px;
            background-color: #ffcc00;
            color: black;
            font-weight: bold;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            transition: 0.3s;
            text-decoration: none;
        }

        .btn-back-home:hover {
            background-color: #ff9900;
            color: white;
        }
    </style>
</head>
<body>

    <div class="failed-container">
        <h2>❌ Thanh toán thất bại</h2>
        <p>Giao dịch của bạn không thành công.<br>Vui lòng thử lại hoặc liên hệ bộ phận hỗ trợ.</p>
        <a href="{{ route('home') }}" class="btn btn-success btn-home">Về trang chủ</a>
    </div>

</body>
</html>
