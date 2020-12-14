<jsp:include page="header.jsp"/>
<style>
    .tab a{        
        text-decoration : none;
    }
    .profile tr th {
        text-align: right
    }
</style>
<div class="row text-center pt-5 mt-5">
   <div class="col-sm-6 border shadow offset-sm-3 pt-2 bg-light">
      <p class="display-4 text-center">Profile</p>
      <table class="table profile bg-white table-bordered">
        <tr>
            <th>Email ID</th>
            <td><%=session.getAttribute("userid")%>
        </tr>      
        <tr>
            <th>Gender</th>
            <td><%=session.getAttribute("gender").equals("M")?"M":"Fe"%>ale</td>
        </tr>      
        <tr>
            <th>Preference</th>
            <td><%=session.getAttribute("preference").equals("D")?"Discounts":"New Arrivals"%>
        </tr>      
      </table>
   </div>
</div>    
<p class="mt-4 text-center text-danger"><%=request.getParameter("err")!=null?request.getParameter("err"):""%></p>