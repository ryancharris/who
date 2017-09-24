<template>
  <div class="member-votes">
    <h2 class="member-votes__header">Recent Votes</h2>
    <ul>
      <li v-for="vote in votes">
        <span v-if="vote.number">{{ vote.number }}</span>
        <span>{{ vote.description }}</span>
        <span>{{ vote.position }}</span>
      </li>
    </ul>
  </div>
</template>

<script>
    export default {
        props: ['member'],
        data() {
          return {
            votes: this.member.votes
          }
        }
    }
</script>

<style>
</style>
