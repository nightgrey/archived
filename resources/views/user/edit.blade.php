@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Edit profile') }}</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('users.update') }}">
                        @csrf
                        @method('PATCH')

                        <div class="form-group row">
                            <label for="username" class="col-md-4 col-form-label text-md-right">{{ __('Username') }}</label>

                            <div class="col-md-6">
                                <input id="username" type="text" class="form-control{{ $errors->has('username') ? ' is-invalid' : '' }}" name="username" value="{{ $user->username }}" disabled>

                                @if ($errors->has('username'))
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('username') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('E-Mail') }}</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ $user->email }}">

                                @if ($errors->has('email'))
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>


                        <div class="form-group row">
                            <label for="avatar" class="col-md-4 col-form-label text-md-right">{{ __('Avatar') }}</label>

                            <div class="col-md-6">
                                <input id="avatar" type="text" class="form-control{{ $errors->has('avatar') ? ' is-invalid' : '' }}" name="avatar" value="{{ $user->avatar }}">

                                @if ($errors->has('avatar'))
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('avatar') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="nintendo_friend_code" class="col-md-4 col-form-label text-md-right">{{ __('Nintendo Friend Code') }}</label>

                            <div class="col-md-6">
                                <input id="nintendo_friend_code" type="text" class="form-control{{ $errors->has('nintendo_friend_code') ? ' is-invalid' : '' }}" name="nintendo_friend_code" value="{{ $user->nintendo_friend_code }}">

                                @if ($errors->has('nintendo_friend_code'))
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('nintendo_friend_code') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="discord_tag" class="col-md-4 col-form-label text-md-right">{{ __('Discord tag') }}</label>

                            <div class="col-md-6">
                                <input id="discord_tag" type="text" class="form-control{{ $errors->has('discord_tag') ? ' is-invalid' : '' }}" name="discord_tag" value="{{ $user->discord_tag }}">

                                @if ($errors->has('discord_tag'))
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('discord_tag') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="games" class="col-md-4 col-form-label text-md-right">{{ __('Games') }}</label>

                            <div class="col-md-6">
                                <input id="games" type="text" class="form-control{{ $errors->has('games') ? ' is-invalid' : '' }}" name="games" value="{{ $user->games }}">

                                @if ($errors->has('games'))
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('games') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>


                        <div class="form-group row">
                            <label for="local_range" class="col-md-4 col-form-label text-md-right">{{ __('Local range') }}</label>

                            <div class="col-md-6">
                                <input id="local_range" type="number" class="form-control{{ $errors->has('local_range') ? ' is-invalid' : '' }}" name="local_range" value="{{ $user->local_range }}" >

                                @if ($errors->has('local_range'))
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('local_range') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="bio" class="col-md-4 col-form-label text-md-right">{{ __('Bio') }}</label>

                            <div class="col-md-6">
                                <textarea id="bio" class="form-control{{ $errors->has('bio') ? ' is-invalid' : '' }}" name="bio" >{{ $user->bio }}</textarea>

                                @if ($errors->has('bio'))
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('bio') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="age" class="col-md-4 col-form-label text-md-right">{{ __('Age') }}</label>

                            <div class="col-md-6">
                                <input id="age" type="number" class="form-control{{ $errors->has('age') ? ' is-invalid' : '' }}" name="age" value="{{ $user->age }}"  />

                                @if ($errors->has('age'))
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('age') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="use_voice_chat" class="col-md-4 col-form-label text-md-right">{{ __('Use voice chat') }}</label>

                            <div class="col-md-6">
                                <input id="use_voice_chat" type="checkbox" class="form-control{{ $errors->has('use_voice_chat') ? ' is-invalid' : '' }}" name="use_voice_chat" checked="{{ $user->use_voice_chat ? 'checked' : '' }}" />

                                @if ($errors->has('use_voice_chat'))
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('use_voice_chat') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-8 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Save') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
