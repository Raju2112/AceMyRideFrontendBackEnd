<%@include file="header.jsp" %>
	<div class="container main-content">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>

			<div class="carousel-inner">
				<div class="item active">
					<img src="${image}/slideshow-image1.jpg" >
				</div>

				<div class="item">
					<img src="${image}/slideshow-image2.jpg" >
				</div>

				<div class="item">
					<img src="${image}/slideshow-image3.jpg" >
				</div>

				<div class="item">
					<img src="${image}/slideshow-image4.jpg" >
				</div>
			</div>

			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="categories">
				<div class="category-row">
					<div class="category">
						<img src="${image}/helmets.png" class="category-image">
						<div class="category-discription">
							<div class="category-title">
								Helmets
							</div>
							<div class="category-info">
								Find best quality helmets at reasonable price
							</div>
						</div>
					</div>
					<div class="category">
						<img src="${image}/indicators.jpg" class="category-image">
						<div class="category-discription">
							<div class="category-title">
								Indicators
							</div>
							<div class="category-info">
								Find best quality indicators at reasonable price
							</div>
						</div>
					</div>
					<div class="category">
						<img src="${image}/helmets.png" class="category-image">
						<div class="category-discription">
							<div class="category-title">
								Helmets
							</div>
							<div class="category-info">
								Find best quality helmets at reasonable price
							</div>
						</div>
					</div>
					<div class="category">
						<img src="${image}/helmets.png" class="category-image">
						<div class="category-discription">
							<div class="category-title">
								Helmets
							</div>
							<div class="category-info">
								Find best quality helmets at reasonable price
							</div>
						</div>
					</div>
					<div class="category">
						<img src="${image}/helmets.png" class="category-image">
						<div class="category-discription">
							<div class="category-title">
								Helmets
							</div>
							<div class="category-info">
								Find best quality helmets at reasonable price
							</div>
						</div>
					</div>
					<div class="category">
						<img src="${image}/helmets.png" class="category-image">
						<div class="category-discription">
							<div class="category-title">
								Helmets
							</div>
							<div class="category-info">
								Find best quality helmets at reasonable price
							</div>
						</div>
					</div>
				</div>
				
				</div>
		</div>
	</div>
	
	
	<%@include file="footer.jsp" %>

<script>
if(${enabled}==false)
	alert("Welcome back. Your account has been reactivated");
</script>
	
</body>
</html>
