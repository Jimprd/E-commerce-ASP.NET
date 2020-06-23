<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Tienda.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>E-Commerce</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://use.fontawesome.com/420ab19281.js"></script>

</head>
<body>
    <form id="form1" runat="server">

        <h1>Aca iría la barra de Navegacion</h1>
        <hr />
        <div><h2>Este seria el home</h2></div>

        <div>

        </div>
        <hr />
        <div>
          <h3>Registrate</h3>
            <table>
                <tr> 
                    <td>Nombre</td>
                    <td>
                        <asp:TextBox ID="TBNombreUsuario" runat="server"></asp:TextBox>
                    </td>
                    <td>Apellido</td>
                    <td>
                        <asp:TextBox ID="TBApellido" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr> 
                    <td>E-mail</td>
                    <td>
                        <asp:TextBox ID="TBEmail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr> 
                    <td>Contraseña</td>
                    <td>
                        <asp:TextBox ID="TBContraseña" runat="server"></asp:TextBox>
                    </td>
                    <td>Repetir Contraseña</td>
                    <td>
                        <asp:TextBox ID="TBRepetirContraseña" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr> 
                    <td></td>
                    <td>
                        <asp:Button ID="BtnCrearCuenta" runat="server" Text="Crear Cuenta" OnClick="BtnCrearCuenta_Click" CssClass="btn-danger" />
                    </td>
                </tr>
            </table>
        </div>
        <hr />
        <div>
            <h2>Alta De Producto</h2>
            <table>
                <tr> <!-- Fila -->
                    <td> <!-- Columna -->
                        Nombre           
                    </td>
                    <td>
                        <asp:TextBox ID="TBNombre" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr> 
                    <td>Descripción</td>
                    <td>
                        <asp:TextBox ID="TBDescripcion" runat="server" TextMode="MultiLine" Height="52px" MaxLength="1000" ToolTip="Describi el producto" Width="170px"></asp:TextBox>
                    </td>
                </tr>
                <tr> 
                    <td>Precio De Venta</td>
                    <td>
                        <asp:TextBox ID="TBPrecio" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr> 
                    <td>Stock</td>
                    <td>
                        <asp:TextBox ID="TBStock" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr> 
                    <td>Peso</td>
                    <td>
                        <asp:TextBox ID="TBPeso" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr> 
                    <td>Ancho</td>
                    <td>
                        <asp:TextBox ID="TBAncho" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr> 
                    <td>Alto</td>
                    <td>
                        <asp:TextBox ID="TBAlto" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr> 
                    <td>Largo</td>
                    <td>
                        <asp:TextBox ID="TBLargo" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr> 
                    <td>Marca</td>
                    <td>
                        <asp:DropDownList ID="DDLMarcas" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr> 
                    <td>Categoria</td>
                    <td>
                        <asp:DropDownList ID="DDLCategoria" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr> 
                    <td></td>
                    <td>
                        <asp:Button ID="BtnAgregar" runat="server" Text="Añadir" OnClick="BtnAgregar_Click" />

                        <asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" />

                        <asp:Button ID="BtnEliminar" runat="server" Text="Borrar" OnClick="BtnEliminar_Click" />
                    </td>
                </tr>
            </table>
        </div>
<div>



</div>
    </form>
</body>
</html>
