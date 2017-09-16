<template>
  <div class="member__committees">
    <ul>
      <li v-for="committee in committees" :key="committee.code">
        {{ committee.name }} {{ committee.rank_in_party }}
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
        }
    }
</script>

<style>
</style>
