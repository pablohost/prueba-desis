$(function(){
    //getComboBoxes();
    /*
    function enviarCorreo(){
        $.ajax({
          type: "POST",
          url: 'script/mailContacto.php',
          data: $('[name=formContacto]').serialize(),
          success: function (respuesta) {
            let z=JSON.parse(respuesta);
            if (z.cod==0) {
              Swal.fire({ title: "Listo !", text: z.msg, type: "success", confirmButtonText: "OK" });
              limpiar();
            } else if(z.cod==1){
              Swal.fire({ title: "Error", text: z.msg, type: "error", confirmButtonText: "OK" });
              
            } else if(z.cod==2){
              Swal.fire({ title: z.msg, text: "No olvide completar el campo ReCaptcha", type: "info", confirmButtonText: "OK" });
              
            }
          },
          error: function () {
            limpiar();
            Swal.fire({ title: "Error Fatal!", text: "Intenta Nuevamente", type: "error", confirmButtonText: "OK" });
          }
        });
    }
    */

    /*
    $.post("script/cargaProductos.php", function (mensaje) {
    $("#listaProductos").html(mensaje);
    });*/

    $("#vota-form").submit(function(e) {
        e.preventDefault();
        /*
        * Validacion de datos antes de enviar
        * @param int n_howto Cantidad de checkboxes “Como se enteró de Nosotros” seleccionados
        * @param string emailCheck regEx para validar email
        * @param string aliasCheck regEx para validar alias
        * @param string msg_error Mensaje a enviar en caso de encontrar errores
        */
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
        //Checkbox “Como se enteró de Nosotros”: Debe elegir al menos dos opciones.
        if (n_howto < 2) {
            msg_error += "Checkbox “Como se enteró de Nosotros”: Debe elegir al menos dos opciones.  \n";
        }
        //Muestro mensaje de error solo si existe
        if (msg_error != "") {
            alert(msg_error);
        }else{
            //sendVote();
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

function getComboBoxes(){
    $.ajax({
      type: "GET",
      url: 'script/controller/get_comboboxes.php',
      success: function (response) {
        let comboboxes=JSON.parse(response);
        console.log(response);
        console.log(comboboxes);
      },
      error: function ( e ) {
        console.log(e);
      }
    });
}