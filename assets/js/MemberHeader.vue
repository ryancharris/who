<template>
  <div class="member__header">
    <h1 class="name">{{ title }} {{ name }}</h1>
    <h3 class="state">{{ state }}</h3>
  </div>
</template>

<script>
    export default {
        props: ['member', 'pic'],
        data() {
          return {
            name: this.member.name,
            title: this.member.title,
            state: this.member.state,
            party: this.member.party,
            chamber: this.member.chamber,
            district: this.member.district,
            social: this.member.social_urls,
            phone: this.member.phone_url
          }
        }
    }
</script>

<style>
  .name {
    font-size: 32px;
    color: #ac050b;
    margin: 30px 0;
    text-align: center;
  }

  .state {
    color: #fadddd;
  }
</style>
