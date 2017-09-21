<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
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


.panel-billing>.panel-heading .tabs{
  padding: 0;
  
}
.panel-billing h2{
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
.panel-billing .form-group {
  padding: 0 30px;
}
.panel-heading .billing {
  font-size:20px;
  padding: 20px 30px;
  border-top-left-radius: 5px;
  color:#f5f1ed;
  text-align:left;
}






.panel-billing input:hover,
.panel-billing input:focus {
  outline:none;
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
  box-shadow: none;
  border-color: #ccc;
}




.billing-background{
background-color: #f5f1ed;
}

.btn-paynow {
  margin:10px;
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
.btn-paynow:hover,
.btn-paynow:focus {
  color: #fff;
  background-color: #252323;
}
</style>




  
<div class="main-content billing-background" ng-app="myApp" ng-controller="myCtrl">



<div class="container-fluid">
 <div class="row"><label></label></div>
   <div class="row">
    <div class="col-md-6 col-md-offset-3">
      <div class="panel-billing">
       
          <div class="row">
            <div class="col-xs-5 tabs">
            <div class="panel-heading">
              <div class="billing">Billing Address</div>
            </div>
            
          </div>
        </div>
        <div class="panel panel-body">
          <div class="row">
            <div class="col-lg-12">
              <form id="how-form" action="doPayment" method="post" role="form">
                <h2>Please provide Billing Address</h2>

                  <input type="hidden" name="address" value="{{newaddress}}">
                  <input type="hidden" name="city" value="{{newcity}}">
                  <input type="hidden" name="country" value="{{newcountry}}">
                  <input type="hidden" name="pin" value="{{newpin}}">
             <input type="hidden" name="id" class="form-control" value="{{Id}}">
                  
                  <input type="hidden" name="paymentMode" value="{{paymentMode}}">
                  <input type="hidden" name="orderId" value="{{orderId}}">
                 <div class="form-group"> 
                  <select style="width:100%; height:35px;" id="howTo" name="howTo">
                    <option value="shipping" selected>Same as Shipping Address</option>
                    <option value="given">Select from your addresses</option>
                    <option value="new">Add a new location</option>
                  </select>
                  
                  <select  ng-model="addressSelected" ng-change="BindSelectedData(addressSelected)" data-ng-options="address as address.address for address in addressList" style="width:100%; height:35px; margin-top: 35px;" id="choose" name="billingAddressId" hidden>
                        <option value="" selected disabled >Select Address</option>
                  </select>  
                 </div>   
               </form>
              <div class="newAddress" id="newAddress" hidden>
              
              <form id="new-form" action="doPayment" method="post" role="form">
              <h2>Address details</h2>
               <div class="row">
                  <div class="col-md-12">
                  <input type="hidden" name="id" class="form-control" value="{{Id}}">
                  <input type="hidden" name="howTo" >
                  <input type="hidden" name="paymentMode" value="{{paymentMode}}">
                  <input type="hidden" name="orderId" value="{{orderId}}">
                  <div class="form-group">
                    <textarea name="address" id="address" class="form-control" placeholder="Enter your address...." rows="3" value="" ng-model="newaddress"></textarea>
                  </div>
                  </div>
               </div>

                 <div class="row">
                  <div class="col-md-4">
                  <div class="form-group">
                    <input type="text" name="city" id="city" class="form-control" placeholder="City" value="" ng-model="newcity">
                  </div>
                  </div>  
                  <div class="col-md-4">
                  <div class="form-group">
                    <input type="text" name="country" id="country" class="form-control" placeholder="Country" value="" ng-model="newcountry">
                  </div>
                  </div> 
                  <div class="col-md-4">
                  <div class="form-group">
                    <input type="text" name="pin" id="pin" class="form-control" placeholder="PIN Code" value="" ng-model="newpin">
                  </div>
                  </div>                 
                 </div>

                  </form>
                
                </div>

                <div class="oldAddress" id="oldAddress" hidden>
                <form id="old-form" action="doPayment" method="post" role="form">
              <h2>Address details</h2>
               <div class="row">
                  <div class="col-md-12">
                  <input type="hidden" name="howTo" >
                  <input type="hidden" name="paymentMode" value="{{paymentMode}}">
                  <input type="hidden" name="orderId" value="{{orderId}}">
                  
                  <input type="hidden" name="address" value="{{newaddress}}">
                  <input type="hidden" name="city" value="{{newcity}}">
                  <input type="hidden" name="country" value="{{newcountry}}">
                  <input type="hidden" name="pin" value="{{newpin}}">
                  
                  <div class="form-group">
                    <textarea name="address" id="addressOld" class="form-control"  rows="3"  readonly>{{AddressLine}}</textarea>
                  </div>
                  </div>
               </div>

                  <div class="form-group">
                    <input type="hidden" name="id" id="existingAddressId" class="form-control" placeholder="Selected Address Id" value="{{Id}}">
                  </div>

                 <div class="row">
                  <div class="col-md-4">
                  <div class="form-group">
                    <input type="text" name="city" id="cityOld" class="form-control"  value="{{City}}" readonly>
                  </div>
                  </div>  
                  <div class="col-md-4">
                  <div class="form-group">
                    <input type="text" name="country" id="countryOld" class="form-control"  value="{{Country}}" readonly>
                  </div>
                  </div> 
                  <div class="col-md-4">
                  <div class="form-group">
                    <input type="text" name="pin" id="pinOld" class="form-control"  value="{{Pin}}" readonly>
                  </div>
                  </div>                 
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


  <div class="container-fluid">
  <form id="payment-form" action="doPayment"  method="post" role="form">
 <div class="row"><label></label></div>
   <div class="row">
    <div class="col-md-6 col-md-offset-3">
      <div class="panel-billing">
       
          <div class="row">
            <div class="col-xs-5 tabs">
            <div class="panel-heading">
              <div class="billing">Payment</div>
            </div>
            
          </div>
        </div>
        <div class="panel panel-body">
        
          <div class="row">
            <div class="col-lg-12">
                
                <div class="row">
                 <div class="col-md-7"> 
                 
                   <h2>Select Payment Method</h2>
                 </div>
                    
                </div> 
     
      			
				<div class="row">
                  <input type="hidden" name="id" class="form-control" value="{{Id}}">
                  <input type="hidden" name="howTo" > 
                  <input type="hidden" name="orderId" value="{{orderId}}">
                  <input type="hidden" name="address" value="{{newaddress}}">
                  <input type="hidden" name="city" value="{{newcity}}">
                  <input type="hidden" name="country" value="{{newcountry}}">
                  <input type="hidden" name="pin" value="{{newpin}}">
                  
                 <div class="col-md-4">  
                 <div class="form-group">                    
                    <input type="radio" name="paymentMode" value="2" ng-model="paymentMode"> Cash On Delivery
                 </div>
                 </div>
                  
                 <div class="col-md-4">  
                 <div class="form-group">                    
                    <input type="radio" name="paymentMode" value="1" ng-model="paymentMode"> Debit Card 
                 </div>
                 </div>
                 
                 <div class="col-md-4">  
                 <div class="form-group">                    
                    <input type="radio" name="paymentMode" value="3" ng-model="paymentMode"> Netbanking
                 </div>
                 </div>  
                </div>  
                
                
                   
  				

                 <div ng-switch="paymentMode">
                  <div ng-switch-when="2">
                    <p>You can pay for Cash on Delivery orders by cash at all locations and by Credit/Debit card in select locations. Please check with the delivery associate if you can pay by card. We accept Visa, MasterCard, Maestro and Rupay debit and credit cards from all banks.</p>

                    <div class="col-sm-6 col-sm-offset-3">     
                        <input type="submit" name="paynow-submit" id="paynow-submit" class="form-control btn btn-paynow" value="Submit">
                    </div>
                  </div>
                 </div>  

                 <div ng-switch="paymentMode">
                   <div ng-switch-when="1">
                    <h2>Debit card details<img style="width:250px;margin-left:170px;" ng-src="${image}/payment.png"></h2>
                        <div class="row">
                            <div class="col-md-10 col-md-offset-1">
                                <div class="form-group">
                                      <input type="text" name="cardNumber" class="form-control" placeholder="Card Number                   ---  ---  ---  --- / ---  ---  ---  --- / ---  ---  ---  --- / ---  ---  ---  ---">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-md-offset-1">
                                <div class="form-group">
                                    <input type="text" name="expiry" class="form-control" placeholder="Expiry MM/YY">
                                </div>
                            </div>
                            <div class="col-md-4 col-md-offset-2">
                                  <div class="form-group">
                                      <input type="text" name="cvv" class="form-control" placeholder="CVV">
                                  </div>
                              </div>
                        </div>
                        <div class="row">
                            <div class="col-md-7 col-md-offset-1">
                              <div class="form-group">
                                  <input type="text" name="nameOnCard" class="form-control" placeholder="Name on card">
                              </div>
                            </div>
                        </div>

                         <div class="col-sm-6 col-sm-offset-3">     
                           <input type="submit" name="paynow-submit" id="paynow-submit" class="form-control btn btn-paynow" value="Pay Now">
                         </div>  

                      </div>
                    </div>

                     <div ng-switch="paymentMode">
                   <div ng-switch-when="3">
                    <h2>Netbanking</h2>
                        
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <select style="width:100%; height:35px;">
                                      <option value="" disabled selected>Choose bank</option>
                                      <option value="sbi">State Bank Of India</option>
                                      <option value="pnb">Punjab National Bank</option>
                                      <option value="kotak">Kotak Mahindra Bank</option>
                                      <option value="axis">Axis Bank</option>
                                      <option value="icici">ICICI Bank</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-5">
                                  <div class="form-group">
                                      <input type="text" name="accNumber" class="form-control" placeholder="Customer ID">
                                  </div>
                              </div>
                        
                            <div class="col-md-3">
                              <div class="form-group">
                                  <input type="text" name="accPin" class="form-control" placeholder="Pin">
                              </div>
                            </div>
                        </div>

                         <div class="col-sm-6 col-sm-offset-3">     
                           <input type="submit" name="paynow-submit" id="paynow-submit" class="form-control btn btn-paynow" value="Pay Now">
                         </div>
                      </div>
                    </div>

                    

              
              
            </div>
          </div>
        </div>
        
      </div>
    </div>
  </div>
  </form>
</div>





</div>
<script>

    document.getElementById('howTo').onchange = function () {
    document.getElementById("choose").hidden = this.value == 'new' || this.value == 'shipping';
    document.getElementById("newAddress").hidden = this.value == 'given' || this.value == 'shipping';
    document.getElementById("oldAddress").hidden = this.value == 'new' || this.value == 'shipping';
    $('input[name=howTo]').val(this.value);
    
  }
    
    

var app = angular.module('myApp', []);

 app.controller('myCtrl',function($scope){
 $scope.addressList =${addressList};
 $scope.orderId=${orderId};
 $scope.howTo="shipping";

 $scope.BindSelectedData=function(addresss){
    $scope.Id=addresss.id
    $scope.AddressLine=addresss.address;
    $scope.Country=addresss.country;
    $scope.Pin=addresss.pin;
    $scope.City=addresss.city;
  }
 });



</script>


<%@include file="footer.jsp" %>


</body>
</html>