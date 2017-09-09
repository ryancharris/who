<template>
    <h1 class="helloMessage">{{ member }}</h1>
</template>

<script>
    export default {
        props: ['member']
    }
</script>

<style>
    .helloMessage {
        font-size: 32px;
        color: #ac050b;
        margin: 30px 0;
        text-align: center;
        text-transform: full-width;
    }
</style>
