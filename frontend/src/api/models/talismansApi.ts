// talismansApi.ts

export interface Talisman {
    id: string;
    name: string;
    image: string;
    description: string;
    effect: string;
  }
  
export async function fetchTalismans(): Promise<Talisman[]> {
  const response = await fetch('https://eldenring.fanapis.com/api/talismans?limit=300&page=?');
  if (!response.ok) {
    throw new Error('Error al obtener los talismanes de Elden Ring');
  }

  const data = await response.json();
  return data.data;
}


  

