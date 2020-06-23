<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PanelDelUsuario.aspx.cs" Inherits="Tienda.Usuario.PanelDelUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Panel Del Usuario</h1>
        <div>
          <h2>Completa Tus Datos (Usuario)</h2>
            <table>
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
                        <asp:Button ID="Button1" runat="server" Text="Crear Cuenta" OnClick="BtnAgregar_Click" CssClass="btn-danger" />

                        <asp:Button ID="Button4" runat="server" Text="Actualizar" />

                        <asp:Button ID="Button5" runat="server" Text="Borrar" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
