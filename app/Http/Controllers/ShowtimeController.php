<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Showtime;
use App\Models\Movie;
use App\Models\Screen;

class ShowtimeController extends Controller
{
    // Hiển thị danh sách suất chiếu
    public function index(Request $request)
    {
        $query = Showtime::query();

        // Lọc theo phim
        if ($request->has('filter_movie') && $request->filter_movie != '') {
            $query->where('movie_id', $request->filter_movie);
        }

        // Lọc theo ngày
        if ($request->has('filter_date') && $request->filter_date != '') {
            $query->whereDate('start_time', $request->filter_date);
        }

        // Lấy danh sách phim để hiển thị combobox
        $movies = Movie::all();

        // Lấy danh sách suất chiếu sau khi lọc
        $showtimes = $query->with(['movie', 'screen'])->get();

        return view('admin.showtimes.showtimes', compact('showtimes', 'movies'));
    }

    // Hiển thị form tạo suất chiếu mới
    public function create()
    {
        $movies = Movie::all();
        $screens = Screen::all();
        return view('admin.showtimes.addshowtime', compact('movies', 'screens'));
    }

    // Lưu suất chiếu mới
    public function store(Request $request)
    {
        $request->validate([
            'movie_id' => 'required|exists:movies,id',
            'screen_id' => 'required|exists:screens,id',
            'start_time' => 'required|date|after:now',
            'seat_count' => 'required|integer|min:1',
        ]);
    
        // Kiểm tra trùng suất
        $exists = Showtime::where('screen_id', $request->screen_id)
            ->where('start_time', $request->start_time)
            ->first();
    
        if ($exists) {
            return back()->with('error', '⚠️ Phòng chiếu đã có suất vào thời điểm này.');
        }
    
        Showtime::create([
            'movie_id' => $request->movie_id,
            'screen_id' => $request->screen_id,
            'start_time' => $request->start_time,
            'seat_count' => $request->seat_count,
        ]);
    
        return redirect()->route('admin.showtimes.showtimes')->with('success', '🎉 Thêm suất chiếu thành công.');
    }
    

    // Hiển thị form chỉnh sửa suất chiếu
    public function edit($id)
    {
        $showtime = Showtime::findOrFail($id);
        $movies = Movie::all();
        $screens = Screen::all();
        return view('admin.showtimes.addshowtime', compact('showtime', 'movies', 'screens'));
    }

    // Cập nhật suất chiếu
    public function update(Request $request, $id)
    {
        $request->validate([
            'movie_id' => 'required|exists:movies,id',
            'screen_id' => 'required|exists:screens,id',
            'start_time' => 'required|date|after:now',
            'seat_count' => 'required|integer|min:1',
        ]);
    
        $showtime = Showtime::findOrFail($id);
    
        $showtime->update([
            'movie_id' => $request->movie_id,
            'screen_id' => $request->screen_id,
            'start_time' => $request->start_time,
            'seat_count' => $request->seat_count,
        ]);
    
        return redirect()->route('admin.showtimes.showtimes')->with('success', '✅ Cập nhật suất chiếu thành công.');
    }
    


    // Xóa suất chiếu
    public function deleteShowtime($id)
    {
        $showtime = Showtime::findOrFail($id);
        $showtime->delete();

        return redirect()->route('admin.showtimes.showtimes')->with('success', 'Suất chiếu đã được xóa thành công.');
    }
}
