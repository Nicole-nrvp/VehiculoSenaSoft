/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

Swal.fire({
  title: 'Actualizar Clase de Ensayo',
  html: '<label style="color:#000">Nombre Clase de Ensayo</label>',
  input: 'text',
  inputAttributes: {
    autocapitalize: 'off'
  },
  showCancelButton: true,
  confirmButtonText: 'Actualizar',
  showLoaderOnConfirm: true,
  preConfirm: (login) => {
    return post(`<%=clasensVO.getClasEnsNombre()%>${login}`)
      .then(response => {
        if (!response.ok) {
          throw new Error(response.statusText);
        }
        return response.json();
      })
      .catch(error => {
        Swal.showValidationMessage(
          `No se Pudo actualizar: ${error}`
        )
      });
  },
  allowOutsideClick: () => !Swal.isLoading()
}).then((result) => {
  if (result.isConfirmed) {
    Swal.fire({
      title: `el nuevo nombre es: ${result.value.login}`,
    });
  }
});

