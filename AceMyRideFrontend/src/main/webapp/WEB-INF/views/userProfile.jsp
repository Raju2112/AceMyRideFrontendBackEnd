<%@include file="header.jsp" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>



  <style>
.menu-item.active {
  background-color: #D6D0DB;
}

.border-right {
  border-right-style: solid;
  border-right-width: 1px;
  border-right-color: grey;
}

.fa-user-circle {
  color: #6F06B8;
}

.fa-unlock {
  color: #8EBD10;
}

.fa-history {
  color: #76766D;
}

.fa-map-marker {
  color: #B12515;
}

.fa-credit-card-alt {
  color: #EBA219;
}
.fa-ban{
color: red;
}
.fa {
  size: 20px;
}

.general {
  font-size: 20px;
  border-bottom-style: solid;
  border-bottom-width: 1px;
  border-bottom-color: grey;
}

.general-without-border {
  font-size: 20px;
}

.contents {
  padding-right: 50px;
}

.content-head {
margin-top:10px;
  font-size: 22px;
  color: black;
  background-color: #C2D8D6;
  border-bottom-style: solid;
  border-bottom-width: 0.75px;
  border-bottom-color: #5E6362;
}

.view {
  border-bottom-style: solid;
  border-bottom-width: 0.5px;
  border-bottom-color: #BBC2C1;
}

.update {
  display:none;
  background-color: white;
  border-bottom-style: solid;
  border-bottom-width: 0.5px;
  border-bottom-color: #BBC2C1;
}

.parameter {
  padding-top: 16px;
  width: 200px;
  font-size: 15px;
  color: #434645;
}

.paramvalue {
  padding-top: 15px;
  width: 200px;
  font-size: 15px;
  color: #6C6F6E;
}

.new-parameter {
  padding-top: 14px;
  padding-bottom: 15px;
  width: 200px;
  font-size: 15px;
  color: #434645;
}

.new-paramvalue {
  padding-top: 13px;
  width: 200px;
  font-size: 15px;
  color: #6C6F6E;
}

.new-edit-link {
  padding-top: 10px;
}

.fa-pencil {
  font-size: 15px;
  color: #094F8C;
}

.fa-times {
  font-size: 15px;
  color: #094F8C;
}

.passForm {
  padding-left: 30px;
  border-bottom-style: solid;
  border-bottom-width: 0.5px;
  border-bottom-color: #BBC2C1;

}
</style>


  <div class="main-content container-fluid">

    <div class="row">

      <div class="col-md-3">
        <div class="border-right">

          <div class="general menu-item active" data-target="details">
            <i class="fa fa-user-circle" aria-hidden="true"></i>General
            Details
          </div>
          <div class="general menu-item" data-target="changePass">
            <i class="fa fa-unlock" aria-hidden="true"></i>Change Password
          </div>
          <div class="general menu-item" data-target="orders">
            <i class="fa fa-history" aria-hidden="true"></i>Your Orders
          </div>
          <div class="general menu-item" data-target="address">
            <i class="fa fa-map-marker" aria-hidden="true"></i>Manage Address
          </div>
          <c:if test="${userRole == 'ROLE_ADMIN'}">
	        <div class="general menu-item" data-target="adminP">
	            <i class="fa fa-columns" aria-hidden="true"></i>
	            Admin Panel
	          </div>
          </c:if>
	      <div class="general menu-item" data-target="deactivatePage">
	        <i class="fa fa-ban" aria-hidden="true"></i>
	            Deactivate Account 
	      </div>
		  
        </div>
      </div>


      <div class="col-md-9 contents">

		
        <div class="content-item active" data-target="details">

          <div class="content-head row">YOUR INFORMATION</div>

          <form action="submitUpdate" method="post">
            <div class="view row">
              <div class="parameter col-md-3 text-left">Name</div>
              <div class="paramvalue col-md-6">${user.name}</div>
              <div class="edit-link col-md-3 text-right" >
                <i class="fa fa-pencil" data-toggle="tooltip" data-target="editName"
                  title="Click to edit" aria-hidden="true"></i>
              </div>

            </div>

            <div class="update row" data-target="editName">
              <div class="new-parameter col-sm-3 text-left">Enter new
                name</div>
              <div class="new-paramvalue col-sm-6">
                <input type="text" name="name" placeholder="Enter Name">
              </div>
              <div class="new-edit-link col-sm-3 text-right">
                <button type="submit" class="btn btn-primary">Update</button>
              </div>
              <div class="cancel-form col-md-3 text-right"
                data-target="editName">
                <i class="fa fa-times" data-toggle="tooltip" title="Cancel"
                  aria-hidden="true"></i>
              </div>
              </div>
			<div class="view row">
              <div class="parameter col-md-3 text-left">Date of Birth</div>
              <div class="paramvalue col-md-6">${user.birthDate}</div>
              <div class="edit-link col-md-3 text-right" >
                <i class="fa fa-pencil" data-toggle="tooltip" data-target="editDob"
                  title="Click to edit" aria-hidden="true"></i>
              </div>

            </div>
			
            <div class="update row" data-target="editDob">
              <div class="new-parameter col-sm-3 text-left">Enter new
                DOB</div>
              <div class="new-paramvalue col-sm-6">
                <input type="date"name="birthDate" id="dateBirth" placeholder="MM/DD/YYYY">
              </div>
              <div class="new-edit-link col-sm-3 text-right">
                <button type="submit" class="btn btn-primary">Update</button>
              </div>
              <div class="cancel-form col-md-3 text-right"
                data-target="editDob">
                <i class="fa fa-times" data-toggle="tooltip" title="Cancel"
                  aria-hidden="true"></i>
              </div>
            </div>

            <div class="view row">
              <div class="parameter col-sm-3 text-left">Contact</div>
              <div class="paramvalue col-sm-6">${user.contact}</div>
              <div class="edit-link col-sm-3 text-right">
                <i class="fa fa-pencil" data-toggle="tooltip" data-target="editContact"
                  title="Click to edit" aria-hidden="true"></i>
              </div>
            </div>

            <div class="update row" data-target="editContact">
              <div class="new-parameter col-sm-3 text-left">Enter new
                contact</div>
              <div class="new-paramvalue col-sm-6">
                <input type="text" name="contact" placeholder="Enter Contact">
              </div>
              <div class="new-edit-link col-sm-3 text-right">
                <button type="submit" class="btn btn-primary">Update</button>
              </div>
              <div class="cancel-form col-md-3 text-right"
                data-target="editContact">
                <i class="fa fa-times" data-toggle="tooltip" title="Cancel"
                  aria-hidden="true"></i>
              </div>
            </div>

          </form>
        </div>

        <div class="content-item" data-target="changePass">

          <div class="content-head row">Change Password</div>

          <form action="submitUpdate" onsubmit="return ComparePasswords()" method="post">


            <div class=" row ">

              <div class="passForm">

                <div class="row">
                  <div class="new-parameter col-sm-6 ">Current password</div>
                  <div class="new-paramvalue col-sm-6">
                    <input type="password" name="currentPassword" id="currentPassword">
                  </div>
                </div>
                <div class="row">
                  <div class="new-parameter col-sm-6 ">New password</div>
                  <div class="new-paramvalue col-sm-6 ">
                    <input type="password" name="password" id="newPassword">
                  </div>
                </div>
                <div class="row">
                  <div class="new-parameter col-sm-6">Confirm password</div>
                  <div class="new-paramvalue col-sm-6">
                    <input type="password" name="againNewPassword" id="againNewPassword">
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-2"></div>
                  <div class="new-edit-link col-sm-2 text-right " style="padding-bottom:15px ">
                    <button type="submit" class="btn btn-primary">Update</button>
                  </div>

                </div>
              </div>

            </div>

          </form>
        </div>
        <div class="content-item" data-target="orders">
        	<div class="content-head row">YOUR ORDERS</div>
        		<%-- <c:forEach items="${orderList}" var="order">
					<div class="product-card col-sm-8 col-sm-offset-2">
						<div class="card-block row">
							<div class="col-sm-3"></div>
							<div class="col-sm-9">
								Order Id:<h4 class="card-title" data-name="${order.id }">${order.id }</h4>
								Order Date: <h6 class="card-subtitle mb-2 text-muted"
									data-productId="${order.date }">${order.orderDate }</h6>
								<p>
									Payment Method: <span class="font-weight-bold"
										data-order="${order.payment}">${order.payment}</span>
									&nbsp; 	
									Total Amount: <span class="font-weight-bold"
										data-amount="${order.orderAmount }"> ${order.orderAmount}</span>
								</p>
								
								<p>
									Order Status: <span class="font-weight-bold"
										data-status="${order.orderStatus}">${order.orderStatus}</span>
									
								</p>
								<p class="shippinhAddress">
									Shipping Address: <span class="text-muted"
										data-shippinhAddress="${order.shippingAddress}">${order.shippingAddress}</span>
								</p>
								
							</div>
						</div>
					</div>
				</c:forEach> --%>
				<table class="table table-responsive table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>Order Id</th>
							<th>Total Amount</th>
							<!-- <th>Payment Method</th> -->
							<th>Order Status</th>
							<th>Shipping Address</th>
							<c:if test="${order.orderStatus eq IN_PROCESS}">
									<th>Operation</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderList}" var="order" varStatus="i">
							<tr>
								<td data-id="index"><c:out value="${i.index+1}"></c:out></td>
								<td data-address="${order.id}">${order.id}</td>
								<td data-city="${order.orderAmount}">${order.orderAmount}</td>
								<%-- <td data-country="${order.payment}">${order.payment}</td> --%>
								<td data-country="${order.orderStatus}">${order.orderStatus}</td>
								<td data-shippingAddress="${order.shippingAddress }">${order.shippingAddress.address }, ${order.shippingAddress.city }, ${order.shippingAddress.country }-${order.shippingAddress.pin }</td>
								<c:if test="${order.orderStatus eq IN_PROCESS}">
									<td data-continuePayment>Continue Payment</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
        	</div>
        
        
        
        
        
        <div class="content-item" data-target="address">

          <div class="content-head row">Your Info</div>
				<div>
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#addAddress">Add Address</button>
				</div>
				<!--Add address modal-->
				<div class="modal fade" id="addAddress">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Add Address</h4>
							</div>
							<div class="modal-body">
								<form action="addAddress" method="POST" id="addAddressForm">
									<div class="form-group">
										<label class="control-label">Address Line</label> 
										<input type="text" name="address" class="form-control" required>
									</div>
									<div class="form-group">
										<label class="control-label">City</label>
										<input type="text" name="city" class="form-control" required>
									</div>
									<div class="form-group">
										<label class="control-label">Country</label>
										<input type="text" name="country" class="form-control" required>
									</div>
									<div class="form-group">
										<label class="control-label">Pin</label>
										<input type="text" name="pin" class="form-control" required>
									</div>
									<div class="form-group text-center">
										<input type="submit" class="btn btn-success" required>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!--Update category modal-->
				<div class="modal fade" id="updateAddress">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Update Address</h4>
							</div>
							<div class="modal-body">
								<form action="updateAddress" method="POST">
									<input type="hidden" name="id">
									<div class="form-group">
										<label class="control-label">Address Line</label> 
										<input type="text" name="address" class="form-control" required>
									</div>
									<div class="form-group">
										<label class="control-label">City</label>
										<input type="text" name="city" class="form-control" required>
									</div>
									<div class="form-group">
										<label class="control-label">Country</label>
										<input type="text" name="country" class="form-control" required>
									</div>
									<div class="form-group">
										<label class="control-label">Pin</label>
										<input type="text" name="pin" class="form-control" required>
									</div>
									<div class="form-group text-center">
										<input type="submit" class="btn btn-success" value="Update">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!--Delete Address modal-->
				<div class="modal fade" id="deleteAddress">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Delete Address</h4>
							</div>
							<div class="modal-body">
								<form action="deleteAddress" method="POST">
									<input type="hidden" name="id">
									<div class="form-group">
										<label class="control-label">Address Line</label> 
										<input type="text" name="address" class="form-control" readonly>
									</div>
									<div class="form-group">
										<label class="control-label">City</label>
										<input type="text" name="city" class="form-control" readonly>
									</div>
									<div class="form-group">
										<label class="control-label">Country</label>
										<input type="text" name="country" class="form-control" readonly>
									</div>
									<div class="form-group">
										<label class="control-label">Pin</label>
										<input type="text" name="pin" class="form-control" readonly>
									</div>
									<div class="form-group text-center">
										<input type="submit" class="btn btn-success"
											value="Confirm Delete">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<table class="table table-responsive table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>Address Line</th>
							<th>City</th>
							<th>Country</th>
							<th>Pin</th>
							<th class="text-center">Operation</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listAddress}" var="addresses" varStatus="i">
							<tr>
								<td data-id="${addresses.id}"><c:out value="${i.index+1}"></c:out>
								</td>
								<td data-address="${addresses.address}">${addresses.address}</td>
								<td data-city="${addresses.city}">${addresses.city}</td>
								<td data-country="${addresses.country}">${addresses.country}</td>
								<td data-pin="${addresses.pin}">${addresses.pin}</td>
								<td class="text-center">
									<span class="glyphicon glyphicon-pencil" data-toggle="modal" data-target="#updateAddress"></span>
									<span class="glyphicon glyphicon-trash" data-toggle="modal" data-target="#deleteAddress"></span>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		
        
        
        <c:if test="${userRole == 'ROLE_ADMIN'}">
	        
        <div class="content-item" data-target="adminP">

          <div class="content-head row">Admin Page</div>

          
            <div class="view row text-center">
              <br><h2 style="font-size: 25px;">Are you sure you want to login as admin ?</h2><br>
              <form action="adminPage" method="post">
				<input type="submit" class="btn btn-success btn-lg" value="Confirm">
				</form>
				
            </div>
	

		</div>
		</c:if>
		<div class="content-item" data-target="deactivatePage">

          <div class="content-head row">Account Deactivate</div>

          
            <div class="view row text-center">
              <br><h2 style="font-size: 25px;">Are you sure you want to deactivate your account ?</h2><br>
              <form action="deactivate" method="post">
				<input type="submit" class="btn btn-success btn-lg" value="Confirm">
				</form>
				
            </div>


		</div>
      </div>
   </div>
 
</div>





  <script type="text/javascript">
    $(document).ready(
        function() {

          $('[data-toggle="tooltip"]').tooltip();
          

          $('.content-item').hide();
          $('.content-item.active').show();
          
          $('.menu-item').click(
              function(event) {
                var target = $(event.target)[0];
                var openMenu = $('.menu-item.active');
                var menuToOpen = $(target);

                $(openMenu).removeClass('active');
                $(menuToOpen).addClass('active');
                var divToOpenName = $(target).attr(
                    'data-target');
                var openDiv = $('.content-item.active').toggle(
                    'fast');
                $(openDiv).removeClass('active');
                var divToOpen = $(
                    '.content-item[data-target='
                        + divToOpenName + ']').toggle(
                    'fast');
                divToOpen.addClass('active');
              });

          $('.edit-link').click(
              function(event) {
                var target = $(event.target)[0];
                var divToOpnName = $(target)
                    .attr('data-target');
                var opnDiv = $('.update.active').hide('fast');
                $(opnDiv).removeClass('active');
                var divToOpn = $(
                    '.update[data-target=' + divToOpnName
                        + ']').show('fast');
                $(divToOpn).addClass('active');
              });

          $('.cancel-form').click(function(event) {

            $('.update').hide();
          });
          
        });


    function ComparePasswords(){

          var currentPassword = document.getElementById("currentPassword").value;
          var newPassword = document.getElementById("newPassword").value;
          var confirmPassword = document.getElementById("againNewPassword").value;
          var flag=true;

          if(newPassword!=confirmPassword){
           alert("Re-entered password should be same as new password");
            flag=false;
    }

           /* if(!(currentPassword.equals(${user.password})))
           {
               alert("Wrong password");
             flag=false;
           }  */

          return flag;

    }
    
    
    $('#updateAddress').on(
			'show.bs.modal',
			function(event) {
				var sibs = $(event.relatedTarget).parent().siblings('td');
				$(this).find('input[name=id]').val($(sibs[0]).attr('data-id'));
				$(this).find('input[name=address]').val($(sibs[1]).attr('data-address'));
				$(this).find('input[name=city]').val($(sibs[2]).attr('data-city'));
				$(this).find('input[name=country]').val($(sibs[3]).attr('data-country'));
				$(this).find('input[name=pin]').val($(sibs[4]).attr('data-pin'));
			});
	$('#deleteAddress').on(
			'show.bs.modal',
			function(event) {
				var sibs = $(event.relatedTarget).parent().siblings('td');
				$(this).find('input[name=id]').val($(sibs[0]).attr('data-id'));
				$(this).find('input[name=address]').val($(sibs[1]).attr('data-address'));
				$(this).find('input[name=city]').val($(sibs[2]).attr('data-city'));
				$(this).find('input[name=country]').val($(sibs[3]).attr('data-country'));
				$(this).find('input[name=pin]').val($(sibs[4]).attr('data-pin'));
			});
	
	var addressIdList = new Array();
	<c:forEach items="${listAddresses}" var="addresses">
	addressIdList.push("${addresses.id}")
	</c:forEach>
	
	
	$('#addAddressForm').submit(function(event) {
		var catId = $(this).find('[name=categoryId]').val();
		if ($.inArray(catId, categoryIdList) > 0) {
			event.preventDefault();
			alert('Category id already saved');
		}
		
		
		var orderIdList = new Array();
		<c:forEach items="${orderList}" var="order">
		orderIdList.push("${order.id}")
		</c:forEach>
	});
	
	
  </script>

<%@include file="footer.jsp" %>


</body>
</html>

