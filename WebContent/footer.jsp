<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<footer id="footer">
		<div class="container">
			<div class="f1">
				<div class="col-xs-12 col-sm-3">
					<div class="tit-boxmain">
						<h3><span>Phụ kiện Bijing</span></h3>
					</div>
					<div class="ct-boxft1">
						<p><span>Chúng tôi chỉ bán hàng chính hãng</span></p>
					</div>
				</div>
				<div class="col-xs-12 col-sm-2">
					<div class="tit-boxmain">
						<h3><span>Về chúng tôi</span></h3>
					</div>
					<div class="ct-boxft1">
						<ul>
							<li><a href="">Giới thiệu</a></li>
							<li><a href="">Chính sách & Quy định</a></li>
						</ul>
					</div>
				</div>
				<div class="col-xs-12 col-sm-2">
					<div class="tit-boxmain">
						<h3><span>Hỗ trợ</span></h3>
					</div>
					<div class="ct-boxft1">
						<ul>
							<li><a href="">Chính sách vận chuyển</a></li>
							<li><a href="">Chính sách thanh toán</a></li>
							<li><a href="">Bản đồ</a></li>
						</ul>
					</div>
				</div>
				<div class="col-xs-12 col-sm-2">
					<div class="tit-boxmain">
						<h3><span>Mạng xã hội</span></h3>
					</div>
				</div>
				<div class="col-xs-12 col-sm-3">
					<div class="tit-boxmain">
						<h3><span>Facebook</span></h3>
					</div>
				</div>
			</div>
		</div>
		
	</footer>
<div class="copyright">
		<div class="container">
			<p>Copyright © 2016 <a href="http://themeviet.org/" target="_blank">Themeviet.org</a>. All Rights Reserved.</p>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript">
		$(".discart").hover(function(){
			$(".top-cart-content").css("display","block");
		}, function(){
			$(".top-cart-content").css("display","none");
		});
	</script>
	<script src="lib/slider/jquery.nivo.slider.pack.js" type="text/javascript"></script>
	<script type="text/javascript"> 
		$(window).load(function() {
		    $('#slider').nivoSlider(); 
		}); 
	</script>

	<!-- Owl Carousel Assets -->
	<script src="lib/owlcarousel/owl.carousel.js"></script>
	<script>
    $(document).ready(function() {
      	$("#slider-tintuc").owlCarousel({
      		autoPlay: 3000,
	      	navigation : true,
	      	slideSpeed : 300,
	      	paginationSpeed : 400,
	      	singleItem : true
      	});
      	$("#spmoi").owlCarousel({
      		autoPlay: 3000,
      		// items : 4,
	       //  itemsDesktop : [1199,3],
	       //  itemsDesktopSmall : [979,3],
	       //  itemsMobile : [768,2]
	       	itemsCustom : [
		        [0, 2],
		        [600, 3],
		        [1200, 4],
		    ],
      	});
	});
    </script>

    <script type="text/javascript">
    	// hidden-show children menu
		$(document).ready(function () {
		    //use event delegation since classes are changed dynamically
		    $('.ulspmobi').on('click', '.iconlist', function () {
		        //remove the show class and assign hidden
		        $(this).toggleClass('iconlist1 iconlist');
		        //the subfield is a child of the parent not the next sibling
		        $(this).siblings('ul.mnboxl_1').show('slow');
		    });
		    $('.ulspmobi').on('click', '.iconlist1', function () {
		        $(this).toggleClass('iconlist1 iconlist');
		        $(this).siblings('ul.mnboxl_1').hide('slow');
		    });
		});
    </script>
</html>    