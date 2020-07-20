<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRead.aspx.cs" Inherits="Tienda.Admin.Usuario.UserRead" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Registrar Usuario</title>

  <!-- Custom fonts for this template-->
  <link href="../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet" />

  <!-- Custom styles for this template-->
  <link href="../assets/css/sb-admin-2.min.css" rel="stylesheet" />

</head>

<body class="bg-gradient-primary">
  <form id="form1" runat="server">

    <div class="container">

      <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
          <!-- Nested Row within Card Body -->
          <div class="row">
            <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
            <div class="col-lg-7">
              <div class="p-5">
                <div class="text-center">
                  <h1 class="h4 text-gray-900 mb-4">Crear Cuenta Administrativa</h1>
                </div>
                <div class="user">
                  <div class="form-group row">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                      <asp:TextBox ID="TBNombre" runat="server" CssClass="form-control form-control-user" type="text"
                        placeholder="Nombre"></asp:TextBox>
                    </div>
                    <div class="col-sm-6">
                      <asp:TextBox ID="TBApellido" runat="server" CssClass="form-control form-control-user" type="text"
                        placeholder="Apellido"></asp:TextBox>
                    </div>
                  </div>
                  <div class="form-group">
                        <asp:TextBox ID="TBEmail" placeholder="email@email.com" ToolTip="Ingresa tu nombre de usuario o e-mail"
                          runat="server" CssClass="form-control form-control-user"  TextMode="Email"></asp:TextBox>
                  </div>
                  <div class="form-group row">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                        <asp:TextBox ID="TBContraseña" placeholder="Contraseña" ToolTip="Ingresa tu contraseña"
                          runat="server" CssClass="form-control form-control-user" TextMode="Password">
                        </asp:TextBox>

                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox ID="TBRContraseña" placeholder="Repetir Contraseña" ToolTip="Repetir contraseña"
                          runat="server" CssClass="form-control form-control-user" TextMode="Password">
                        </asp:TextBox>

                    </div>
                  </div>
                    <div class="btn-group btn-block" role="group">
                  <asp:Button ID="BtnVolver" runat="server" Text="Volver" CssClass="btn btn-dark btn-user "
                    OnClick="BtnVolver_Click" />
                   <div class="btn-group">
                    <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success btn-user" OnClick="BtnGuardar_Click" />
                    <asp:Button ID="BtnEditar" runat="server" Text="Editar" CssClass="btn btn-warning btn-user" OnClick="BtnEditar_Click" />
                    <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger btn-user" OnClick="BtnCancelar_Click" />
                    </div>
                   </div>
                  <hr/>
                </div>
                <hr/>
                <div class="text-center">
                  <a class="small" href="#">Forgot Password?</a>
                </div>
                <div class="text-center">
                  <a class="small" href="#">Already have an account? Login!</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../assets/vendor/jquery/jquery.min.js"></script>
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../assets/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../assets/js/sb-admin-2.min.js"></script>
    </form>
</body>

</html>
