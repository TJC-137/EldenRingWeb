<template>
  <div class="item-details">

    <div v-if="foundItems.length > 1">
      <h3>Select an item:</h3>
      <ul class="item-list">
        <li v-for="foundItem in foundItems" :key="foundItem.id"  @click="selectItem(foundItem)">         
          <div class="item">
            <p>{{ foundItem.name }}</p>
            <img :src="foundItem.image" />
          </div>
        </li>
      </ul>
    </div>

    <div class="item-details-content" v-else-if="item">
      <div class="item-details-info" >
        <BoxAtom 
          :key="item.id"
          :itemId="item.id"
          :itemName="item.name" 
          :imageUrl="item.image" 
          className="box" />
        <div class="item-text">
          
        <div class="spec-details">

          <!-- Ammo --> 
          <div v-if="props.category == 'Ammos'">            
            <h2>{{ item.name }}</h2>

            <section class="description"> 
              <strong>DESCRIPTION: </strong> 
              <p>{{  item.description }}</p>
            </section>
            

            <section class="type"> 
              <strong>TYPE: </strong>  
              <p>{{ item.type }}</p> 
            </section>

            <section class="attack"> <strong>DAMAGE: </strong> 
              <div v-for="dmg in item.attackPower" :key="dmg.name"  >
                <p :class="dmg.name"> {{ dmg.name }}: {{ dmg.amount }} </p>
              </div>    
            </section>      
                
            <section class="frost"> 
              <strong> PASSIVE: </strong> 
              <p>{{ item.passive }} </p>
            </section>
          </div>

          <!-- Armor --> 
          <div v-else-if="props.category == 'Armors'">            
            <h2>{{ item.name }}</h2>

            <section class="description"> 
              <strong>DESCRIPTION: </strong> 
              <p>{{  item.description }}</p>
            </section>
            
            <section class="type"> 
              <strong>CATEGORY: </strong>  
              <p>{{ item.category }}</p> 
            </section>

            <section class="dmgNegation"> <strong>DAMAGE NEGATION: </strong> 
              <div v-for="dmgNeg in item.dmgNegation" :key="dmgNeg.name"  >
                <p :class="dmgNeg.name"> {{ dmgNeg.name }}: {{ dmgNeg.amount }} </p>
              </div>    
            </section> 
            
            <section class="resistance"> <strong>RESISTANCE: </strong> 
              <div v-for="res in item.resistance" :key="res.name"  >
                <p :class="res.name"> {{ res.name }}: {{ res.amount }} </p>
              </div>    
            </section>  
                
            <section class="weight"> 
              <strong> WEIGHT: </strong> 
              <p>{{ item.weight }} </p>
            </section>
          </div>

          <!-- Bosses --> 
          <div v-else-if="props.category == 'Bosses'">            
            <h2>{{ item.name }}</h2>

            <section class="description"> 
              <strong>DESCRIPTION: </strong> 
              <p>{{  item.description }}</p>
            </section>

            <section class="region"> 
              <strong>REGION: </strong>  
              <p>{{ item.region }}</p> 
            </section>

            <section class="location"> 
              <strong>LOCATION: </strong> 
              <p>{{  item.location }}</p>
            </section>
            
            <section class="drops"> 
              <strong>DROPS: </strong> 
              <p>{{  item.drops }}</p>
            </section>

            <section class="health"> 
              <strong>HEALT POINTS: </strong> 
              <p>{{  item.healthPoints }}</p>
            </section>

          </div>

          <!-- Npcs --> 
          <div v-else-if="props.category == 'Npcs'">            
            <h2>{{ item.name }}</h2>

            <section class="region"> 
              <strong>REGION: </strong>  
              <p>{{ item.location }}</p> 
            </section>

            <section class="role"> 
              <strong>ROLE: </strong> 
              <p>{{  item.role }}</p>
            </section>
            
            <section class="quote"> 
              <strong>QUOTE: </strong> 
              <p>{{  item.quote }}</p>
            </section>

          </div>

          <!-- Incantation --> 
          <div v-if="props.category == 'Incantations'">            
            <h2>{{ item.name }}</h2>

            <section class="description"> 
              <strong>DESCRIPTION: </strong> 
              <p>{{  item.description }}</p>
            </section>
            

            <section class="type"> 
              <strong>TYPE: </strong>  
              <p :class="item.type">{{ item.type }}</p> 
            </section>

            <section class="cost"> 
              <strong>COST: </strong>  
              <p>{{ item.cost }}</p> 
            </section>

            <section class="slots"> 
              <strong>SLOTS: </strong>  
              <p>{{ item.slots }}</p> 
            </section>

            <section class="effect"> 
              <strong>EFFECT: </strong>  
              <p>{{ item.effects }}</p> 
            </section>

            <section class="required"> <strong>REQUIRES: </strong> 
              <div v-for="req in item.requires" :key="req.name"  >
                <p :class="req.name"> {{ req.name }}: {{ req.amount }} </p>
              </div>    
            </section>      
                
            
          </div>

          <!-- Item --> 
          <div v-if="props.category == 'Items'">            
            <h2>{{ item.name }}</h2>

            <section class="description"> 
              <strong>DESCRIPTION: </strong> 
              <p>{{  item.description }}</p>
            </section>
            

            <section class="type"> 
              <strong>TYPE: </strong>  
              <p :class="item.type">{{ item.type }}</p> 
            </section>

            <section class="effect"> 
              <strong>EFFECT: </strong>  
              <p>{{ item.effects }}</p> 
            </section>   
                
          </div>

          <!-- Sorcery --> 
          <div v-if="props.category == 'Sorceries'">            
            <h2>{{ item.name }}</h2>

            <section class="description"> 
              <strong>DESCRIPTION: </strong> 
              <p>{{  item.description }}</p>
            </section>

            <section class="type"> 
              <strong>TYPE: </strong>  
              <p :class="item.type">{{ item.type }}</p> 
            </section>

            <section class="cost"> 
              <strong>COST: </strong>  
              <p>{{ item.cost }}</p> 
            </section>

            <section class="slots"> 
              <strong>SLOTS: </strong>  
              <p>{{ item.slots }}</p> 
            </section>

            <section class="effect"> 
              <strong>EFFECT: </strong>  
              <p>{{ item.effects }}</p> 
            </section>

            <section class="required"> <strong>REQUIRES: </strong> 
              <div v-for="req in item.requires" :key="req.name"  >
                <p :class="req.name"> {{ req.name }}: {{ req.amount }} </p>
              </div>    
            </section>      
                
            
          </div>

          <!-- Spirit --> 
          <div v-if="props.category == 'Spirits'">            
            <h2>{{ item.name }}</h2>

            <section class="description"> 
              <strong>DESCRIPTION: </strong> 
              <p>{{  item.description }}</p>
            </section>
            

            <section class="fpCost"> 
              <strong>FP COST: </strong>  
              <p>{{ item.fpCost }}</p> 
            </section>

            <section class="hpCost"> 
              <strong>HP COST: </strong>  
              <p>{{ item.hpCost }}</p> 
            </section>

            <section class="effect"> 
              <strong>EFFECT: </strong>  
              <p>{{ item.effects }}</p> 
            </section>   
                
          </div>

          <!-- Talisman --> 
          <div v-if="props.category == 'Talismans'">            
            <h2>{{ item.name }}</h2>

            <section class="description"> 
              <strong>DESCRIPTION: </strong> 
              <p>{{  item.description }}</p>
            </section>
            
            <section class="effect"> 
              <strong>EFFECT: </strong>  
              <p>{{ item.effects }}</p> 
            </section>   
                
          </div>

          <!-- Weapon --> 
          <div v-if="props.category == 'Weapons'">            
            <h2>{{ item.name }}</h2>

            <section class="description"> 
              <strong>DESCRIPTION: </strong> 
              <p>{{  item.description }}</p>
            </section>

            <section class="attack"> <strong>DAMAGE: </strong> 
              <div v-for="atk in item.attack" :key="atk.name"  >
                <p :class="atk.name"> {{ atk.name }}: {{ atk.amount }} </p>
              </div>    
            </section>     
            
            <section class="defence"> <strong>DEFENCE: </strong> 
              <div v-for="def in item.defence" :key="def.name"  >
                <p :class="def.name"> {{ def.name }}: {{ def.amount }} </p>
              </div>    
            </section>   

            <section class="scaling"> <strong>SCALING: </strong> 
              <div v-for="atr in item.scalesWith" :key="atr.name"  >
                <p :class="atr.name"> {{ atr.name }}: {{ atr.scaling }} </p>
              </div>    
            </section>

            <section class="required"> <strong>REQUIRED: </strong> 
              <div v-for="req in item.requiredAttributes" :key="req.name"  >
                <p :class="req.name"> {{ req.name }}: {{ req.amount }} </p>
              </div>    
            </section> 

            <section class="weight"> 
              <strong> WEIGHT: </strong> 
              <p>{{ item.weight }} </p>
            </section>


          </div>          

        </div>
        </div>
      </div>
    </div>

    <div v-else >
      <p class="settings-error">Trying to load item details...</p>
    </div>

  </div>
</template>

<script setup lang="ts">
  import { defineProps, watchEffect } from 'vue';
  import BoxAtom from '../Atoms/BoxAtom.vue';
  import { useItemDetails } from '../../api/composables/useItemDetails';
  import { useRouter } from 'vue-router';

  const props = defineProps<{
    category: string;
    itemName: string;
    itemId?: string;
  }>();

  const { item, foundItems, fetchItemDetails, fetchItemById } = useItemDetails();
  const router = useRouter();


  const selectItem = (selectedItem: any) => {
    fetchItemById(props.category, selectedItem.id);
    router.push({
      name: 'itemDetails',
      params: {
        category: props.category,
        itemName: selectedItem.name
      }
    });
  };

  watchEffect(() => {
    if (props.itemId) {
      fetchItemById(props.category, props.itemId);
    } else {
      fetchItemDetails(props.category, props.itemName);
    }
    console.log('Calling fetchItemDetails with:', props.category, props.itemName);
  });
</script>

<style scoped>
  .item-details {
    width: 750px;
    margin: 0 auto;
    padding: 20px;
  }

  .item-details-content {
    border-radius: 5px;
    padding: 20px;
    border-radius: 10px;
    padding: 10px;
    overflow-y: auto; 
    z-index: 1;
    animation: fadeIn 5s forwards;
  }

  .item-details-info {
    display: flex;
    flex-direction: row-reverse;
    align-items: flex-start;
    justify-content: space-between;
    gap: 20px;
  }

  .box {
    position: relative;
    right: 0;
    margin-right: 20px;
    flex-shrink: 0;
    animation: popIn 1s ease-out;
  }

  .item-text {
    margin-left: 20px;
  }

  .item-details h2 {
    font-size: 24px;
    margin-bottom: 10px;
    color: #e1c680;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);
  }

  .item-details p {
    font-size: 16px;
    line-height: 1.6;
    color: #ddd;
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);
  }

  .item-details p::first-letter {
    font-size: 120%;
    color: #e1c680;
  }

  .item-details p + p {
    margin-top: 10px;
  }

  .item-details-content p {
    margin: 0;
  }

  .spec-details p::before {
    content: '— ';
    color: #e1c680;
  }

  .item-details h2::before {
    content: '⚜ ';
    color: #e1c680;
  }

  .item-details p:last-child::after {
    content: ' ⚜';
    color: #e1c680;
  }

    /* DAMAGE */

  .spec-details p.physical::before,
  .spec-details p.magic::before, 
  .spec-details p.fire::before,
  .spec-details p.lightning::before,
  .spec-details p.holy::before,
  .spec-details p.critical::before,
  .spec-details p.Crit::before,
  .spec-details p.Rng::before,

    /* RESISTANCES */

  .spec-details p.Phy::before,
  .spec-details p.Strike::before,
  .spec-details p.Slash::before,
  .spec-details p.Pierce::before,
  .spec-details p.Magic::before,
  .spec-details p.Mag::before,
  .spec-details p.Fire::before,
  .spec-details p.Lightning::before,
  .spec-details p.Light::before,
  .spec-details p.Ligt::before,
  .spec-details p.Holy::before,
  .spec-details p.Boost::before,
  .spec-details p.Immunity::before,

    /* SPECIAL */
  .spec-details p.Robustness::before,
  .spec-details p.Focus::before,
  .spec-details p.Vitality::before,
  .spec-details p.Poise::before,
  .spec-details p.Incantations::before,
  .spec-details p.Sorceries::before,

    /* STATS */

  .spec-details p.Intelligence::before,
  .spec-details p.Dexterity::before,
  .spec-details p.Strength::before,
  .spec-details p.Faith::before,
  .spec-details p.Arcane::before,
  .spec-details p.Int::before,
  .spec-details p.Dex::before,
  .spec-details p.Str::before,
  .spec-details p.Fai::before,
  .spec-details p.Arc::before

    
  {
    content: '';
    display: inline-block;
    width: 25px; /* Ajusta el ancho según sea necesario */
    height: 25px; /* Ajusta la altura según sea necesario */
    background-size: contain; /* Asegura que la imagen se ajuste dentro del contenedor */
    background-repeat: no-repeat; /* Evita que la imagen se repita */
    margin-right: 5px; /* Espacio entre la imagen y el texto */
    vertical-align: middle; /* Alinea la imagen verticalmente con el texto */
  }

  .spec-details p.physical::before{
    background-image: url('../../assets/Icons/dmg.png');
  }

  .spec-details p.magic::before {
    background-image: url('../../assets/Icons/mgc.png');
  }

  .spec-details p.fire::before {
    background-image: url('../../assets/Icons/fire.png');
  }

  .spec-details p.lightning::before {
    background-image: url('../../assets/Icons/lght.png');
  }

  .spec-details p.Light::before {
    background-image: url('../../assets/Icons/ligt.png');
  }

  .spec-details p.ligt::before {
    background-image: url('../../assets/Icons/lght.png');
  }

  .spec-details p.holy::before {
    background-image: url('../../assets/Icons/holy.png');
  }

  .spec-details p.critical::before {
    background-image: url('../../assets/Icons/Crit.png');
  }

  .spec-details p.Phy::before {
    background-image: url('../../assets/Icons/Phy.png');
  }

  .spec-details p.Strike::before {
    background-image: url('../../assets/Icons/strike.png');
  }

  .spec-details p.Slash::before {
    background-image: url('../../assets/Icons/slash.png');
  }

  .spec-details p.Pierce::before {
    background-image: url('../../assets/Icons/pierce.png');
  }

  .spec-details p.Magic::before {
    background-image: url('../../assets/Icons/Mag.png');
  }

  .spec-details p.Mag::before {
    background-image: url('../../assets/Icons/Mag.png');
  }

  .spec-details p.Fire::before {
    background-image: url('../../assets/Icons/Fr.png');
  }

  .spec-details p.Ligt::before {
    background-image: url('../../assets/Icons/ligt.png');
  }

  .spec-details p.Holy::before {
    background-image: url('../../assets/Icons/hly.png');
  }

  .spec-details p.Immunity::before {
    background-image: url('../../assets/Icons/immunity.png');
  }

  .spec-details p.Robustness::before {
    background-image: url('../../assets/Icons/robustness.png');
  }

  .spec-details p.Focus::before {
    background-image: url('../../assets/Icons/focus.png');
  }

  .spec-details p.Vitality::before {
    background-image: url('../../assets/Icons/vitality.png');
  }

  .spec-details p.Poise::before {
    background-image: url('../../assets/Icons/poise.png');
  }

  .spec-details p.Incantations::before {
    background-image: url('../../assets/Icons/incantation.png');
  }

  .spec-details p.Sorceries::before {
    background-image: url('../../assets/Icons/sorcery.png');
  }

  .spec-details p.Intelligence::before {
    background-image: url('../../assets/Icons/intelligence.png');
  }

  .spec-details p.Int::before {
    background-image: url('../../assets/Icons/intelligence.png');
  }

  .spec-details p.Dexterity::before {
    background-image: url('../../assets/Icons/dexterity.png');
  }

  .spec-details p.Dex::before {
    background-image: url('../../assets/Icons/dexterity.png');
  }

  .spec-details p.Strength::before {
    background-image: url('../../assets/Icons/strength.png');
  }

  .spec-details p.Str::before {
    background-image: url('../../assets/Icons/strength.png');
  }

  .spec-details p.Guard::before {
    background-image: url('../../assets/Icons/guard.png');
  }

  .spec-details p.Fai::before {
    background-image: url('../../assets/Icons/faith.png');
  }

  .spec-details p.Faith::before {
    background-image: url('../../assets/Icons/faith.png');
  }

  .spec-details p.Arcane::before {
    background-image: url('../../assets/Icons/arcane.png');
  }

  .spec-details p.Arc::before {
    background-image: url('../../assets/Icons/arcane.png');
  }

  .spec-details p.Boost::before {
    background-image: url('../../assets/Icons/Boost.png');
  }

  .spec-details p.Crit::before {
    background-image: url('../../assets/Icons/Crit.png');
  }

  .spec-details p.Rng::before {
    background-image: url('../../assets/Icons/Rng.png');
  }

  /*Attributes*/

  .spec-details section.frost::before,
  .spec-details section.poison::before,
  .spec-details section.bleed::before,
  .spec-details section.rot::before,
  .spec-details section.sleep::before,
  .spec-details section.madness::before,
  .spec-details section.death::before
  {
    content: '';
    display: inline-block;
    width: 25px; /* Ajusta el ancho según sea necesario */
    height: 25px; /* Ajusta la altura según sea necesario */
    background-size: contain; /* Asegura que la imagen se ajuste dentro del contenedor */
    background-repeat: no-repeat; /* Evita que la imagen se repita */
    margin-right: 5px; /* Espacio entre la imagen y el texto */
    vertical-align: middle; /* Alinea la imagen verticalmente con el texto */
  }

  .spec-details section.frost::before {
    background-image: url('../../assets/Icons/frost.png');
  }

  .spec-details section.poison::before {
    background-image: url('../../assets/Icons/poison.png');
  }

  .spec-details section.bleed::before {
    background-image: url('../../assets/Icons/bleed.png');
  }

  .spec-details section.rot::before {
    background-image: url('../../assets/Icons/rot.png');
  }

  .spec-details section.sleep::before {
    background-image: url('../../assets/Icons/sleep.png');
  }

  .spec-details p.strength::before {
    content: '💪';
    color: #e1c680;
  }

  .spec-details p.dexterity::before {
    content: '🤸';
    color: #e1c680;
  }

  .spec-details p.intelligence::before {
    content: '🧠';
    color: #e1c680;
  }

  .spec-details p.faith::before {
    content: '🙏';
    color: #e1c680;
  }

  .spec-details p.arcane::before {
    content: '🔮';
    color: #e1c680;
  }

  .spec-details p.weight::before {
    content: '⚖️';
    color: #e1c680;
  }

  .spec-details section.attack::before,
  .spec-details section.type::before,
  .spec-details section.description::before,
  .spec-details section.armorType::before,
  .spec-details section.armor::before,
  .spec-details section.armorType::before,
  .spec-details section.dmgNegation::before,
  .spec-details section.resistance::before,
  .spec-details section.weight::before,
  .spec-details section.region::before,
  .spec-details section.location::before,
  .spec-details section.drops::before,
  .spec-details section.health::before,
  .spec-details section.role::before,
  .spec-details section.quote::before,
  .spec-details section.cost::before,
  .spec-details section.slots::before,
  .spec-details section.effect::before,
  .spec-details section.required::before,
  .spec-details section.fpCost::before,
  .spec-details section.hpCost::before,
  .spec-details section.defence::before,
  .spec-details section.scaling::before,
  .settings-error::before
  {
    content: '';
    display: inline-block;
    width: 25px; /* Ajusta el ancho aquí sea necesario */
    height: 25px; /* Ajusta la altura aquí sea necesario */
    background-size: contain; /* Asegura que la imagen se ajuste dentro del contenedor */
    background-repeat: no-repeat; /* Evita que la imagen se repita */
    margin-right: 5px; /* Espacio entre la imagen y el texto */
    vertical-align: middle; /* Alinea la imagen verticalmente con el texto */
    margin-bottom: 5px;
  }

  .spec-details section.attack::before {
    background-image: url('../../assets/Icons/attack.png');
  }

  .spec-details section.type::before {
    background-image: url('../../assets/Icons/general.png');
  }

  .spec-details section.description::before {
    background-image: url('../../assets/Icons/papers.png');
  }

  .spec-details section.dmgNegation::before {
    background-image: url('../../assets/Icons/armor.png');
  }

  .spec-details section.resistance::before {
    background-image: url('../../assets/Icons/resistance.png');
  }

  .spec-details section.weight::before {
    background-image: url('../../assets/Icons/load.png');
  }

  .spec-details section.region::before {
    background-image: url('../../assets/Icons/region.png');
  }

  .spec-details section.location::before {
    background-image: url('../../assets/Icons/map.png');
  }

  .spec-details section.drops::before {
    background-image: url('../../assets/Icons/runes.png');
  }

  .spec-details section.health::before {
    background-image: url('../../assets/Icons/rune.png');
  }

  .spec-details section.role::before {
    background-image: url('../../assets/Icons/wistle.png');
  }

  .spec-details section.quote::before {
    background-image: url('../../assets/Icons/arc.png');
  }

  .spec-details section.cost::before {
    background-image: url('../../assets/Icons/spiritIcon.png');
  }

  .spec-details section.slots::before {
    background-image: url('../../assets/Icons/slots.png');
  }

  .spec-details section.effect::before {
    background-image: url('../../assets/Icons/effect.png');
  }

  .spec-details section.required::before {
    background-image: url('../../assets/Icons/keys.png');
  }

  .spec-details section.fpCost::before {
    background-image: url('../../assets/Icons/fpCost.png');
  }

  .spec-details section.hpCost::before {
    background-image: url('../../assets/Icons/hpCost.png');
  }

  .spec-details section.defence::before {
    background-image: url('../../assets/Icons/shield.png');
  }

  .spec-details section.scaling::before {
    background-image: url('../../assets/Icons/scaling.png');
  }

  .settings-error::before {
    background-image: url('../../assets/Icons/settings.png');
  }




  .item-list {
    list-style: none;
    padding: 0;
  }

  .item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px;
    border-radius: 5px;

  }

  .item img{
    width: 50px;
    height: 50px;
  }

  .item-list li {
    cursor: pointer;
    color: #e1c680;
    padding: 5px;
    border: 1px solid #e1c680;
    margin: 5px 0;
  }

  .item-list li:hover {
    background-color: #333;
  }

  .item-details-info strong {
    color: #e1c680;
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);
    margin-bottom: 5px;
  }

  .spec-details section {
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);
    padding: 10px;
    border-radius: 5px;
    margin-bottom: 10px;
  }

  .spec-details strong{
    padding: 10px;
    margin-bottom: 25px;
  }

  .spec-details p {
    margin-bottom: 5px;
  }

  /* Animations */
  @keyframes fadeIn {
    0% { opacity: 0; }
    100% { opacity: 1; }
  }

  @keyframes popIn {
    0% { transform: scale(0.8); opacity: 0; }
    100% { transform: scale(1); opacity: 1; }
  }

  

  /* RESPONSIVENESS */

  @media screen and (max-width: 1440px) {
    .item-details {
      width: 90%;
    }
  }

  @media screen and (max-width: 768px) {
    .item-details {
      width: 90%;

    }

    .item-details-info {
      display: center;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      margin-top: 20px;
      margin-bottom: 20px;
      padding: 10px;
    }
  }
</style>
