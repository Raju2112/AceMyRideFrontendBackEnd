<%@include file="header.jsp"%>
<link rel="stylesheet" type="text/css" href="${style}/cart.css">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.6/angular.min.js"></script>

<style>


.panel {
  border-radius: 5px;
}
label {
  font-weight: 300;
}
.panel-body {
   border: none;
  -webkit-box-shadow: 0px 0px 49px 14px rgba(188,190,194,0.39);
  -moz-box-shadow: 0px 0px 49px 14px rgba(188,190,194,0.39);
  box-shadow: 0px 0px 49px 14px rgba(188,190,194,0.39);
  }


.panel-shipping>.panel-heading .tabs{
  padding: 0;
  
}
.panel-shipping h2{
  font-size: 20px;
  font-weight: 300;
  margin: 30px;
}
.panel-heading {
  color: #848c9d;
  background-color: #252323;
  border-color: #fff;
  text-align:center;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  
  border-bottom: 0px;
  padding: 0px 15px;
}
.panel-shipping .form-group {
  padding: 0 30px;
}
.panel-heading .shipping {
  font-size:20px;
  padding: 20px 30px;
  border-top-left-radius: 5px;
  color:#f5f1ed;
  text-align:left;
}






.panel-shipping input:hover,
.panel-shipping input:focus {
  outline:none;
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
  box-shadow: none;
  border-color: #ccc;
}




.shipping-background{
background-color: #f5f1ed;
}

.btn-shipping {
  background-color: #dad2bc;
  outline: none;
  color: #252323;
  font-size: 14px;
  height: auto;
  font-weight: normal;
  padding: 14px 0;
  text-transform: uppercase;
  border: none;
  border-radius: 0px;
  box-shadow: none;
}
.btn-shipping:hover,
.btn-shipping:focus {
  color: #fff;
  background-color: #252323;
}
</style>



<div class="main-content" ng-app="myApp" ng-controller="myCtrl">
  
<div class="container" >

<h1 class="text-center heading">Checkout</h1>
  <table id="cart" class="table table-hover table-responsive">
    <thead>
      <tr>
        <th style="width:50%">Product</th>
        <th style="width:10%">Price</th>
        <th style="width:8%">Quantity</th>
        <th style="width:22%; text-align:center;">Sub Total</th>
        <th style="width:10%"></th>
      </tr>
    </thead>
    <tbody>
      <tr ng-repeat="cartItem in cartList">
        <td data-th="Product">
        <a href="product?id={{cartItem.product.id}}">
          <div class="row">
            <div class="col-sm-2 hidden-xs"><img src="download?fileName={{cartItem.product.imagePath}}" class="img-responsive img-rounded"></div>
            <div class="col-sm-10 product-detail">
              <h4 class="product-name">{{cartItem.product.brand}} {{cartItem.product.name}}</h4>
              <p class="product-description text-muted">{{cartItem.product.description}}</p>
            </div>
          </div>
          </a>
        </td>
        <td data-th="Price" class="price">&#8377; {{cartItem.product.price}}</td>
        <td data-th="Quantity">
        	<form action="updateCartItem" method="post" data-cart-item-id="{{cartItem.id}}">
        	<input type="hidden" name="id" value="{{cartItem.id}}">
        		<h4 class="product-name">{{cartItem.quantity}}</h4>
          	</form>
        </td>
        <td data-th="Subtotal" class="text-center price">&#8377; {{cartItem.totalPrice}}</td>
      </tr>
    </tbody>
    <tfoot>
                <tr>
                  <td></td>
                  <td colspan="2" class="hidden-xs"></td>
                  <td class="hidden-xs text-center price"><strong>Total &#8377; {{cartAmount}}</strong></td>
                  </tr>
              </tfoot>
  </table>
</div>





<div class="shipping-background">

<div class="container-fluid">
 <div class="row"><label></label></div>
   <div class="row">
    <div class="col-md-6 col-md-offset-3">
      <div class="panel-shipping">
       
          <div class="row">
            <div class="col-xs-5 tabs">
            <div class="panel-heading">
              <div class="shipping">Shipping Address</div>
            </div>
            
          </div>
        </div>
        <div class="panel panel-body">
          <div class="row">
            <div class="col-lg-12">
              <form id="shipping-form" action="payment" method="post" role="form">
                <h2>Please provide Shipping Address</h2>

                  
                 <div class="form-group"> 
                  <select style="width:100%; height:35px;" id="howTo" name="howTo" >
                    <option value="empty" disabled selected>Select one option</option>
                    <option value="given">Select from your addresses</option>
                    <option value="new">Add a new location</option>
                  </select>
                  
                  <select  ng-model="addressSelected" ng-change="BindSelectedData(addressSelected)" data-ng-options="address as address.address for address in addressList" style="width:100%; height:35px; margin-top: 35px;" id="choose" name="shippingAddressId" hidden>
                        <option value="" selected disabled >Select Address</option>
                  </select>  
                 </div>   
             </form>
              <div class="newAddress" id="newAddress" hidden>
              
              <form id="shipping-form" action="payment" method="post" role="form">
              <h2>Address details</h2>
               <div class="row">
                  <div class="col-md-12">
                  
                  <input type="hidden" name="howTo" >
                  <div class="form-group">
                    <textarea name="address" id="address" class="form-control" placeholder="Enter your address...." rows="3" value=""></textarea>
                  </div>
                  </div>
               </div>

                 <div class="row">
                  <div class="col-md-4">
                  <div class="form-group">
                    <input type="text" name="city" id="city" class="form-control" placeholder="City" value="">
                  </div>
                  </div>  
                  <div class="col-md-4">
                  <div class="form-group">
                    <input type="text" name="country" id="country" class="form-control" placeholder="Country" value="">
                  </div>
                  </div> 
                  <div class="col-md-4">
                  <div class="form-group">
                    <input type="text" name="pin" id="pin" class="form-control" placeholder="PIN Code" value="">
                  </div>
                  </div>                 
                 </div>
                  <div class="col-sm-6 col-sm-offset-3">     
                        <input type="submit" name="shipping-submit" id="shipping-submit" class="form-control btn btn-shipping" value="Continue">
                  </div>
                  
                 </form> 
                </div>

                <div class="oldAddress" id="oldAddress" hidden>
                <form id="shipping-form" action="payment" method="post" role="form">
              <h2>Address details</h2>
               <div class="row">
                  <div class="col-md-12">
                  <input type="hidden" name="howTo" >
                  <div class="form-group">
                    <textarea name="address" id="address" class="form-control"  rows="3"  readonly>{{AddressLine}}</textarea>
                  </div>
                  </div>
               </div>

                  <div class="form-group">
                    <input type="hidden" name="id" id="existingAddressId" class="form-control" placeholder="Selected Address Id" value="{{Id}}">
                  </div>

                 <div class="row">
                  <div class="col-md-4">
                  <div class="form-group">
                    <input type="text" name="city" id="city" class="form-control"  value="{{City}}" readonly>
                  </div>
                  </div>  
                  <div class="col-md-4">
                  <div class="form-group">
                    <input type="text" name="country" id="country" class="form-control"  value="{{Country}}" readonly>
                  </div>
                  </div> 
                  <div class="col-md-4">
                  <div class="form-group">
                    <input type="text" name="pin" id="pin" class="form-control"  value="{{Pin}}" readonly>
                  </div>
                  </div>                 
                 </div>
                  <div class="col-sm-6 col-sm-offset-3">     
                        <input type="submit" name="shipping-submit" id="shipping-submit" class="form-control btn btn-shipping" value="Continue">
                  </div>
                  
                  </form>
                </div>

                    

              
              
            </div>
          </div>
        </div>
        
      </div>
    </div>
  </div>
</div>
</div>
</div>
<script>

    document.getElementById('howTo').onchange = function () {
    document.getElementById("choose").hidden = this.value == 'new' || this.value == 'empty';
    document.getElementById("newAddress").hidden = this.value == 'given' || this.value == 'empty';
    document.getElementById("oldAddress").hidden = this.value == 'new' || this.value == 'empty';
    $('input[name=howTo]').val(this.value);
}

var app = angular.module('myApp', []);

 app.controller('myCtrl',function($scope){
 	<c:if test="${empty addressList}">
	 $scope.addressList=[];
 	</c:if>
 	<c:if test="${not empty addressList}">
	 $scope.addressList=${addressList};
	</c:if>
	 $scope.howTo="empty";

 $scope.BindSelectedData=function(addresss){
    $scope.Id=addresss.id
    $scope.AddressLine=addresss.address;
    $scope.Country=addresss.country;
    $scope.Pin=addresss.pin;
    $scope.City=addresss.city;
  }
 
 
 
 
 $scope.cartList=${listCartItems};
 $scope.cartAmount=0;
	for (var i = 0; i < $scope.cartList.length; i++) {
			$scope.cartAmount += $scope.cartList[i].totalPrice;
		}

	});
</script>


</body>
</html>
