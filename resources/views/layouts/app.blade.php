<!DOCTYPE html>
<html lang="zh-tw">
<head>
  <meta name="viewport" content="user-scalable=1, width=device-width, initial-scale=1, maximum-scale=2" />
  <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0" /> -->
  <meta charset="UTF-8">
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="format-detection" content="telephone=no" />
  <title>REHOW × JUST IN XX 舊衣新生工坊</title>
  <meta name="description" content="加入我們使服裝重生讓愛循環">
  <meta name="Keywords" content="UNIQLO, REHOW, JUST IN XX, 舊衣新生工坊">
  <meta property="og:site_name" content="REHOW × JUST IN XX 舊衣新生工坊">
  <meta property="og:title" content="REHOW × JUST IN XX 舊衣新生工坊">
  <meta property="og:description" content="加入我們使服裝重生讓愛循環">
  <meta property="og:type" content="website">
  <meta property="og:url" content="https://rehow.org/uq-jix">
  <meta property="og:image" content="https://rehow.org/ogimg/ogimg.png">
  <meta http-equiv="Content-Script-Type" content="text/javascript">
  <meta http-equiv="content-style-type" content="text/css">
  <link rel="canonical" href="">
  <meta name="robots" content="noydir">
  <meta name="robots" content="noodp">
  <meta name="robots" content="index,follow">

		<!-- Icons -->
		<link rel="shortcut icon" href="/ogimg/favicon/favicon.ico">
		<link rel="apple-touch-icon" type="image/png" href="/ogimg/favicon/apple-touch-icon-57x57-precomposed.png" sizes="57x57" >
		<link rel="apple-touch-icon" type="image/png" href="/ogimg/favicon/apple-touch-icon-60x60-precomposed.png" sizes="60x60" >
		<link rel="apple-touch-icon" type="image/png" href="/ogimg/favicon/apple-touch-icon-72x72-precomposed.png" sizes="72x72" >
		<link rel="apple-touch-icon" type="image/png" href="/ogimg/favicon/apple-touch-icon-76x76-precomposed.png" sizes="76x76" >
		<link rel="apple-touch-icon" type="image/png" href="/ogimg/favicon/apple-touch-icon-114x114-precomposed.png" sizes="114x114" >
		<link rel="apple-touch-icon" type="image/png" href="/ogimg/favicon/apple-touch-icon-120x120-precomposed.png" sizes="120x120" >
		<link rel="apple-touch-icon" type="image/png" href="/ogimg/favicon/apple-touch-icon-144x144-precomposed.png" sizes="144x144" >
		<link rel="apple-touch-icon" type="image/png" href="/ogimg/favicon/apple-touch-icon-152x152-precomposed.png" izes="152x152" >
		<link rel="apple-touch-icon" type="image/png" href="/ogimg/favicon/apple-touch-icon-180x180-precomposed.png" sizes="180x180" >
		<link rel="icon" type="image/png" href="/ogimg/favicon/favicon-16x16.png" sizes="16x16" >
		<link rel="icon" type="image/png" href="/ogimg/favicon/favicon-32x32.png" sizes="32x32" >
		<link rel="icon" type="image/png" href="/ogimg/favicon/favicon-72x72.png" sizes="72x72" >
		<link rel="icon" type="image/png" href="/ogimg/favicon/favicon-96x96.png" sizes="96x96" >
		<link rel="icon" type="image/png" href="/ogimg/favicon/favicon-128x128.png" sizes="128x128" >
		<link rel="icon" type="image/png" href="/ogimg/favicon/favicon-196x196.png" sizes="196x196" >
		<link rel="manifest" href="/ogimg/favicon/site.webmanifest">
		<meta name="msapplication-TileColor" content="#2b5797">
		<meta name="msapplication-config" content="browserconfig.xml">
		<meta name="theme-color" content="#ffffff">


    <link rel="stylesheet" type="text/css" href="/fonts/uniqlo/css/uniqlo.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="{{ mix('css/main.css') }}">
    <script src="https://kit.fontawesome.com/3de6e4f0a1.js"></script>
    @stack('styles')
</head>

<body>
    <div id="app">
        @yield('content')
    </div>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/tether@2.0.0-beta.5/dist/js/tether.min.js"></script>
    <script type="text/javascript" src="{{ mix('js/app.js') }}"></script>
    <script type="text/javascript" src="{{ mix('js/main.js') }}"></script>
    @stack('scripts')
</body>
</html>
