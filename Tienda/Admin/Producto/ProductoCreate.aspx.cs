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
            string nombre = datos.NombreArchivo.ToString();
            if (ok)
            {
                CargarFoto(nombre);
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

            this.TBPrecio.Attributes.Add("min", "0");
            this.TBStock.Attributes.Add("min", "0");

            this.TBNombre.Attributes.Add("required", "required");

            this.TBPrecio.Attributes.Add("required", "required");
            this.TBStock.Attributes.Add("required", "required");

            this.TBPrecio.Attributes.Add("step", ".01");
            //this.TBPrecio.Attributes.Add("pattern", "^\d*(\.\d{0,2})?$");

            this.TBDescripcion.Attributes.Add("aria-label", "With textarea");
        }

        private void CargarAtributosDeControl()
        {
            this.TBNombre.MaxLength = 60;

            this.TBDescripcion.TextMode = TextBoxMode.MultiLine;
            this.TBDescripcion.Rows = 10;
            this.TBDescripcion.Columns = 30;
            this.TBDescripcion.MaxLength = 1000;

            this.TBPrecio.TextMode = TextBoxMode.Number;
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

        private void CargarFoto(string nombre)
        {
            if (FUfoto.HasFile || FUfoto2.HasFile || FUfoto3.HasFile || FUfoto4.HasFile)
            {
                
                // Obtenemos la extensión y el tamaño para delimitar si es necesario
                string extension = System.IO.Path.GetExtension(FUfoto.FileName).ToLower();
                string extension2 = System.IO.Path.GetExtension(FUfoto2.FileName).ToLower();
                string extension3 = System.IO.Path.GetExtension(FUfoto3.FileName).ToLower();
                string extension4 = System.IO.Path.GetExtension(FUfoto4.FileName).ToLower();

                // Tamaño en bytes
                int tamano = FUfoto.PostedFile.ContentLength;

                // Podemos verificar la extensión y tamaño del archivo (1 Mb = 1048576 bytes)
                if (extension == ".png" || extension == ".jpg" && tamano <= 5242880)
                {
                    FUfoto.SaveAs(Server.MapPath("~/Imagenes/" + nombre + "1" + extension));
                    FUfoto2.SaveAs(Server.MapPath("~/Imagenes/" + nombre + "2" + extension2));
                    FUfoto3.SaveAs(Server.MapPath("~/Imagenes/" + nombre + "3" + extension3));
                    FUfoto4.SaveAs(Server.MapPath("~/Imagenes/" + nombre + "4" + extension4));

                    GBDatos datos = new GBDatos();

                    datos.CrearFoto(nombre, "Imagenes/", nombre + "1" + extension, nombre + "2" + extension2, nombre + "3" + extension3, nombre + "4" + extension4);
                }
            }
        }


        private bool VerificarFoto(FileUpload FU)
        {
            bool valor = true;
            if (FU.HasFile)
            {
                //string rutaCliente = System.IO.Path.GetFullPath(FUfoto.AppRelativeTemplateSourceDirectory);// ruta de donde procede el archivo???

                // Obtenemos la extensión y el tamaño para delimitar si es necesario
                string extension = System.IO.Path.GetExtension(FU.FileName).ToLower();

                // Tamaño en bytes
                int tamano = FUfoto.PostedFile.ContentLength;

            }
            else
            {
                valor = false;
            }
            return valor;
        }
        #endregion
    }
}