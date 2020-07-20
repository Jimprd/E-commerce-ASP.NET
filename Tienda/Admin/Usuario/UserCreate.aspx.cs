using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tienda.Admin
{
    public partial class AdminUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                VerificarSesion();
            }
        }

        private void VerificarSesion()
        {
            if (Session["LoginOk"] == null)
            {
                Response.Redirect("~/Admin/Login.aspx");
            }
        }

        protected void BtnRegistrar_Click(object sender, EventArgs e)
        {
            GBDatos datos = new GBDatos();
            bool ok = datos.CrearUsuario(this.TBNombre.Text.Trim(), this.TBApellido.Text.Trim(), this.TBEmail.Text.Trim(), this.TBContraseña.Text.Trim());
            if (ok)
            {
                Response.Redirect("~/Admin/Usuario/UserAdmin.aspx");
            }
            else
            {
                CrearAlertJS("Se produjo un error. El Producto no fue Ingresado.");
            }
        }

        public void CrearAlertJS(string mensaje)
        {
            Response.Write("<script>alert('" + mensaje + "')</script>");
        }
    }
}