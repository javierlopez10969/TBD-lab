<template>
    <div class="contenedor" > 
        <img hre src="https://i.ibb.co/Xtk8K3T/yellow-post-it-clipart-post-it-clipart-282-300.png"  alt="Rectangle-12" width="300" height="300" />
        <div class="centrado text-center tamaño_tposit">

            <div class = " row text-center mt-5">
                <div v-if="emergencia.nombre.length >= 15"  > 
                    <h4>{{emergencia.nombre.slice(0,20)}}</h4>
                </div>
                <div col v-else> 
                    <h4>{{emergencia.nombre}}</h4>
                </div>
                
                <div  v-if="emergencia.descrip.length >= 15" >
                    <h5>{{emergencia.descrip.slice(0,20)}}...</h5>
                </div>
                <div col v-else> 
                    <h5>{{emergencia.descrip}}</h5>
                </div>
                


                <router-link 
                    :to="{name: 'emergencia', params: { id: emergencia.id}}" 
                    class="mt-5 btn abajo colorRojo  rounded-pill"><h5 class="my-1">Ver emergencia</h5>
                </router-link>
            </div>

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
        top: 40%;
        left: 50%;
        transform: translate(-48%, -50%);
    }
    .tamaño_tposit{
        width: 220px;
        height: 350px;

    }

    

</style>