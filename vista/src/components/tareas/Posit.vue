<template>
    <div class="contenedor" > 
        <img hre src="https://i.ibb.co/6P44Zc9/Rectangle-12.png" alt="Rectangle-12" width="250" height="250" />
        <div class="centrado text-center ">

            <div class = " rowtext-center ">
                <div v-if="tarea.nombre.length >= 4"> 
                    <h4>{{tarea.nombre.slice(0,20)}}</h4>
                </div>
                <div col v-else> 
                    <h4>{{tarea.nombre}}</h4>
                </div>
                
                <div  v-if="tarea.nombre.length >= 8">
                    <h5>{{tarea.descrip.slice(0,20)}}...</h5>
                </div>
                <div col v-else> 
                    <h4>{{tarea.descrip}}</h4>
                </div>
                
                <div  v-if="tarea.cant_vol_requeridos.length >= 4">
                    <h5>{{tarea.cant_vol_requeridos.slice(0,20)}}</h5>
                </div>
                <div col v-else> 
                    <h4>{{tarea.cant_vol_requeridos}}</h4>
                </div>

                <div  v-if="tarea.cant_vol_inscritos.length >= 4">
                    <h5>{{tarea.cant_vol_inscritos.slice(0,20)}}</h5>
                </div>
                <div col v-else> 
                    <h4>{{tarea.cant_vol_inscritos}}</h4>
                </div>

                <router-link 
                    :to="{name: 'tarea', params: { id: tarea.id}}" 
                    class="btn btn-succes color6 bottom rounded-pill">Ver Tarea
                </router-link>
            </div>

        </div>

        <div class="texto-encima">


        </div>
    </div>
    
</template>



<script>
export default {
    props: [
        'tarea',
        'estado'
        ],
}
</script>

<style >
    .contenedor{
        position: relative;
        display: inline-block;
        text-align: center;
    }
    .texto-encima{
        position: absolute;
        top: 10px;
        left: 10px;
    }
    .centrado{
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
</style>