<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultPageMaster.Master" AutoEventWireup="true" CodeBehind="CategoryDetails.aspx.cs" Inherits="de1.CategoryDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #f5f5f5;
}

.vertical-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    border: 1px solid #ddd;
    padding: 10px;
    margin: 10px;
    width: 200px; /* Điều chỉnh chiều rộng ô */
}

.beverage-list {
    display: flex; /* Sử dụng flexbox để hiển thị theo hàng */
    flex-wrap: wrap; /* Cho phép các mục xuống hàng nếu không đủ chỗ */
    justify-content: flex-start; /* Căn trái cho các mục trong danh sách */
    gap: 20px; /* Khoảng cách giữa các mục */
}

.beverage-item {
    border: 1px solid #ddd; /* Thêm viền cho mỗi mục */
    padding: 10px; /* Khoảng cách bên trong mỗi mục */
    text-align: center; /* Căn giữa văn bản */
    width: 150px; /* Chiều rộng của mỗi mục */
    border-radius: 8px; /* Bo tròn góc cho các mục */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Đổ bóng cho các mục */
    transition: transform 0.2s; /* Hiệu ứng chuyển tiếp khi hover */
}

    .beverage-item:hover {
        transform: scale(1.05); /* Phóng to mục khi hover */
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<body>
    <form id="form1" >
        <div>
            <asp:ListView ID="ListViewBeverages" runat="server" OnPagePropertiesChanging="ListViewBeverages_PagePropertiesChanging">
                <LayoutTemplate>
                    <div class="beverage-list">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                    </div>
                    <asp:DataPager ID="DataPagerBeverages" runat="server" PageSize="5">
                        <Fields>
                            <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowLastPageButton="true" />
                        </Fields>
                    </asp:DataPager>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="beverage-item">
                       <img src='<%# ResolveUrl("~/images/Beverages/" + Eval("ImageFilePath")) %>' alt='<%# Eval("Name") %>' width="100" height="100" />
                        
                        <h4><%# Eval("Name") %></h4>
                        <p><%# Eval("Description") %></p>
                        <p>Price: <%# Eval("Price", "{0:C}") %></p>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </form>


</asp:Content>