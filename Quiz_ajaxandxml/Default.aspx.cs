using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ScriptManager1.RegisterAsyncPostBackControl(DataList1);
        Label1.Text = DateTime.Now.ToString();

    }

    public SortedList P_Anslist
    {
        get
        {
            return (SortedList)(ViewState["aa"] ?? new SortedList());
        }

        set
        {
            ViewState["aa"] = value;
        }
    }

    protected void r1_SelectedIndexChanged(object sender, EventArgs e)
    {
        RadioButtonList r = (RadioButtonList)(sender);
        SortedList k = P_Anslist;
        k[r.ToolTip] = r.SelectedValue;
        P_Anslist = k;
        DataList2.DataSource = P_Anslist;
        DataList2.DataBind();

        if(P_Anslist.Count==DataList1.Items.Count)
        {
            Button1.Visible = true;
        }

    }
}