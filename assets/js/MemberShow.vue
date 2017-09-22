<template>
  <div class="member">
    <div class="content--container">
      <member-header :member="member" :pic="pic"></member-header>
      <member-stats :member="member"></member-stats>
    </div>
    <div class="content--full-width">
      <member-map :member="member"></member-map>
    </div>
    <div class="content--container">
      <member-committees :member="member"></member-committees>
      <member-votes :member="member"></member-votes>
    </div>
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
