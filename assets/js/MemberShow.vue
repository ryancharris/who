<template>
  <div class="member">
    <member-header :member="member" :pic="pic"></member-header>
    <member-stats :member="member"></member-stats>
    <member-map :member="member"></member-map>
    <member-committees :member="member"></member-committees>
    <member-votes :member="member"></member-votes>
  </div>
</template>

<script>
    export default {
        props: ['member', 'pic'],
        data() {
          return {
          }
        }
    }
</script>

<style>
</style>
