<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="Tienda.Admin.Producto" %>

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
          <h6 class="m-0 font-weight-bold text-primary">Panel De Productos</h6>
        </div>

        <div class="card-body">

          <!--  Para pruebas -->
          <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

          <div class="btn-group btn-block mb-4 mt-1" role="group">
            <asp:Button ID="BtnVolver" runat="server" Text="Volver" CssClass="btn btn-dark btn-user"
              OnClick="BtnVolver_Click" />

            <asp:Button ID="BtnCrearProducto" runat="server" Text="Ingresar Un Nuevo Producto"
              OnClick="BtnCrearProducto_Click" CssClass="btn btn-block btn-success" />
          </div>

          <div class="table-responsive">

            <asp:GridView ID="GVTabla" runat="server" CssClass="table table-bordered table-hover"
              DataKeyNames="Id_Producto" DataSourceID="TiendaProductos" Width="100%"
              OnRowDataBound="TblProductos_RowDataBound">
              <Columns>
                <asp:CommandField
                  DeleteText="&lt;i class=&quot;fa fa-trash&quot; aria-hidden=&quot;true&quot;&gt;&lt;/i&gt;"
                  ShowDeleteButton="True">
                  <ControlStyle CssClass="text-danger" />
                </asp:CommandField>
                <asp:BoundField DataField="Nombre" HeaderText="Producto" SortExpression="Nombre" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:BoundField DataField="Precio_Venta" HeaderText="Precio Venta" SortExpression="Precio_Venta" />
                <asp:BoundField DataField="Stock_Actual" HeaderText="Stock" SortExpression="Stock_Actual" />
                <asp:HyperLinkField DataNavigateUrlFields="Id_Producto"
                  DataNavigateUrlFormatString="~/Admin/Producto/ProductoRead.aspx?Id_Producto={0}"
                  Text="&lt;i class=&quot;fa fa-eye&quot; aria-hidden=&quot;true&quot;&gt;&lt;/i&gt;" />
                <asp:HyperLinkField DataNavigateUrlFields="Id_Producto"
                  DataNavigateUrlFormatString="~/Admin/Producto/ProductoRead.aspx?Id_Producto={0}&amp;edit=edit"
                  Text="&lt;i class=&quot;fa fa-pencil-square-o&quot; aria-hidden=&quot;true&quot;&gt;&lt;/i&gt;" />
              </Columns>
              <PagerSettings Mode="NumericFirstLast" />
            </asp:GridView>

          </div>
        </div>
      </div>
    </div>

    <!-- ----------------------------------------------------- -->
    <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">

            <h5 class="modal-title" id="exampleModalLabel">Atención!</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Desea eliminar este producto?</div>
          <div class="modal-footer">
            <asp:LinkButton ID="LinkEliminar" runat="server" CssClass="btn btn-danger">Eliminar</asp:LinkButton>
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
          </div>
        </div>
      </div>
    </div>

    <%-- 
<a class="dropdown-item" href="#" data-toggle="modal" datatarget="#logoutModal">Logout</a>  
<i class="fa fa-trash" aria-hidden="true"></i>
<i class="fa fa-pencil" aria-hidden="true"></i>
<i class="fa fa-eye" aria-hidden="true"></i>
--%>

    <asp:SqlDataSource ID="TiendaProductos" runat="server"
      ConnectionString="<%$ ConnectionStrings:TiendaOnlineConnectionString %>"
      DeleteCommand="DELETE FROM [PRODUCTO] WHERE [Id_Producto] = @Id_Producto"
      InsertCommand="INSERT INTO [PRODUCTO] ([Nombre], [Descripcion], [Precio_Venta], [Stock_Actual], [Id_Marca], [Id_Categoria]) VALUES (@Nombre, @Descripcion, @Precio_Venta, @Stock_Actual, @Id_Marca, @Id_Categoria)"
      SelectCommand="SELECT Id_Producto, Nombre, SUBSTRING(Descripcion, 1, 100) AS Descripcion, Precio_Venta, Stock_Actual FROM PRODUCTO ORDER BY Nombre"
      UpdateCommand="UPDATE [PRODUCTO] SET [Nombre] = @Nombre, [Descripcion] = @Descripcion, [Precio_Venta] = @Precio_Venta, [Stock_Actual] = @Stock_Actual, [Id_Marca] = @Id_Marca, [Id_Categoria] = @Id_Categoria WHERE [Id_Producto] = @Id_Producto">
      <DeleteParameters>
        <asp:Parameter Name="Id_Producto" Type="Int32" />
      </DeleteParameters>
      <InsertParameters>
        <asp:Parameter Name="Nombre" Type="String" />
        <asp:Parameter Name="Descripcion" Type="String" />
        <asp:Parameter Name="Precio_Venta" Type="Decimal" />
        <asp:Parameter Name="Stock_Actual" Type="Int32" />
        <asp:Parameter Name="Id_Marca" Type="Int32" />
        <asp:Parameter Name="Id_Categoria" Type="Int32" />
      </InsertParameters>
      <UpdateParameters>
        <asp:Parameter Name="Nombre" Type="String" />
        <asp:Parameter Name="Descripcion" Type="String" />
        <asp:Parameter Name="Precio_Venta" Type="Decimal" />
        <asp:Parameter Name="Stock_Actual" Type="Int32" />
        <asp:Parameter Name="Id_Marca" Type="Int32" />
        <asp:Parameter Name="Id_Categoria" Type="Int32" />
        <asp:Parameter Name="Id_Producto" Type="Int32" />
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