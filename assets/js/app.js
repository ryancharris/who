import 'phoenix_html';

//
// IMPORT VUE COMPONENTS
//
import Vue from 'vue';
import MemberHeader from './MemberHeader.vue';
import MemberStats from './MemberStats.vue';
import MemberMap from './MemberMap.vue';
import MemberCommittees from './MemberCommittees.vue';

//
// REGISTER CUSTOM TAGS
//
Vue.component('member-header', MemberHeader);
Vue.component('member-stats', MemberStats);
Vue.component('member-map', MemberMap);
Vue.component('member-committees', MemberCommittees);

//
// DECLARE VUE INSTANCE
//
new Vue({
  el: '#app'
});
