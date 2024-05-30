export interface Npc {
    id: string;
    name: string;
    image: string;
    quote: string | null;
    location: string;
    role: string;
}

export async function fetchCharacters(): Promise<Npc[]> {
  const response = await fetch('https://eldenring.fanapis.com/api/npcs?limit=300&page=?');
  if (!response.ok) {
    throw new Error('Error al obtener los npcs');
  }
  const data = await response.json();
  return data.data;
}


