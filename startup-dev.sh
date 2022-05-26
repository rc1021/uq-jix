#!/bin/bash

# color
Red='\033[0;31m'
Green='\033[0;32m'
NC='\033[0m' # No Color

die() {
    echo -e "${NC}$1\n"
    exit 1
}

# Usage info
show_help() {
cat << EOF
------------------------
快速啟動專案開發環境腳本
------------------------
使用方式: ${0##*/} [init|down] [-h] [-b] [--update] [--file[=PATH]]
    init                 初始化環境變數
    down                 Docker contianer shutdown
    -h                   說明文件
    --file[=PATH]        環境變數：laradoc位置、專案位置、專案名稱 etc...
    -b                   強制重建印象檔
    --update             升級相依套件
EOF
}

# 判斷作業系統
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
verbose=0
shutdown=false
build=false
update=false
env_file="$(PWD)/.startup.env"

while :; do
    case $1 in
        -h|-\?|--help)
            show_help    # Display a usage synopsis.
            exit
            ;;
        init) # 初始化環境變數
            if [ -f "$env_file" ]; then
                rm "$env_file"
            fi
            touch "$env_file"
            read -p "請輸入Laradock資料夾路徑 [../laradock]: " lard_path
            lard_path=${lard_path:-../laradock}
            echo "LARADOCK_PATH=$lard_path" >> "$env_file"
            echo "PROJECT_PATH=$(PWD)" >> "$env_file"
            name=$(basename $PWD)
            read -p "請輸入本專案名稱 [$name]: " name2
            name=${name2:-$name}
            echo "PROJECT_NAME=$name" >> "$env_file"
            read -p "PHP Version [7.4]: " php_version
            php_version=${php_version:-7.4}
            echo "PHP_VERSION=$php_version" >> "$env_file"
            read -p "Composer Version [2]: " composer_version
            composer_version=${composer_version:-2}
            echo "COMPOSER_VERSION=$composer_version" >> "$env_file"
            echo -e "\n${NC}file: $env_file"
            cat "$env_file"
            echo -e "${NC}建立環境變數...${Green}done${NC}"
            ;;
        -f|--file)       # Takes an option argument; ensure it has been specified.
            if [ "$2" ]; then
                env_file=$2
                shift
            else
                die 'ERROR: "-f" requires a non-empty option argument.'
            fi
            ;;
        --file=?*)
            env_file=${1#*=} # Delete everything up to "=" and assign the remainder.
            ;;
        --file=)         # Handle the case of an empty --file=
            echo 'ERROR: Must specify a non-empty "--file PATH" argument.' >&2
            exit 1
            ;;
        --update)
            update=true
            ;;
        -v|--verbose)
            verbose=$((verbose + 1))  # Each -v adds 1 to verbosity.
            ;;
        -b)
            build=true
            ;;
        down)
            shutdown=true
            ;;
        --)              # End of all options.
            shift
            break
            ;;
        -?*)
            printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
            ;;
        *)               # Default case: No more options, so break out of the loop.
            break
    esac

    shift
done

[ ! -f "$env_file" ] && die "ERROR: $env_file does not exists.\n第一次執行請使用 \`${Green}./startup-dev.sh init${NC}\` 初始化環境檔"

# 讀取環境變數
lard_path=$(awk -F= '$1=="LARADOCK_PATH"{print $2;exit}' "$env_file")
lard_path=${lard_path:-../laradock}
lard_path=$(sed "s|~/|$HOME/|g" <<< $lard_path)
proj_path=$(awk -F= '$1=="PROJECT_PATH"{print $2;exit}' "$env_file")
proj_path=${proj_path:-$(PWD)}
proj_name=$(awk -F= '$1=="PROJECT_NAME"{print $2;exit}' "$env_file")
name=$(basename $PWD)
proj_name=${proj_name:-$name}
php_version=$(awk -F= '$1=="PHP_VERSION"{print $2;exit}' "$env_file")
php_version=${php_version:-7.4}
composer_version=$(awk -F= '$1=="COMPOSER_VERSION"{print $2;exit}' "$env_file")
composer_version=${composer_version:-2}

if $shutdown; then
    cd "$lard_path" && docker-compose down
    exit 1
fi

echo -e "${NC}讀取環境變數...${Green}done"

# 確認 laradock 專案是否存在
lard_path="$(echo $lard_path | sed 's:/*$::')"
[ ! -d "$lard_path" ] && die "ERROR: $lard_path does not exists.\n請確保 Laradock 是否指向正確路徑"

# Laravel 複製 .env.example （如果不存在)
file1="$proj_path/.env.example"
file2="$proj_path/.env"
if [ ! -f "$file2" ]; then
    if [ ! -f "$file1" ]; then
        die "ERROR: $file1 does not exist."
    fi
    cp "$file1" "$file2"
fi

# Laradock 複製 .env.example （如果不存在)
file1="$lard_path/.env.example"
file2="$lard_path/.env"
if [ ! -f "$file2" ]; then
    if [ ! -f "$file1" ]; then
        die "ERROR: $file1 does not exist."
    fi
    cp "$file1" "$file2"
fi

## 更改 Laradock 環境
# compose name
search="COMPOSE_PROJECT_NAME=.*"
replace="COMPOSE_PROJECT_NAME=$proj_name"
case "${machine}" in
    Linux)     sed -i "s|$search|$replace|g" "$file2";;
    Mac)    sed -i "" "s|$search|$replace|g" "$file2";;
esac
# project dir
search="APP_CODE_PATH_HOST=.*"
replace="APP_CODE_PATH_HOST=$proj_path/"
case "${machine}" in
    Linux)     sed -i "s|$search|$replace|g" "$file2";;
    Mac)    sed -i "" "s|$search|$replace|g" "$file2";;
esac
# PHP Version
search="PHP_VERSION=.*"
replace="PHP_VERSION=$php_version"
case "${machine}" in
    Linux)     sed -i "s|$search|$replace|g" "$file2";;
    Mac)    sed -i "" "s|$search|$replace|g" "$file2";;
esac
# COMPOSER Version
search="WORKSPACE_COMPOSER_VERSION=.*"
replace="WORKSPACE_COMPOSER_VERSION=$composer_version"
case "${machine}" in
    Linux)     sed -i "s|$search|$replace|g" "$file2";;
    Mac)    sed -i "" "s|$search|$replace|g" "$file2";;
esac
# GD
search="PHP_WORKER_INSTALL_GD=false"
replace="PHP_WORKER_INSTALL_GD=true"
case "${machine}" in
    Linux)     sed -i "s|$search|$replace|g" "$file2";;
    Mac)    sed -i "" "s|$search|$replace|g" "$file2";;
esac
# IMAGEMAGICK
search="PHP_WORKER_INSTALL_IMAGEMAGICK=false"
replace="PHP_WORKER_INSTALL_IMAGEMAGICK=true"
case "${machine}" in
    Linux)     sed -i "s|$search|$replace|g" "$file2";;
    Mac)    sed -i "" "s|$search|$replace|g" "$file2";;
esac
# FFMPEG
search="PHP_WORKER_INSTALL_FFMPEG=false"
replace="PHP_WORKER_INSTALL_FFMPEG=true"
case "${machine}" in
    Linux)     sed -i "s|$search|$replace|g" "$file2";;
    Mac)    sed -i "" "s|$search|$replace|g" "$file2";;
esac
# change db engine
search="PMA_DB_ENGINE=mysql"
replace="PMA_DB_ENGINE=mariadb"
case "${machine}" in
    Linux)     sed -i "s|$search|$replace|g" "$file2";;
    Mac)    sed -i "" "s|$search|$replace|g" "$file2";;
esac
echo -e "${NC}更新Laradock(.env)...${Green}done"

## php-worker
# JPEG support modify
search="docker-php-ext-configure gd --with-freetype --with-jpeg --with-png;"
replace="docker-php-ext-configure gd --with-freetype --with-jpeg;"
case "${machine}" in
    Linux)     sed -i "s|$search|$replace|g" "$lard_path/php-worker/Dockerfile";;
    Mac)    sed -i "" "s|$search|$replace|g" "$lard_path/php-worker/Dockerfile";;
esac
# 將最新的 supervisord 組態更新到 laradock
# worker
/bin/cp  "$(PWD)/docker/supervisord.d/laravel-worker.conf" "$lard_path/php-worker/supervisord.d/laravel-worker.conf"
# scheduler
/bin/cp  "$(PWD)/docker/supervisord.d/laravel-scheduler.conf" "$lard_path/php-worker/supervisord.d/laravel-scheduler.conf"
# laravel-short-schedule
/bin/cp  "$(PWD)/docker/supervisord.d/laravel-short-schedule.conf" "$lard_path/php-worker/supervisord.d/laravel-short-schedule.conf"
echo -e "${NC}更新php-worker組態...${Green}done"

image_name="$proj_name"
image_name+='_workspace:latest'
container_name="$proj_name"
container_name+='_workspace_1'
echo -e "${NC}"
if $build || [ -z "$(docker images -q $image_name)" ]; then
    cd "$lard_path" \
        && echo -e "建立並啟動容器..." \
        && docker-compose up --build -d laravel-echo-server nginx mariadb phpmyadmin redis php-worker mailhog workspace
else
    cd "$lard_path" \
        && echo -e "啟動容器..." \
        && docker-compose up -d laravel-echo-server nginx mariadb phpmyadmin redis php-worker mailhog workspace
fi

# check vendor exists
echo -e "${NC}"
vendor="$SCRIPT_DIR/vendor/autoload.php"
if [ ! -f "$vendor" ]; then
    cd "$SCRIPT_DIR" \
        && echo -e "準備安裝 composer 相依套件" \
        && docker exec -it "$container_name" composer install \
        && echo -e "產生 Laravel key" \
        && docker exec -it "$container_name" php artisan key:generate
else
    if [ $update == true ]; then
        cd "$SCRIPT_DIR" \
            && echo -e "準備升級 composer 相依套件" \
            && docker exec -it "$container_name" composer update
    else
        echo -e "忽略 composer 相依套件"
    fi
fi

# check node_modules exists
echo -e "${NC}"
node_modules="$SCRIPT_DIR/node_modules"
if [ ! -d "$node_modules" ]; then
    cd "$SCRIPT_DIR" \
        && echo -e "準備安裝 node.js 相依套件" \
        && docker exec -it "$container_name" npm install
else
    if [ $update == true ]; then
        cd "$SCRIPT_DIR" \
            && echo -e "準備升級 node.js 相依套件" \
            && docker exec -it "$container_name" npm update
    else
        echo -e "忽略 node.js 相依套件"
    fi
fi
