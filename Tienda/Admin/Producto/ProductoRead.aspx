<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductoRead.aspx.cs" Inherits="Tienda.Admin.ProductoRead" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="Plataforma e-commerce, tienda online" />
  <meta name="author" content="Joel Imparado" />

  <title>Alta De Producto</title>

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
            <div class="col-lg-7">
              <div class="p-5">
                <div class="text-center">
                  <h1 class="h4 text-gray-900 mb-4">Detalle de producto</h1>
                </div>
                <div class="user">
                  <div class="form-group row">
                    <div class="col-sm-6">
                      <div class="form-group row">
                        <div class="col mb-3 mb-sm-0">
                          Producto
                          <asp:TextBox ID="TBNombre" runat="server" Placeholder="Nombre"
                            CssClass="form-control form-control-user"></asp:TextBox>
                        </div>
                      </div>

                      <div class="form-group row">
                        <div class="col mb-3 mb-sm-0">
                          Precio De Venta
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text" id="basic-addon1">$</span>
                            </div>
                            <asp:TextBox ID="TBPrecio" runat="server" Placeholder="1500.00"
                              CssClass="form-control form-control-user"
                              ToolTip='Precio. Usar el punto (.) como separador decimal en lugar de la coma (,)'>
                            </asp:TextBox>
                          </div>
                        </div>
                      </div>

                      <div class="form-group row">
                        <div class="col mb-3 mb-sm-0">
                          Stock Actual
                          <asp:TextBox ID="TBStock" runat="server" Placeholder="0"
                            CssClass="form-control form-control-user" ToolTip="Stock Actual"></asp:TextBox>
                        </div>
                      </div>

                      <div class="form-group row">
                        <div class="col mb-3 mb-sm-0">
                          <asp:TextBox ID="TextBox1" runat="server" Placeholder="0"
                            CssClass="form-control form-control-user" Enabled="False"></asp:TextBox>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      Descripción
                      <asp:TextBox ID="TBDescripcion" runat="server" TextMode="MultiLine" MaxLength="1000"
                        ToolTip="Describi el producto" Placeholder="Descripcion del producto"
                        CssClass="form-control rounded" Rows="10" Columns="30" aria-label="With textarea"></asp:TextBox>
                    </div>
                  </div>
                  <hr />
                  <div class="text-center row">
                    <div class="col-6">
                      Marca
                      <asp:DropDownList ID="DDLMarcas" runat="server"
                        CssClass="custom-select custom-select-sm form-control form-control-sm"></asp:DropDownList>
                    </div>
                    <div class="col-6">
                      Categoria
                      <asp:DropDownList ID="DDLCategoria" runat="server"
                        CssClass="custom-select custom-select-sm form-control form-control-sm"></asp:DropDownList>
                    </div>
                  </div>
                  <hr />
                  <div class="btn-group btn-block" role="group">
                    <asp:Button ID="BtnVolver" runat="server" Text="Volver" CssClass="btn btn-dark btn-user "
                      OnClick="BtnVolver_Click" />
                    <div class="btn-group">
                      <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success btn-user"
                        OnClick="BtnGuardar_Click" />
                      <asp:Button ID="BtnEditar" runat="server" Text="Editar" CssClass="btn btn-warning btn-user"
                        OnClick="BtnEditar_Click" />
                      <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger btn-user"
                        OnClick="BtnCancelar_Click" />
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-5 bg-primary">
              <div class="mt-2 mr-2">

                <asp:Image ID="Image1" runat="server" CssClass="img-fluid rounded mw-100 w-100" />

                <div class="input-group">
                  <div class="custom-file">
                    <asp:FileUpload ID="FUfoto" runat="server" CssClass="custom-file-input" onchange="readURL(this)" />
                    <label class="custom-file-label" for="FUfoto">Seleccionar la imagen principal</label>
                  </div>
                </div>

                <asp:Image ID="Image2" runat="server" CssClass="img-fluid rounded mw-100 w-100" />

                <div class="input-group">
                  <div class="custom-file">
                    <asp:FileUpload ID="FUfoto2" runat="server" CssClass="custom-file-input"
                      onchange="readURL2(this)" />
                    <label class="custom-file-label" for="FUfoto2">Seleccionar imagen 2</label>
                  </div>
                </div>

                <asp:Image ID="Image3" runat="server" CssClass="img-fluid rounded mw-100 w-100" />

                <div class="input-group">
                  <div class="custom-file">
                    <asp:FileUpload ID="FUfoto3" runat="server" CssClass="custom-file-input"
                      onchange="readURL3(this)" />
                    <label class="custom-file-label" for="FUfoto3">Seleccionar imagen 3</label>
                  </div>
                </div>

                <asp:Image ID="Image4" runat="server" CssClass="img-fluid rounded mw-100 w-100" />

                <div class="input-group">
                  <div class="custom-file">
                    <asp:FileUpload ID="FUfoto4" runat="server" CssClass="custom-file-input"
                      onchange="readURL4(this)" />
                    <label class="custom-file-label" for="FUfoto4">Seleccionar imagen 4</label>
                  </div>
                </div>

              </div>
            </div>

          </div> <!-- row -->
        </div> <!-- card-body -->
      </div> <!-- card -->
    </div> <!-- container -->

  </form>

  <!-- Bootstrap core JavaScript-->
  <script src="../assets/vendor/jquery/jquery.min.js"></script>
  <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../assets/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../assets/js/sb-admin-2.min.js"></script>
</body>

</html>