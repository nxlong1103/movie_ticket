<?php

namespace App\Http\Controllers;

use App\Models\Seat;
use App\Models\Showtime;
use App\Models\Screen; // ✅ Bổ sung dòng này
use Illuminate\Http\Request;

class SeatController extends Controller
{
    public function showSeats($showtime_id)
    {
        $showtime = Showtime::findOrFail($showtime_id);

        $standard_seats = Seat::where('screen_id', $showtime->screen_id)
            ->where('seat_type', 'standard')->get();

        $vip_seats = Seat::where('screen_id', $showtime->screen_id)
            ->where('seat_type', 'VIP')->get();

        $seats = $standard_seats->merge($vip_seats); // ✅ Gộp lại tất cả ghế

        return view('select_seats', [
            'movie_id' => $showtime->movie_id,
            'theater_id' => $showtime->theater_id,
            'date' => now()->toDateString(),
            'showtime_id' => $showtime_id,
            'seats' => $seats, // ✅ Truyền biến $seats cho view
        ]);
    }
    public function index()
    {
        $seats = Seat::with('screen')->get();
        $screens = Screen::all();
        return view('admin.seats', compact('seats', 'screens'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'seat_number' => 'required',
            'seat_type' => 'required',
            'price' => 'required|numeric',
            'screen_id' => 'required|exists:screens,id',
        ]);

        Seat::create($request->all());
        return redirect()->back()->with('success', 'Thêm ghế thành công!');
    }

    public function update(Request $request, $id)
    {
        $seat = Seat::findOrFail($id);
        $seat->update($request->all());
        return redirect()->back()->with('success', 'Cập nhật ghế thành công!');
    }

    public function destroy($id)
    {
        Seat::destroy($id);
        return redirect()->back()->with('success', 'Đã xóa ghế!');
    }
}

