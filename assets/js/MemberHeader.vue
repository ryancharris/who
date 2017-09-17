<template>
  <div class="member-header">
    <h1 class="name">{{ title }} {{ name }}</h1>
    <h3 class="state">{{ state }}</h3>
    <img :src="pic" :alt="name">
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
            phone: this.member.phone_url,
            pic: this.pic
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
