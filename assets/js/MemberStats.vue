<template>
  <div class="member-stats">
    <div class="member-stats__primary">
      <h1 class="member-stats__party-pct">{{ votes_with_party }}</h1>
      <p class="member-stats__primary-label">Votes with party</p>
    </div>
    <div class="member-stats__dates">
      <div class="member-stats__date-wrapper">
        <p class="member-stats__label">member since</p>
        <h3 class="member-stats__date">{{ start_date }}</h3>
      </div>
      <div class="member-stats__date-wrapper">
        <p class="member-stats__label">term ends in</p>
        <h3 class="member-stats__date">{{ end_date }}</h3>
      </div>
    </div>
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
