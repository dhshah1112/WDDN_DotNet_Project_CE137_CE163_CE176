<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateMovie.aspx.cs" Inherits="MovieBookingSite.CreateMovie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Movie</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <link
        rel="stylesheet"
        href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
        crossorigin="anonymous" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&family=Poppins:wght@200&family=Roboto&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

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
            height: 70vh;
            border-radius: 2%;
            background-color: #889EAF;
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: 0.3s;
        }

            .create_box:hover {
                transform: scale(1.1);
                box-shadow: 0 0 0 2px white;
            }

        .create_title {
            font-size: 2rem;
            margin-top: 3vh;
            color: white;
        }



        .text_input {
            background-color: #303245;
            color: white;
            border-radius: 2%;
            width: 25vw;
            border: none;
            padding: 3vw;
            margin-top: 3vh;
            height: 3vh;
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
            margin-top:3vh;
            margin-left:6.5vw;
        }
        .title_text
        {
            font-family:'Poppins';
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="create_container">
            <div class="create_box">
                <h1 class="create_title">Create Movie</h1>
                <asp:TextBox CssClass="text_input" ID="movie_name" placeholder="Movie Name" runat="server"></asp:TextBox>
                <asp:TextBox CssClass="text_input" ID="movie_description" placeholder="Movie description" runat="server"></asp:TextBox>
                <label class="file_upload">
                    <i class="fas fa-camera camera_icon"><span class="title_text"> Upload Poster</span></i>
                    <asp:FileUpload ID="movie_poster" runat="server" />
                </label>
                <asp:Button ID="Create" CssClass="btn btn-primary w-25 mt-4 p-3" runat="server" OnClick="HandleCreateMovie" Text="Create" />
            </div>
        </div>
        <%--<div>
            <asp:TextBox ID="movie_name" placeholder="Movie Name" runat="server"></asp:TextBox>
            <asp:FileUpload ID="movie_poster" runat="server" />
            <asp:TextBox ID="movie_description" placeholder="Movie description" runat="server"></asp:TextBox>
            <asp:Button ID="Create" runat="server" OnClick="HandleCreateMovie" Text="Create" />
        </div>--%>
    </form>
</body>
</html>
