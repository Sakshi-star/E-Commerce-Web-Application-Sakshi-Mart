<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
session.setAttribute("message", "you are not logged in !! Login first");
response.sendRedirect("login.jsp");
return;
} else {

if (user.getUserType().equals("normal")) {
session.setAttribute("message", "You are not admin ! Do not access this ");
response.sendRedirect("login.jsp");
return;
}
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Panel</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>
<%@include file="components/navbar.jsp"%>


<div class="container admin">

<div class ="container-fluid mt-3">

<%@include file="components/message.jsp"  %>



</div>



<div class="row mt-3 ">

<!--first col-->
<div class ="col-md-4">

<!--first box-->
<div class ="card">

<div class="card-body text-center">

<div class="container"> 
<img style="max-width: 125px;" class="image-fluid rounded-circle" src="img/team.png" alt="user_icon">
</div> 
<h1>123</h1>
<h1 class ="text-uppercase text-muted" >Users</h1> 

</div>
</div>
</div>

<!--second col-->
<div class ="col-md-4">

<!--second box-->
<div class ="card" >

<div class="card-body text-center">

<div class="container"> 
<img style="max-width: 125px;" class="image-fluid rounded-circle" src="img/category.png" alt="user_icon">
</div> 
<h1>456</h1>
<h1  class ="text-uppercase text-muted">CATEGORIES</h1> 

</div>
</div> 
</div>

<!--third col-->
<div class ="col-md-4">
<!-- third box-->
<div class ="card">

<div class="card-body text-center">

<div class="container"> 
<img style="max-width: 125px;" class="image-fluid rounded-circle" src="img/product.png" alt="user_icon">
</div> 

<h1>4562</h1>
<h1  class ="text-uppercase text-muted" >PRODUCTS</h1> 

</div>
</div>
</div>
</div>




<!--second row-->

<div class="row mt-3">
<!-- second:row first:column -->
<!--md - medium screen/device-->
<div class ="col-md-6">

<!--first box-->
<div class ="card" data-toggle="modal" data-target="#add-category-modal ">


<div class="card-body text-center">

<div class="container"> 
<img style="max-width: 125px;" class="image-fluid rounded-circle" src="img/add cateory.png" alt="user_icon">
</div> 

<p class ="mt-2">Click here to add new category</p>
<h1  class ="text-uppercase text-muted" >Add Category</h1> 

</div>
</div>
</div> 





<!-- second:row second:column -->
<!--md - medium screen/device-->
<div class ="col-md-6">
<!--second box-->
<div class ="card" data-toggle="modal" data-target="#add-product-modal" >


<div class="card-body text-center">

<div class="container"> 
<img style="max-width: 125px;" class="mx-auto d-block" src="img/buy.png" alt="user_icon">
</div> 

<p class ="mt-2">Click here to add new category</p>
<h1  class ="text-uppercase text-muted" >ADD PRODUCT</h1> 

</div>
</div>
</div> 
</div>                  

</div>
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<!--add category modal-->


<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog modal-lg " role="document">
<div class="modal-content">
<div class="modal-header custom-bg text-white">
<h5 class="modal-title" id="exampleModalLabel">Fill Category</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span> 
</button>

</div>
<div class="modal-body">
<form action="ProductOperationServlet" method="post">
<input type="hidden" name="operation" value="addcategory">




<div  class= "form-group">
<input type="text" class= "form-control" name ="catTitle" placeholder="Enter category title" required />
</div>


<div class="form-group mt-2">
<textarea class="form-control" name="catDescription" placeholder="Enter Category Description" required style="height: 200px;"></textarea>
</div>

<div class= "container text-center mt-3">
<button  class="btn btn-outline-success">Add Category</button>
<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

</div>

</form>
</div>

</div>
</div>
</div>

<!--End  category modal-->


<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->     




<!-- Adding addproduct modal -->
<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog modal-lg" role="document">
<div class="modal-content">
<div class="modal-header custom-bg text-white">
<h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
<!--close button -->
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span> 
</button>
</div>
<div class="modal-body">
<!-- Form -->
<form action="ProductOperationServlet" method="post" enctype="multipart/form-data" >

<input type ="hidden" name="operation" value="addproduct"/>

<!-- Product title -->

<div class="form-group">
<input type="text" class="form-control" name="pName" placeholder="Enter title of product" required />
</div>
<!-- Product description -->
<div class="form-group mt-2">
<textarea class="form-control" name="pDesc" placeholder="Enter Product Description" required style="height: 150px;"></textarea>
</div>
<!-- Product price -->
<div class="form-group mt-1">
<input type="number" class="form-control" name="pPrice" placeholder="Enter Product Price" required />
</div>
<!-- Product discount -->
<div class="form-group mt-1">
<input type="number" class="form-control" name="pDiscount" placeholder="Enter Product Discount" required />
</div>
<!-- Product quantity -->
<div class="form-group mt-1">
<input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" required />
</div>
<!-- Product category -->
<%  CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
List< Category> list = cdao.getCategories();
%>
<div class="form-group mt-1">
<select name="catId" class="form-control" id="">

<%               
for (Category c:list) {
%>      

<option value="<%= c.getCategoryId()%> "> <%=  c.getCategoryTitle()%></option>

<% }%>



<!--<option value="mobile">Mobile</option>
<option value="tablet">Tablet</option>   -->
</select>
</div>
<!-- Product picture -->
<div class="form-group mt-1">
<label for="pPic">Select picture of product</label>
<br>
<input type="file" id="pPic" name="pPic" required />
</div>
<!-- Submit buttons -->
<div class="container text-center">
<button type="submit" class="btn btn-outline-success">Add Product</button>
<div class="modal-footer">
<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
</div>
</div>
</form>
<!-- End form -->
</div>
</div>
</div>
</div>

<!-- End addproduct modal -->

</body>
</html>
