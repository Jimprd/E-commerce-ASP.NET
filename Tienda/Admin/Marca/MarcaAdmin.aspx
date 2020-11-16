<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MarcaAdmin.aspx.cs" Inherits="Tienda.Admin.MarcaAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server" lang="es-ar">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="Plataforma e-commerce, tienda online" />
  <meta name="author" content="Joel Imparado" />

  <title>Panel De Productos</title>

  <!-- Custom fonts for this template-->
  <script src="https://kit.fontawesome.com/cf74c2230c.js" crossorigin="anonymous"></script>
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet" />

  <!-- Custom styles for this template-->
  <link href="../assets/css/sb-admin-2.min.css" rel="stylesheet" />

  <!-- Custom styles for this page -->
  <link href="../assets/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />

</head>

<body class="bg-gradient-primary">
  <form id="form1" runat="server">

    <div class="container-fluid">

      <div class="card shadow mb-4 mt-5">
        <div class="card-header py-3 text-center">
          <h6 class="m-0 font-weight-bold text-primary">Panel De Marcas</h6>
        </div>

        <div class="card-body">

          <div class="btn-group btn-block mb-5" role="group">
            <asp:Button ID="BtnVolver" runat="server" Text="Volver" CssClass="btn btn-dark btn-user"
              OnClick="BtnVolver_Click" />

            <asp:Button ID="BtnCrearMarca" runat="server" Text="Ingresar Una Nueva Marca"
              CssClass="btn btn-block btn-success" OnClick="BtnCrearMarca_Click" />

            <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" CssClass="btn btn-block btn-user btn-success "
              OnClick="BtnGuardar_Click" />

            <asp:TextBox ID="TBMarca" runat="server" CssClass="form-control"></asp:TextBox>

            <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger btn-user"
              OnClick="BtnCancelar_Click" />

          </div>


          <div class="table-responsive">

            <asp:GridView ID="GVTabla" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_Marca"
              DataSourceID="TiendaMarcas" CssClass="table table-bordered table-hover" Width="100%"
              OnRowDataBound="GVTabla_RowDataBound">
              <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                <asp:CommandField ShowEditButton="True" />
              </Columns>
            </asp:GridView>

          </div>
        </div>
      </div>
    </div>
    <asp:SqlDataSource ID="TiendaMarcas" runat="server"
      ConnectionString="<%$ ConnectionStrings:TiendaOnlineConnectionString %>" DeleteCommand="spMarcaEliminar"
      InsertCommand="spMarcaCrear" SelectCommand="spMarcaObtener_Todo" UpdateCommand="spMarcaActualizar"
      DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure"
      UpdateCommandType="StoredProcedure">
      <DeleteParameters>
        <asp:Parameter Name="Id_Marca" Type="Int32" />
      </DeleteParameters>
      <InsertParameters>
        <asp:Parameter Name="Marca" Type="String" />
      </InsertParameters>
      <UpdateParameters>
        <asp:Parameter Name="Id_Marca" Type="Int32" />
        <asp:Parameter Name="Marca" Type="String" />
      </UpdateParameters>
    </asp:SqlDataSource>
  </form>

  <!-- Bootstrap core JavaScript-->
  <script src="../assets/vendor/jquery/jquery.min.js"></script>
  <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../assets/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../assets/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="../assets/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="../assets/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts (Mis JS personalizados para tablas JQuery)-->
  <script src="../assets/js/demo/datatables-demo.js"></script>

</body>

</html>