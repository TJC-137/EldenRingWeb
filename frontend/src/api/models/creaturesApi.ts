// Creatures Api

export interface Creature {
    id: string;
    name: string;
    image: string;
    description: string;
    location: string;
    drops: string[];
  }
  
  export async function fetchCreatures(): Promise<Creature[]> {
    const response = await fetch('https://eldenring.fanapis.com/api/creatures?limit=300&page=?');
    if (!response.ok) {
      throw new Error('Error al obtener las criaturas');
    }
    const data = await response.json();
    return data.data;
  }
  