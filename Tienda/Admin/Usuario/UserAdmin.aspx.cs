using System;
using System.Web.UI.WebControls;

namespace Tienda.Admin.Usuario
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                VerificarSesion();
            }
        }

        protected void BtnCrearUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Usuario/UserCreate.aspx");
        }

        private void VerificarSesion()
        {
            if (Session["LoginOk"] == null)
            {
                Response.Redirect("~/Admin/Login.aspx");
            }
        }

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/PanelAdmin.aspx");
        }

        protected void TblUsuarios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // reference the Delete LinkButton
                LinkButton db = (LinkButton)e.Row.Cells[0].Controls[0];
                db.OnClientClick = "return confirm('Queres eliminar este usuario?');";
            }
        }
    }
}