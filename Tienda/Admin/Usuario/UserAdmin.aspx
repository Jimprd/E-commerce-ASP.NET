<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserAdmin.aspx.cs" Inherits="Tienda.Admin.Usuario.Usuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server" lang="es-ar">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="Plataforma e-commerce, tienda online" />
  <meta name="author" content="Joel Imparado" />

  <title>Panel De Productos</title>

  <!-- Custom fonts for this template-->
  <link href="../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
  <script src="https://kit.fontawesome.com/cf74c2230c.js" crossorigin="anonymous"></script>

  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet" />

  <!-- Custom styles for this template-->
  <link href="../assets/css/sb-admin-2.min.css" rel="stylesheet" />

</head>

<body class="bg-gradient-primary">
  <form id="form1" runat="server">

    <div class="container-fluid">

      <div class="card shadow mb-4 mt-5">
        <div class="card-header py-3 text-center">
          <h6 class="m-0 font-weight-bold text-primary">Panel De Usuarios</h6>
        </div>
        <%--<div class="card-body p-0">--%>
        <div class="card-body">
          <div class="table-responsive">
            <div class="btn-group btn-block mb-5" role="group">
              <asp:Button ID="BtnVolver" runat="server" Text="Volver" CssClass="btn btn-dark btn-user"
                OnClick="BtnVolver_Click" />

              <asp:Button ID="BtnCrearUsuario" runat="server" Text="Ingresar Un Nuevo Usuario"
                CssClass="btn btn-block btn-success" OnClick="BtnCrearUsuario_Click" />
            </div>

            <asp:GridView ID="TblUsuarios" runat="server" AllowPaging="True" AllowSorting="True"
              AutoGenerateColumns="False" CssClass="table table-bordered table-hover" DataKeyNames="Id_Usuario"
              DataSourceID="AdminUsuarios" Width="100%" PageSize="15" OnRowDataBound="TblUsuarios_RowDataBound">
              <Columns>
                <asp:CommandField ShowDeleteButton="True"
                  DeleteText="&lt;i class=&quot;fa fa-trash&quot; aria-hidden=&quot;true&quot;&gt;&lt;/i&gt;">
                  <ControlStyle CssClass="text-danger" />
                </asp:CommandField>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:HyperLinkField DataNavigateUrlFields="Id_Usuario"
                  DataNavigateUrlFormatString="~/Admin/Usuario/UserRead.aspx?Id_Usuario={0}"
                  Text="&lt;i class=&quot;fa fa-eye&quot; aria-hidden=&quot;true&quot;&gt;&lt;/i&gt;" />
                <asp:HyperLinkField
                  Text="&lt;i class=&quot;fa fa-pencil-square-o&quot; aria-hidden=&quot;true&quot;&gt;&lt;/i&gt;"
                  DataNavigateUrlFields="Id_Usuario"
                  DataNavigateUrlFormatString="~/Admin/Usuario/UserRead.aspx?Id_Usuario={0}&amp;edit=edit" />
              </Columns>
              <PagerSettings Mode="NumericFirstLast" />
            </asp:GridView>

            <asp:SqlDataSource ID="AdminUsuarios" runat="server"
              ConnectionString="<%$ ConnectionStrings:TiendaOnlineConnectionString %>"
              DeleteCommand="DELETE FROM [USUARIO] WHERE [Id_Usuario] = @Id_Usuario"
              InsertCommand="INSERT INTO [USUARIO] ([Nombre], [Apellido], [Email], [Contraseña]) VALUES (@Nombre, @Apellido, @Email, @Contraseña)"
              SelectCommand="SELECT * FROM [USUARIO]"
              UpdateCommand="UPDATE [USUARIO] SET [Nombre] = @Nombre, [Apellido] = @Apellido, [Email] = @Email, [Contraseña] = @Contraseña WHERE [Id_Usuario] = @Id_Usuario">
              <DeleteParameters>
                <asp:Parameter Name="Id_Usuario" Type="Int32" />
              </DeleteParameters>
              <InsertParameters>
                <asp:Parameter Name="Nombre" Type="String" />
                <asp:Parameter Name="Apellido" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Contraseña" Type="String" />
              </InsertParameters>
              <UpdateParameters>
                <asp:Parameter Name="Nombre" Type="String" />
                <asp:Parameter Name="Apellido" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Contraseña" Type="String" />
                <asp:Parameter Name="Id_Usuario" Type="Int32" />
              </UpdateParameters>
            </asp:SqlDataSource>

          </div>
        </div>
      </div>
    </div>
  </form>
</body>

</html>