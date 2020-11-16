using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Tienda.Admin
{
    public partial class ProductoRead : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                VerificarSesion();
                CargarAtributosDeControl(); CargarAtributosHTML();
                CargarMarca(); CargarCategoria();
                ObtenerQueryString();
                string q = Request.QueryString["edit"];
                if (q == "edit")
                {
                    HabilitarControles(true);
                }
                else
                {
                    HabilitarControles(false);
                }
            }
        }


        #region HANDLERS
        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Producto/Producto.aspx");
        }

        protected void BtnEditar_Click(object sender, EventArgs e)
        {
            HabilitarControles(true);
        }

        protected void BtnCancelar_Click(object sender, EventArgs e)
        {
            HabilitarControles(false);
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            ActualizarProducto();
        }
        #endregion


        #region METODOS PRIVADOS
        public void ActualizarProducto()
        {
            GBDatos datos = new GBDatos();
            string valorId = Request.QueryString["Id_Producto"].ToString();
            bool ok = datos.ActualizarProducto(valorId, this.TBNombre.Text, this.TBDescripcion.Text, this.TBPrecio.Text, this.TBStock.Text, this.DDLMarcas.SelectedValue, this.DDLCategoria.SelectedValue);

            if (ok)
            {
                CrearAlertJS("El Producto fue Actualizado.");
                Response.Redirect("~/Admin/Producto/Producto.aspx");
            }
            else
            {
                CrearAlertJS("Se produjo un error. No se guardaron los cambios.");
            }
        }

        public void ObtenerQueryString()
        {
            // clase que lleva y trae info cuando realizo acciones sobre la pagina, query string de la url, etc
            string valorId = Request.QueryString["Id_Producto"];
            if (!string.IsNullOrEmpty(valorId))
            {
                // this.IdMensaje.Text = valorId;
                GBDatos datos = new GBDatos();
                DataTable tabla = datos.ObtenerProducto(valorId);
                this.TBNombre.Text = tabla.Rows[0]["Nombre"].ToString(); // tomar la fila 0 y de esa fila tomar el nombre
                this.TBDescripcion.Text = tabla.Rows[0]["Descripcion"].ToString();
                this.TBPrecio.Text = tabla.Rows[0]["Precio_Venta"].ToString();
                this.TBStock.Text = tabla.Rows[0]["Stock_Actual"].ToString();

                this.DDLMarcas.SelectedValue = tabla.Rows[0]["Id_Marca"].ToString();
                this.DDLCategoria.SelectedValue = tabla.Rows[0]["Id_Categoria"].ToString();
            }
            else
            {
                CrearAlertJS("El producto no fue encontrado.");
            }
        }

        private void CargarMarca()
        {
            GBDatos datos = new GBDatos();
            DDLMarcas.DataSource = datos.ObtenerMarcas();
            CargarDDL(DDLMarcas, "Id_Marca", "Marca");
        }

        private void CargarCategoria()
        {
            GBDatos datos = new GBDatos();
            DDLCategoria.DataSource = datos.ObtenerCategoria();
            CargarDDL(DDLCategoria, "Id_Categoria", "Categoria");
        }

        // Pendiente mejorar Esto
        /// <summary>
        /// Rellena un Drop Down List
        /// </summary>
        /// <param name="DDL">El Drop Down List con DataSource a rellenar</param>
        /// <param name="indice">Propiedad .DataValueField del DDList</param>
        /// <param name="campo">Propiedad .DataTextField del DDList</param>
        private void CargarDDL(DropDownList DDL, string indice, string campo)
        {
            DDL.DataValueField = indice;
            DDL.DataTextField = campo;
            DDL.DataBind(); // enlazar datos de un origen a un control de servidor, generalemtente después de recuperar un conjunto de datos a través de una consulta de base de datos. La mayoría de los controles lo hacen automáticamente, por lo que normalmente no es necesario llamarlo explícitamente.
            DDL.Items.Insert(0, new ListItem("Seleccionar", "0"));
        }

        public void CargarAtributosDeControl()
        {
            this.TBNombre.MaxLength = 60;

            this.TBDescripcion.TextMode = TextBoxMode.MultiLine;
            this.TBDescripcion.Rows = 10;
            this.TBDescripcion.Columns = 30;
            this.TBDescripcion.MaxLength = 1000;

            this.TBStock.TextMode = TextBoxMode.Number;
        }

        public void CargarAtributosHTML()
        {
            this.TBNombre.Attributes.Add("placeholder", "Nombre del producto");
            this.TBDescripcion.Attributes.Add("placeholder", "Descripcion del producto");
            this.TBPrecio.Attributes.Add("placeholder", "1500.00");
            this.TBStock.Attributes.Add("placeholder", "0");

            this.TBDescripcion.ToolTip = "Describi el producto, 1000 Caracteres máximo";
            this.TBPrecio.ToolTip = "Precio. Usar el punto (.) como separador decimal en lugar de la coma (,)";
            this.TBStock.ToolTip = "Stock actual del producto";

            this.TBDescripcion.Attributes.Add("aria-label", "With textarea");
        }

        private void HabilitarControles(bool valor)
        {
            this.DDLCategoria.Enabled = valor;
            this.DDLMarcas.Enabled = valor;
            this.TBNombre.Enabled = valor;
            this.TBDescripcion.Enabled = valor;
            this.TBPrecio.Enabled = valor;
            this.TBStock.Enabled = valor;
            this.BtnGuardar.Visible = valor;
            this.BtnCancelar.Visible = valor;
            this.BtnEditar.Visible = !valor;

            this.FUfoto.Visible = valor; // Estos no se están ocultando, probar ocultar el div a ver que pasa 
            this.FUfoto2.Visible = valor;
            this.FUfoto3.Visible = valor;
            this.FUfoto4.Visible = valor;
        }

        private void VerificarSesion()
        {
            if (Session["LoginOk"] == null)
            {
                Response.Redirect("~/Admin/Login.aspx");
            }
        }

        public void CrearAlertJS(string mensaje)
        {
            Response.Write("<script>alert('" + mensaje + "')</script>");
        }
        #endregion
    }
}