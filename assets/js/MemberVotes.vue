<template>
  <div class="member-votes accordion">
    <h2 class="member-votes__header accordion__header">Recent Votes</h2>
    <ul class="accordion__list">
      <li v-for="vote in votes" :key="vote.id" class="member-votes__item">
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
