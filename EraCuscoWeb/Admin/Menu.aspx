<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="EraCuscoWeb.Admin.Menu" %>

<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
Menú Principal
</asp:Content>

<asp:Content ID="Descripcion" ContentPlaceHolderID="Descripcion" runat="server">
Aquí podras gestionar las mascotas en el albergue
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--Botonera y acciones--%>
    <div class="d-flex flex-wrap justify-content-center">  

        <asp:Linkbutton runat="server" class="btn btn-primary mx-1">
            <i class="fas fa-plus"></i>
            Agregar una mascota
        </asp:Linkbutton>

        <asp:Linkbutton runat="server" class="btn btn-outline-primary mx-1">
            <i class="fas fa-sync-alt"></i>
            Actualizar lista
        </asp:Linkbutton>

        <div class="col-md-2 mx-1">
                <select class="form-select" aria-label="Default select example">
                <option selected>Todos</option>
                <option value="Perro">Perro</option>
                <option value="Gato">Gato</option>
                <option value="Conejo">Conejo</option>
            </select>
        </div>

        <div class="d-flex mx-1 col-md-4">
            <input class="form-control me-sm-2" type="text" placeholder="Busca algo aquí">
            <asp:Linkbutton runat="server" class="btn btn-secondary" type="submit">
                <i class="fas fa-search"></i>
            </asp:Linkbutton>
        </div>

        <%--Tabla--%>
        <div class="d-flex flex-wrap justify-content-center">
            <asp:GridView runat="server"></asp:GridView>
        </div>
    </div>
</asp:Content>