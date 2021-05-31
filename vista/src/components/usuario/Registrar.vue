<template>
    <div>


    <div class="container-fluid text-center">
        <div class="col">
        </div>

            <div id="msg"></div>
 
            <!-- Mensajes de Verificación -->
            <div id="error" class="alert alert-danger ocultar" role="alert">
                Las Contraseñas no coinciden, vuelve a intentar !
            </div>
            <div id="ok" class="alert alert-success ocultar" role="alert">
                Las Contraseñas coinciden ! (Procesando formulario ... )
            </div>

            <div class="col ">
                <div class="container-fluid ventana">
                    <a href="/"><img class="padding_up" src="https://i.ibb.co/nbxmWJQ/preparadoslogo.png" alt="logo" ></a>
                  <form class="form-signin" @submit.prevent="handleSubmitForm">
                    
                    <article class="card-body mx-auto" style="max-width: 400px;">
                        <h4 class="card-title text-center">Crear cuenta</h4>
                        <div class="form-group input-group">
                            <input name="" class="form-control rounded-pill" placeholder="Nombre Completo" type="text" v-model="user.name" required>
                        </div> 

                    <!-- fecha-->
                        <div class="form-group input-group">
                            <label class="mt-2" for="datepicker-dateformat2" > </label>
                            <b-form-datepicker
                            style="text-align:left;"
                            placeholder="Fecha de Nacimiento"
                            id="datepicker-dateformat2"
                            dropright
                            :date-format-options="{ year: 'numeric', month: 'numeric', day: 'numeric' }"
                            locale="es"
                            v-model="user.fnacimiento"
                            ></b-form-datepicker>
                        </div>
                        <div class="form-group text-center">
                            <button class="btn btn-lg color3 rounded-pill" type="submit">Crear cuenta</button>
                        </div>     
                        <p class="text-center">¿Ya tienes cuenta?  <a href="/login">Inicia sesión aquí</a> </p>                                                                 
                        
                        
                       
                    </article>
                  </form>
                </div>
      
            </div>

        <div class="col">
        </div>

    </div> 
    </div>
</template>


<script>

    import axios from "axios";

    export default {
        data() {
            return {
                user: {       
                    name: '',
                    fnacimiento: '', 
                },

            }
        },
        methods: {
            handleSubmitForm() {
                let apiURL = 'http://localhost:3000/voluntarios/a';
                //this.limpiarMensaje();
                //this.user.name = this.user.name + ' ' + this.apellido; 
                alert('Usuario creado con exito, nombre de usuario : ' + this.user.name)
                axios.post(apiURL, {
                    nombre : this.user.name,
                    fnacimiento : this.user.fnacimiento
                    }).then(() => {
                  this.user = {
                    name: '',
                    fnacimiento: '',  
                  } 
                this.$router.push('/login')
                }).catch(error => {
                    alert(error)
                    console.log(error)
                });
            },
            limpiarMensaje(){
                document.getElementById("passbox").setCustomValidity('')  
            },
            onContext(ctx) {
            // The date formatted in the locale, or the `label-no-date-selected` string
            this.user.fnacimiento = ctx.selectedFormatted
            // The following will be an empty string until a valid date is entered
            this.selected = ctx.selectedYMD
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
    background: linear-gradient(180deg, #A8DADC -7.87%, rgba(255, 255, 255, 0) 20%),
                linear-gradient(0deg, #A8DADC -12.07%, rgba(255, 255, 255, 0) 20%),
                #FEF9FF;
    }

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
        position: relative;
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
        height: 900px;
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


    

</style>


