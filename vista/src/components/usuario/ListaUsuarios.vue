<template>
    <div class="row">
        <div class="col-md-12">
            <h1>Voluntarios inscritos</h1>
            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>Nombre</th>
                        <th>Fecha de Nacimiento</th>
                        <th>Correo</th>
                        <th>Ubicación</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="user in Users" :key="user._id">
                        <td>{{ user.nombre }}</td>
                        <td>{{ user.fnacimiento }}</td>
                        <td>{{ user.email }}</td>
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
        created() {
            let apiURL = 'http://localhost:3000/voluntarios';
            axios.get(apiURL).then(res => {
                this.Users = res.data;
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

  body, html {
  padding: 0;
  margin: 0;
  width: 100%;
  min-height: 100vh;
  }
  body {
    background: linear-gradient(180deg, #A8DADC 4.87%, rgba(255, 255, 255, 0) 20%),
                linear-gradient(0deg, #A8DADC -12.07%, rgba(255, 255, 255, 0) 20%),
                #FEF9FF;
  }
  
    .btn-success {
        margin-right: 10px;
    }
</style>