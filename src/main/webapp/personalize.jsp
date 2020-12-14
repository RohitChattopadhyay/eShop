<%@ page import="eShop.Apparel" %>
<%@ page import="java.util.LinkedList" %>
<div class="row">
    <div class="col-12">
        <div class="card border-0">
            <div class="card-body">
                <h4 class="card-title"><%=session.getAttribute("preference").equals("D")?"Discounts":"New Arrivals"%></h4>
                <div class="owl-carousel">
                <%
                    LinkedList<Apparel> results = (LinkedList)request.getAttribute("results");
                    for(Apparel apparel :  results){
                    %>
                        <div class="item">
                            <div class="card">
                                <div class="card-body text-right" style="background-color:<%=apparel.getName().replaceAll(" .*", "")%>">
                                    <h4 class="card-title text-left"><%=apparel.getName()%></h4>
                                    <p class="card-text mb-0 strike"><%=apparel.isDiscounted()?apparel.getCost():"&nbsp;"%></p>
                                    <p class="card-text lead mb-0">Rs <%=apparel.getSellingPrice()%></p>
                                    <span class="badge badge-secondary invisible">Dummy</span>
                                    <%=apparel.isNew()?"<span class='badge badge-success'>New Arrival</span>":""%>
                                    <%=apparel.isDiscounted()?"<span class='badge badge-secondary'>Discounted</span>":""%>
                                </div>
                            </div>
                        </div>                
                    <%}
                %>                             
                </div>
            </div>
        </div>
    </div>
</div>