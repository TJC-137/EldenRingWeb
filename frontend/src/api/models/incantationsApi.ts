// incantationsApi.ts
export interface Incantation {
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
  
  export async function fetchIncantations(): Promise<Incantation[]> {
    const response = await fetch('https://eldenring.fanapis.com/api/incantations?limit=300&page=?');
    if (!response.ok) {
      throw new Error('Error al obtener los encantamientos');
    }
    const data = await response.json();
    return data.data;
  }


  