// Call the dataTables jQuery plugin
//$(document).ready(function() {
//  $('#dataTable').DataTable();
//});

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
                    "last": "Último",
                    "next": "Siguiente",
                    "previous": "Anterior"
                }
            }
        });
});