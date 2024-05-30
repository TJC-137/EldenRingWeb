// sorceriesApi.ts
export interface Sorcery {
  id: string;
  name: string;
  image: string;
  description: string;
  type: string;
  cost: number;
  slots: number;
  effects: string;
  requires: { name: string; amount: number }[];
}

export async function fetchSorceries(): Promise<Sorcery[]> {
  const response = await fetch('https://eldenring.fanapis.com/api/sorceries?limit=300&page=?');
  if (!response.ok) {
    throw new Error('Error al obtener los hechizos');
  }
  const data = await response.json();
  return data.data;
}
  
