<template>
    <div >
        <div v-if="habilidades">
            <div v-for="habilidad in HabilidadesTarea" :key="habilidad.id">
                - {{habilidad.descrip}}
            </div>
        </div>
        <div v-if="emergencia">
            <p style="padding-bottom:0px;margin-bottom:0px;"> 
                {{Emergencia.nombre}} 
            </p>
            <p style="color:grey; padding-top:0px;margin-top:0px; font-weight: bold; font-size: 14px;"> 
                ID : {{Emergencia.id}}
            </p>
            
        </div>
    </div>
</template>

<script>
    import axios from 'axios' ;
    export default{
        data(){
            return {
                HabilidadesTarea : [],
                Emergencia : {},
                habilidades : false,
                emergencia : false,
            }
        },
        props : [
            'id',
            //Modos de obtener cierto parametro
            // 1 : habilidades de una tarea
            // 2 : emergencia
            'modo'
        ],
        created(){
            if (this.modo == 1) {
                this.habilidades = true ;
                console.log("MODO 1");
                this.HabilidadesTarea = [];
                let apiURL = 'http://localhost:3000/habilidades/tarea/' + this.id;
                axios.get(apiURL).then(res => {
                    this.HabilidadesTarea = res.data;
                }).catch(error => {
                    console.log(error)
                });
            }
            if (this.modo == 2) {
                this.emergencia = true ;
                let apiURL = 'http://localhost:3000/emergencias/' + this.id;
                axios.get(apiURL).then(res => {
                    this.Emergencia = res.data;
                }).catch(error => {
                    console.log(error)
                });
            }
        }
    }
</script>
