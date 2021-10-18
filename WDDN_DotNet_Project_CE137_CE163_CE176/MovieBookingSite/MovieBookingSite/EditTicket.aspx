<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditTicket.aspx.cs" Inherits="MovieBookingSite.EditTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <title></title>

    <link
        rel="stylesheet"
        href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
        crossorigin="anonymous" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&family=Poppins:wght@200&family=Roboto&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet" />

    <style>
        body {
            background-image: linear-gradient(to top,black,30%,transparent),url(Styles/images/theaterbg2.jpg);
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
            width: 100%;
            height: 100vh;
            font-family: 'Poppins';
            font-weight: 400;
        }

        .create_container {
            width: 100%;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .create_box {
            width: 35vw;
            height: 90vh;
            border-radius: 2%;
            background-color: #889EAF;
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: 0.3s;
        }

            .create_box:hover {
                transform: scale(1.01);
                box-shadow: 0 0 0 2px white;
            }

        .create_title {
            font-size: 2rem;
            margin-top: 2vh;
            color: white;
        }



        .text_input {
            background-color: #303245;
            color: white;
            border-radius: 15px;
            width: 25vw;
            border: none;
            padding: 1.6vw;
            margin-top: 3vh;
            height: 2vh;
            font-size: 1.5rem;
        }

            .text_input:focus {
                outline: none;
                border: none;
            }

        .file_upload {
            cursor: pointer;
        }

            .file_upload input {
                top: 0;
                left: 0;
                margin: 0;
                opacity: 0;
                filter: alpha(opacity=0);
            }

        .camera_icon {
            font-size: 2rem;
            margin-top: 3vh;
            margin-left: 6.5vw;
        }

        .title_text {
            font-family: 'Poppins';
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div>
            <div class="create_container">
                <div class="create_box">
                    <asp:TextBox ID="movie_name" CssClass="text_input" AutoPostBack="true" OnTextChanged="movie_name_TextChanged"  runat="server"></asp:TextBox><br />
                    <asp:TextBox ID="movie_desc" CssClass="text_input" AutoPostBack="true" OnTextChanged="movie_desc_TextChanged" runat="server"></asp:TextBox><br />
                    <asp:TextBox ID="silver_price" CssClass="text_input" AutoPostBack="true"  OnTextChanged="silver_price_TextChanged" runat="server"></asp:TextBox><br />
                    <asp:TextBox ID="gold_price" CssClass="text_input" AutoPostBack="true" OnTextChanged="gold_price_TextChanged" runat="server"></asp:TextBox><br />
                    <asp:TextBox ID="platinum_price" CssClass="text_input" AutoPostBack="true" OnTextChanged="platinum_price_TextChanged" runat="server"></asp:TextBox><br />
                    <asp:FileUpload ID="movie_poster" runat="server" /><br />
                    <asp:Button ID="Update_btn" CssClass="btn btn-primary w-25 mt-3 p-3" OnClick="HandleUpdate" runat="server" Text="Update!" />
                </div>
                </div>
        </div>
    </form>
</body>
</html>
