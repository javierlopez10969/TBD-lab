<template>
    <div class="row">
        <div class="col-md-12">


            <h1>Tareas en la que el usuario es permitido</h1>
            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>Nombre Tarea</th>
                        <th>Descripción </th>
                        <th>Habilidades requerida</th>
                        <th>id de emergencia</th>
                        <th>Acciones</th>
                        
                                <!--
                    private Integer id;
                    private String nombre;
                    private String descrip;
                    private Integer cant_vol_requeridos;
                    private Integer cant_vol_inscritos;
                    private Integer id_emergencia;
                    private Date finicio;
                    private Date ffin;
                    private Integer id_estado;
                    -->
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="tarea in Tareas" :key="tarea._id">
                        <td>{{ tarea.nombre}}</td>
                        <td>{{ tarea.descrip }}</td>

                        <td>Habilidad</td>
                        <td>{{ tarea.id_emergencia}}</td>

                        <td>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
export default {
    data() {
        return {
            Tareas :[],
        }
    },
    props: [
        'id'
    ],
    created() {
        let apiURL = 'http://localhost:3000/tareas/buscar/' + this.id;
        axios.get(apiURL).then(res => {
            this.Tareas = res.data;
        }).catch(error => {
            console.log(error)
        });
    },
    methods: {
        deleteUser(id){
            let apiURL = `http://localhost:3000//voluntarios/d/${id}`;
            let indexOfArrayItem = this.Users.findIndex(i => i._id === id);
            if (window.confirm("Seguro que quiere borrar al voluntario?")) {
                axios.delete(apiURL).then(() => {
                    this.Users.splice(indexOfArrayItem, 1);
                }).catch(error => {
                    console.log(error)
                });
            }
        }
    }
}


</script>

<style>

</style>