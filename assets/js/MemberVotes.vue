<template>
  <div class="member-votes">
    <ul>
      <li v-for="vote in votes">
        <p v-if="vote.number">{{ vote.number }}</p>
        <p>{{ vote.description }}</p>
        <p>{{ vote.position }}</p>
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
