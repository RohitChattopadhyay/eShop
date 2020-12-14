<%@ page import="eShop.Apparel" %>
<%@ page import="java.util.LinkedList" %>
<jsp:include page="header.jsp" />
<style>
    .gender i {
        font-size : 1.25em
    }
</style>
<div class="row">
    <div class="col-12">
    <%
        LinkedList<Apparel> result = (LinkedList)request.getAttribute("search_result");
        String query = request.getParameter("q");
        if(query==null || result==null){
            %><p class="text-danger lead text-center">Please Enter a Search Query</p><%
        }
        else{
    %>
        <h4>Search results for <strong><%=query%></strong></h4>        
        <table class="table">
            <tr>
                <th></th>
                <th colspan=3>Name</th>
                <th class="text-right">Price</th>
            </tr>
            <%
            if(result.size()==0){
                %><tr><td colspan=5 class="text-center">No results</td></tr><%
            }
            else{
                for(Apparel apparel : result){
                    %>
                    <tr class="text-right">
                        <td class="gender"><%=apparel.getGender().equals("M")?"<i title='Male' class='fas fa-male'></i>":"<i title='Female' class='fas fa-female'></i>"%></td>
                        <td class="text-left"><%=apparel.getName()%></td>
                        <td>
                            <%=apparel.isNew()?"<span class='badge badge-success'>New Arrival</span>":""%>
                            <%=apparel.isDiscounted()?"<span class='badge badge-secondary'>Discounted</span>":""%>
                        </td>
                        <td class="strike text-muted"><%=apparel.isDiscounted()?apparel.getCost():""%></td>
                        <td>Rs <%=apparel.getSellingPrice()%></td>
                    </tr>
                    <%
                }
            }
            %>            
        </table>
        <%}%>
    </div>
</div>