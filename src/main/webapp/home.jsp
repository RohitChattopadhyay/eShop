<%@ page import="eShop.ActiveUserListener" %>
<jsp:include page="header.jsp" />
<jsp:include page="recommendation.jsp" />
<jsp:include page="personalize.jsp" />
<hr>
<center>Currently Active Users : <%=ActiveUserListener.getActiveSessions()%></center>
<br>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

<style>
   .owl-prev, .owl-next {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        display: block !important;        
    }
    .owl-nav{
        display : block !important;
    }
    .owl-next:focus, .owl-prev:focus {outline: none;}
    .owl-prev { left: -2em; }
    .owl-next { right: -2em; }
    .owl-prev i, .owl-next i {
        font-size:3em; 
        color: #fff;
        width:1em;
        height:1em;
        opacity:.8;
        border-radius: 50%;
        border: 1px solid black;
    }
</style>

<script>
    $(document).ready(function () {
        $(".owl-carousel").owlCarousel({
            autoPlay: 3000,
            items: 4,
            itemsDesktop: [1199, 3],
            itemsDesktopSmall: [979, 3],
            center: true,
            nav: true,
            loop: true,
            margin:10,
            autoplay:true,
            autoplayTimeout:5000,
            autoplayHoverPause:true,
            responsive: {
                600: {
                    items: 4
                }
            },
            navText : ['<i class="fa shadow fa-angle-left bg-secondary" aria-hidden="true"></i>','<i class="fa bg-secondary shadow fa-angle-right" aria-hidden="true"></i>']
        });
    });
</script>