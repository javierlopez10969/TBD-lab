<template>  
    <div row class="container-fluid ">
        
        <button class="btn btn-lg colorRojo margin-moreleft rounded-pill"   
        @click="volver()" > <i class="bi bi-arrow-left-short"></i>Volver a tablón</button>

        <div col class="container-fluid ventana text-center">
            <!-- @submit.prevent="handleUpdateForm()" -->
            <form > 
                Emergencia
                <h1>{{emergencia.nombre}}</h1>
                <h2> 
                    Nombre : {{institucion.nombre}}
                </h2>
                <h5>
                <p>Descripcion : <br>{{emergencia.descrip}}
                </p> 
                </h5>

                <h4>
                    <p> 
                    Fecha de Inicio: {{emergencia.finicio}}
                    </p>
                    <p> 
                    Ubicacion : {{emergencia.latitud}} , {{emergencia.longitud}}
                    </p>
                   
                </h4>
                <h4>
                    <p> 
                    Fecha de Termino: {{emergencia.ffin}}
                    Hola _{{emergencia.id_institucion}}

                    </p>
                   
                </h4>
                    <div class="form-group text-center">
                </div>   
                <div >
                    <button class="btn btn-lg color4 rounded-pill" 
                    @click="checkearPostulantes();" > Postular</button>
                </div>
            </form>


        </div>
        <div col>
        <div class="form-group input-group">
            <select class="form-control rounded-pill " placeholder="Voluntarios" v-model="totalVol" required>
                <option v-for="number in N" :key="number">{{number}}</option>
            </select>
        </div> 
        <Mapa v-bind:emergencia="emergencia" v-bind:usuarios="usuarios" ></Mapa> 
        <Lista v-bind:usuarios="usuarios" ></Lista>  

        </div>
    </div> 
</template>

<script>
    import axios from "axios";
    import Mapa from '../mapas/MapaVoluntario.vue';
    import Lista from '../usuario/UsuariosCercanos.vue';
    export default {
        components:{
            Mapa,
            Lista
        },
        props:[
            'usuario'
        ],
        data() {
            return {
                emergencia: { },
                id_institucion : '',
                latitud : 0,
                longitud : 0,
                institucion : {} ,
                ubicacion : [],
                usuarios : [],
                totalVol: 1,
                N : 0,
            }
        },     
        created() {
            let apiURL = `http://localhost:3000/emergencias/${this.$route.params.id}`;
            axios.get(apiURL).then((res) => {
                this.emergencia= res.data;
                this.latitud = this.emergencia.latitud;
                this.longitud = this.emergencia.longitud;
                this.id_institucion =  res.data.id_institucion;
                console.log(this.emergencia.latitud,this.emergencia.longitud);
                let apiURL2 = 'http://localhost:3000/instituciones/' + this.id_institucion.toString();
                axios.get(apiURL2).then((res) => {
                    this.institucion = res.data;
                    console.log("Nombre : " + this.institucion.nombre);
                }); 
                this.ubicacion = [this.emergencia.latitud,this.emergencia.longitud]
            });  

        },
        mounted(){

            let apiURL4 = `http://localhost:3000/voluntarios/count`;  
            axios.get(apiURL4).then(res => {
                this.N = res.data;
                console.log("N : " + this.N);
            }).catch(error => {
            console.log(error)
             });
 
        },
        updated(){
                                    let apiURL3 = `http://localhost:3000/voluntarioscercanos`;  
            axios.post(apiURL3, {"latitud" : this.latitud,"longitud" :this.longitud, "id": this.totalVol}).then((res) => {
                this.usuarios = res.data;
                console.log(this.usuarios);
            }).catch(error => {
            console.log(error)
             });
        },
        computed(){
            
        },

        methods: {
            volver(){
                this.$router.push('/emergencias');   
            }
        }    
    }
</script>

<style>
    .divider-text {
        position: relative;
        text-align: center;
        margin-top: 15px;
        margin-bottom: 15px;
    }
    .divider-text span {
        padding: 7px;
        font-size: 12px;
        position: relative;   
        z-index: 2;
    }
    .divider-text:after {
        content: "";
        position: absolute;
        width: 100%;
        border-bottom: 1px solid #ddd;
        top: 55%;
        left: 0;
        z-index: 1;
    }
    .ocultar {
    display: none;
    }
    .mostrar {
        display: block;
    }

    .ventana{
        width: 540.93px;
        height: 400px;
        left: 482px;
        top: 26px;

        background: #FFFFFF;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        border-radius: 20px;
    }
    .padding_up{
        padding-top: 15px;
    }
    .margin-l{
        margin-left: 51px;
    }
    .margin-moreleft{
        margin-left: -150px;
    }

    

</style>


