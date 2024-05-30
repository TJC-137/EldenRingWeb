// itemsApi

export interface KeyItem {
    id: string;
    name: string;
    image: string;
    description: string;
    type: string;
    effect: string;
  }
  
export async function fetchKeyItems(): Promise<KeyItem[]> {
  const response = await fetch('https://eldenring.fanapis.com/api/items?limit=300&page=?');
  if (!response.ok) {
    throw new Error('Error al obtener los ítems de Elden Ring');
  }

  const data = await response.json();
  return data.data;
}


  