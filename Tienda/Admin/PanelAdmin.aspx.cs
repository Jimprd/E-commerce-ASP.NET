using System;

namespace Tienda
{
    public partial class PanelAdministracion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                VerificarSesion();
                this.linkProductos.NavigateUrl = ("~/Admin/Producto/Producto.aspx");
                this.linkUsuario.NavigateUrl = ("~/Admin/Usuario/UserAdmin.aspx");
            }
        }

        private void VerificarSesion()
        {
            if (Session["LoginOk"] == null)
            {
                Response.Redirect("~/Admin/Login.aspx");
            }
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/Admin/Login.aspx");
        }
    }
}