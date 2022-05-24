<?php

if (! function_exists('snowflake')) {
    /**
     * get snowflake id
     * 取得一個基于雪花算法的 ID
     *
     * @param  mixed $payload 塞入一組內容, 可以是一個陣列, 字串, 數字, 或物件
     * @return void
     */
    function snowflake($payload = null) {
        $key = app('snowflake')->id();
        cache()->put($key, $payload);
        return $key;
    }
}

if (! function_exists('snowflake_get')) {
    /**
     * snowflake_get
     * 取得指定 id 的內容
     *
     * @param  string $key
     * @return mixed
     */
    function snowflake_get($key) {
        return cache()->get($key);
    }
}

if (! function_exists('snowflake_set')) {
    /**
     * snowflake_set
     * 更新指定 id 的內容
     *
     * @param  mixed $key
     * @param  mixed $data
     * @return void
     */
    function snowflake_set($key, $data = null) {
        cache()->put($key, $data);
    }
}

if (! function_exists('snowflake_forget')) {
    /**
     * snowflake_forget
     * 移除指定 id 的內容
     *
     * @param  mixed $key
     * @return void
     */
    function snowflake_forget($key) {
        cache()->forget($key);
    }
}
