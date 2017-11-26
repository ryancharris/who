<template>
  <div class="member-votes accordion accordion--closed">
    <h2 v-on:click="toggleAccordion" class="member-votes__header accordion__header">Recent Votes</h2>
    <ul class="member-votes__list accordion__list">
      <li v-for="vote in votes" v-if="vote.description" :key="vote.id" class="member-votes__vote">
        <a :href="buildBillLink(vote.number)" class="member-votes__bill-link">

          <p class="member-votes__position">
            {{ vote.position }}
          </p>

          <div class="member-votes__bill-info">
            <h4 class="member-votes__bill-num" v-if="vote.number">
              {{ vote.number }}
            </h4>
            <p class="member-votes__bill-desc" v-if="vote.description">
              {{ vote.description }}
            </p>
          </div>

        </a>
      </li>
    </ul>
  </div>
</template>

<script>
    import { Accordion } from  './util/mixins.js';

    export default {
        props: ['member'],
        mixins: [Accordion],
        data() {
          return {
            votes: this.member.votes
          }
        },
        methods: {
          buildBillLink(billNum) {
            let noSpaceString = billNum.replace(/ /g, '');
            return `/bill/${noSpaceString.toLowerCase()}`;
          },
          votedYes(position) {
            return position === 'Yes' ? true : false;
          }
        }
    }
</script>

<style>
</style>
