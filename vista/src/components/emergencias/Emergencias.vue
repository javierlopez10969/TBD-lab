<template>
    <div>
        <div v-if="Emergencias.length === 0">
            <h1>
                No existen tareas actualmente
            </h1>
        </div>
        <row v-for="emergencia in Emergencias" :key="emergencia._id">
            <Posit v-bind:emergencia="emergencia">
            </Posit>
        </row>

    </div>
</template>
<script>
    import axios from "axios";
    import Posit from './Posit.vue';
    export default {
        components :{
            Posit,
        },
        data(){
            return{
                Emergencias: [],
                page:1,
                perPage:10,
                pages: []
            }
        },  
        created() {
            let apiURL = 'http://localhost:3000/emergencias';
            axios.get(apiURL).then(res => {
                this.Emergencias = res.data;
            }).catch(error => {
                console.log(error)
            });
        },


    }
</script>