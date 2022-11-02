
// En este evento click llamaremos a la función recuperar ingreso
// y cambiaremos el text ó de panel a panel ingreso


/*
Evento click que se dispara cuando se presiona el link de tipo button para abrir el panel ingreso.
 */
$(document).on('click','#ing',function(){
    recuperar_ingreso()
    document.getElementById("panel").innerText="Panel ingreso";
    document.getElementById("titulo_panel").innerText="Panel ingresos";
    
});
//esta funcion se  implemta el ajax para mostar los datos q se visualizaran

/**
 * Esta funcion envia datos a traves del metodo GET por medio ajax al archivo ingresos.php
 * método $.ajax
 * URL - para la petición.
 * type - especifica que será una petición GET.
 * data - la información a enviar.
 *  la var cabecera que contiene el formulario para obtener los datos del fecha Inicio,fecha fin y la tabla de reportes.
 */
function recuperar_ingreso(){
    $.ajax({
        url:'../php/ingresos.php',
        type:'GET',
        success:function(data){
            var lista_actividad=JSON.parse(data);
            var cabecera=`
            <div class="main">
            <div class="cards">
            <div class="tabla-responsive" id="no-more-tables">
            <div class="row g-3">
            <div class="col-md-2">
            <label for="inputAddress" class="form-label">Fecha Inicio</label>
            <input type="date" class="form-control" id="fechmin" placeholder="1234 Main St" max="2028-12-31">
            </div>
            <div class="col-md-2">
                <label for="inputAddress" class="form-label">Fecha Fin</label>
                <input type="date" class="form-control" id="fechmax" placeholder="1234 Main St" max="2028-12-31">
            </div>
            <div class="col-md-2">
                <label for="inputAddress" class="form-label"><br></label>
                <a class='generar-pdf form-control btn btn-danger'>Generar PDF</a>
            </div>
            <div class="col-md-2">
                <label for="inputAddress" class="form-label"><br></label>
                <a class='generar-excel form-control btn btn-success'>Generar EXCEL</a>
            </div>
            </div>
            
            <table class="table table-striped">
            <thead>
                    <tr>
                    <th scope="col">N° Boleta</th>
                    <th scope="col">Proyecto</th>
                    <th scope="col">Fecha</th>
                    <th scope="col">Fecha de caja</th>
                    <th scope="col">Ingreso</th>
                    <th scope="col">Reporte</th>
                    </tr>
                </thead>
                <tbody id="completa_prueba">`;
            var fin=`
                </tbody>
            </table>
            </div>
            </div>
            <div id="n">
            </div>
            <div id="paginacion">
            </div>`;
            var registros='';
            // en esta forech mostraremos los Datos De ingresos 
            // los cuales son el id de la caja el nombre del proyecto la fecha la fecha de la caja y el monto del ingreso
            lista_actividad.forEach(fila=>{
                registros +=`
                <tr ID="${fila.id_ingreso}">
                    <td data-title="N° Boleta">${fila.id_caja}</td>
                    <td data-title="Proyecto">${fila.n_proyecto}</td>
                    <td data-title="fecha">${fila.fecha}</td>
                    <td data-title="Fecha Caja">${fila.fecha_caja}</td>
                    <td data-title="Ingreso">S/. ${fila.monto_ingreso}</td>
                    <td data-title="Reporte">
                    <a class="btn" target="_blank" href='../php/reporte_pe.php?id=${fila.n_proyecto}'><img src="../imagenes/ms-pdf.png"></a>
                    <a class="btn"  target="_blank" href='../php/reporte_ex.php?id=${fila.n_proyecto}'><img src="../imagenes/ms-excel.png"></a>
                    </td>
                </tr>
                `;              
            });
            $('#cabecera').html(cabecera+registros+fin);
            fecha_actual("fechmin");
            fecha_post("fechmax");
            cantitad_registros();
           
        } 
    });
}

/**
 * funcion cantitad_registros para la paginacion.
 * método $.ajax 
 * URL - ruta del archivo prueba_cantida.php para la petición.
 * type - especifica que será una petición POST
 * success - Establece una función a ejecutar si la petición a sido satisfactoria.
 * lista_actividad - variable que almacenar al objeto 
 * fila - variable de tipo array - almacena los elementos del objeto.
 * registro - variable de estructura html donde a la etiqueta input en su valor le colocamos los datos que tiene los respectivos elementos.
 * n - id de la etiqueta div - donde se va colocar los valores de la var registro.
 * cant - variable que va almacenar los datos de registro.
 * paginacion - funcion que va enviar como parametro a la car cant y el 1(pagina).
 */
function cantitad_registros(){
    $.ajax({
        url:'../php/prueba_cantida.php',
        type:'GET',
        success:function(data){
            var lista_actividad=JSON.parse(data);
            var registro='';
            lista_actividad.forEach(fila=>{
                registro=`<input type="hidden" value="${fila.cantidad}" id="registro">`;
            });
            $('#n').html(registro);
            var cant=document.getElementById("registro").value;
            paginacion(cant,1);
        }
    });
}

/**
 * funcion para la paginacion.
 */
function paginacion(cant,pag){
    var n=parseInt(cant/10);
    var decimal=parseFloat(cant/10);
    var n_button='';
    var seleccion='';
    var btn_ini=`
    <center>
    <table>
    <tr><td>
    <nav aria-label="...">
        <ul class="pagination">`;
    var btn_fin=`</ul>
    </nav>
    </td>
    </tr>
    </center>
    `;
    if(decimal>1)
    { 
        if(n<decimal){
            n=n+1;
        }
        for (var i = 1; i <= n; i++) {
            if(pag==i){
                n_button += `<li class="page-item active">
                                <a role="button" class="page-link" id="${i}">${i}<span class="sr-only">(current)</span></a>
                            </li>`;
                seleccion=i;
            }else{
                n_button += `<li class="page-item"><a role="button" class="page-link" id="${i}">${i}</a></li>`;
            }
        }
        if(n==2){

        }else{
            if(seleccion !=1){

            btn_ini=`
            <center>
            <table>
                <tr><td>
            <nav aria-label="...">
                <ul class="pagination">
                    <li class="page-item">
                        <a role="button" class="page-link"  id="${seleccion-1}">Previous</a>
                    </li>`;
                }
            if(seleccion !==n){
            btn_fin=`<li class="page-item">
                        <a role="button" class="page-link" id="${seleccion+1}">Next</a>
                    </li>
                </ul>
            </nav>
            </td>
        </tr>
        </center>
            `;
            }
        }
    }
    $('#paginacion').html(btn_ini+n_button+btn_fin);
}


//En este evento click nos mostrará los Datos en una lista de 10

/*
* Evento click que se dispara cuando se presiona el link de tipo button para la paginacion.
 */

$(document).on('click','.page-link',function(){
    var pag =this.id;
    var cant=document.getElementById("registro").value;
    paginacion(cant,pag);
    var limite=(pag*10)-10;
    $.ajax({
        
        url:'../php/prueba_select.php' ,
        data:{limite},//envia la variable
        type: 'POST',
        success: function(data){
                var lista_actividad=JSON.parse(data);
                var registros='';
                lista_actividad.forEach(fila=>{
                    registros +=`
                    <tr ID="${fila.id_ingreso}">
                        <td data-title="N° Boleta">${fila.id_caja}</td>
                        <td data-title="Proyecto">${fila.n_proyecto}</td>
                        <td data-title="fecha">${fila.fecha}</td>
                        <td data-title="Fecha Caja">${fila.fecha_caja}</td>
                        <td data-title="Ingreso">S/. ${fila.monto_ingreso}</td>
                        <td data-title="Reporte">
                        <a class="btn" target="_blank" href='../php/reporte_pe.php?id=${fila.n_proyecto}'><img src="../imagenes/ms-pdf.png"></a>
                        <a class="btn"  target="_blank" href='../php/reporte_ex.php?id=${fila.n_proyecto}'><img src="../imagenes/ms-excel.png"></a>
                        </td>
                    </tr>
                    `;  
                           
                });
            $('#completa_prueba').html(registros);
        }
    });
});

/*
 *Evento click que se dispara cuando se presiona el buton para generar pdf.
 */
$(document).on('click','.generar-pdf',function(){
    var fecha_min=document.getElementById("fechmin").value;
    var fecha_max=document.getElementById("fechmax").value;
    window.open("../php/ingresospdf.php?fmin="+fecha_min+"&&fmax="+fecha_max,'_blank');
});

/*
 *Evento click que se dispara cuando se presiona el buton para generar excel.
 */
$(document).on('click','.generar-excel',function(){
    var fecha_min=document.getElementById("fechmin").value;
    var fecha_max=document.getElementById("fechmax").value;
    window.open("../php/ingresosexcel.php?fmin="+fecha_min+"&&fmax="+fecha_max,'_blank');
});