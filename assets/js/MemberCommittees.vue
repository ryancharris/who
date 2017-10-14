<template>
  <div class="member-committees accordion accordion--closed">
    <h2 v-on:click="toggleAccordion" class="member-committees__header accordion__header">Committees</h2>
    <ul class="accordion__list">
      <li v-for="committee in committees" :key="committee.code" class="member-committees__committee">
        <span class="member-committees__committee-name">
          {{ committee.name }}
        </span>
        <span class="member-committees__rank">
          {{ committee.rank_in_party }}
          </span>
      </li>
    </ul>
  </div>
</template>

<script>
    export default {
        props: ['member'],
        data() {
          return {
            committees: this.member.committees
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
