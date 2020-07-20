using System;
using System.Web.UI.WebControls;

namespace Tienda.Admin
{
    public partial class MarcaAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HabilitarControles(false);
            CargarAtributosDeControl();
            CargarAtributosHTML();
        }


        #region Handlers
        protected void GVTabla_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // reference the Delete LinkButton
                LinkButton db = (LinkButton)e.Row.Cells[0].Controls[0];
                db.OnClientClick = "return confirm('Queres eliminar esta marca?');"; 
            }
        }

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/PanelAdmin.aspx");
        }

        protected void BtnCrearMarca_Click(object sender, EventArgs e)
        {
            HabilitarControles(true);
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            CrearMarca();
            this.GVTabla.DataBind();
        }

        protected void BtnCancelar_Click(object sender, EventArgs e)
        {
            HabilitarControles(false);
        }
        #endregion


        #region Metodos Privados
        private void CrearMarca()
        {
            bool ok = new GBDatos().CrearMarca(this.TBMarca.Text);

            if (ok)
            {
                CrearAlertJS("Marca ingresada correctamente");
            }
            else
            {
                CrearAlertJS("Error");
            }
        }

        private void HabilitarControles(bool valor)
        {
            this.TBMarca.Visible = valor;
            this.BtnGuardar.Visible = valor;
            this.BtnCancelar.Visible = valor;
            this.BtnCrearMarca.Visible = !valor;
        }

        private void CargarAtributosHTML()
        {
            this.TBMarca.Attributes["placeholder"] = "Ingresa el nombre de la marca";
        }

        private void CargarAtributosDeControl()
        {
            //this.dataTable.HeaderRow.TableSection = TableRowSection.TableHeader; no se dónde va pero de alguna manera esta linea debe crear el <thead> al renderizar el gridview para que Jquery datatable no de error
            this.GVTabla.AllowSorting = false; // ordenacion por click en el encabezado, false porque ahora se encarga JQuery 
            this.GVTabla.AllowPaging = false;
            this.GVTabla.AllowCustomPaging = false;
            this.GVTabla.AutoGenerateColumns = false;
            this.GVTabla.ShowHeader = true;
            this.GVTabla.ShowHeaderWhenEmpty = true;
            this.GVTabla.EmptyDataText = "Marca";
        }

        private void CrearAlertJS(string mensaje)
        {
            Response.Write("<script>alert('" + mensaje + "')</script>");
        }
        #endregion
    }
}