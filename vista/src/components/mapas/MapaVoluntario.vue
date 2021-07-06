<template>

  <div>
    <div style="height: 20%; overflow: auto; text-align: left !important;">
      <h3>Ubicación de la emergencia</h3>
       <!--
      <h4>Ubicacion :  {{emergencia.latitud}} , {{emergencia.longitud}}</h4>
      -->
      <h4>{{emergencia.nombre}} </h4>

    </div>
    <l-map
      :zoom="zoom"
      :center="center"
      style="height: 750px; width: 540.93px; border-radius: 20px; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);"
      class="extra"
      
    >
      <l-tile-layer
        :url="url"
        :attribution="attribution"
      />
     <!-- 
      <l-marker :lat-lng=ubicacion :icon = icon>
        <l-popup>Benjax Basado</l-popup>  
      </l-marker> 

      Create image icon (icon) from l-icon tag
      <l-marker :lat-lng="[-33.19976552083029, -70.67199596382044]">
        <l-popup>Benjax Basado</l-popup>  
      </l-marker> -->
      <l-marker :lat-lng="[x,y]">
        <l-icon 
          :icon-size="dynamicSize"
          :icon-anchor="dynamicAnchor"
          icon-url= "https://i.ibb.co/DtM7qdQ/map-marker-icon.png"
        />
        <l-popup><b>Emergencia</b><br>{{emergencia.nombre}}</l-popup>  
      </l-marker> 

      <l-marker v-for="usuario in usuarios" v-bind:key="usuario" :lat-lng="[usuario.longitud,usuario.latitud]" :icon =icon>
        <l-popup><b>Voluntario</b><br>{{usuario.nombre}}</l-popup>  
      </l-marker>
 
    </l-map>
  </div>
</template>

<script>
import { LMap, LTileLayer, LMarker, LIcon, LPopup } from "vue2-leaflet";
import { latLng,icon} from "leaflet";

export default {
  name: "Icon",
  components: {
    LMap,
    LTileLayer,
    LMarker,
    LIcon,
    LPopup,
  },
  data() {
    return {
      x : 0,
      y : 0,
      ubicacion : [] ,
      ubicacionString : '',
      zoom: 4,
      center: latLng(-38.719, -72.478),
      url: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
      attribution:
        '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
      icon: icon({
        //iconUrl: "https://i.ibb.co/DtM7qdQ/map-marker-icon.png",
        iconUrl: require('leaflet/dist/images/marker-icon.png'),
        //iconSize: [32, 37],
        iconAnchor: [16, 37]
      }),
      staticAnchor: [16, 37],
      customText: "Foobar",
      iconSize: 36 


    };
  },
  props: [
        'emergencia',
        'usuarios'
        ],
  computed: {
    dynamicSize() {
      return [this.iconSize, this.iconSize * 1.15];
    },
    dynamicAnchor() {
      return [this.iconSize / 2, this.iconSize * 1.15];
    }
    
  },
  methods: {} ,
  mounted() {
  },
  updated(){
      this.x = this.emergencia.longitud;
      this.y = this.emergencia.latitud;
      this.ubicacion = [this.emergencia.latitud,this.emergencia.longitud];
      this.ubicacionString = '[' + this.ubicacion.toString() + ']';
  }
};
</script>

<style>
.someExtraClass {
  background-color: aqua;
  padding: 10px;
  border: 1px solid #333;
  border-radius: 0 20px 20px 20px;
  box-shadow: 5px 3px 10px rgba(0, 0, 0, 0.2);
  text-align: center;
  width: auto !important;
  height: auto !important;
  margin: 0 !important;
}
    .extra{
        transition: 0.5s;
    }
    .extra:hover{
        /*
        margin-top: 23px !important;
        */
        box-shadow: 0px 10px 10px rgba(0, 0, 0, 0.5);
         
    }
</style>
