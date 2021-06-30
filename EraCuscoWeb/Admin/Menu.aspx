<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="EraCuscoWeb.Admin.Menu" %>

<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
Menú Principal
</asp:Content>

<asp:Content ID="Descripcion" ContentPlaceHolderID="Descripcion" runat="server">
Aquí podras gestionar las mascotas en el albergue
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
<script>
    var jsonMascotas = <%=obtenerMascotas()%>
    var etapas = {
        1: "Bebé",
        2: "Joven",
        3: "Adulto",
        4: "Anciano",
    }
    var estados= {
        0: "Adoptado",
        1: "Disponible"
    }

</script>

    <%--Botonera y acciones--%>
    <div class="d-flex flex-wrap justify-content-center">

        <asp:LinkButton id="btNuevaMascota" class="btn btn-primary mx-1" data-toggle="modal" data-target="#modalAgregarMascota" runat="server" OnClientClick="return false;">
            <i class="fas fa-plus"></i>
            Registrar una mascota
        </asp:LinkButton>

        <asp:Linkbutton id="btActualizar" runat="server" class="btn btn-outline-primary mx-1">
            <i class="fas fa-sync-alt"></i>
            Actualizar lista
        </asp:Linkbutton>

        <div class="d-flex mx-1 col-md-4">
            <asp:TextBox id="tbBusqueda" runat="server" class="form-control me-sm-2" placeholder="Busca algo aquí"/>
            <asp:Linkbutton runat="server" class="btn btn-secondary" type="submit">
                <i class="fas fa-search"></i>
            </asp:Linkbutton>
        </div>

        <%--Tabla--%>
        <div class="d-flex flex-wrap justify-content-center">
            <div class="card p-3 my-5 carta">
                <table id="tbMascotas" class="table">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Foto</th>
                            <th>Mascota</th>
                            <th>Etapa de vida</th>
                            <th>Estado</th>   
                            <th>Fecha de registro</th>
                            <th>Usuario registrador</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>

        <!-- El Modal -->
        <div class="modal" id="modalAgregarMascota">
        <form>
          <div class="modal-dialog">
            <div class="modal-content">
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title">Agregar Mascota</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              <!-- Modal body -->
              <div class="modal-body">
                
                    <div class="form-group row">
					    <label for="ddEspecie" class="col-sm-2 col-form-label">Tipo</label>
					    <div class="col-sm-10">
						    <asp:DropDownList ID="ddEspecie" runat="server" class="col-sm-4 form-control" aria-label="Seleccion de sexo">
							    <asp:ListItem Selected="True" Value="perro"> Perro </asp:ListItem>
							    <asp:ListItem Value="gato"> Gato </asp:ListItem>
                                <asp:ListItem Value="conejo"> Conejo </asp:ListItem>
                                <asp:ListItem Value="ave"> Ave </asp:ListItem>
                                <asp:ListItem Value="hamster"> Hamster </asp:ListItem>
						    </asp:DropDownList>
					    </div>
                    </div>
					<div class="form-group row">
						<label for="tbNombre" class="col-sm-2 col-form-label">Nombre</label>
						<div class="col-sm-10">
                            <asp:TextBox type="text" class="form-control" runat="server"
                                ID="tbNombre"
                                placeholder="Nombre de la mascota"></asp:TextBox>
						</div>
					</div>
					<div class="form-group row">
					    <label for="ddSexo" class="col-sm-2 col-form-label">Sexo</label>
					    <div class="col-sm-10">
						    <asp:DropDownList ID="ddSexo" runat="server" class="col-sm-4 form-control" aria-label="Seleccion de sexo">
							    <asp:ListItem Selected="True" Value="Hembra"> Hembra </asp:ListItem>
							    <asp:ListItem Value="Macho"> Macho </asp:ListItem>
						    </asp:DropDownList>
					    </div>
                    </div>
                    <div class="form-group row">
					    <label for="ddEtapaVida" class="col-sm-2 col-form-label">Etapa de vida</label>
					    <div class="col-sm-10">
						    <asp:DropDownList ID="ddEtapaVida" runat="server" class="col-sm-4 form-control" aria-label="Seleccion de sexo">
							    <asp:ListItem Selected="True" Value="bebe"> Bebé </asp:ListItem>
							    <asp:ListItem Value="joven"> Joven </asp:ListItem>
                                <asp:ListItem Value="adulto"> Adulto </asp:ListItem>
                                <asp:ListItem Value="adulto_mayor"> Adulto mayor </asp:ListItem>
						    </asp:DropDownList>
					    </div>
                    </div>
                    <div class="form-group row">
						<label for="tbRaza" class="col-sm-2 col-form-label">Raza</label>
						<div class="col-sm-10">
							<asp:TextBox type="text" class="form-control" runat="server"
                                ID="tbRaza"
                                placeholder="Raza ejm. Cocker, Pastor Alemán, Angora..."></asp:TextBox>
						</div>
					</div>
                    <div class="form-group row">
						<label for="caFechaNacimiento" class="col-sm-2 col-form-label">Fecha. de Nacimiento</label>
						<div class="col-sm-10">
						    <input type="date" runat="server" ID="caFechaNacimiento"/>
                        </div>
					</div>
                    <div class="form-group row">
						<label for="tbDescripcion" class="col-sm-2 col-form-label">Descripción</label>
						<div class="col-sm-10">
							<asp:TextBox type="text" class="form-control" runat="server"
                                ID="tbDescripcion"
                                placeholder="Escriba una descripción de la mascota"></asp:TextBox>
						</div>
					</div>
                    <div class="form-group row">
						<label for="tbDescripcion" class="col-sm-2 col-form-label">Disponibilidad</label>
						<div class="col-sm-10">
                            <asp:RadioButton runat="server" GroupName="rbDisponibilidad" Text="Disponible"/>
                            <asp:RadioButton runat="server" GroupName="rbDisponibilidad" Text="No disponible"/>
                        </div>
                    </div>
                    
				
              </div>
              <!-- Modal footer -->
              <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                    <asp:Button type="button" class="btn btn-success" ID="btAgregarMascota" runat="server" Text="Agregar Mascota" />
              </div>
            </div>
          </div 
        </form>
        </div>

        <%--Librería datatables--%>
        <script>
            $(document).ready(function () {
                $('#tbMascotas').DataTable({
                    "aaData": jsonMascotas,
                    /*
                    < th > Código</th >
                    <th>Foto</th>
                    <th>Mascota</th>
                    <th>Etapa de vida</th>
                    <th>Estado</th>   
                    <th>Fecha de registro</th>
                    <th>Usuario registrador</th>
                    <th>Acciones</th>
                    */
                    "aoColumns": [
                        { "data": "id" },
                        {
                            "data": "rutaFoto", "render": function (data) {
                                return `<img style="height: 100px; border-radius: 5px" src='${data}'></img>`
                            },
                            "orderable": false,
                            "searchable": false
                        },
                        {
                            "data": "nombre",
                            "render": function (data, type, row, meta) {
                                return "<div class='column'> <div class='row'><a class='link - primary' data-toggle='modal' data-target='#modalAgregarMascota'> " + data + "</a></div> <div class='row'> <p style='font-size: 12px;'>" + row.tipo + " - " + row.raza + "</p> </div> </div>";
                            },
                            "orderable": false,
                            "searchable": false
                        },
                        {
                            "data": "etapaVida",
                            "render": function (data) {
                                return etapas[data];
                            }
                        },
                        {
                            "data": "estado",
                            "render": function (data) {
                                switch (data) {
                                    case 0:
                                        return "<span class='badge rounded-pill bg-danger'>Adoptado</span>";
                                        break;
                                    case 1:
                                        return "<span class='badge rounded-pill bg-success'>Disponible</span>";
                                        break;
                                }
                            }
                        },
                        { "data": "fechaRegistro" },
                        { "data": "usuarioNombre" },
                        {
                            "render": function (data) {
                                return "<div class='d-flex'>" +
                                    "<button id='btEditar' class='btn btn-warning mx-1'><i class='fas fa-pencil-alt'></i></button>" +
                                    "<button id='btEliminar' class='btn btn-danger'><i class='fas fa-trash-alt'></i></button>" +
                                    "<div>";
                            }
                        }
                    ]
                });
            });


        </script>
</asp:Content>