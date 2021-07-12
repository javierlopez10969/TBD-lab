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
        <div class="row">
            <div class="col-6 mt-5">
                <b-card no-body class="overflow-hidden" style="max-width: 600px; max-height:288px;">
                    <b-row no gutters>
                        <b-col md="6">
                            <b-card :img-src='"https://placekitten.com/500/500?image=" + this.id2' img-alt="Image" class="rounded-0"></b-card>
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

          

            <div class="col-6  mt-5">
                <button v-on:click="isHidden = !isHidden">Mostrar/Ocultar</button>
                
                <div v-if="!isHidden">
                     <b-card  class="overflow-hidden hidden" style="max-width: 600px; max-height:288px;">
                    <b-row no gutters>                      
                        <b-col >
                            <b-card-title class = "mb-2 pt-2">Tarea</b-card-title>
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
                
                
            </div>

             
        </div>
       
        
        <div class="col-md-12">
            <h1>Tareas en la que el usuario es permitido</h1>
            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>Emergencia</th>
                        <th>Nombre Tarea</th>
                        <th>Descripción </th>
                        <th>Habilidades requerida</th>
                        
                        <th>Acciones</th>
                        
                                <!--
                    private Integer id;
                    private String nombre;
                    private String descrip;
                    private Integer cant_vol_requeridos;
                    private Integer cant_vol_inscritos;
                    private Integer id_emergencia;
                    private Date finicio;
                    private Date ffin;
                    private Integer id_estado;
                    -->
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="tarea in Tareas" :key="tarea.id">
                        <td><Lista v-bind:id="tarea.id_emergencia" v-bind:modo="2"></Lista>
                        </td>
                        
                        
                        <td>{{ tarea.nombre}} {{tarea.id}} </td>
                        <td>{{ tarea.descrip }}</td>

                        <td>                        
                            <tbody>
                                <Lista v-bind:id="tarea.id" v-bind:modo="1"></Lista>
                            </tbody>
                        </td>


                        <td>
                            <router-link 
                                :to="{name: 'emergencia', params: { id: tarea.id_emergencia}}" 
                                class="mt-0 btn abajo colorRojo  rounded-pill" ><h6>Ver emergencia</h6>
                            </router-link>
                        </td>
                    </tr>
                   
                </tbody>
               
                
            </table>
        </div>
       <!-- <Lista v-bind:id="id"></Lista>
         -->
    </div>
</template>
    
<script>    

    import axios from 'axios';
    import Lista from './GTarea.vue';
    export default {
        components:{
            Lista
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
                urlGato : `https://placekitten.com/500/500?image=` + this.id%16+1,

                isHidden: false
            
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
                        let apiURL3 = 'http://localhost:3000/habilidades/usuario/' + this.id;
                        axios.get(apiURL3).then(res => {
                            this.Habilidades = res.data;
                        }).catch(error => {
                            console.log(error)
                        });
                }).catch(error => {
                    console.log(error)
                });
            }).catch(error => {
                console.log(error)
            });
            
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
                }).catch(error => {
                    console.log(error)
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
.ms-n5 {
    margin-left: -40px;
}
</style>