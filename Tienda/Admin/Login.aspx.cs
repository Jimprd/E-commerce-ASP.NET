using System;
using System.Web.UI.WebControls;

namespace Tienda.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarAtributosHTML();
            CargarAtributosDeControles();
        }

        protected void Btn_Loguin_Click(object sender, EventArgs e)
        {
            LogIn();
        }

        public void LogIn()
        {
            GBDatos datos = new GBDatos();
            bool tbl = datos.VerificarUsuario(this.TBUsuario.Text, this.TBContraseña.Text);

            if (tbl)
            {
                Session["LoginOk"] = true;
                Response.Redirect("~/Admin/PanelAdmin.aspx");
            }
            else
            {
                Response.Write("<script>alert('Usuario o contraseña no válidos.')</script>");
            }
        }

        public void LogOut()
        {
            Session.RemoveAll();
            //Session.Abandon(); ??
            //Session.Remove("LoginOk"); ??
            Response.Redirect("~/Admin/Login.aspx");
        }

        public void CargarAtributosHTML()
        {

            this.TBUsuario.Attributes["placeholder"] = "Nombre de Usuario o Email.";
            this.TBUsuario.Text = "admin@admin.com";

            this.TBContraseña.Attributes["placeholder"] = "Contraseña";
            this.TBContraseña.Text = "123456789";
        }

        public void CargarAtributosDeControles()
        {
            this.TBUsuario.TextMode = TextBoxMode.Email; // quizas deba cambiar a modo singleline para ingresar con el nombre de usuario
            this.TBContraseña.TextMode = TextBoxMode.Password;

            this.TBUsuario.ToolTip = "Ingresa tu nombre de usuario o e-mail";
            this.TBContraseña.ToolTip = "Ingresa tu contraseña";

        }
    }
}