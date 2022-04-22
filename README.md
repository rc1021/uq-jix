```
ssh uqjix 
cd uq-jix/
git fetch
git pull origin 
sudo docker-compose build
sudo docker tag fpm-alpine-7.4/uq-jix rc701021/uq-jix:1.11
cd ..
vi docker-compose.yml 

sudo docker exec -it ec2-user_webapp_1 cat storage/logs/laravel.log
sudo docker exec -it ec2-user_webapp_1 sh
sudo docker-compose up -d

use App\Services\GoogleSheetWriteBehind;
use Illuminate\Support\Facades\Cache;
Cache::get(GoogleSheetWriteBehind::PrefixKeyAppend . env('SPREADSHEET_ID'))
```
