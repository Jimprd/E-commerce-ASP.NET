<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Tienda.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>E-Commerce</title>

</head>
<body>
    <form id="form1" runat="server">

        <h1>Aca iría la barra de Navegacion</h1>
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
                        <asp:Button ID="BtnCrearCuenta" runat="server" Text="Crear Cuenta" OnClick="BtnCrearCuenta_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <hr />
        <div><h2>Este seria el home</h2></div>
        <div>
            <asp:Image runat="server" Width="500px" ImageUrl="~/Images/model-train-1146828.jpg"></asp:Image>
        </div>
        <hr />
    </form>
</body>
</html>
