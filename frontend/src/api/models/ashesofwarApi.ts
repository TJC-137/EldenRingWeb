//Ash Of War Api

export interface AshOfWar {
    id: string;
    name: string;
    image: string;
    description: string;
    affinity: string;
    skill: string;
  }
  
  export async function fetchAshes(): Promise<AshOfWar[]> {
    const response = await fetch('https://eldenring.fanapis.com/api/ashes?limit=300&page=?');
    if (!response.ok) {
      throw new Error('Error al obtener las cenizas de guerra');
    }
    const data = await response.json();
    return data.data;
  }
  