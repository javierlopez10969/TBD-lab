<template>
  <div>
    <Navbar v-bind:botones= show v-bind:user=usuario>  </Navbar>
    <div class="container mt-1">
    </div>
    <div  class="container-fluid mt-5 mx-0 px-10">
      <!-- v-on:update:usuario="usuario = $event" -->      
      <router-view v-bind:usuario="usuario"></router-view>
    </div>
    <div class = "container-fluid bottom mx-0 px-0">
      <Footer></Footer>
    </div>
  </div>

</template>

<script>
import Navbar from './components/general/Navbar.vue'
import Footer from './components/general/Footer.vue'
import axios from 'axios';
export default {
  name: 'App',
  data() {
    return {
      show : 'true',
      tamanoRoute : 0,
      usuario: {}
    }
  },
  components: {
    Navbar,
    Footer
  },
  methods: {
      ocultarMethod(){
        if (localStorage.getItem('token') === null) {
            return true;
        }else{
            return false
        }
      }
  },
  created() { 
    this.show = this.ocultarMethod();  
    this.tamanoRoute = this.selectTamano();
  },
  updated() {
    axios.get('http://localhost:3000/api/user',
     { headers: { token: localStorage.getItem('token')}})
      .then(res => {
        this.usuario = res.data.user;
    });
    this.show = this.ocultarMethod();  
    this.tamanoRoute = this.selectTamano();
  },
  computed:{
      currentRouteName() {
        return this.$route.name;
      },
      selectTamano(){
        if (this.currentRouteName() =='home') {
          return 0;
        }
        else if(this.currentRouteName() =='tablero') {
          return 5;
        }
        else{
          return 0;
        }
      }

  },
  mounted() {
    axios.get('http://localhost:3000/api/user',
     { headers: { token: localStorage.getItem('token')}})
      .then(res => {
        this.usuario = res.data.user;
    });
    this.tamanoRoute = this.selectTamano();
    this.show = this.ocultarMethod();  
  },
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

  .color3{
    background-color: #1D3557 !important ;
     color: white !important ;
  }
  .color3:hover{
    background-color: #255ba5 !important ;
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
    background-color: TRANSPARENT !important ;
     color: #1D3557 !important;
  }
  .color6:hover{
    background-color: #255ba5!important  ;
    color: white !important ;
  }
  .color7{
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
  .colorRojo{
    background-color: rgb(255, 0, 0) !important  ;
    color: white !important ;
  }
  .colorRojo:hover{
    background-color: rgb(168, 15, 15) !important  ;
    color: rgb(255, 255, 255) !important ;
  }

  .colorVerde{
    background-color: rgb(48, 190, 20) !important  ;
    color: white !important ;
  }
  .colorVerde:hover{
    background-color: rgb(36, 136, 22) !important  ;
    color: rgb(255, 255, 255) !important ;
  }

  .color9{

    background: linear-gradient(180deg, #7289da 80%, transparent 100%);
  }
  .transparente{
    background-color: transparent;
  }
  .letra-blanca{
    color: white;
  }
  .letra-blanca:hover{
    color: white;
     text-decoration: none;
  }
  .texto-publicitario{
    font-family: Dosis;
    font-style: normal;
    font-weight: normal;
    font-size: 35px;
    line-height: 48px;
    display: flex;
    align-items: center;

    color: black;
  }

  .press2p{
    font-family: 'Racing Sans One', cursive;
  }
  .roboto{
    font-family: 'Roboto', sans-serif;
  }
    .padding_arriba{
    padding-top: 65px;
  }
  .pt-6,
  .py-6 {
    padding-top: 5rem !important;
  }

  .pr-6,
  .px-6 {
    padding-right: 5rem !important;
  }

  .pb-6,
  .py-6 {
    padding-bottom: 5rem !important;
  }

  .pl-6,
  .px-6 {
    padding-left: 5rem !important;
  }

  .pt-10,
  .py-10 {
    padding-top: 12rem !important;
  }

  .pr-10,
  .px-10 {
    padding-right: 12rem !important;
  }

  .pb-10,
  .py-10 {
    padding-bottom: 12rem !important;
  }

  .pl-10,
  .px-10 {
    padding-left: 12rem !important;
  }
  .mayuscula{
    text-transform: uppercase;
  }
  .minuscula{
    text-transform: lowercase;
  }
  .capitalize{
    text-transform: capitalize;
  }
  .justificar{
    text-align: justify;
  }


</style>
