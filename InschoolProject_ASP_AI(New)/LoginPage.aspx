<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="InschoolProject_ASP_AI_New_.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inschool</title>

    <link href="Helper/css/style.default.css" rel="stylesheet" />
    <link href="Helper/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class=" page-holder d-flex align-items-center">

             <div class="container">
                <div class="row align-items-center py-5">
                    <div class="col-5 col-lg-7 mx-auto mb-5 mb-lg-0">
                    
                        <div class="pr-lg-5">
                            <img src="img/Log-in1.jpg" alt="" class="img-fluid" />     
                        </div>
                    </div>
                    <div class="col-lg-5 px-lg-4">
                        <h1 class="text-base text-primary text-uppercase mb-4">Login Here</h1>
                        <h2 class="mb-4">Welcome Back!</h2>

                        <div class ="form-group mb-4">

                            <asp:TextBox ID="txtemail" required= "true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Email" runat="server" ></asp:TextBox>

                        </div>

                             <div class ="form-group mb-4">
                            <asp:TextBox ID="txtpassword" required= "true" TextMode="Password" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Password" runat="server" ></asp:TextBox>
                                 <br />               
                                  <asp:Label ID="erreurMessage"  runat="server"  Text="Incorrect Email Or PassWord " color="#721c24" Font-Names=" Times New Roman, Times, serif"></asp:Label>
                        </div>
                        <div class="form-group mb-4">
                     <!--         <div class="custom-control custom-checkbox">
                               
                                 <asp:CheckBox ID="checkBox1" Text=" Show PassWord" runat="server" />
                            </div>--> 
                        </div>
                        <asp:Button ID = "btnLogin" OnClick="btnLogin_Click"  Text="LOGIN" CssClass="btn btn-primary" Height="50px" Width="400px" runat="server" />
                    </div>
                </div>
               
                
            </div>

        </div>
    </form>
</body>
</html>
