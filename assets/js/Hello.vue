<template>
    <h1 class="helloMessage">{{ title }} {{ name }}</h1>
</template>

<script>
    export default {
        props: ['member'],
        data() {
          return {
            name: this.member.name,
            title: this.member.title
          }
        }
    }
</script>

<style>
    .helloMessage {
        font-size: 32px;
        color: #ac050b;
        margin: 30px 0;
        text-align: center;
    }
</style>
