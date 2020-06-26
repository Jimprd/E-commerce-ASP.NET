using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
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
                CargarDDList(DDLMarcas, "Id_Marca", "Nombre");
            }
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            CrearProducto();
            ActualizarGridView();
        }

        protected void BtnActualizar_Click(object sender, EventArgs e)
        {
            ActualizarProducto();
            ActualizarGridView();
        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            EliminarProducto();
            ActualizarGridView();
        }

        public void CrearProducto()
        {
            GestionBaseDatos datos = new GestionBaseDatos();
            bool ok = datos.CrearProducto(this.TBNombre.Text.Trim(), this.TBDescripcion.Text.Trim(), this.TBPrecio.Text.Trim(), this.TBStock.Text.Trim());
            if (ok)
            {
                this.LblMensaje.Text = "El Producto fue ingresado";
                this.LblMensaje.ForeColor = Color.Green;
            }
            else
            {
                this.LblMensaje.Text = "Se produjo un error. El Producto no fue Ingresado";
            }
        }

        public void ActualizarGridView()
        {
            GridView1.DataBind();
        }

        public void ActualizarProducto()
        {
            GestionBaseDatos datos = new GestionBaseDatos();
            string valorId = Request.QueryString["id"].ToString();
            bool ok = datos.ActualizarProducto(valorId, this.TBNombre.Text, this.TBDescripcion.Text, this.TBPrecio.Text, this.TBStock.Text);

            if (ok)
            {
                this.LblMensaje.Text = "El Producto fue Actualizado";
            }
            else
            {
                this.LblMensaje.Text = "Se produjo un error. El producto no fue Actualizado";
            }
        }

        public void EliminarProducto()
        {
            GestionBaseDatos datos = new GestionBaseDatos();
            string valorId = Request.QueryString["id"].ToString();
            bool ok = datos.EliminarProducto(valorId);
            if (ok)
            {
                this.LblMensaje.Text = "El Producto fue Eliminado";
            }
            else
            {
                this.LblMensaje.Text = "Se produjo un error. El Producto no fue Eliminado";
            }
        }

        public void ProbandoElRequest()
        {
            // clase que lleva y trae info cuando realizo acciones sobre la pagina, query string de la url, etc
            string valorId = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(valorId))
            {
                // this.IdMensaje.Text = valorId;
                GestionBaseDatos datos = new GestionBaseDatos();
                DataTable tabla = datos.ObtenerProducto(valorId);
                this.TBNombre.Text = tabla.Rows[0]["Nombre"].ToString(); // tomar la fila 0 y de esa fila tomar el nombre
                this.TBDescripcion.Text = tabla.Rows[0]["Descripcion"].ToString();
                this.TBPrecio.Text = tabla.Rows[0]["Precio_Venta"].ToString();
                this.TBStock.Text = tabla.Rows[0]["Stock_Actual"].ToString();
            }
            else
            {
                this.LblMensaje.Text = "El Producto no fue encontrado, debe darlo de alta";
            }
        }

        /// <summary>
        /// Rellena un Drop Down List
        /// </summary>
        /// <param name="DDL">El Drop Down List a rellenar</param>
        /// <param name="valor">Propiedad .DataValueField del DDList</param>
        /// <param name="campo">Propiedad .DataTextField del DDList</param>
        public void CargarDDList(DropDownList DDL, string valor, string campo)
        {
            GestionBaseDatos datos = new GestionBaseDatos();
            DDL.DataSource = datos.ObtenerMarcas();
            DDL.DataValueField = valor;
            DDL.DataTextField = campo;
            DDL.DataBind(); // enlazar datos de un origen a un control de servidor, generalemtente después de recuperar un conjunto de datos a través de una consulta de base de datos. La mayoría de los controles lo hacen automáticamente, por lo que normalmente no es necesario llamarlo explícitamente.
            DDL.Items.Insert(0, new ListItem("Seleccionar", "0"));
        }
    }
}