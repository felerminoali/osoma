
<div class="footer">
    <div style="height: 0.5px; width:100%; display:block; overflow: hidden; background-color: #c2cbd4;">

    </div>
    <div class="container">
        <div class="footer-grids">
            <div class="col-md-3 footer-grid about-info">
                <!-- <a href="#"><img src="web/images/logo.png" title="Umbrella" /></a> -->
                <br/>
                <p style="text-align: center">Cimenta o seu futuro com o auxilio do <b>Osoma</b></p>
                <a href="/"><img src="../images/28468.jpg" width="200"/></a>

            </div>
            <div class="col-md-3 footer-grid subscribe">
                <h3>Subscribe </h3>
                <%--<form>--%>
                    <%--<input type="text" placeholder="" required/>--%>
                    <%--<input type="submit" value=""/>--%>
                <%--</form>--%>
                <a href="#">Register</a>
            </div>
            <div class="col-md-3 footer-grid explore">
                <h3>Explore</h3>
                <ul class="col-md-6">
                    <li><a href="#">Online placement Exams</a></li>
                    <%--<li><a href="#">Themecurve</a></li>--%>
                    <%--<li><a href="#">Kreativeshowcase</a></li>--%>
                    <%--<li><a href="#">Freebiescurve</a></li>--%>
                </ul>
                <div class="clearfix"></div>
            </div>



            <div class="col-md-3 footer-grid copy-right">

                <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
                    <ul class="list-unstyled list-inline social text-center">
                        <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-facebook"></i></a></li>
                        <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-twitter"></i></a></li>
                        <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-instagram"></i></a></li>
                    </ul>
                </div>
                <p>Eusmod tempor incididunt ut labore et dolore magna aliqua. ut labore et dolore magna aliqua. </p>
                <%--<p class="copy">Template by <a href="http://w3layouts.com/">w3layouts</a></p>--%>
            </div>
            <div class="clearfix"></div>
            <script type="text/javascript">
                $(document).ready(function () {
                    /*
                     var defaults = {
                     containerID: 'toTop', // fading element id
                     containerHoverID: 'toTopHover', // fading element hover id
                     scrollSpeed: 1200,
                     easingType: 'linear'
                     };
                     */

                    $().UItoTop({easingType: 'easeOutQuart'});

                });
            </script>
            <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
        </div>
    </div>
</div>
<%--footer--%>


<%--start-smoth-scrolling--%>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
        });
    });
</script>
<script type="application/x-javascript"> addEventListener("load", function () {
    setTimeout(hideURLbar, 0);
}, false);
function hideURLbar() {
    window.scrollTo(0, 1);
}
</script>

<script>
    $(function () {
        var pull = $('#pull');
        menu = $('nav ul');
        menuHeight = menu.height();
        $(pull).on('click', function (e) {
            e.preventDefault();
            menu.slideToggle();
        });
        $(window).resize(function () {
            var w = $(window).width();
            if (w > 320 && menu.is(':hidden')) {
                menu.removeAttr('style');
            }
        });
    });
</script>
<!----//End-top-nav-script---->

</body>
</html>