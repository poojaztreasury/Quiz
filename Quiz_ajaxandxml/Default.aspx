<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <br />
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <strong>
                    <asp:Label ID="BackColor" runat="server" BackColor="#FFFF99" Text="Label"></asp:Label>
                    </strong>
                    <br />
                    <asp:Timer ID="Timer1" runat="server" Interval="1000">
                    </asp:Timer>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="XmlDataSource1">
                <ItemTemplate>
                    
                    Question:
                    <asp:Label ID="descLabel" runat="server" Text='<%# Eval("desc") %>' />
                    <br />
                    <asp:RadioButtonList ID="r1" DataSource='<%#XPathSelect("choices/choice") %>' runat="server" DataTextField="InnerText" DataValueField="InnerText" ToolTip='<%#XPath("@id") %>' AutoPostBack="true" OnSelectedIndexChanged="r1_SelectedIndexChanged">

                    </asp:RadioButtonList>
<br />
                </ItemTemplate>
            </asp:DataList>
            <br />
            <br />
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/XMLFile.xml" XPath="questions/question"></asp:XmlDataSource>
            <br />
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:DataList ID="DataList2" runat="server">
                        <ItemTemplate>
                            <%#Eval("key") %>
                            <%#Eval("value") %> <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Final Answer" Visible="False" BackColor="#99FF33" ForeColor="#006600" />
<br />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
