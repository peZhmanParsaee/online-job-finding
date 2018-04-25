<%@ Page Title="" Language="C#" MasterPageFile="~/AllUsers.master" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style>
        #aboutinfo 
        {           
            overflow: hidden;
            color: #444444;
            border: 1px solid #EEEEEE;            
            -webkit-transition: background 1s;
            -o-transition: background 1s;
            -moz-transition: background 1s;            
        }
        #aboutinfo:hover img 
        {
            right: 30%;
            opacity: 1;            
        }
        #aboutinfo:hover
        {
            background: #EEEEEE;            
        }
        #aboutinfo:hover #textinfo 
        {
            right: 100px;opacity: 1;
        }
         #developer
        {  
            -webkit-box-shadow: 10px 10px 42px #999, -10px -10px 42px #999;
            -o-box-shadow: 10px 10px 42px #999, -10px -10px 42px #999;
            -moz-box-shadow: 10px 10px 42px #999, -10px -10px 42px #999;
            height: 140px;
            width: 120px;
            opacity: .3;
            -webkit-transition: all 1s;
            -o-transition: all 1s;
            -moz-transition: all 1s;
            position: relative;            
            display: inline-block;
            border: 1px solid;
            right: -40%;
        }
        #textinfo
        {
            position: relative;
            right: -300px;
            -webkit-transition: all 1s, opacity 2s;
            -moz-transition: all 1s, opacity 2s;
            -o-transition: all 1s, opacity 2s;
             display: inline-block;
             opacity: .1;             
        }
       .alignleft
       {
           text-align: left;
       }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <p id="subject">درباره ما</p>
    <div id="aboutinfo">
        <span id="textinfo">
            <table>
                <tr>
                    <td>
                        طراح و برنامه نويس: 
                    </td>
                    <td>&nbsp;
                        <b>پژمان پارسائي</b>        
                    </td>
                </tr>

                <tr>
                    <td>موبايل: </td>
                    <td class="alignleft">
                        <b>09171106974</b>
                    </td>
                </tr>

                <tr>
                    <td>ايميل 1: </td>
                    <td class="alignleft">
                        <b>p.parsaee@gmail.com</b>        
                    </td>
                </tr>

                <tr>
                    <td>ايميل 2: </td>
                    <td class="alignleft">
                        <b>pezhmanparsaee@yahoo.com</b>    
                    </td>
                </tr>
            </table>
            
            
            
            
        </span>                
        <img src="images/developer.jpg" alt="پژمان پارسائي" id="developer" />                
    </div>
</asp:Content>

