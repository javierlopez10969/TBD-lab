<template>
  <!-- el height para el tamaño vertical-->
  <div id="map-wrap" style="height: 60vh">
    <client-only>
        <!-- este es para ver donde apunta el mapa al inicio-->
      <l-map :zoom=4 :center="[-38.719, -72.478]">
        <l-tile-layer url="http://{s}.tile.osm.org/{z}/{x}/{y}.png"></l-tile-layer>
        <!--l-marker es un punto en el mapa, hay que revisar si estan de la forma latitud,longitud-->
        <l-marker :lat-lng="[-33.039722, -71.509167]">
              <l-popup>Benjax Basado</l-popup>      
          
        </l-marker>
      </l-map>
    </client-only>
  </div>

</template>

<script>
//import L from 'leaflet';
import { LMap, LTileLayer, LMarker, LPopup } from 'vue2-leaflet';
import { Icon } from 'leaflet';

delete Icon.Default.prototype._getIconUrl;
Icon.Default.mergeOptions({
  iconRetinaUrl: require('leaflet/dist/images/marker-icon-2x.png'),
  iconUrl: require('leaflet/dist/images/marker-icon.png'),
  shadowUrl: require('leaflet/dist/images/marker-shadow.png'),
});



export default {
  name: 'MyAwesomeMap',
  components: {
    LMap,
    LTileLayer,
    LMarker,
    LPopup
  },

  modules: [
    // Simple usage
    'nuxt-leaflet',

    // With options
    ['nuxt-leaflet', { /* module options */ }],
 ],

  computed: {
    dynamicSize () {
      return [this.iconSize, this.iconSize * 1.15];
    },
    dynamicAnchor () {
      return [this.iconSize / 2, this.iconSize * 1.15];
    }
  }

};
</script>
