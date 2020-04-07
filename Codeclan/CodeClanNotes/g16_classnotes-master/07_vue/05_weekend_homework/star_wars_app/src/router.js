import Vue from 'vue';
import Router from 'vue-router';

import FilmsView from '@/views/FilmsView';
import ScrawlView from '@/views/CrawlView';

Vue.use(Router);

export const router = new Router({
  routes: [
    {
      path: '/',
      name: 'films',
      component: FilmsView
    },
    {
      path:'/crawl',
      name: 'crawl',
      component: ScrawlView,
      props: true
    }
  ]
});
