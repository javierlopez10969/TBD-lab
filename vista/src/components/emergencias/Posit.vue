<template>
    <div class="contenedor" > 
        <img hre src="https://i.ibb.co/Xtk8K3T/yellow-post-it-clipart-post-it-clipart-282-300.png"  alt="Rectangle-12" width="250" height="250" />
        <div class="centrado text-center ">

            <div class = " rowtext-center ">
                <div v-if="emergencia.nombre.length >= 4"> 
                    <h4>{{emergencia.nombre.slice(0,20)}}</h4>
                </div>
                <div col v-else> 
                    <h4>{{emergencia.nombre}}</h4>
                </div>
                
                <div  v-if="emergencia.nombre.length >= 8">
                    <h5>{{emergencia.descrip.slice(0,20)}}...</h5>
                </div>
                <div col v-else> 
                    <h4>{{emergencia.descrip}}</h4>
                </div>
                


                <router-link 
                    :to="{name: 'emergencia', params: { id: emergencia.id}}" 
                    class="btn  colorRojo bottom rounded-pill">Ver emergencia
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
        'emergencia',
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