@extends('layouts.app')

@section('content')
    <welcome-component
        :post-url="'{{ route('uq-jix.store') }}'"
        :show-url="'{{ route('uq-jix.show', ['uq_jix' => 'replace_it']) }}'"
        :repay-url="'{{ route('paynow.repay', ['number' => 'replace_it']) }}'"
        :orders="{{ $orders ?? '{}' }}"
        :order-config="{{ json_encode(config('order')) }}"
        :paynow-config="{{ json_encode(config('paynow')) }}" />
@endsection

@push('scripts')
@if ($message ?? false)
<script>
    $(function () {
        alert('{{ $message }}');
    });
</script>
@endif
@if ($errors->any())
<script>
    $(function () {
        alert('{{ $errors->first() }}');
    });
</script>
@endif
@endpush
