<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <!-- adding common file -->
        <%@include file= "components/common_css_js.jsp" %>
        
           

    </head>
    <body>
        <%@include file= "components/navbar.jsp" %>
        <div class ="container-fluid">
            <div class="row mt-3">
                <div class ="col-md-6 offset-md-3">
                 <div class = "card ">
                         
                         <%@include file="components/message.jsp" %>
                        <div class ="card body px-5">
                         <div class="container text-center">
                                <!-- Add Image Here -->
                                <img src="img/add-friend.png"  style =" max-width: 100px;"alt="add-friend.png" class="img-fluid mb-4" />
                            </div>
                            <h3 class="text-center my-3" > Sign up here !!</h3>
                           
                            <form action ="RegisterServlet" method ="post">
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name ="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter here">
                                </div>
                                
                                 <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input name ="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter here">
                                </div>
                               

                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input name ="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter here">
                                </div>

                                <div class="form-group">
                                    <label for="Phone">User Phone</label>
                                    <input  name ="user_phone" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter your phone number" required pattern="^\+?[0-9]{10,15}$">
                                </div>

                                <div class="form-group">
                                    <label for="Address">User Address</label>
                                    <textarea name ="user_address"  style ="height: 150px;"  class ="form-control" placeholder="Enter Your Address"></textarea>
                                </div>

                                <div class =" container  text-center">        
                                    <button class ="btn btn-outline-success"> Register</button>
                                    <button class ="btn btn-outline-warning"> Reset</button>
                                </div> 
                            </form>
                        </div>  
                    </div> 


                </div>
            </div>

        </div>
   </body>
</html>
