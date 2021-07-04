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
                    Ubicacion : {{emergencia.longitud}} , {{emergencia.latitud}}
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
        <Mapa v-bind:emergencia="emergencia" ></Mapa> 
        </div>
    </div> 
</template>

<script>
    import axios from "axios";
    import Mapa from '../mapas/MapaVoluntario.vue';
    export default {
        components:{
            Mapa,
        },
        props:[
            'usuario'
        ],
        data() {
            return {
                emergencia: { },
                id_institucion : '',
                institucion : {} ,
                ubicacion : []
            }
        },     
        created() {
            let apiURL = `http://localhost:3000/emergencias/${this.$route.params.id}`;
            axios.get(apiURL).then((res) => {
                this.emergencia= res.data;
                this.id_institucion =  res.data.id_institucion;
                let apiURL2 = 'http://localhost:3000/instituciones/' + this.id_institucion.toString();
                axios.get(apiURL2).then((res) => {
                    this.institucion = res.data;
                }); 
                this.ubicacion = [this.emergencia.latitud,this.emergencia.longitud]
            });       
        },
        methods: {
            handleUpdateForm() { 
                let apiURL = `http://localhost:3000/api/update-proyect/${this.$route.params.id}`;
                axios.post(apiURL, this.proyect).then((res) => {
                    console.log(res);
                    this.proyect = res.data;
                    if (this.usuario.proyectosPostulados == undefined || 
                    this.usuario.proyectosPostulados == null ||
                    this.usuario.proyectosPostulados == []) {
                        this.usuario.proyectosPostulados = [];
                    }
                    //Pusheamos un objeto
                    this.usuario.proyectosPostulados.push(
                        {
                            id : this.proyect._id ,
                            estado : 'En espera'
                        }
                    );
                    //alert(this.usuario.proyectosPostulados);
                    this.actualizarIDPostulante();
                }).catch(error => {
                    console.log(error)
                });
            },
            actualizarPostulantes(){
                //this.postulantes.push('Hola')
                this.proyect.postulantes.push(this.usuario._id);  
                this.handleUpdateForm();
            },
            actualizarIDPostulante() {
                let apiURL = `http://localhost:3000/api/update-user/`+ this.usuario._id;
                axios.post(apiURL, this.usuario).then((res) => {
                    console.log(res)
                }).catch(error => {
                    console.log(error)
                    alert(error);
                });
            },
            checkearPostulantes(){
                let arreglo = this.proyect.postulantes;
                let i;
                for (i = 0; i < arreglo.length; i++) {
                    if (arreglo[i] === this.usuario._id) {
                        alert('Usted ya postulado a este proyecto')
                        this.$router.push('/tablon');
                        return false;
                    }
                }
                this.actualizarPostulantes();
                return true;
            },
            volver(){
                this.$router.push('/emergencias');   
            },
            getInstitucion(){

            }
        }    
    }
</script>

<style>
    /*body, html {
    padding: 0;
    margin: 0;
    width: 100%;
    min-height: 100vh;
    }
    body {
        background: linear-gradient(180deg, #736CED -7.87%, rgba(255, 255, 255, 0) 20%),
                    linear-gradient(0deg, #736CED -12.07%, rgba(255, 255, 255, 0) 20%),
                    #FEF9FF;;
    }*/

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


