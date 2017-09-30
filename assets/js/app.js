import 'phoenix_html';

//
// IMPORT VUE COMPONENTS
//
import Vue from 'vue';

// Import social media icons
import facebookIcon from '../static/images/social_media/facebook.svg';
import twitterIcon from '../static/images/social_media/twitter.svg';
import youtubeIcon from '../static/images/social_media/youtube.svg';
import websiteIcon from '../static/images/social_media/website.svg';

// Member #show components
import MemberShow from './MemberShow.vue'
import MemberHeader from './MemberHeader.vue';
import MemberStats from './MemberStats.vue';
import MemberMap from './MemberMap.vue';
import MemberCommittees from './MemberCommittees.vue';
import MemberVotes from './MemberVotes.vue';

//
// REGISTER CUSTOM TAGS
//
Vue.component('member', MemberShow);
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
