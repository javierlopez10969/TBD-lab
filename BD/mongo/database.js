
use tbd;

db.emergencia.drop();

db.emergencia.insert(
[{nombre :"Terremoto" ,
descrip : "Se necesitan voluntarios para rescatar perros atrapados.",
finicio : "2021-01-20" ,
ffin : "2021-03-01",
latitud : -71.605196,
longitud : -33.52186,
tareas : [
    {nombre: "Rescatar Perros",
    descrip: "Buscar perritos atrapados en la calle zoom 1234", 
    cant_vol_requeridos: 37, 
    cant_vol_inscritos: 49,
    finicio: "2021-03-12", 
    ffin: "2021-04-05",
    activo : false},
]
},
{nombre :"Incendio" ,
descrip : "Se necesita apagar el fuego en la localidad de Huevito Kingdom",
finicio : "2020-12-05" ,
ffin : "2021-03-01",
latitud : -70.102301,
longitud : -20.270732,
tareas : [ 
    {nombre: "Apagar fuego",
    descrip: "Buscar posibles puntos donde las llamas no se encuentren apagadas", 
    cant_vol_requeridos: 65, 
    cant_vol_inscritos: 67,
    finicio: "2020-12-05", 
    ffin: "2021-04-26",
    activo : true},
] 
},

{nombre :"Incendio en el Cerro" ,
descrip : "Se necesitan voluntarios para apagar el fuego en el cerro Santa Lucía",
finicio : "2021-01-20" ,
ffin : "2021-03-01",
latitud : -73.828039,
longitud : -41.867611,
tareas : [
    {nombre: "Apagar fuego",
    descrip: "Buscar posibles puntos donde las llamas no se encuentren apagadas", 
    cant_vol_requeridos: 65, 
    cant_vol_inscritos: 67,
    finicio: "2020-12-05", 
    ffin: "2021-04-26",
    activo : false},
]
},

{nombre :"Mision atrapar presos" ,
descrip : "Se escapan lo preso aiuudaaa",
finicio : "2021-03-30" ,
ffin : "2020-10-07",
latitud : -70.67199596382044,
longitud : -33.19976552083029,
tareas : [
    {nombre: "Buscar profugos",
    descrip: "Contacte a carabineros cuando vea a presos, especial atencion con huevito rey", 
    cant_vol_requeridos: 26, 
    cant_vol_inscritos: 15,
    finicio: "2020-06-29", 
    ffin: "2020-07-29",
    activo: true},
]
},]);

db.tarea.insert(
    [{nombre: "Rescatar Perros",
    descrip: "Buscar perritos atrapados en la calle zoom 1234", 
    cant_vol_requeridos: 37, 
    cant_vol_inscritos: 49,
    finicio: "2021-03-12", 
    ffin: "2021-04-05",
    activo : false,
    emergencia: "Terremoto"},

    {nombre: "Apagar fuego",
    descrip: "Buscar posibles puntos donde las llamas no se encuentren apagadas", 
    cant_vol_requeridos: 65, 
    cant_vol_inscritos: 67,
    finicio: "2020-12-05", 
    ffin: "2021-04-26",
    activo : true,
    emergencia: "Incendio en el Cerro"},

    {nombre: "Apagar fuego",
    descrip: "Buscar posibles puntos donde las llamas no se encuentren apagadas", 
    cant_vol_requeridos: 65, 
    cant_vol_inscritos: 67,
    finicio: "2020-12-05", 
    ffin: "2021-04-26",
    activo : false,
    emergencia: "Incendio"},

    {nombre: "Buscar profugos",
    descrip: "Contacte a carabineros cuando vea a presos, especial atencion con huevito rey", 
    cant_vol_requeridos: 26, 
    cant_vol_inscritos: 15,
    finicio: "2020-06-29", 
    ffin: "2020-07-29",
    activo: true,
    emergencia :"Mision atrapar presos"}
] 

);