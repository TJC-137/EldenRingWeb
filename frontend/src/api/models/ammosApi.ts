//ammosApi.ts
export interface Ammo {
    id: string;
    name: string;
    image: string;
    description: string;
    type: string;
    attackPower: { name: string; amount: number }[];
    passive: string;
  }
  
  export async function fetchAmmos(): Promise<Ammo[]> {
    const response = await fetch('https://eldenring.fanapis.com/api/ammos?limit=300&page=?');
    if (!response.ok) {
      throw new Error('Error al obtener las municiones');
    }
    const data = await response.json();
    return data.data;
  }
  
 