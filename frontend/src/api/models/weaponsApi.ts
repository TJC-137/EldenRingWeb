//weaponsApi.ts
export interface Weapon {
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

export async function fetchWeapons(): Promise<Weapon[]> {
  const response = await fetch('https://eldenring.fanapis.com/api/weapons?limit=300&page=?');
  if (!response.ok) {
    throw new Error('Error al obtener las armas');
  }
  const data = await response.json();

  return data.data;
  
}


  