import { ref } from 'vue';
import { fetchAmmos } from '../models/ammosApi';
import { fetchArmors } from '../models/armorsApi';
import { fetchIncantations } from '../models/incantationsApi';
import { fetchSorceries } from '../models/sorceriesApi';
import { fetchSpirits } from '../models/spiritsApi';
import { fetchTalismans } from '../models/talismansApi';
import { fetchWeapons } from '../models/weaponsApi';
import { fetchKeyItems } from '../models/itemsApi';
import { fetchShields } from '../models/shieldsApi';
import { fetchCharacters } from '../models/charactersApi';
import { fetchBosses } from '../models/bossesApi';
import { fetchCreatures } from '../models/creaturesApi';
import { fetchAshes } from '../models/ashesofwarApi';

interface ItemDTO {
  id: string;
  name: string;
  image: string;
  category: string;
}

const searchResults = ref<ItemDTO[]>([]);

const searchInAllCategories = async (query: string) => {
  const allResults: ItemDTO[] = [];

  const categories = [
    { fetch: fetchKeyItems, name: 'Items' },
    { fetch: fetchAmmos, name: 'Ammos' },
    { fetch: fetchArmors, name: 'Armors' },
    { fetch: fetchIncantations, name: 'Incantations' },
    { fetch: fetchSorceries, name: 'Sorceries' },
    { fetch: fetchSpirits, name: 'Spirits' },
    { fetch: fetchTalismans, name: 'Talismans' },
    { fetch: fetchWeapons, name: 'Weapons' },
    { fetch: fetchShields, name: 'Shields' },
    { fetch: fetchAshes, name: 'Ashes of War' },
    { fetch: fetchCreatures, name: 'Creatures' },
    { fetch: fetchCharacters, name: 'Npcs' },
    { fetch: fetchBosses, name: 'Bosses' },
  ];

  for (const category of categories) {
    const data = await category.fetch();
    const filtered = data.filter((item: any) => item.name.includes(query));
    allResults.push(...filtered.map((item: any) => ({
      id: item.id,
      name: item.name,
      image: item.image,
      category: category.name,
    })));
  }

  searchResults.value = allResults;
};

export const useSearchApi = () => {
  return {
    searchResults,
    searchInAllCategories,
  };
};
