import Vue from 'vue'
import Router from 'vue-router'
import homePage from '@/components/homePage'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'homePage',
      component: homePage
    },
    {
      path: '/yhxy',
      name: 'yhxy',
      component: () => import( '../views/yhxy.vue')//路由懒加载
    },
    {
      path: '/yszc',
      name: 'yszc',
      component: () => import( '../views/yszc.vue')//路由懒加载
    },
    {
      path: '/test',
      name: 'test',
      component: () => import( '../views/test.vue')//路由懒加载
    }
  ]
})
