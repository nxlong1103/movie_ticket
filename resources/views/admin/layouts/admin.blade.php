<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Admin Panel')</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   
    <!-- Custom CSS -->
    <link rel="stylesheet" href="{{ asset('css/admin/admin.css') }}">
 
    
</head>
<body>
    <div class="d-flex">
        <!-- Sidebar -->
        @include('admin.layouts.admin_menu')

        <!-- Nội dung chính -->
        <div class="main-content p-4">
            @yield('content')
        </div>
    </div>
   
    
</body>

</html>
