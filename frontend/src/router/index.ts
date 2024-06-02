import { createRouter, createWebHistory } from 'vue-router';
import FullTemplate from '../components/Templates/FullTemplate.vue';
import ItemsPage from '../components/Pages/ItemsPage.vue';
import HomePage from '../components/Pages/HomePage.vue';
import NewsPage from '../components/Pages/NewsPage.vue';
import ItemDetailsPage from '../components/Pages/ItemDetailsPage.vue';
import ItemListPage from '../components/Pages/ItemListPage.vue';
import MapPage from '../components/Pages/MapPage.vue';
import LoginAtom from '../components/Atoms/LoginAtom.vue';
import RegisterAtom from '../components/Atoms/RegisterAtom.vue';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      component: FullTemplate,
      children: [
        {
          path: '',
          name: 'home',
          component: HomePage,
        },
        {
          path: 'login',
          name: 'login',
          component: LoginAtom,
        },
        {
          path: 'register',
          name: 'register',
          component: RegisterAtom,
        },
        {
          path: 'news',
          component: NewsPage,
        },
        {
          path: 'map',
          name: 'map',
          component: MapPage,
          props: true,
        },
        {
          path: ':category',
          name: 'categories',
          component: ItemsPage,
          props: true,
        },
        {
          path: ':category/:itemName',
          name: 'itemDetails',
          component: ItemDetailsPage,
          props: route => ({
            category: route.params.category,
            itemId: route.params.itemId,
            itemName: route.params.itemName,
          }),
        },
        {
          path: 'search',
          name: 'itemList',
          component: ItemListPage,
        },
      ],
    },
  ],
});

export default router;
