import 'phoenix_html';

//
// IMPORT VUE COMPONENTS
//
import Vue from 'vue';
import MemberHeader from './MemberHeader.vue';
import MemberStats from './MemberStats.vue';
import MemberMap from './MemberMap.vue';

//
// REGISTER CUSTOM TAGS
//
Vue.component('member-header', MemberHeader);
Vue.component('member-stats', MemberStats);
Vue.component('member-map', MemberMap);

//
// DECLARE VUE INSTANCE
//
new Vue({
  el: '#app'
});
