import { ref } from 'vue';
import { useApi } from './apiComposable';

export function useItemDetails() {
  const item = ref<any>(null);
  const foundItems = ref<any[]>([]);

  const fetchItemDetails = async (category: string, itemName: string) => {
    console.log('Starting fetch for category:', category);
    console.log('Item name:', itemName);

    const { itemsData, fetchItems } = useApi(category);

    await fetchItems();

    console.log('Fetched items data:', itemsData.value);

    foundItems.value = itemsData.value.filter((item: any) => item.name.toLowerCase().includes(itemName.toLowerCase()));
    console.log('Found items:', foundItems.value);

    if (foundItems.value.length === 1) {
      item.value = foundItems.value[0];
      await fetchItemById(category, item.value.id);
    } else if (foundItems.value.length > 1) {
      item.value = null;
    } else {
      console.error('Item not found');
    }
  };

  const fetchItemById = async (category: string, itemId: string) => {
    try {
      const endpointCategory = getEndpointCategory(category);
      const url = `https://eldenring.fanapis.com/api/${endpointCategory}/${itemId}`;
      console.log('Fetching item details from URL:', url);

      const response = await fetch(url);
      if (!response.ok) {
        throw new Error('Error al obtener los detalles del ítem');
      }
      const data = await response.json();
      item.value = data.data;
    } catch (error) {
      console.error('Error fetching item details:', error);
    }
  };

  const getEndpointCategory = (category: string) => {
    const categoryMap: Record<string, string> = {
      keyitems: 'items', // Mapeamos 'keyitems' a 'items'
      ammos: 'ammos',
      armors: 'armors',
      incantations: 'incantations',
      sorceries: 'sorceries',
      spirits: 'spirits',
      talismans: 'talismans',
      weapons: 'weapons',
      npcs: 'npcs',
      bosses: 'bosses',
      ashes: 'ashes',
      creatures: 'creatures',
    };

    return categoryMap[category.toLowerCase()] || category.toLowerCase();
  };

  return { item, foundItems, fetchItemDetails, fetchItemById };
}
