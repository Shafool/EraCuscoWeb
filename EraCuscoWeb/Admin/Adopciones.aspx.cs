using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EraCuscoWeb.Admin
{
    public partial class Adopciones : System.Web.UI.Page
    {
        DateTime fechaSeleccionada;
        protected void Page_Load(object sender, EventArgs e)
        {
            listar();
        }

        private void listar()
        {
            using (BD_EraCuscoEntities1 entidades = new BD_EraCuscoEntities1())
            {
                gridView.DataSource = entidades.Mascota.ToList();
                gridView.DataBind();
            }
        }
    }
}