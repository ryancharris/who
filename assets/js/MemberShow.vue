<template>
  <div class="member">
    <member-header v-bind:member="member"></member-header>
    <member-stats v-bind:member="member"></member-stats>
    <member-map v-bind:member="member"></member-map>
    <member-committees v-bind:member="member"></member-committees>
    <member-votes v-bind:member="member"></member-votes>
  </div>
</template>

<script>
    export default {
        props: ['member'],
        data() {
          return {
          }
        }
    }
</script>

<style>
  .name {
    font-size: 32px;
    color: #ac050b;
    margin: 30px 0;
    text-align: center;
  }

  .state {
    color: #fadddd;
  }
</style>
