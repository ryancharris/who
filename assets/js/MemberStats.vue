<template>
  <div class="member__stats">
    <h1 class="state">{{ votes_with_party }}</h1>
    <h3 class="name">{{ start_date }} {{ end_date }}</h3>
  </div>
</template>

<script>
    export default {
        props: ['member'],
        data() {
          return {
            votes_with_party: this.member.votes_with_party,
            start_date: this.member.start_date,
            end_date: this.member.end_date
          }
        }
    }
</script>

<style>
</style>
