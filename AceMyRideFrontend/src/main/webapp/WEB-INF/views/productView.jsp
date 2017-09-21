<%@page isELIgnored="false" %>
<%@include file="header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.6/angular.min.js"></script>

<style>
.flex {

  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  margin-top: 50px; 
  
  }



.single{
	border-radius: 5px;
	border: none;
  background:#FCF5ED;
  box-shadow: 0px 0px 49px 14px rgba(188,190,194,0.39);

  overflow: hidden;
  transform: scale(1);
  transition: transform 300ms ease-out;
 
  max-width:250px;
  height:470px;

  
  margin-bottom:50px;
  margin-right:80px;
  margin-left:80px;
  align-items:center;


}

.single:hover{
	transform: scale(1.2);
  transition: transform 300ms ease-out;

  
  box-shadow: 0px 0px 70px 20px rgba(188,190,194,1);
}

.addThis{
	transform: scale(1);
  transition: transform 300ms ease-out;
  

  }

.single:hover .addThis{
	transform: scale(1.2);
  transition: transform 300ms ease-out;
}

.flex > section {
  align-items: center;
  display: flex;
  flex: 1 1 0 ; 
  flex-direction: column;
  text-align: center;
  width: 270px;
}

.flex > section > p {
  flex-grow: 1;
}

@media (max-width: 1600px) {
  .flex > section {  
    max-width: 270px;
  }
}

.flex ul {
  display: flex;
  justify-content: space-between;
}

.flex aside {
  width:100%;
}

img {
  width: 250px;
  height: 250px;
  border-radius: 2px;
}

@media (max-width: 1600px) {
  img{
    width: 250px;
    height: 250px;
  }
}

.container-fluid p{
	font-size: 25px;
  font-weight:700;
}

.flex h2 {
  font-size: 25px;
  font-weight:700;
  margin:10px;
}

.flex h3 {
  color:#909792;
  font-size: 25px;
  font-weight:400;
  margin:10px;
}



.flex > section {
  background: #fff;
  padding: 1em;
  margin: 0.5em;
  border-radius: 4px;
}

.flex button {
  background-color: #dad2bc;
  
  border: 0;  
  border-radius: 4px;
  cursor: pointer;
  color: #252323;  
  font-weight: bold;
  font-size: 15px;
  padding: 1em 2em;
  margin-top:10px;
  display: block;
  width: 100%;
}

.flex button:hover {
  background-color: #252323;
  color:#dad2bc;
}

.sort{
	background-color: #dad2bc;
  
  border: 0;  
  border-radius: 4px;
  cursor: pointer;
  color: #252323;  
  font-weight: bold;
  font-size: 15px;
  margin-right:20px;
  padding: 0.2em 0.8em;
  
}

.sortby{
	margin-top:15px;
	font-size:25px;
	font-weight:300;
}

.sort:hover{
	background-color: #252323;
  color:#dad2bc;
}

.flex ul {
  list-style-type: none;
  padding: 0;
}

.link{
	font-weight: 100;
  padding: 0.3em 0.6em;
 
}

.not-in-stock{
	background-color: #eee;
  font-weight: 700;
  padding: 0.3em 0.6em;
  border-radius: 1em;
  color:#BC2D09;
}

.in-stock{
	background: #eee;
  font-weight: 700;
  padding: 0.3em 0.6em;
  border-radius: 1em;
  color:#057423;
}

.glyphicon-shopping-cart{
	font-size:20px;
}



.flex p{
	font-size: 15px;
  font-weight:200;
  margin:10px;
  text-align:center;
  height:42px;
}

.glyphicon-search{
	width:25px;
}


</style>


<div class="main-content" ng-app="myApp" ng-controller="myCtrl">

<div class="container-fluid">

<div class="row sortby">
  
  <div class="col-md-3">
   <p>{{categoryName}}	</p>
  </div> 
   
<div class="input-group col-md-4">
    <span class="input-group-addon">
        <i class="glyphicon glyphicon-search"></i>
    </span>
    <input type="text"  class="form-control" ng-model="search" placeholder="Search for a particular product.."/>
</div>
  </div>
 
  <div class="row pull-right">
   Arrange By <button class="sort" ng-click="orderByMe('name')">Name</button>
             <button class="sort" ng-click="orderByMe('price')">Price</button>
  </div>
      
 </div>      				
			
<div class="flex">
<div class="list" ng-repeat="item in productList| filter:{name:search}|orderBy:myOrderBy">
 <section>
    <div class="single">
    	<form action="addToCart" method="post">
    	 <input type="hidden" name="productId" id="productID" value="{{item.id}}"/>
    	 <input type="hidden" name="quantity" id="quantity" value="1"/>
      <img src="download?fileName={{item.imagePath}}" alt="ProductName"/>
      <aside>
       <ul>
        <li><h2>{{item.name}}</h2></li>
        <li><h3>{{item.price}}<sup>&#8377</sup></h3></li>
       </ul>
      </aside>
      <p>{{item.description}}</p>
      <aside>
        <ul>
          <li class="link"> <a href="product?id={{item.id}}">View more details</a></li>
           
          <li ng-if="item.inStock != 0" class="in-stock">In Stock</li>
           
           
          <li ng-if="item.inStock ===0 " class="not-in-stock">No Stock</li>
           
        </ul>
        <button type="submit" class="addThis"><span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart</button>
      </aside>
        </form>
        </div>
    </section>
</div> 
</div>
</div>

<script>
var app = angular.module('myApp', []);

 app.controller('myCtrl',function($scope){
 $scope.productList = ${productList};
 $scope.categoryName= ${categoryName};

 $scope.orderByMe=function(x){

		$scope.myOrderBy=x;
	}
 
 });
</script>

<%@include file="footer.jsp" %>

</body>
</html>
