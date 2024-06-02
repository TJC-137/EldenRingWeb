// apiComposable.ts

import { ref } from 'vue';
import { KeyItem, fetchKeyItems } from "../models/itemsApi";
import { Ammo, fetchAmmos } from '../models/ammosApi';
import { Armor, fetchArmors } from '../models/armorsApi';
import { Incantation, fetchIncantations } from '../models/incantationsApi';
import { Sorcery, fetchSorceries } from '../models/sorceriesApi';
import { Spirit, fetchSpirits } from '../models/spiritsApi';
import { AshOfWar, fetchAshes } from '../models/ashesofwarApi';
import { Talisman, fetchTalismans } from '../models/talismansApi';
import { Weapon, fetchWeapons } from '../models/weaponsApi';
import { Shield, fetchShields} from '../models/shieldsApi';
import { Creature, fetchCreatures } from '../models/creaturesApi';
import { Npc, fetchCharacters } from '../models/charactersApi';
import { Boss, fetchBosses } from '../models/bossesApi';

export type { KeyItem, Ammo, Armor, Incantation, Sorcery, Spirit, AshOfWar, Talisman, Weapon, Shield, Creature, Npc, Boss };

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
        case 'Shields': itemsData.value = await fetchShields(); break;
        case 'Armors': itemsData.value = await fetchArmors(); break;
        case 'Ammos': itemsData.value = await fetchAmmos(); break;
        case 'Incantations': itemsData.value = await fetchIncantations(); break;
        case 'Sorceries': itemsData.value = await fetchSorceries(); break;
        case 'Spirits': itemsData.value = await fetchSpirits(); break;
        case 'Ashes': itemsData.value = await fetchAshes(); break;
        case 'Talismans': itemsData.value = await fetchTalismans(); break;
        case 'Items': itemsData.value = await fetchKeyItems(); break;
        case 'Creatures': itemsData.value = await fetchCreatures(); break;
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


