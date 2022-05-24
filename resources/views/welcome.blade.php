@extends('layouts.app')

@section('content')
    <welcome-component
        :post-url="'{{ route('uq-jix.store') }}'"
        :show-url="'{{ route('uq-jix.show', ['uq_jix' => 'replace_it']) }}'"
        :orders="{{ $orders ?? '{}' }}"
        :order-config="{{ json_encode(config('order')) }}" />
@endsection

@push('scripts')

@if ($message ?? false)
<script>
    $(function () {
        alert('{{ $message }}');
    });
</script>
@endif
@endpush
