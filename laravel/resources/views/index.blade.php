@extends('layouts.standard')
@section('page-title', __('home'))

@section('content')
    <div>
        <p>
            Welcome to {{ config('app.name', 'Laravel app') }}!
        </p>
    </div>
@endsection
