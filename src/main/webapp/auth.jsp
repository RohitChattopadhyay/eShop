<jsp:include page="header.jsp">
    <jsp:param name="showNav" value="false" />
</jsp:include>
<style>
    .tab a{        
        text-decoration : none;
    }
</style>
<div class="row text-center pt-5">
   <div class="col-sm-6 border shadow offset-sm-3 pt-2 bg-light">
      <img src="/marketplace/authlogo.png"/>
      <table class="table bg-white table-bordered" style="table-layout: fixed;">
      <tr class="text-center">         
        <%
            if (request.getParameter("register")!=null){%>
                <th class="tab"><a href="/marketplace/auth.jsp">Login</a></th>
                <th class="tab">Register</th>  
            <%}
            else{%>
                <th class="tab">Login</th>
                <th class="tab"><a href="?register">Register</a></th>
            <%}
        %>
      </tr>
      <tr>
         <td colspan=2>
            <%
                if (request.getParameter("register")!=null){%>
                <form method="POST" action="/marketplace/auth/register">
                    <div class="form-group">
                        <label for="username">Email Address</label>
                        <input required type="email" autocomplete="off" class="form-control" id="username" name="username" placeholder="Enter your Email">
                    </div>
                    <div class="form-group">
                        <label for="pswd">Password</label>
                        <input required type="password" autocomplete="off" name="password" class="form-control" id="pswd" placeholder="Enter Password">
                    </div>
                    <div class="form-row pb-2">
                        <label class="d-block col">Gender</label>
                        <div class="custom-control custom-radio custom-control-inline col">
                            <input value="M" required type="radio" id="maleRadio" name="gender" class="custom-control-input">
                            <label class="custom-control-label" for="maleRadio">Male</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline col">
                            <input value="F" required type="radio" id="femaleRadio" name="gender" class="custom-control-input">
                            <label class="custom-control-label" for="femaleRadio">Female</label>
                        </div>
                    </div>
                    <div class="form-row pb-2">
                        <label class="d-block col">Preference</label>
                        <div class="custom-control custom-radio custom-control-inline col">
                            <input value="D" required type="radio" id="discountRadio" name="preference" class="custom-control-input">
                            <label class="custom-control-label" for="discountRadio">More Discounts</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline col">
                            <input value="N" required type="radio" id="freshRadio" name="preference" class="custom-control-input">
                            <label class="custom-control-label" for="freshRadio">Fresh Arrivals</label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-info btn-block">Register</button>
                <%}
                else{%>                
                <form method="POST" action="/marketplace/auth/signin">
                    <div class="form-group">
                        <label for="username">Email Address</label>
                        <input required type="email" autocomplete="off" class="form-control" id="username" name="username" placeholder="Enter your Email">
                    </div>
                    <div class="form-group">
                        <label for="pswd">Password</label>
                        <input required type="password" autocomplete="off" name="password" class="form-control" id="pswd" placeholder="Enter Password">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                <%}
            %>
            </form>
         </td>
      </tr>      
      </table>
   </div>
</div>    
<p class="mt-4 text-center text-danger"><%=request.getParameter("err")!=null?request.getParameter("err"):""%></p>