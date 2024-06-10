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
import EditAtom from '../components/Atoms/EditAtom.vue';
import FavoritesPage from '../components/Pages/FavoritesPage.vue';
import ClassesPage from '../components/Pages/ClassesPage.vue';
import LorePage from '../components/Pages/LorePage.vue';

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
          path: 'edit',
          name: 'edit',
          component: EditAtom,
        },
        {
          path: 'news',
          component: NewsPage,
        },
        {
          path: 'classes',
          name: 'classes',
          component: ClassesPage,
        },
        {
          path: 'map',
          name: 'map',
          component: MapPage,
          props: true,
        },
        {
          path: 'lore',
          name: 'lore',
          component: LorePage,
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
        {
          path: 'favorites',  // Definimos la ruta para FavoritesPage
          name: 'favorites',
          component: FavoritesPage,
        },
      ],
    },
  ],
});

export default router;
