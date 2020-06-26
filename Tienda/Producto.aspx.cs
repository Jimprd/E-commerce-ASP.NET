using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tienda
{
    public partial class Producto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProbandoElRequest();
            }

        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            GestionBaseDatos datos = new GestionBaseDatos();
            bool ok = datos.CrearProducto(this.TBNombre.Text, this.TBDescripcion.Text, Convert.ToDecimal(this.TBPrecio.Text), Convert.ToInt32(this.TBStock.Text));

            if (ok)
            {
                this.IdMensaje.Text = "Producto agregado";
            }
            else
            {
                this.IdMensaje.Text = "Se produjo un error";
            }
        }

        protected void BtnActualizar_Click(object sender, EventArgs e)
        {
            GestionBaseDatos db = new GestionBaseDatos();
            string valorId = Request.QueryString["id"].ToString();
            bool ok = db.ActualizarProducto(valorId, this.TBNombre.Text, this.TBDescripcion.Text, Convert.ToDecimal(this.TBPrecio.Text), Convert.ToInt32(this.TBStock.Text));

            if (ok)
            {
                this.IdMensaje.Text = "Producto actualizado";
            }
            else
            {
                this.IdMensaje.Text = "Se produjo un error";
            }
        }


        protected void BtnEliminar_Click(object sender, EventArgs e)
        {

        }


        public void ProbandoElRequest()
        {

            // clase que lleva y trae info cuando realizo acciones sobre la pagina, query string de la url, etc
            string valorId = Request.QueryString["id"];

            if (!string.IsNullOrEmpty(valorId))
            {

                // this.IdMensaje.Text = valorId;
                GestionBaseDatos datos = new GestionBaseDatos();
                DataTable dt = datos.ObtenerProducto(valorId);
                this.TBNombre.Text = dt.Rows[0]["Nombre"].ToString(); // tomar la fila 0 y de esa fila tomar el nombre
                this.TBDescripcion.Text = dt.Rows[0]["Descripcion"].ToString();
                this.TBPrecio.Text = dt.Rows[0]["Precio_Venta"].ToString();
                this.TBStock.Text = dt.Rows[0]["Stock_Actual"].ToString();

            }
            else
            {
                this.IdMensaje.Text = "Realizar alta del producto";
            }
        }

    }
}