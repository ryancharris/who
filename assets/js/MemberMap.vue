<template>
  <div class="member__map">
    <iframe width="100%" height="350" frameborder="0" style="border:0" v-bind:src="url">
    </iframe>
  </div>
</template>

<script>
    export default {
        props: ['member'],
        data() {
          return {
            url: this.member.map_src_url
          }
        }
    }
</script>

<style>
</style>
