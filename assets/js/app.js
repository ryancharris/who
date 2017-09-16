import 'phoenix_html';

//
// IMPORT VUE COMPONENTS
//
import Vue from 'vue';


// Member #show components
import MemberHeader from './MemberHeader.vue';
import MemberStats from './MemberStats.vue';
import MemberMap from './MemberMap.vue';
import MemberCommittees from './MemberCommittees.vue';
import MemberVotes from './MemberVotes.vue';

//
// REGISTER CUSTOM TAGS
//
Vue.component('member-header', MemberHeader);
Vue.component('member-stats', MemberStats);
Vue.component('member-map', MemberMap);
Vue.component('member-committees', MemberCommittees);
Vue.component('member-votes', MemberVotes);

//
// DECLARE VUE INSTANCE
//
new Vue({
  el: '#app'
});
