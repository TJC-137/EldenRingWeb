// armorsApi.ts
export interface Armor {
    id: string;
    name: string;
    image: string;
    description: string;
    category: string;
    dmgNegation: { name: string; amount: number }[];
    resistance: { name: string; amount: number }[];
    weight: number;
  }
  
  export async function fetchArmors(): Promise<Armor[]> {
    const response = await fetch('https://eldenring.fanapis.com/api/armors?limit=300&page=?');
    if (!response.ok) {
      throw new Error('Error al obtener las armaduras');
    }
    const data = await response.json();
    return data.data;
  }
