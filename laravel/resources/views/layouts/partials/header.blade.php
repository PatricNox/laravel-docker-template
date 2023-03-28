<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    {{-- Preload --}}
    <link rel="preload" href="{{ asset('css/app.css') }}" as="style" media="print">
    <link rel="preload" href="{{ asset('js/app.js') }}" as="script">

    {{-- Style --}}
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">

    {{-- Fonts --}}
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link rel="preload" href="https://fonts.googleapis.com/css?family=Nunito" as="font" type="font/woff2" crossorigin>

    {{-- Title --}}
    <title>{{ config('app.name', 'Laravel') }} | @yield('page-title')</title>

    {{-- Meta --}}
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    {{-- CSRF --}}
    <meta name="csrf-token" content="{{ csrf_token() }}">
</head>
