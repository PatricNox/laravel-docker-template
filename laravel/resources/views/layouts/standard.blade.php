@include('layouts.partials.header')
    <body>
        <div>
            <!-- Content -->
            <div class="site-content">
                <div>
                    @yield('content')
                </div>
            </div>

        </div>
        <script src="{{ asset('js/app.js') }}" async></script>
    </body>
</html>
