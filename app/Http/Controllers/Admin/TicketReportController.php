<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Booking;
use App\Models\Movie;
use App\Models\Showtime;

class TicketReportController extends Controller
{
    public function index(Request $request)
    {
        $movies = Movie::all();
        $showtimes = Showtime::orderBy('start_time', 'desc')->get();

        $query = Booking::with(['user', 'showtime.movie', 'bookingDetails.seat'])
                        ->orderBy('created_at', 'desc');

        if ($request->movie_id && $request->movie_id !== 'all') {
            $query->where('movie_id', $request->movie_id);
        }

        if ($request->showtime_id && $request->showtime_id !== 'all') {
            $query->where('showtime_id', $request->showtime_id);
        }

        if ($request->booking_date) {
            $query->whereDate('created_at', $request->booking_date);
        }

        $tickets = $query->paginate(10);

        return view('admin.ticket_report', compact('movies', 'showtimes', 'tickets'));
    }
}
