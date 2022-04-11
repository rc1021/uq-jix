@extends('layouts.app')

@section('content')
<div class="w-full md:w-96 md:max-w-full mx-auto">
    <h1 class="text-2xl text-center my-4">Title</h1>
    @if (session('status'))
        <div class="alert alert-success">
            {{ session('status') }}
        </div>
    @endif
    @if ($errors->any())
        <div class="text-red-500">
            @foreach ($errors->all() as $error)
                <pre>{{ $error }}</pre>
            @endforeach
        </div>
    @endif
    <div class="p-6 border border-gray-300 sm:rounded-md">
      <form method="POST" action="{{ route('form.post') }}">
        @csrf
        <label class="block mb-6">
          <span class="text-gray-700">Your name</span>
          <input type="text" name="name" value="{{ old('name') }}" class=" block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding bg-no-repeat border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" placeholder="Joe Bloggs" required />
          @error('name', 'form')
          <div class="text-red-500">{{ $message }}</div>
          @enderror
        </label>
        <label class="block mb-6">
          <span class="text-gray-700">Mobile Number</span>
          <input name="mobile" type="text" value="{{ old('mobile') }}" class=" block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding bg-no-repeat border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" placeholder="0912345678" required />
          @error('mobile', 'form')
          <pre class="text-red-500">{{ $message }}</pre>
          @enderror
        </label>
        <label class="block mb-6">
          <span class="text-gray-700">Email address</span>
          <input name="email" type="email" value="{{ old('email') }}" class=" block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding bg-no-repeat border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" placeholder="joe.bloggs@example.com" />
          @error('email', 'form')
          <div class="text-red-500">{{ $message }}</div>
          @enderror
        </label>
        <div class="block mb-6">
            <span class="text-gray-700">預約店點</span>
            <select name="place" class="form-select block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding bg-no-repeat border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" aria-label="Default select example" required>
                <option selected>請選擇</option>
                @foreach ($places as $item)
                    <option value="{{ $item }}" {{ old('place') == $item ? 'selected' : '' }}>{{ $item }}</option>
                @endforeach
            </select>
            @error('place', 'form')
            <div class="text-red-500">{{ $message }}</div>
            @enderror
        </div>
        <div class="block mb-6">
            <span class="text-gray-700">希望預約日期</span>
            <select name="date" class="form-select block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding bg-no-repeat border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" aria-label="Default select example">
                <option value="" selected>請選擇</option>
                @foreach ($date_range as $item)
                    <option value="{{ $item }}" {{ old('date') == $item ? 'selected' : '' }}>{{ $item }}</option>
                @endforeach
            </select>
            @error('date', 'form')
            <div class="text-red-500">{{ $message }}</div>
            @enderror
        </div>
        <div class="block mb-6">
            <span class="text-gray-700">希望預約時間</span>
            <select name="time" class="form-select block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding bg-no-repeat border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" aria-label="Default select example">
                <option value="" selected>請選擇</option>
                @foreach ($time_range as $item)
                    <option value="{{ $item }}" {{ old('time') == $item ? 'selected' : '' }}>{{ $item }}</option>
                @endforeach
            </select>
            @error('time', 'form')
            <div class="text-red-500">{{ $message }}</div>
            @enderror
        </div>
        <div class="block mb-6">
            <span class="text-gray-700">預約項目</span>
            @foreach($items as $name => $item)
            <div class="form-check block">
                <input name="{{ $name }}" id="{{ $name }}" {{ (old($name)) ? 'checked' : '' }} class="form-check-input border border-gray-300 rounded-sm bg-white checked:bg-blue-600 checked:border-blue-600 focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain float-left mr-2 cursor-pointer" type="checkbox" value="TRUE">
                <label for="{{ $name }}" class="form-check-label inline-block text-gray-800">{{$item}}</label>
            </div>
            @endforeach
            @error('item1', 'form')
            <div class="text-red-500">{{ $message }}</div>
            @enderror
        </div>
        <div class="mb-6">
          <button type="submit" class="h-10 px-5 text-indigo-100 bg-indigo-700 rounded-lg transition-colors duration-150 focus:shadow-outline hover:bg-indigo-800">
            Submit
          </button>
        </div>
      </form>
    </div>
  </div>
@endsection
