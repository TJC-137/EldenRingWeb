export interface Class {
    id: string;
    name: string;
    image: string;
    description: string;
    stats: {
        level: string;
        vigor: string;
        mind: string;
        endurance: string;
        strength: string;
        dexterity: string;
        intelligence: string;
        faith: string;
        arcane: string;
    };
}

export async function fetchClasses(): Promise<Class[]> {
    const response = await fetch('https://eldenring.fanapis.com/api/classes?limit=14');
    if (!response.ok) {
        throw new Error('Error al obtener las clases');
    }
    const data = await response.json();
    return data.data.map((item: any) => ({
        id: item.id,
        name: item.name,
        image: item.image,
        description: item.description,
        stats: {
            level: item.stats.level,
            vigor: item.stats.vigor,
            mind: item.stats.mind,
            endurance: item.stats.endurance,
            strength: item.stats.strength,
            dexterity: item.stats.dexterity,
            intelligence: item.stats.intelligence,
            faith: item.stats.faith,
            arcane: item.stats.arcane,
        },
    }));
}
