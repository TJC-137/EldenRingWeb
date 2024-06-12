// bossesApi.ts
export interface Boss {
    id: string;
    name: string;
    image: string;
    region: string;
    description: string;
    location: string;
    drops: string[];
    healthPoints: string;
}

export async function fetchBosses(): Promise<Boss[]> {
    const response = await fetch('https://eldenring.fanapis.com/api/bosses?limit=300&page=?');
    if (!response.ok) {
      throw new Error('Error al obtener los jefes enemigos');
    }
    const data = await response.json();
    return data.data;
  }


  