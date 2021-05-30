<template>
    <div>
        <div v-if="Tareas.length === 0">
            <h1>
                No existen tareas actualmente
            </h1>
        </div>
        <row v-for="tarea in Tareas" :key="tarea._id">
            <Posit v-bind:proyecto="tarea">
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
                Tareas: [],
                page:1,
                perPage:10,
                pages: []
            }
        },  
        created() {
            let apiURL = 'http://localhost:3000/tareas';
            axios.get(apiURL).then(res => {
                this.Tareas = res.data;
            }).catch(error => {
                console.log(error)
            });
        },


    }
</script>