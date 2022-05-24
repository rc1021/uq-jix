<?php

namespace App\Providers;

use App\Contracts\GoogleSheetWriteBehind;
use App\Services\GoogleSheetWriteBehind as ServicesGoogleSheetWriteBehind;
use Illuminate\Support\ServiceProvider;
use Godruoyi\Snowflake\Snowflake;
use Godruoyi\Snowflake\LaravelSequenceResolver;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton('snowflake', function () {
            return (new Snowflake())
                ->setStartTimeStamp(strtotime('2022-05-22')*1000)
                ->setSequenceResolver(new LaravelSequenceResolver($this->app->get('cache')->store()));
        });
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
