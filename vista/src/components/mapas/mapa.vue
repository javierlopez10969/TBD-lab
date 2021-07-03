<template>

  <div>
    <div style="height: 20%; overflow: auto;">
      <h3>Mapa de emergencias</h3>
    </div>
    <l-map
      :zoom="zoom"
      :center="center"
      style="height: 500px; width: 100%"
    >
      <l-tile-layer
        :url="url"
        :attribution="attribution"
      />
      <l-marker :lat-lng="[-38.719, -73]" :icon =icon>
        <l-popup>Benjax Basado</l-popup>  
      </l-marker>
      <!-- Create image icon (icon) from l-icon tag -->
      <l-marker :lat-lng="[-38.719, -72.478]">
        <l-icon
          :icon-size="dynamicSize"
          :icon-anchor="dynamicAnchor"
          icon-url= "https://i.ibb.co/DtM7qdQ/map-marker-icon.png"
        />
      </l-marker>
    </l-map>
  </div>
</template>

<script>
import { LMap, LTileLayer, LMarker, LIcon } from "vue2-leaflet";
import { latLng, icon } from "leaflet";

export default {
  name: "Icon",
  components: {
    LMap,
    LTileLayer,
    LMarker,
    LIcon
  },
  data() {
    return {
      zoom: 7,
      center: latLng(-38.719, -72.478),
      url: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
      attribution:
        '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',

      icon: icon({
        iconUrl: "https://i.ibb.co/DtM7qdQ/map-marker-icon.png",
        iconSize: [32, 37],
        iconAnchor: [16, 37]
      }),
      staticAnchor: [16, 37],
      customText: "Foobar",
      iconSize: 64
    };
  },
  computed: {
    dynamicSize() {
      return [this.iconSize, this.iconSize * 1.15];
    },
    dynamicAnchor() {
      return [this.iconSize / 2, this.iconSize * 1.15];
    }
  },
  methods: {}
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
</style>
