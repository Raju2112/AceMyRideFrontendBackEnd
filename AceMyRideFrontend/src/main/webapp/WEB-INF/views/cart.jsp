<%@include file="header.jsp"%>
<link rel="stylesheet" type="text/css" href="${style}/cart.css">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.6/angular.min.js"></script>
<div class="container main-content" ng-app="myApp">
  <h1 class="text-center heading">Cart</h1>
  <table id="cart" class="table table-hover table-responsive" ng-controller="myController">
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
        	<div>
          <form action="updateCartItem" method="post" data-cart-item-id="{{cartItem.id}}">
          
            <input type="hidden" name="id" value="{{cartItem.id}}">
            <div class="form-group">
            <input type="number" name="quantity" value="{{cartItem.quantity}}" min="0" max="{{cartItem.product.inStock}}" class="form-control">
          	</div>
          </form>
          </div>
          <div class="text-muted">
          	Available:{{cartItem.product.inStock}}
          </div>
        </td>
        <td data-th="Subtotal" class="text-center price">&#8377; {{cartItem.totalPrice}}</td>
        <td class="actions" data-th="actions">
          <span class="btn glyphicon glyphicon-refresh btn-info" ng-click="update(cartItem.id)"></span>
          <span class="btn glyphicon glyphicon-trash btn-danger" ng-click="delete(cartItem.id)"></i></span>
        </tr>
      </tbody>
      <tfoot>
      <tr>
        <td><a href="#" class="btn btn-warning"><i class="glyphicon glyphicon-chevron-left"></i> Continue Shopping</a></td>
        <td colspan="2" class="hidden-xs"></td>
        <td class="hidden-xs text-center price"><strong>Total &#8377; {{cartAmount}}</strong></td>
        <td><a href="checkout" class="btn btn-success btn-block">Checkout <i class="glyphicon glyphicon-chevron-right"></i></a></td>
      </tr>
      </tfoot>
    </table>
  </div>
  <div class='error toast' style='display:none'>Quantity exceeds available units</div>
  <script type="text/javascript">
  
  var app=angular.module('myApp',[]);
  app.controller('myController',  function($scope){
  $scope.cartList=${listCartItems};
  $scope.cartAmount=0;
  $scope.update=function(id){
  var form=$(document).find('form[data-cart-item-id='+id+']');
  if($(form).find('input[name=quantity]').val()<=$(form).find('input[name=quantity]').attr('max'))
  	$(form).submit();
  else{
	 $('.toast').fadeIn(400).delay(3000).fadeOut(400);
	 $(form).find('input[name=quantity]').parent('div').addClass('has-error');
  }
  };
  $scope.delete=function(id){
  if(confirm("Do you really want to permanently remove this item from cart???")){
    var form=$(document).find('form[data-cart-item-id='+id+']');
    $(form).attr('action', 'deleteCartItem');
    $(form).submit();
  }
  };
  for (var i = 0; i < $scope.cartList.length; i++) {
  $scope.cartAmount+=$scope.cartList[i].totalPrice;
  }
  });
  </script>
  <%@include file="footer.jsp"%>
</body>
</html>