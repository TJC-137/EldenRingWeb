// spiritsApi.ts
export interface Spirit {
  id: string;
  name: string;
  image: string;
  description: string;
  fpCost: string;
  hpCost: string;
  effect: string;
}

export async function fetchSpirits(): Promise<Spirit[]> {
  const response = await fetch('https://eldenring.fanapis.com/api/spirits?limit=300&page=?');
  if (!response.ok) {
    throw new Error('Error al obtener los espíritus');
  }
  const data = await response.json();
  return data.data;
}
  
