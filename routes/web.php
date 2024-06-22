<?php

use Inertia\Inertia;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Application;

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        Log::info(__CLASS__ . ' - ' . __FUNCTION__ . ' - ' . __LINE__ . ' - ' . __FILE__ . ' - ' . __METHOD__ . ' - User: ' . auth()->user()->name . ' - ' . auth()->user()->email);
        return Inertia::render('Dashboard');
    })->name('dashboard');
});
