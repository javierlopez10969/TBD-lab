<template>
    <div>
        <div class="row">
       
            <div class="col-md-3 mx-auto">
                <div class="input-group">
                    <input class="form-control border-end-0 border rounded-pill" type="search" 
                    value="search" v-model="id" @change="buscar();actualizarBusqueda();getUsuario();getHabilidades();">
                    <span class="input-group-append">
                        <router-link 
                        :to="{name: 'tareas', params: { id: id}}" class="">
                        <button class="btn btn-outline-secondary bg-white border-bottom-0 border rounded-pill ms-n5" type="button">
                            <i class="bi bi-search"></i>
                        </button>
                        </router-link>
                    </span>
                </div>
            </div>
        </div>
        <div v-if="(0<Usuario.id) && (Usuario.id<=cantUsers)">
        <div class="row">
            <div class="col-6 mt-5">
                <b-card no-body class="overflow-hidden" style="max-width: 600px; max-height:288px;">
                    <b-row no gutters>
                        <b-col md="6">
                            <b-card  :img-src='"https://placekitten.com/500/500?image=" + this.id2' img-alt="Image" class="rounded-0"></b-card>
                        </b-col>
                        <b-col md="6">
                            <b-card-title class = "mb-2 pt-2">{{ Usuario.nombre}}</b-card-title>
                            <hr class="my-1">
                            <h5>Correo</h5>
                            <b-card-sub-title class="mb-2">{{ Usuario.email}}</b-card-sub-title>
                            <hr  class="my-1">
                            <h5>Fecha de nacimiento</h5>
                            <b-card-sub-title class="mb-2">{{ Usuario.fnacimiento}}</b-card-sub-title>
                            <hr  class="my-1">
                            <h5>Habilidades</h5>   

                            <b-card-sub-title class="mb-2" v-if="Habilidades.length<4">
                                <div v-for="habilidad in Habilidades" :key="habilidad._id">
                                    {{ habilidad.descrip}}       
                                </div>             
                            </b-card-sub-title>  
                        

                            <b-card-sub-title class="mb-2" v-else style="overflow: auto; max-height:77px; min-width:280px;">
                                <div v-for="habilidad in Habilidades" :key="habilidad._id">
                                    {{habilidad.descrip}}                           
                                </div>             
                            </b-card-sub-title>  

                        </b-col>
                    </b-row>                      
                </b-card>
            </div>  

          
            <!-- cuadro tarea-->
            <div class="col-6  mt-5">     
                        
                <TareaComp v-bind:idTarea.sync="idTarea" > </TareaComp>
            </div>

             
        </div>
       
        
        <div class="col-md-12">
            <h1>Tareas en la que el usuario es permitido</h1>
            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>Emergencia</th>
                        <th>Nombre Tarea</th>
                        <th>Descripción de la tarea </th>
                        <th>Habilidades requerida</th>                        
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="tarea in Tareas" :key="tarea.id">
                        <td><Lista v-bind:id="tarea.id_emergencia" v-bind:modo="2"></Lista>
                        </td>
                        
                        
                        <td>          
                             <p style="padding-bottom:0px;margin-bottom:0px;"> 
                                {{ tarea.nombre}}
                            </p>
                            <p style="color:grey; padding-top:0px;margin-top:0px; font-weight: bold; font-size: 14px;"> 
                                ID : {{tarea.id}}   
                            </p> </td>
                        <td>{{ tarea.descrip }}</td>

                        <td>                        
                            <tbody>
                                <Lista v-bind:id="tarea.id" v-bind:modo="1"></Lista>
                            </tbody>
                        </td>


                        <td class="text-center">

                            <btn                                
                                class="mx-2 mt-1 mb-1 btn abajo colorVerde  rounded-pill" @click="actualizarID(tarea.id)"><h6 class="my-1">Ver Tarea</h6>
                            </btn>

                            <router-link 
                                :to="{name: 'emergencia', params: { id: tarea.id_emergencia}}" 
                                class=" btn abajo colorRojo  rounded-pill" ><h6 class="my-1">Ver emergencia</h6>
                            </router-link>
                        </td>
                    </tr>
                   
                </tbody>
            </table>
        </div>
    </div>
    <div v-else>
        <h1 class = " mt-5 mb-5 text-center " style="padding-top:100px; padding-bottom:100px;"> Error 404 :( No hay usuarios con esa id</h1>
    </div>

   
    </div>
</template>
    
<script>    

    import axios from 'axios';
    import Lista from './GTarea.vue';
    import TareaComp from './TareaPeq.vue';
    export default {
        components:{
            Lista,
            TareaComp
        },
        data() {
            return {
                Tareas :[],
                Usuario : {},
                Habilidades : {},
                HabilidadesTarea : [],
                HabilidadesEmergencia : {},
                id : 1,
                id2: this.id,
                error : 0 ,
                urlGato : `https://placekitten.com/500/500?image=` + this.id%16+1,
                idTarea : 0.1,
                cantUsers: 0,
            
            }
        },
       /* @GetMapping("/habilidades/tarea/{id}")
   
        @GetMapping("/habilidades/emergencia/{id]")*/
    
    
        created() {
            if (this.$route.params.id != null) {
                this.id = this.$route.params.id;
            }
        
            let apiURL = `http://localhost:3000/tareas/buscar/` +this.id;
            axios.get(apiURL).then(res => {
            this.Tareas = res.data;
                let apiURL2 = 'http://localhost:3000/voluntarios/' + this.id;
                axios.get(apiURL2).then(res => {
                    this.Usuario = res.data;
                    this.error = 0 ;
                        let apiURL3 = 'http://localhost:3000/habilidades/usuario/' + this.id;
                        axios.get(apiURL3).then(res => {
                            this.Habilidades = res.data;
                                let apiURL3 = 'http://localhost:3000/voluntarios/count';
                                axios.get(apiURL3).then(res => {
                                    this.cantUsers = res.data;
                                }).catch(error => {
                                    console.log(error)
                                });
                        }).catch(error => {
                            this.error =1 ;
                            console.log(error)
                        });
                }).catch(error => {
                    this.error =1 ;
                    console.log(error)
                });
            }).catch(error => {
                this.error =1 ;
                console.log(error)
            });
            if (this.Usuario == null) {
                this.error = 1;
            }
            
        },
        methods: {
            actualizarBusqueda(){
                console.log("ID : " + this.id);
                let apiURL = 'http://localhost:3000/tareas/buscar/' + this.id;
                axios.get(apiURL).then(res => {
                    this.Tareas = res.data;
                    console.log("Tareas puestas ");
                    this.getHabilidadesTarea();
                }).catch(error => {
                    console.log(error)
                });

            },
            getUsuario(){
                let apiURL2 = 'http://localhost:3000/voluntarios/' + this.id;
                axios.get(apiURL2).then(res => {
                    this.Usuario = res.data;
                    this.error = 0 ;
                }).catch(error => {
                    console.log(error)
                    this.error = 1 ;
                });
            },
            getHabilidades(){
                let apiURL3 = 'http://localhost:3000/habilidades/usuario/' + this.id;
                axios.get(apiURL3).then(res => {
                    this.Habilidades = res.data;
                }).catch(error => {
                    console.log(error)
                });

            },
            buscar(){
                this.$router.push('/tareas/'+this.id);
            },
            actualizarID(id){
                this.idTarea = id;
            }
        },
        updated(){
            if(this.$route.params.id == this.id){                
                this.id2 = this.id%16+1;
            }
        }
    }
</script>    
    
<style>    

    body, html {
    padding: 0;
    margin: 0;
    width: 100%;
    min-height: 100vh;
    }
    body {
        background: linear-gradient(180deg, #b7e7e9 4.87%, rgba(255, 255, 255, 0) 20%),
                    linear-gradient(0deg, #b7e7e9 -12.07%, rgba(255, 255, 255, 0) 20%),
                    #FEF9FF;
    }
.ms-n5 {
    margin-left: -40px;
}
</style>