<?php

namespace App\Console\Commands;

use App\Services\GoogleSheetWriteBehind;
use Illuminate\Console\Command;

class GoogleSheetWriteBehindSync extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'writebehind:sync';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'GoogleSheetWriteBehind Sync';

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
    public function handle()
    {
        GoogleSheetWriteBehind::getInstance()->Sync();
    }
}
