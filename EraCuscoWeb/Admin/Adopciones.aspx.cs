using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Text.Json;
using System.Text.Json.Serialization;

namespace EraCuscoWeb.Admin
{
    public partial class Adopciones : System.Web.UI.Page
    {
        DateTime fechaSeleccionada;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public string obtenerDatos()
        {
            List<Mascota> listaAdopciones = new List<Mascota>();
            string jsonString = "{}"; // Por defecto se tiene una lista vacia

            using (Entidades datos = new Entidades())
            {
                listaAdopciones = datos.Mascota.ToList();
                jsonString = JsonSerializer.Serialize(listaAdopciones);

            }
            return jsonString;
        }
    }
}