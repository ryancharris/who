import 'phoenix_html';

//
// IMPORT VUE COMPONENTS
//

import Vue from 'vue';
import MemberHeader from './MemberHeader.vue';

//
// REGISTER CUSTOM TAGS
//

Vue.component('member-header', MemberHeader);

//
// DECLARE VUE INSTANCE
//

new Vue({
  el: '#app'
});
