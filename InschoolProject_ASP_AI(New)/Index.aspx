<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="InschoolProject_ASP_AI_New_.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                        <!--  <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>-->
                    </div>
     <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2" >
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-4">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                <p class="card-category"><asp:label ID="goday" runat="server"  Text="Nombre des Etudiants"></asp:label></p>
                                                <img src="img/abstract.png" style="float:right;width:50px;height:50px" />
                                            <p class="card-title"> 
                    
                                                  <h7><asp:Label ID="Label01" runat="server" Font-Bold="true" style="margin-top:4px;font-size:20px"></asp:Label><br />
                                                </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"> 
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                           <!--   <i class="fas fa-comments fa-2x text-gray-300"></i>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
 
</asp:Content>
