using System;
using System.Web.UI.WebControls;

namespace Tienda.Admin
{
    public partial class Producto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                VerificarSesion();
                CargarAtributosHTML();
                CargarAtributosDeControl();
            }
        }


        #region HANDLERS
        protected void TblProductos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // reference the Delete LinkButton
                LinkButton lb = (LinkButton)e.Row.Cells[0].Controls[0];
                lb.OnClientClick = "return confirm('Queres eliminar este producto?');";
            }
        }

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/PanelAdmin.aspx");
        }

        protected void BtnCrearProducto_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Producto/ProductoCreate.aspx");
        }
        #endregion


        #region METODOS PRIVADOS
        private void VerificarSesion()
        {
            if (Session["LoginOk"] == null)
            {
                Response.Redirect("~/Admin/Login.aspx");
            }
        }

        private void CargarAtributosHTML()
        {
            this.LinkButton1.Attributes.Add("data-toggle", "modal");
            this.LinkButton1.Attributes["data-target"] = $"#logoutModal"; // Otra manera de añadir atributos
        }

        private void CargarAtributosDeControl()
        {
            //this.dataTable.HeaderRow.TableSection = TableRowSection.TableHeader; del aguna manera esta linea debe crear el <thead> al renderizar el gridview para que Jquery datatable no de error
            this.GVTabla.AllowSorting = false; // ordenacion por click en el encabezado, false porque ahora se encarga JQuery 
            this.GVTabla.AllowPaging = false;
            this.GVTabla.AllowCustomPaging = false;
            this.GVTabla.AutoGenerateColumns = false;
        }

        #region AÚN NO SE ESTÁ USANDO en este form
        private void ObtenerQueryString()
        {
            // clase que lleva y trae info cuando realizo acciones sobre la pagina, query string de la url, etc
            string valorId = Request.QueryString["Id_Producto"];
            if (!string.IsNullOrEmpty(valorId))
            {
            
            }
            else
            {
                CrearAlertJS("El producto no fue encontrado.");
            }
        }

        private void CrearAlertJS(string mensaje)
        {
            Response.Write("<script>alert('" + mensaje + "')</script>");
        }
        #endregion
        #endregion
    }
}