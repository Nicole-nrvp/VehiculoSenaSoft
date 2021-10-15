/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
const forms = document.querySelectorAll('#delete');
console.log(forms);

forms.forEach((form) => {

    form.addEventListener('submit', e => {
        e.preventDefault();
        console.log("ENVIADO")
        Swal.fire({
            html: '<h1 style="color:#000">Esta Seguro?</h1><br><label style="color:#000">No vas a poder revertir esto!</lavel>',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, Borralo!',
            cancelButtonText: 'Cancelar',
            background: '#fff',
        }).then((result) => {
            if (result.isConfirmed) {
                
                form.submit();
            }
        })
    })
})

/*form.addEventListener('submit', e => {
 e.preventDefault();
 console.log("ENVIADO")
 Swal.fire({
 title: 'Are you sure?',
 text: "You won't be able to revert this!",
 icon: 'warning',
 showCancelButton: true,
 confirmButtonColor: '#3085d6',
 cancelButtonColor: '#d33',
 confirmButtonText: 'Yes, delete it!'
 }).then((result) => {
 if (result.isConfirmed) {
 Swal.fire(
 'Deleted!',
 'Your file has been deleted.',
 'success'
 )
 }
 })
 })*/
 