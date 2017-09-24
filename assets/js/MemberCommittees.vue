<template>
  <div class="member-committees">
    <h2 class="member-committees__header">Committees</h2>
    <ul>
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
        }
    }
</script>

<style>
</style>
