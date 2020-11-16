using System;
using System.Data;
using System.Linq;
using System.Web.UI.HtmlControls;

namespace Tienda
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
             //   MostrarGaleria();
            }
        }

        //protected void BtnCrearCuenta_Click(object sender, EventArgs e)
        //{
        //    CrearCuenta();
        //}

        //private void CrearCuenta()
        //{
        //    GBDatos datos = new GBDatos();
        //    bool ok = datos.CrearUsuario(this.TBNombreUsuario.Text.Trim(), this.TBApellido.Text.Trim(), this.TBEmail.Text.Trim(), this.TBContraseña.Text.Trim());
        //    if (ok)
        //    {

        //    }
        //    else
        //    {

        //    }
        //}

        //private void MostrarProducto()
        //{
        //    GBDatos datos = new GBDatos();
        //    DataTable tabla = datos.MostrarProducto(id_Producto);
        //    Image1.Width = 500;
        //    Image1.ImageUrl = tabla.Rows[0]["NombreRuta1"].ToString();
        //    LblProducto.Text = tabla.Rows[0]["Nombre"].ToString();
        //    LblDescripcion.Text = tabla.Rows[0]["Descripcion"].ToString();
        //    LblPrecio.Text = tabla.Rows[0]["Precio_Venta"].ToString();
        //    LblStock.Text = tabla.Rows[0]["Stock_Actual"].ToString();
        //}

        //private void MostrarGaleria()
        //{
        //    GBDatos datos = new GBDatos();
        //    DataTable tabla = datos.ProductosGaleria();
        //    HtmlGenericControl item = new HtmlGenericControl();

        //    foreach (DataRow fila in tabla.Rows)
        //    {
        //        item.TagName = "div";
        //        item.Attributes.Add("class", "contenedor");
        //        item.InnerHtml += "<img src='" + fila["NombreRuta1"] + "'>" +
        //                            "<p>" + fila["Nombre"] + "</p>";

        //    }

        //    // Añadir elemento div al elemento contenedor
        //    galeria.Controls.Add(item);

        //}

// https://docs.microsoft.com/es-es/aspnet/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/display_data_items_and_details


    }
}