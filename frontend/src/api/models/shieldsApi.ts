export interface Shield {
    id: string;
    name: string;
    image: string;
    description: string;
    attack: { name: string; amount: number }[];
    defence: { name: string; amount: number }[];
    scalesWith: { name: string; scaling: string }[];
    requiredAttributes: { name: string; amount: number }[];
    category: string;
    weight: number;
  }
  
  export async function fetchShields(): Promise<Shield[]> {
    const response = await fetch('https://eldenring.fanapis.com/api/shields?limit=300&page=?');
    if (!response.ok) {
      throw new Error('Error al obtener los escudos');
    }
    const data = await response.json();
    return data.data;
  }
  