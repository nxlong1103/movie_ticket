<?php

namespace App\Http\Controllers;

use App\Models\Payment;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Models\Booking;
use App\Models\BookingDetail;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Auth; // ✅ Đúng
use Illuminate\Support\Facades\DB;

class PaymentController extends Controller
{
    // Hiển thị danh sách giao dịch thanh toán
    public function showPayments(Request $request)
    {
        $query = Payment::with('booking');

        // Lọc theo phương thức thanh toán
        if ($request->has('payment_method') && $request->payment_method !== 'all') {
            $query->where('payment_method', $request->payment_method);
        }

        // Lọc theo trạng thái thanh toán
        if ($request->has('status') && $request->status !== 'all') {
            $query->where('status', $request->status);
        }

        // Lọc theo ngày thanh toán
        if ($request->has('payment_date') && !empty($request->payment_date)) {
            $query->whereDate('created_at', $request->payment_date);
        }

        // Phân trang danh sách thanh toán
        $payments = $query->paginate(10);

        return view('admin.payments', [
            'payments' => $payments,
            'payment_method' => $request->payment_method, // Truyền lại giá trị phương thức thanh toán
            'status' => $request->status, // Truyền lại giá trị trạng thái
            'payment_date' => $request->payment_date // Truyền lại giá trị ngày thanh toán
        ]);
    }

    // Cập nhật trạng thái thanh toán
    public function update(Request $request, $id)
    {
        $payment = Payment::find($id);
        if (!$payment) {
            return redirect()->route('admin.payments')->with('error', 'Không tìm thấy giao dịch thanh toán.');
        }

        // Xác nhận rằng trạng thái được gửi đúng
        $request->validate([
            'status' => 'required|in:pending,completed,failed',
        ]);

        // Cập nhật trạng thái thanh toán
        $payment->update([
            'status' => $request->status,
        ]);

        return redirect()->route('admin.payments')->with('success', 'Cập nhật trạng thái thanh toán thành công!');
    }

    // Xóa giao dịch thanh toán
    public function destroy($id)
    {
        $payment = Payment::find($id);
        if (!$payment) {
            return redirect()->route('admin.payments')->with('error', 'Không tìm thấy giao dịch thanh toán.');
        }

        // Xóa giao dịch thanh toán
        $payment->delete();
        return redirect()->route('admin.payments')->with('success', 'Giao dịch thanh toán đã được xóa!');
    }


    public function payWithVNPAY(Request $request)
    {

        $data = $request->all(); // Thay vì only(...), lấy hết luôn để đảm bảo

        $code_cart = rand(0000, 9999);
        // Bước 1: Tạo đơn hàng trước
        $booking = Booking::create([
            'user_id' => Auth::id(), // hoặc $data['user_id']
            'movie_id' => $data['movie_id'],
            'showtime_id' => $data['showtime_id'],
            'total_price' => $data['total_amount'],
            'vnpay_payment_status' => 'pending',
            'vnp_txn_ref' => $code_cart
        ]);

        // Bước 2: Lưu danh sách ghế đã chọn (booking_details)
        foreach ($data['seats'] as $seatNumber) {
            // Tìm ghế theo seat_number
            $seat = \App\Models\Seat::where('seat_number', $seatNumber)->first();

            if ($seat) {
                BookingDetail::create([
                    'booking_id' => $booking->id,
                    'seat_id' => $seat->id,
                    'price' => $seat->price,
                    'vnpay_payment_status' => 'pending',
                    'vnp_txn_ref' => $code_cart
                ]);
            }
        }


        // Bước 3: Chuẩn bị redirect sang VNPAY


        $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
        // $vnp_Returnurl = "http://localhost:8000/payment/success"; 
        $vnp_Returnurl = route('payment.vnpay_return');
        // ví dụ tạo route /payment/return
        $vnp_TmnCode = "I43GPUV8";
        $vnp_HashSecret = "43JDQ47YKFXZPDAXUN7QT50JN738D6C0";

        $vnp_TxnRef = $code_cart;
        $vnp_OrderInfo = 'Thanh toán đơn hàng #' . $booking->id;
        $vnp_OrderType = 'billpayment';
        $vnp_Amount = $data['total_amount'] * 100;
        $vnp_Locale = 'vn';
        $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];

        $inputData = [
            "vnp_Version" => "2.1.0",
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_Amount" => $vnp_Amount,
            "vnp_Command" => "pay",
            "vnp_CreateDate" => date('YmdHis'),
            "vnp_CurrCode" => "VND",
            "vnp_IpAddr" => $vnp_IpAddr,
            "vnp_Locale" => $vnp_Locale,
            "vnp_OrderInfo" => $vnp_OrderInfo,
            "vnp_OrderType" => $vnp_OrderType,
            "vnp_ReturnUrl" => $vnp_Returnurl,
            "vnp_TxnRef" => $vnp_TxnRef
        ];

        ksort($inputData);
        $hashdata = '';
        $query = '';
        $i = 0;
        foreach ($inputData as $key => $value) {
            $hashdata .= ($i++ ? '&' : '') . urlencode($key) . "=" . urlencode($value);
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }

        $vnpSecureHash = hash_hmac('sha512', $hashdata, $vnp_HashSecret);
        $vnp_Url .= '?' . $query . 'vnp_SecureHash=' . $vnpSecureHash;

        return redirect($vnp_Url);
    }
    public function vnpayReturn(Request $request)
    {
        $vnp_ResponseCode = $request->input('vnp_ResponseCode');
        $vnp_TxnRef = $request->input('vnp_TxnRef');
        $vnp_Amount = $request->input('vnp_Amount') / 100;

        // ✅ Tìm booking chính xác theo mã giao dịch
        $booking = Booking::where('vnp_txn_ref', $vnp_TxnRef)->first();

        if (!$booking) {
            return redirect()->route('payment.failed')->with('error', 'Không tìm thấy đơn hàng');
        }

        if ($vnp_ResponseCode == '00') {
            // ✅ Thành công
            $booking->update(['vnpay_payment_status' => 'completed']);
            BookingDetail::where('booking_id', $booking->id)->update(['vnpay_payment_status' => 'completed']);

            Payment::create([
                'booking_id' => $booking->id,
                'amount' => $vnp_Amount,
                'status' => 'success',
                'vnpay_txn_ref' => $request->input('vnp_TxnRef'),
                'vnpay_secure_hash' => $request->input('vnp_SecureHash'),
                'vnpay_response_code' => $vnp_ResponseCode,
                'vnpay_order_info' => $request->input('vnp_OrderInfo'),
                'vnpay_status' => 'completed',
                'txn_ref' => $request->input('vnp_TxnRef')
            ]);

            return redirect()->route('payment.success');
        } else {
            // ❌ Thất bại
            $booking->update(['vnpay_payment_status' => 'failed']);
            BookingDetail::where('booking_id', $booking->id)->update(['vnpay_payment_status' => 'failed']);
            return redirect()->route('payment.failed');
        }
    }
}
