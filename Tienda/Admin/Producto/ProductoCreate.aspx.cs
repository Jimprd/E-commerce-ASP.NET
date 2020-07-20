using System;
using System.Web.UI.WebControls;

namespace Tienda
{
    public partial class Producto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                VerificarSesion();
                CargarMarca();
                CargarCategoria();
                CargarAtributosDeControl();
                CargarAtributosHTML();
            }
        }

        #region HANDLERS
        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            CrearProducto();
        }
        #endregion


        #region METODOS PRIVADOS
        public void CrearProducto()
        {
            GBDatos datos = new GBDatos();
            bool ok = datos.CrearProducto(this.TBNombre.Text.Trim(), this.TBDescripcion.Text.Trim(), this.TBPrecio.Text.Trim(), this.TBStock.Text.Trim(), this.DDLMarcas.SelectedValue, this.DDLCategoria.SelectedValue);
            if (ok)
            {
                CrearAlertJS("El Producto fue ingresado");
                Response.Redirect("~/Admin/Producto/Producto.aspx");
            }
            else
            {
                CrearAlertJS("Se produjo un error. El Producto no fue Ingresado.");
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

        private void CargarAtributosHTML()
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

        private void CargarAtributosDeControl()
        {
            this.TBNombre.MaxLength = 60;

            this.TBDescripcion.TextMode = TextBoxMode.MultiLine;
            this.TBDescripcion.Rows = 10;
            this.TBDescripcion.Columns = 30;
            this.TBDescripcion.MaxLength = 1000;

            this.TBStock.TextMode = TextBoxMode.Number;
        }

        private void VerificarSesion()
        {
            if (Session["LoginOk"] == null)
            {
                Response.Redirect("~/Admin/Login.aspx");
            }
        }

        private void CrearAlertJS(string mensaje)
        {
            Response.Write("<script>alert('" + mensaje + "')</script>");
        }
        #endregion
    }
}