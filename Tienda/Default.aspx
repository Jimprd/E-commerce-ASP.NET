<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Tienda.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="es-AR">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link rel="icon" type="image/ico" href="/img/favicon.ico"/>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"/>

    <title>Tienda</title>


</head>

<body class="bg-light">
    <form id="form1" runat="server">

     <div class="container-fliud">

        <nav class="navbar navbar-expand-lg navbar-light bg-dark" >
            <a class="navbar-brand text-success" href="#">Electro Deluxe</a>
            <button class="navbar-toggler bg-success" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link text-success" href="#">Home<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-success" href="#">Nosotros</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-success" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Productos</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <!--
                      <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                      </li>
                    -->
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Búsqueda..." aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                </form>
            </div>
        </nav>
    </div>

        <%--<div>
            // Hoja de producto
            <asp:Image ID="Image1" runat="server" />
            <asp:Label ID="LblProducto" runat="server" Text="Producto"></asp:Label>
            <asp:Label ID="LblDescripcion" runat="server" Text="Descripcion"></asp:Label>
            <asp:Label ID="LblPrecio" runat="server" Text="Precio"></asp:Label>
            <asp:Label ID="LblStock" runat="server" Text="Label"></asp:Label>
            <asp:Button ID="BtnComprar" runat="server" Text="Comprar"/>
            <asp:Button ID="BtnAgregarCarrito" runat="server" Text="Agregar al Carrito"/>
        </div>--%>

<%--        <div id="galeria" class="galeria" runat="server">
        </div>--%>

        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Producto" DataSourceID="GaleriaProductos">
            <ItemTemplate>
                <div style="background-color: #ffffff;">
                    <img src='<%#Eval("Ruta")%><%#Eval("Foto1")%>' width="300px" alt="Foto del producto.">
                    <h3><a href="#"><%#Eval("Nombre")%></a></h3>
                    <p>$ <%#Eval("Precio_Venta")%></p>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
            </LayoutTemplate>
        </asp:ListView>

        <asp:SqlDataSource ID="GaleriaProductos" runat="server"
            ConnectionString="<%$ ConnectionStrings:TiendaOnlineConnectionString %>"
            SelectCommand="SELECT * FROM [vwProductos_Galeria]"></asp:SqlDataSource>


    </form>
</body>

</html>