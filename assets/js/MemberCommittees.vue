<template>
  <div class="member-committees accordion accordion--closed">
    <h2 v-on:click="toggleAccordion" class="member-committees__header accordion__header">Committees</h2>
    <ul class="member-committees__list accordion__list">
      <li v-for="committee in committees" :key="committee.code" class="member-committees__committee">
        <a :href="buildCommitteeLink(committee.code)" class="member-committees__link">
          <h4 class="member-committees__committee-name">
            {{ committee.name }}
          </h4>
          <p v-if="committee.rank_in_party === 1" class="member-committees__rank">
            {{ buildMemberTitle(committee) }}
          </p>
          <p v-else-if="committee.rank_in_party != null" class="member-committees__rank">
            Party Rank: {{ committee.rank_in_party }}
          </p>
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
            committees: this.member.committees
          }
        },
        methods: {
          buildCommitteeLink(code) {
            return `/committee/${code.toLowerCase()}`;
          },
          buildMemberTitle(committee) {
            return committee.side === 'majority' ? 'Committee Chair' : 'Ranking Member';
          }
        }
    }
</script>

<style>
</style>
