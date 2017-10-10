<template>
  <div class="member-header">
    <h3 class="member-header__title">
      {{ title }}
    </h3>
    <div class="member-header__name-row">
      <h1 class="member-header__name">
        {{ name }}
      </h1>
      <h4 class="member-header__state">
        {{ state }}
      </h4>
    </div>
    <div class="member-header__pic-wrapper" v-bind:class="setPartyColor()">
      <img class="member-header__pic" :src="pic" :alt="name">
      <span class="member-header__district">
        {{ district }}
      </span>
    </div>
    <div class="member-header__social-wrapper">
      <ul class="member-header__social-list">
        <li v-for="network in social" :key="network.network" class="member-header__social-item">
          <a class="member-header__social-link" :href="network.url">
            <img v-bind:src="buildSocialIconPath(network.network)" :alt="network.network" :class="`member-header__social-icon member-header__social-icon--${network.network}`">
          </a>
       </li>
      </ul>
    </div>
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
        },
        methods: {
          setPartyColor() {
            return `member-header__pic-wrapper--${this.party.toLowerCase()}`;
          },
          buildSocialIconPath(network) {
            return `/images/${network}.svg`;
          }
        }
    }
</script>

<style>
</style>
