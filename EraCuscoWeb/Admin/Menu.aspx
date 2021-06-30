<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="EraCuscoWeb.Admin.Menu" %>

<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
Menú Principal
</asp:Content>

<asp:Content ID="Descripcion" ContentPlaceHolderID="Descripcion" runat="server">
Aquí podras gestionar las mascotas en el albergue
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
<script>
    var jsonDatos = <%=obtenerMascotas()%>
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

        <asp:LinkButton id="btNuevaMascota" class="btn btn-primary mx-1" data-toggle="modal" data-target="#modalAgregarMascota" runat="server" OnClientClick="agregar();">
            <i class="fas fa-plus"></i>
            Registrar una mascota
        </asp:LinkButton>

        <asp:Linkbutton id="btActualizar" runat="server" class="btn btn-outline-primary mx-1">
            <i class="fas fa-sync-alt"></i>
            Actualizar lista
        </asp:Linkbutton>

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

        <%--Dialogo de confirmar eliminacion--%>
        <div id="eliminarDialog" class="modal" tabindex="-1" role="dialog">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Está seguro de eliminar</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <p>Al eliminar este registro no se podrá restaurar nunca mas.</p>
              </div>
              <div class="modal-footer">
                <asp:LinkButton runat="server" id="btConfirmarEliminacion" type="button" class="btn btn-danger" OnClick="btConfirmarEliminacion_Click">Eliminar</asp:LinkButton>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
              </div>
            </div>
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
                    <label for="tbId" class="col-sm-2 col-form-label">ID</label>
                    <div class="col-sm-10">
                        <asp:TextBox type="text" class="form-control" runat="server" ID="tbId"></asp:TextBox>
                    </div>  
                </div>
                <div class="form-group row">
                    <label for="tbNombre" class="col-sm-2 col-form-label">Nombre</label>
                    <div class="col-sm-10">
                        <asp:TextBox type="text" class="form-control" runat="server" ID="tbNombre"></asp:TextBox>
                    </div>  
                </div>
                <div class="form-group row">
                    <label for="tbDescripcion" class="col-sm-2 col-form-label">Descripcion</label>
                    <div class="col-sm-10">
                        <asp:TextBox type="text" class="form-control" runat="server" ID="tbDescripcion"></asp:TextBox>
                    </div>  
                </div>
                <div class="form-group row">
					<label for="ddEspecie" class="col-sm-2 col-form-label">Etapa de VIda</label>
					<div class="col-sm-10">
						<asp:DropDownList ID="ddEtapaVida" runat="server" class="col-sm-4 form-control" aria-label="Seleccion de sexo">
                            <asp:ListItem Selected="True" Value="1"> Bebe </asp:ListItem>
							<asp:ListItem Value="2"> Joven</asp:ListItem>
                            <asp:ListItem Value="3"> Adulto </asp:ListItem>
                            <asp:ListItem Value="4"> Anciano </asp:ListItem>
						</asp:DropDownList>
					</div>
                </div>
                <div class="form-group row">
					<label for="ddEspecie" class="col-sm-2 col-form-label">Tipo</label>
					<div class="col-sm-10">
						<asp:DropDownList ID="ddTipo" runat="server" class="col-sm-4 form-control" aria-label="Seleccion de sexo">
                            <asp:ListItem Selected="True" Value="perro"> Perro </asp:ListItem>
							<asp:ListItem Value="gato"> Gato </asp:ListItem>
                            <asp:ListItem Value="pez"> Pez </asp:ListItem>
                            <asp:ListItem Value="conejo"> Conejo </asp:ListItem>
                            <asp:ListItem Value="hamster"> Hamster </asp:ListItem>
                            <asp:ListItem Value="ornitorrinco"> Ornitorrinco </asp:ListItem>
						</asp:DropDownList>
					</div>
                </div>
                <div class="form-group row">
                    <label for="tbRaza" class="col-sm-2 col-form-label">Raza</label>
                    <div class="col-sm-10">
                        <asp:TextBox type="text" class="form-control" runat="server" ID="tbRaza"></asp:TextBox>
                    </div>  
                </div>
                  <%--Campos ocultos--%>
                  <asp:TextBox type="text" class="form-control" runat="server" ID="tbCodigoEliminar" hidden></asp:TextBox>
                  <asp:TextBox type="text" class="form-control" runat="server" ID="tbModo" hidden></asp:TextBox>
                    
				

              <!-- Modal footer -->
              <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                    <asp:Button type="button" class="btn btn-success" ID="btAgregarMascota" runat="server" Text="Guardar Cambios" OnClick="btAgregarMascota_Click"/>
              </div>
            </div>
          </div 
        </form>
        </div>

        <%--Librería datatables--%>
        <script>
            $(document).ready(function () {
                $('#tbMascotas').DataTable({
                    "aaData": jsonDatos,
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
                                return "<div class='column'> <div class='row'><a onclick='llenarDatos(" + meta.row + ")' class='link - primary' data-toggle='modal' data-target='#modalAgregarMascota'> " + data + "</a></div> <div class='row'> <p style='font-size: 12px;'>" + row.tipo + " - " + row.raza + "</p> </div> </div>";
                            }
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
                            "render": function (data, type, row, meta) {
                                return "<div class='d-flex'>" +
                                    "<a onclick='llenarDatos("+ meta.row +")' id='btEditar' class='btn btn-warning mx-1'><i class='fas fa-pencil-alt'></i></a>" +
                                    "<a onclick='eliminarRegistro("+ meta.row +")' id='btEliminar' class='btn btn-danger'><i class='fas fa-trash-alt'></i></a>" +
                                    "<div>";
                            },
                            "orderable": false,
                            "searchable": false
                        }
                    ]
                });
            });

            function llenarDatos(indice) {
                //var elemento = jsonDatos[indice];
                document.getElementById("MainContent_tbId").value = jsonDatos[indice]["id"];
                document.getElementById("MainContent_tbNombre").value = jsonDatos[indice]["nombre"];
                document.getElementById("MainContent_tbDescripcion").value = jsonDatos[indice]["descripcion"];
                document.getElementById("MainContent_ddEtapaVida").value = jsonDatos[indice]["etapaVida"];
                document.getElementById("MainContent_ddTipo").value = jsonDatos[indice]["tipo"];
                document.getElementById("MainContent_tbRaza").value = jsonDatos[indice]["raza"];
                $("#modalAgregarMascota").modal('toggle')

                document.getElementById("MainContent_tbModo").value = "editar";
            }

            function eliminarRegistro(indice) {
                document.getElementById("MainContent_tbCodigoEliminar").value = jsonDatos[indice]["id"];
                $("#eliminarDialog").modal('toggle')
            }

            function agregar() {
                document.getElementById("MainContent_tbModo").value = "crear";
            }
        </script>
</asp:Content>