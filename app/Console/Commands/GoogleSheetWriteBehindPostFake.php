<?php

namespace App\Console\Commands;

use App\Services\GoogleSheetWriteBehind;
use Illuminate\Console\Command;
use Faker\Generator as Faker;

class GoogleSheetWriteBehindPostFake extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'writebehind:post_fake';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'GoogleSheetWriteBehind FakePost';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle(Faker $faker)
    {
        if((bool)random_int(0, 1)) {
            $inputs = array_merge([
                'name' => $faker->name,
                'mobile' => $faker->numerify('09########'),
                'email' => $faker->unique()->safeEmail,
                'place' => collect(array_keys(GoogleSheetWriteBehind::PlaceLimit))->random(),
                'date' => collect(GoogleSheetWriteBehind::DateRange)->random(),
                'time' => collect(GoogleSheetWriteBehind::TimeRange)->random(),
            ], collect(array_keys(GoogleSheetWriteBehind::ItemRange))->random(rand(1, count(GoogleSheetWriteBehind::ItemRange)))->mapWithKeys(fn($key) => [$key => TRUE])->all());

            try {
                do {
                    // 使用原子鎖執行任務
                    $appended = GoogleSheetWriteBehind::getInstance()->Lock(function ($instance) use ($inputs) {
                        // 寫入暫存區
                        $instance->Append($inputs);
                    });
                    // 是否已寫入, 已寫入暫存區則跳出迴圈並做出回應
                    if($appended)
                        break;
                    // 等待 1 秒後再試寫一次
                    sleep(1);
                } while(true);
            }
            finally {

            }
        }
    }
}
