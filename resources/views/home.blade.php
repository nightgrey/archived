@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">API</div>

                <div class="card-body">
                    <ul>
                        <li><strong>Auth</strong></li>
                        <li>/api/auth/login</li>
                        <li>/api/auth/register</li>
                        <li>/api/auth/logout</li>
                        <li><strong>Games</strong></li>
                        <li>/api/games/</li>
                        <li>/api/games/{id}</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
