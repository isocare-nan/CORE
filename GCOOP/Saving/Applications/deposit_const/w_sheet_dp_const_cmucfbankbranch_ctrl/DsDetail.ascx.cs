﻿using System;
using CoreSavingLibrary;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Saving.Applications.deposit_const.w_sheet_dp_const_cmucfbankbranch_ctrl
{
    public partial class DsDetail : DataSourceRepeater
    {
        public DataSet1.CMUCFBANKBRANCHDataTable DATA { get; private set; }

        public void InitDs(PageWeb pw)
        {
            //ปิด css1 ตอนรันไทม์ เปลี่ยนไปใช้ css ของเฟรมแทน
            css1.Visible = false;
            //ประกาศ dataset
            DataSet1 ds = new DataSet1();
            //ตั้งค่า property DATA เอา DataTable จาก DataSet มาใช้
            this.DATA = ds.CMUCFBANKBRANCH;
            //ตั้งชื่อ event ItemChanged ในรูปแบบ On<ชื่อ WebUserControl>ItemChanged
            this.EventItemChanged = "OnDsDetailItemChanged";
            //ตั้งชื่อ event ItemChanged ในรูปแบบ On<ชื่อ WebUserControl>ItemChanged
            this.EventClicked = "OnDsDetailClicked";

            //เรียกคำสั่งในคลาสแม่ให้การ init ก่อน
            //argument ที่ 2 ใส่ object ของ WebUserControl 
            //argument ที่ 4 ใส่ชื่อขึ้นต้นตัวเล็ก)
            this.InitDataSource(pw, Repeater1, this.DATA, "dsDetail");

            this.Button.Add("b_delete");

            //เรียกให้คลาสแม่ทำงานอีกครั้ง (เป็นคำสั่งการรวม object ต่างๆ เข้าด้วยกัน)
            this.Register();
        }

        public void Retrieve(String bank_code)
        {
            string sql = @"
                SELECT  * 
            FROM CMUCFBANKBRANCH where bank_code='" + bank_code + "' order by branch_id";
            sql = WebUtil.SQLFormat(sql, state.SsCoopControl, bank_code);
            DataTable dt = WebUtil.Query(sql);
            //ทำยังไงก็ได้ให้ได้ DataTable หรือ Xml String ที่มีข้อมูล แล้วนำมาใช้คำสั่ง ImportData
            this.ImportData(dt);
        }
    }
}