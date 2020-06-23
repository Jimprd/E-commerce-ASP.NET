<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="Tienda.Producto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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

                        <asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" OnClick="BtnActualizar_Click" />

                        <asp:Button ID="BtnEliminar" runat="server" Text="Borrar" />
                    </td>
                </tr>
            </table>
        </div>

        <div>
            <asp:Label ID="IdMensaje" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
