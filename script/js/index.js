$(function(){
    //Accion que carga los comboboxes desde la base de datos
    getComboBoxes();

    /*
    * Validacion de datos antes de enviar
    * @param int n_howto Cantidad de checkboxes “Como se enteró de Nosotros” seleccionados
    * @param string emailCheck regEx para validar email
    * @param string aliasCheck regEx para validar alias
    * @param string msg_error Mensaje a enviar en caso de encontrar errores
    */
    $("#vota-form").submit(function(e) {
        e.preventDefault();
        let n_howto = $("[name='howto']:checked").length;
        let emailCheck = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z]+$/;
        let aliasCheck = /^[a-z A-Z0-9]+$/;
        let msg_error = "";
        //Nombre y Apellido: No debe quedar en Blanco.
        if ($.trim($("#full_name").val()) == "") {
            msg_error += "Nombre y Apellido: No debe quedar en Blanco \n";
        }
        //Alias: Validar que la cantidad de caracteres sea mayor a 5 y que contenga letras y números.
        if ((!aliasCheck.test($("#alias").val())) && ($.trim($("#alias").val()).length < 5)) {
            msg_error += "Alias: Validar que la cantidad de caracteres sea mayor a 5 y que contenga letras y números. \n";
        }
        //RUT: Validar el RUT (Formato Chile).
        if (!Fn.validaRut($("#rut").val())) {
            msg_error += "RUT: Validar el RUT (Formato Chile). Sin puntos, Con guion \n";
        }
        //Email: Deberá validar el correo según estándar.
        if (!emailCheck.test($("#email").val())) {
            msg_error += "Email: Deberá validar el correo según estándar. \n";
        }
        //Combo Box Región No deberá quedar en blanco
        if ($("#region").val() == "" && $("#region").val() == "0") {
            msg_error += "Combo Box Región No deberá quedar en blanco \n";
        }
        //Combo Box Comuna No deberá quedar en blanco
        if ($("#comuna").val() == "" && $("#comuna").val() == "0") {
            msg_error += "Combo Box Comuna No deberá quedar en blanco \n";
        }
        //Combo Box Candidato No deberá quedar en blanco
        if ($("#candidato").val() == "" && $("#candidato").val() == "0") {
            msg_error += "Combo Box Candidato No deberá quedar en blanco \n";
        }
        //Checkbox “Como se enteró de Nosotros”: Debe elegir al menos dos opciones.
        if (n_howto < 2) {
            msg_error += "Checkbox “Como se enteró de Nosotros”: Debe elegir al menos dos opciones.  \n";
        }
        //Muestro mensaje de error solo si existe
        if (msg_error != "") {
            alert(msg_error);
        }else{
            sendVote();
        }
    });

    /*
    * Carga comunas de la region seleccionada
    */
    $("#region").change(function(e) {
        e.preventDefault();
        if ($(this).val() != 0) {
            $('#comuna').empty();
            for (var i = 0; i < global_comunas.length; i++) {
                if (global_comunas[i].region == $(this).find('option:selected').text()) {
                    $('#comuna').append('<option value="'+global_comunas[i].id+'">'+global_comunas[i].comuna+'</option>');
                }
            }
        }
    });

    // Valida el rut con su cadena completa "XXXXXXXX-X"
    var Fn = {
        validaRut : function (full_rut) {
            let rutCheck = /^[0-9]+[-|‐]{1}[0-9kK]{1}$/;
            if (!rutCheck.test( full_rut ))
                return false;
            var tmp     = full_rut.split('-');
            var digv    = tmp[1]; 
            var rut     = tmp[0];
            if ( digv == 'K' ) digv = 'k' ;
            
            return (Fn.dv(rut) == digv );
        },
        dv : function(T){
            var M=0,S=1;
            for(;T;T=Math.floor(T/10))
                S=(S+T%10*(9-M++%6))%11;
            return S?S-1:'k';
        }
    }
});

var global_regiones = [];
var global_comunas = [];

/*
* Carga comboboxes desde la base de datos
* @return array global_regiones Arreglo con todas las regiones
* @return array global_comunas Arreglo con todas las comunas y su region
*/
function getComboBoxes(){
    $.ajax({
      type: "GET",
      url: 'script/controller/get_comboboxes.php',
      success: function (response) {
        let comboboxes=JSON.parse(response);
        $('#candidato').empty();
        $('#region').empty();
        $('#comuna').empty();

        for (var i = 0; i < comboboxes.candidatos.length; i++) {
            $('#candidato').append('<option value="'+comboboxes.candidatos[i].id+'">'+comboboxes.candidatos[i].candidato+'</option>');
        }

        for (var i = 0; i < comboboxes.regiones.length; i++) {
            $('#region').append('<option value="'+comboboxes.regiones[i].id+'">'+comboboxes.regiones[i].region+'</option>');
        }

        for (var i = 0; i < comboboxes.comunas.length; i++) {
            if (comboboxes.comunas[i].region == 'Region de Arica y Parinacota') {
                $('#comuna').append('<option value="'+comboboxes.comunas[i].id+'">'+comboboxes.comunas[i].comuna+'</option>');
            }
        }

        global_regiones = comboboxes.regiones;
        global_comunas = comboboxes.comunas;
      },
      error: function ( e ) {
        console.log(e);
      }
    });
}

/*
* Carga voto en la base de datos
* @param JSON data JSON con toda la informacion del formulario
*/
function sendVote(){
    var data = {};
    let arr_form = $('[name=vota-form]').serializeArray().map(function(x){
        data[x.name] = x.value;
    });
    let arr_howto = [];
    let str_tmp = "";
    $("[name='howto']:checked").each(function name(key, params) {
        str_tmp += $(this).val()+",";
    });
    str_tmp = str_tmp.substr(0, str_tmp.length - 1);
    data.howto = str_tmp;
    $.ajax({
      type: "POST",
      url: 'script/controller/index.php',
      data: {"request" : JSON.stringify(data)},
      success: function (response) {
        alert(JSON.parse(response).response);
      },
      error: function ( e ) {
        console.log(e);
      }
    });
}