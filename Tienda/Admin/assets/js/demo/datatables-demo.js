// Call the dataTables jQuery plugin
//$(document).ready(function() {
//  $('#dataTable').DataTable();
//});

// jQuery utiliza el simbolo $ para referirse a los selectores, como los que usamos en css: p, h1, h2, #id, .class
// 

$(function () {
    $("#GVTabla").prepend($("<thead></thead>").append($(this).find("tr:first")))
        .dataTable({
            "pageLength": 10,
            "lengthMenu": [5, 10, 25, 50],
            "language": {
                "info": "Mostrando del _START_ al _END_ de _TOTAL_ elementos",
                "lengthMenu": "Mostrar _MENU_ elementos",
                "search": "Buscar:",
                "paginate": {
                    "first": "Primero",
                    "last": "�ltimo",
                    "next": "Siguiente",
                    "previous": "Anterior"
                }
            }
        });
});