# Vue 3 + TypeScript + Vite

This template should help get you started developing with Vue 3 and TypeScript in Vite. The template uses Vue 3 `<script setup>` SFCs, check out the [script setup docs](https://v3.vuejs.org/api/sfc-script-setup.html#sfc-script-setup) to learn more.

## Recommended Setup

- [VS Code](https://code.visualstudio.com/) + [Vue - Official](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (previously Volar) and disable Vetur

- Use [vue-tsc](https://github.com/vuejs/language-tools/tree/master/packages/tsc) for performing the same type checking from the command line, or for generating d.ts files for SFCs.

### Icons

🛡 🗡 ⚔ ⸸ 📜 📃 ♡ ☾☼ 🗝 ➳ 🗺 𒅒𒈔𒅒𒇫𒄆

<!-- Armors -->
          <div v-else-if="props.category == 'Armors'">            
            <h2>{{ item.name }}</h2>
            <p> <strong>DESCRIPTION: </strong> {{  item.description }}</p>
            <p> <strong>CATEGORY: </strong>  {{  item.category }} </p>
            <p> <strong>⚔ DAMAGE NEGATION: </strong>  
              <div v-for="dmgNeg in item.dmgNegation" :key="dmgNeg.name" > 
                <p> -  {{ dmgNeg.name }}: {{ dmgNeg.amount }} </p>
              </div>    
            </p> 
            <p> <strong>🛡 RESISTANCE: </strong>  
              <div v-for="res in item.resistance" :key="res.name">
                <p>
                  -  {{ res.name }}: {{ res.amount }}
                </p>
              </div>    
            </p>
            <p> <strong>🛡 PASSIVE: </strong> {{  item.passive }} </p>
          </div>