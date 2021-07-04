<template>
    <div class="row">
        <div class="col-md-12">
            <h1>Voluntarios inscritos</h1>
            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>Nombre</th>
                        <th>Ubicación</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="user in usuarios" :key="user.nombre">
                        <td>{{ user.nombre }}</td>
                        <td>{{ user.longitud }} , {{ user.latitud }}</td>
                        <td>
                            <router-link :to="{name: 'edit', params: { id: user._id }}" class="btn btn-success">Editar
                            </router-link>
                            <button @click.prevent="deleteUser(user._id)" class="btn btn-danger ">borrar</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
    import axios from "axios";

    export default {
        data() {
            return {
                Users: []
            }
        },
        props: [
            'usuarios'
        ],
        created() {
        },
        methods: {
        }
    }
</script>

<style>
    .btn-success {
        margin-right: 10px;
    }
</style>