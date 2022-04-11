<?php

namespace App\Providers;

use App\Contracts\GoogleSheetWriteBehind;
use App\Services\GoogleSheetWriteBehind as ServicesGoogleSheetWriteBehind;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind(GoogleSheetWriteBehind::class, ServicesGoogleSheetWriteBehind::class);
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
