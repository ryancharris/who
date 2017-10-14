<template>
  <div class="member-votes accordion--closed">
    <h2 v-on:click="toggleAccordion" class="member-votes__header accordion__header">Recent Votes</h2>
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
        },
        methods: {
          toggleAccordion(event) {
            let parentEl = event.target.parentElement;

            if (parentEl.classList.contains("accordion--closed")) {
              parentEl.classList.replace("accordion--closed", "accordion--open");
            } else {
              parentEl.classList.replace("accordion--open", "accordion--closed");
            }
          }
        }
    }
</script>

<style>
</style>
