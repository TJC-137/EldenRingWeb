import { ref } from 'vue';
import { useApi } from './apiComposable';

export function useItemDetails() {
  const item = ref<any>(null);
  const foundItems = ref<any[]>([]);  // Ref para guardar los ítems encontrados

  const fetchItemDetails = async (category: string, itemName: string) => {
    console.log('Starting fetch for category:', category);
    console.log('Item name:', itemName);

    const { itemsData, fetchItems } = useApi(category);

    await fetchItems();

    console.log('Fetched items data:', itemsData.value);

    // Filtrar ítems que contienen el nombre
    foundItems.value = itemsData.value.filter((item: any) => item.name.toLowerCase().includes(itemName.toLowerCase()));
    console.log('Found items:', foundItems.value);

    if (foundItems.value.length === 1) {
      // Si solo hay un ítem, lo seleccionamos automáticamente
      item.value = foundItems.value[0];
      fetchItemById(category, item.value.id);
    } else if (foundItems.value.length > 1) {
      // Si hay múltiples ítems, dejamos que el usuario seleccione uno
      item.value = null;
    } else {
      console.error('Item not found');
    }
  };

  const fetchItemById = async (category: string, itemId: string) => {
    try {
      const response = await fetch(`https://eldenring.fanapis.com/api/${category.toLowerCase()}/${itemId}`);
      if (!response.ok) {
        throw new Error('Error al obtener los detalles del ítem');
      }
      const data = await response.json();
      item.value = data.data;
    } catch (error) {
      console.error('Error fetching item details:', error);
    }
  };

  return { item, foundItems, fetchItemDetails, fetchItemById };
}
