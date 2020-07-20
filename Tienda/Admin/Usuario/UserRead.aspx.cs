using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Tienda.Admin.Usuario
{
    public partial class UserRead : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                VerificarSesion();
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
            Response.Redirect("~/Admin/Usuario/UserAdmin.aspx");
        }

        protected void BtnEditar_Click(object sender, EventArgs e)
        {
            HabilitarControles(true);
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            ActualizarUsuario();
        }

        protected void BtnCancelar_Click(object sender, EventArgs e)
        {
            HabilitarControles(false);
            // agregar un metodo para limpiar los controles??? 
        }

        #endregion

        #region Metodos Privados
        private void ObtenerQueryString()
        {
            string valorId = Request.QueryString["Id_Usuario"];

            if (!string.IsNullOrEmpty(valorId))
            {
                int id = Convert.ToInt32(valorId);
                GBDatos datos = new GBDatos();
                DataTable tabla = datos.ObtenerUsuario(id);
                this.TBNombre.Text = tabla.Rows[0]["Nombre"].ToString();
                this.TBApellido.Text = tabla.Rows[0]["Apellido"].ToString();
                this.TBEmail.Text = tabla.Rows[0]["Email"].ToString();
                this.TBContraseña.Text = tabla.Rows[0]["Contraseña"].ToString();
            }
            else
            {
                CrearAlertJS("El Usuario no fue encontrado.");
            }
        }

        private void ActualizarUsuario()
        {
            GBDatos datos = new GBDatos();
            string valorId = Request.QueryString["Id_Usuario"].ToString();

            if (!string.IsNullOrEmpty(valorId))
            {
                int id = Convert.ToInt32(valorId);
                bool ok = datos.ActualizarUsuario(id, this.TBNombre.Text, this.TBApellido.Text, this.TBEmail.Text, this.TBContraseña.Text);

                if (ok)
                {
                    CrearAlertJS("El Producto fue Actualizado.");
                    Response.Redirect("~/Admin/Usuario/UserAdmin.aspx");
                }
                else
                {
                    CrearAlertJS("Se produjo un error. No se guardaron los cambios.");
                }
            }
        }

        private void VerificarSesion()
        {
            if (Session["LoginOk"] == null)
            {
                Response.Redirect("~/Admin/Login.aspx");
            }
        }

        private void HabilitarControles(bool valor)
        {
            this.TBNombre.Enabled = valor;
            this.TBApellido.Enabled = valor;
            this.TBEmail.Enabled = valor;
            this.TBContraseña.Enabled = valor;
            this.TBRContraseña.Enabled = valor;
            this.BtnGuardar.Visible = valor;
            this.BtnCancelar.Visible = valor;
            this.BtnEditar.Visible = !valor;
        }

        private void CrearAlertJS(string mensaje)
        {
            Response.Write("<script>alert('" + mensaje + "')</script>");
        }
        #endregion
    }
}