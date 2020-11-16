<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PanelDelUsuario.aspx.cs" Inherits="Tienda.Usuario.PanelDelUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>

<body>
    <form id="form1" runat="server">
        <h1>Panel Del Usuario</h1>
        <div>
            <h2>Completa Tus Datos (Usuario)</h2>
            <table style="width: 100%;">
                <tr>
                    <td>Nombre</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Apellido</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>E-mail</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Teléfono</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Contraseña</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Repetir Contraseña</td>
                    <td>
                        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="asd" />

                        <asp:Button ID="Btn_GuardarCambios" runat="server" Text="Guardar Cambios" />

                        <asp:Button ID="BtnEliminarCuenta" runat="server" Text="Darse De Baja" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <h2>Domicilio</h2>
            <table style="width: 100%;">
                <tr>
                    <td>Calle</td>
                    <td>&nbsp;</td>
                    <td>Número</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>

</html>