<template>
  <div>
    <Navbar v-bind:botones= show v-bind:user=usuario>  </Navbar>
    <div class="container mt-5">
    </div>
    <div  class="container mt-5">
      <!-- v-on:update:usuario="usuario = $event" -->      
      <router-view></router-view>
    </div>
    <div class = "container-fluid bottom mx-0 px-0">
      <Footer></Footer>
    </div>
  </div>

</template>

<script>
import Navbar from './components/general/Navbar.vue'
import Footer from './components/general/Footer.vue'
export default {
  name: 'App',
  data() {
    return {
      show : 'true',
      baseURL: "http://localhost:3000/api",
      tamanoRoute : 0,
      usuario: {}
    }
  },
  components: {
    Navbar,
    Footer
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

  .color1{
    background-color: #457B9D;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);  
  }

  .color2{
    background-color:  #F1FAEE !important  ;
    color: black !important ;
  }
  .color2:hover{
    background-color:#A8DADC !important  ;
    color: black !important ;
  }

  .color3{
    background-color: #1D3557 !important ;
     color: white !important ;
  }

  .color4{
    background-color: #A8DADC!important ;
     color: black !important ;
  }

  .color5{
    background-color: #457B9D !important ;
     color: white !important ;
  }
  .color6{
    background-color: rgb(160, 0, 0) !important ;
     color: white !important ;
  }
  .color6:hover{
    background-color: red !important  ;
    color: white !important ;
  }
  .color7:{
    background-color: #457B9D !important;
    color: #1D3557 !important;
  }
    .color8{
    background-color: rgb(110, 110, 110) !important ;
     color: white !important ;
  }
  .color8:hover{
    background-color: rgb(153, 153, 153) !important  ;
    color: white !important ;
  }
  .letra-blanca{
    color: white;
  }
  .letra-blanca:hover{
    color: white;
     text-decoration: none;
  }
</style>
