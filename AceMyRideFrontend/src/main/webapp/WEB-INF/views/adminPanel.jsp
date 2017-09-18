<%@include file="header.jsp" %>



<div class="container-fluid main-content">

	<div class="row">
		<div class="vertical-menu col-sm-2 ">
			<div class="v-menu-header">Admin Panel</div>
			<ul>
			</ul>
		</div>
		<div class="col-sm-10 content">
			<div data-target="categories">
				<div class="content-heading">Manage Categories</div>
				<div><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addCategory">Add Category</button></div>
				<!--Add category modal-->
				<div class="modal fade" id="addCategory">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Add Category</h4>
							</div>
							<div class="modal-body">
								<form action="addCategory" method="POST" id="addCategoryForm">
									<div class="form-group">
										<label class="control-label">Category ID</label>
										<input type="text" name="categoryId" class="form-control text-capitalize">
									</div>
									<div class="form-group">
										<label class="control-label">Category Name</label>
										<input type="text" name="name" class="form-control">
									</div>
									<div class="form-group">
										<label class="control-label">Category Description</label>
										<textarea rows="3" class="form-control" name="description"></textarea>
									</div>
									<div class="form-group text-center">
										<input type="submit" class="btn btn-success">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!--Update category modal-->
				<div class="modal fade" id="updateCategory">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Update Category</h4>
							</div>
							<div class="modal-body">
								<form action="updateCategory" method="POST">
									<input type="hidden" name="id">
									<div class="form-group">
										<label class="control-label">Category ID</label>
										<input type="text" name="categoryId" class="form-control" readonly>
									</div>
									<div class="form-group">
										<label class="control-label">Category Name</label>
										<input type="text" name="name" class="form-control">
									</div>
									<div class="form-group">
										<label class="control-label">Category Description</label>
										<textarea rows="3" class="form-control" name="description"></textarea>
									</div>
									<div class="form-group text-center">
										<input type="submit" class="btn btn-success" value="Update">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!--Delete Category modal-->
				<div class="modal fade" id="deleteCategory">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Delete Category</h4>
							</div>
							<div class="modal-body">
								<form action="deleteCategory" method="POST">
									<input type="hidden" name="id">
									<div class="form-group">
										<label class="control-label">Category ID</label>
										<input type="text" name="categoryId" class="form-control text-capitalize" readonly>
									</div>
									<div class="form-group">
										<label class="control-label">Category Name</label>
										<input type="text" name="name" class="form-control" readonly>
									</div>
									<div class="form-group">
										<label class="control-label">Category Description</label>
										<textarea rows="3" class="form-control" name="description" readonly></textarea>
									</div>
									<div class="form-group text-center">
										<input type="submit" class="btn btn-success" value="Confirm Delete">
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
							<th>Category Id</th>
							<th>Category Name</th>
							<th>Category Description</th>
							<th class="text-center">Operation</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listCategories}" var="category" varStatus="i">
						<tr>
							<td data-id="${category.id}"><c:out value="${i.index+1}"></c:out> </td>
							<td data-categoryId="${category.categoryId}">${category.categoryId}</td>
							<td data-name="${category.name}">${category.name}</td>
							<td data-description="${category.description}">${category.description}</td>
							<td class="text-center"><span class="glyphicon glyphicon-pencil" data-toggle="modal" data-target="#updateCategory"></span><span class="glyphicon glyphicon-trash" data-toggle="modal" data-target="#deleteCategory"></span></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div data-target="suppliers">
				<div class="content-heading">Manage Suppliers</div>
				<div><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addSupplier">Add Supplier</button></div>
				<!--Add category modal-->
				<div class="modal fade" id="addSupplier">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Add Supplier</h4>
							</div>
							<div class="modal-body">
								<form action="addSupplier" method="POST" id="addSupplierForm">
									<div class="form-group">
										<label class="control-label">Supplier ID</label>
										<input type="text" name="supplierId" class="form-control text-capitalize">
									</div>
									<div class="form-group">
										<label class="control-label">Supplier Name</label>
										<input type="text" name="name" class="form-control">
									</div>
									<div class="form-group">
										<label class="control-label">Supplier Description</label>
										<textarea rows="3" class="form-control" name="description"></textarea>
									</div>
									<div class="form-group text-center">
										<input type="submit" class="btn btn-success">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!--Update category modal-->
				<div class="modal fade" id="updateSupplier">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Update Supplier</h4>
							</div>
							<div class="modal-body">
								<form action="updateSupplier" method="POST">
									<input type="hidden" name="id">
									<div class="form-group">
										<label class="control-label">Supplier ID</label>
										<input type="text" name="supplierId" class="form-control" readonly>
									</div>
									<div class="form-group">
										<label class="control-label">Supplier Name</label>
										<input type="text" name="name" class="form-control">
									</div>
									<div class="form-group">
										<label class="control-label">Supplier Description</label>
										<textarea rows="3" class="form-control" name="description"></textarea>
									</div>
									<div class="form-group text-center">
										<input type="submit" class="btn btn-success" value="Update">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!--Delete Category modal-->
				<div class="modal fade" id="deleteSupplier">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Delete Supplier</h4>
							</div>
							<div class="modal-body">
								<form action="deleteSupplier" method="POST">
									<input type="hidden" name="id">
									<div class="form-group">
										<label class="control-label">Supplier ID</label>
										<input type="text" name="supplierId" class="form-control text-capitalize" readonly>
									</div>
									<div class="form-group">
										<label class="control-label">Supplier Name</label>
										<input type="text" name="name" class="form-control" readonly>
									</div>
									<div class="form-group">
										<label class="control-label">Supplier Description</label>
										<textarea rows="3" class="form-control" name="description" readonly></textarea>
									</div>
									<div class="form-group text-center">
										<input type="submit" class="btn btn-success" value="Confirm Delete">
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
							<th>Supplier Id</th>
							<th>Supplier Name</th>
							<th>Supplier Description</th>
							<th class="text-center">Operation</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listSuppliers}" var="supplier" varStatus="i">
						<tr>
							<td data-id="${supplier.id}"><c:out value="${i.index+1}"></c:out> </td>
							<td data-categoryId="${supplier.supplierId}">${supplier.supplierId}</td>
							<td data-name="${supplier.name}">${supplier.name}</td>
							<td data-description="${supplier.description}">${supplier.description}</td>
							<td class="text-center"><span class="glyphicon glyphicon-pencil" data-toggle="modal" data-target="#updateSupplier"></span><span class="glyphicon glyphicon-trash" data-toggle="modal" data-target="#deleteSupplier"></span></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div data-target="products">
				<div class="content-heading">Manage Products</div>
			</div>
		</div>
	</div>



</div>


<script type="text/javascript">

var verticalMenuItems=[{
	'target':'categories',
	'value':'Manage Categories'
},{
	'target':'suppliers',
	'value':'Manage Suppliers'
},{
	'target':'products',
	'value':'Manage Products'
}];
var defaultVerticalMenuItem='categories';
$('#updateCategory').on('show.bs.modal',  function(event) {
	var sibs=$(event.relatedTarget).parent().siblings('td');
	$(this).find('input[name=id]').val($(sibs[0]).attr('data-id'));
	$(this).find('input[name=categoryId]').val($(sibs[1]).attr('data-categoryId'));
	$(this).find('input[name=name]').val($(sibs[2]).attr('data-name'));
	$(this).find('textarea[name=description]').val($(sibs[3]).attr('data-description'));
});

$('#deleteCategory').on('show.bs.modal',  function(event) {
	var sibs=$(event.relatedTarget).parent().siblings('td');
	$(this).find('input[name=id]').val($(sibs[0]).attr('data-id'));
	$(this).find('input[name=categoryId]').val($(sibs[1]).attr('data-categoryId'));
	$(this).find('input[name=name]').val($(sibs[2]).attr('data-name'));
	$(this).find('textarea[name=description]').val($(sibs[3]).attr('data-description'));
});

$('#updateSupplier').on('show.bs.modal',  function(event) {
	var sibs=$(event.relatedTarget).parent().siblings('td');
	$(this).find('input[name=id]').val($(sibs[0]).attr('data-id'));
	$(this).find('input[name=supplierId]').val($(sibs[1]).attr('data-supplierId'));
	$(this).find('input[name=name]').val($(sibs[2]).attr('data-name'));
	$(this).find('textarea[name=description]').val($(sibs[3]).attr('data-description'));
});

$('#deleteSupplier').on('show.bs.modal',  function(event) {
	var sibs=$(event.relatedTarget).parent().siblings('td');
	$(this).find('input[name=id]').val($(sibs[0]).attr('data-id'));
	$(this).find('input[name=supplierId]').val($(sibs[1]).attr('data-supplierId'));
	$(this).find('input[name=name]').val($(sibs[2]).attr('data-name'));
	$(this).find('textarea[name=description]').val($(sibs[3]).attr('data-description'));
});

var categoryIdList=new Array();
var supplierIdList=new Array();

<c:forEach items="${listSuppliers}" var="supplier">
	supplierIdList.push("${supplier.supplierId}")
</c:forEach>
<c:forEach items="${listCategories}" var="category">
	categoryIdList.push("${category.categoryId}")
</c:forEach>

$('#addCategoryForm').submit(function(event) {
	var catId=$(this).find('[name=categoryId]').val();
	if($.inArray(catId, categoryIdList)>0){
		event.preventDefault();
		alert('Category id already saved');
	}
});
$('#addSupplierForm').submit(function(event) {
	var supId=$(this).find('[name=supplierId]').val();
	if($.inArray(supId, supplierIdList)>0){
		event.preventDefault();
		alert('Supplier id already saved');
	}
});

</script>
<script type="text/javascript" src="${script}/scripts.js"></script>

<%@include file="footer.jsp" %>
</body>
</html>