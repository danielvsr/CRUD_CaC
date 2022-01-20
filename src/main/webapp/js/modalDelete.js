/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

var modalDelete = document.getElementById('modalDelete');
modalDelete.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  var button = event.relatedTarget;
  // Extract info from data-bs-* attributes
  var numId = button.getAttribute('data-bs-numeroId');
  // If necessary, you could initiate an AJAX request here
  // and then do the updating in a callback.
  //
  // Update the modal's content.
  //var modalTitle = modalDelete.querySelector('.modal-title');
  //var modalBodyInput = modalDelete.querySelector('.modal-body input');
  var objInvoiceNumCD = document.getElementById('numId');
  var objNumeroCuenta = document.getElementById('numeroCuenta');
  var objMessageTextCD = document.getElementById('messageTextCD');
  //modalTitle.textContent = 'Mensaje a ' + recipient;
  objInvoiceNumCD.value = numId;
  objNumeroCuenta.value = numId;
  objMessageTextCD.value = "¿Estás seguro? ¡No podrás recuperar la información!";
});
