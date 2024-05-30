// apiComposable.ts

import { ref } from 'vue';
import { KeyItem, fetchKeyItems } from "../models/itemsApi";
import { Ammo, fetchAmmos } from '../models/ammosApi';
import { Armor, fetchArmors } from '../models/armorsApi';
import { Incantation, fetchIncantations } from '../models/incantationsApi';
import { Sorcery, fetchSorceries } from '../models/sorceriesApi';
import { Spirit, fetchSpirits } from '../models/spiritsApi';
import { Talisman, fetchTalismans } from '../models/talismansApi';
import { Weapon, fetchWeapons } from '../models/weaponsApi';
import { Npc, fetchCharacters } from '../models/charactersApi';
import { Boss, fetchBosses } from '../models/bossesApi';

export type { KeyItem, Ammo, Armor, Incantation, Sorcery, Spirit, Talisman, Weapon, Npc, Boss };

interface ItemDTO {
  id: string;
  name: string;
  image: string;
}

export function useApi(category: string) {
  let itemsData = ref<ItemDTO[]>([]);

  let fetchItems = async () => {
    try {
      switch(category) {
        case 'Weapons': itemsData.value = await fetchWeapons(); break;
        case 'Armors': itemsData.value = await fetchArmors(); break;
        case 'Ammos': itemsData.value = await fetchAmmos(); break;
        case 'Incantations': itemsData.value = await fetchIncantations(); break;
        case 'Sorceries': itemsData.value = await fetchSorceries(); break;
        case 'Spirits': itemsData.value = await fetchSpirits(); break;
        case 'Talismans': itemsData.value = await fetchTalismans(); break;
        case 'Items': itemsData.value = await fetchKeyItems(); break;
        case 'Npcs': itemsData.value = await fetchCharacters(); break;
        case 'Bosses': itemsData.value = await fetchBosses(); break;
        default: console.error('Categoría no válida');
      }
    } catch (error) {
      console.error('Error al obtener los ítems:', error);
    }
  };

  
  return { itemsData, fetchItems };
}


