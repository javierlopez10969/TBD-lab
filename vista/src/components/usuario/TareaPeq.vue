<template>
    <div >
        <div v-if="idTarea!=0.1">
            <b-card  class="overflow-hidden hidden" style="max-width: 600px; max-height:788px;">
                
                <b-row no gutters>                      
                    <b-col >
                        <div class="row">
                            <div class="col-10">
                                <b-card-title class = "mb-0 py-0">Tarea: {{Tarea.nombre}} </b-card-title>
                            </div>
                            <div class="col-2 text-center">
                                <p class="btn mb-1 btn-default colorRojo rounded-pill" v-on:click="actualizarID(0.1);">✕</p>
                            </div>   
                        </div>                             

                        
                        <hr  class="my-1">
                        <h5>Fecha de Inicio: <span style="color:rgb(108, 117, 125);"> {{Tarea.finicio}}</span></h5>
                        
                        <b-card-sub-title class="mb-2"></b-card-sub-title>
                        <h5>Fecha de Finalizacion:<span style="color:rgb(108, 117, 125);"> {{Tarea.ffin}}</span></h5>   
                        <hr  class="my-1">

                        <h5>Voluntarios requeridos:<span style="color:rgb(108, 117, 125);">  {{Tarea.cant_vol_requeridos}}</span></h5>
                        <b-card-sub-title class="mb-2"></b-card-sub-title>
                        <h5>Voluntarios Inscritos: <span style="color:rgb(108, 117, 125);"> {{Tarea.cant_vol_inscritos}}</span></h5>   
                        <b-card-sub-title class="mb-2"></b-card-sub-title>
                        
                        <hr class="my-1">
                        <h5>Descripción: </h5>
                        <b-card-sub-title class="mb-2">{{Tarea.descrip}}</b-card-sub-title>

                    </b-col>
                </b-row>                      
            </b-card> 
        </div>
        <!--private Date finicio;
        private Date ffin;-->

        <div v-else>
            <h1></h1>
        </div>

    </div>
</template>

<script>
    import axios from "axios";
    export default {
        props :[
            'idTarea',
        ],
        data(){
            return{
                Tarea: {},
                id :0,
            }
        },  
        created() {
            this.bandera = 0.1;
            let apiURL = 'http://localhost:3000/tareas/' + this.idTarea;
            axios.get(apiURL).then(res => {
                this.Tarea = res.data;
            }).catch(error => {
                console.log(error)
            });
        },
        updated(){
            this.$emit('update:idTarea', this.idTarea);
            if (this.id!=this.idTarea) {
                this.id = this.idTarea;
                this.bandera = 1;
                let apiURL = 'http://localhost:3000/tareas/' + this.idTarea;
                axios.get(apiURL).then(res => {
                    this.Tarea = res.data;
                    console.log("hola");
                }).catch(error => {
                    console.log(error)
                })     
            };
        },
        methods:{
            actualizarID(id2){
                this.idTarea = id2;
            }

        }


    }
</script>
