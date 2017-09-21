

<%@include file="header.jsp" %>

<style>



.panel {
  border-radius: 5px;
}
label {
  font-weight: 300;
}
.panel-login {
   border: none;
  -webkit-box-shadow: 0px 0px 49px 14px rgba(188,190,194,0.39);
  -moz-box-shadow: 0px 0px 49px 14px rgba(188,190,194,0.39);
  box-shadow: 0px 0px 49px 14px rgba(188,190,194,0.39);
  }


.panel-login>.panel-heading .tabs{
  padding: 0;
}
.panel-login h2{
  font-size: 20px;
  font-weight: 300;
  margin: 30px;
}
.panel-login>.panel-heading {
  color: #848c9d;
  background-color: #f5f1ed;
  border-color: #fff;
  text-align:center;
  border-bottom-left-radius: 5px;
  border-bottom-right-radius: 5px;
  border-top-left-radius: 0px;
  border-top-right-radius: 0px;
  border-bottom: 0px;
  padding: 0px 15px;
}
.panel-login .form-group {
  padding: 0 30px;
}
.panel-login>.panel-heading .login {
  padding: 20px 30px;
  border-bottom-leftt-radius: 5px;
}
.panel-login>.panel-heading .register {
  padding: 20px 30px;
  background: #252323;
  border-bottom-right-radius: 5px;
}
.panel-login>.panel-heading a{
  text-decoration: none;
  color: #666;
  font-weight: 300;
  font-size: 16px;
  -webkit-transition: all 0.1s linear;
  -moz-transition: all 0.1s linear;
  transition: all 0.1s linear;
}
.panel-login>.panel-heading a#register-form-link {
  color: #fff;
  width: 100%;
  text-align: right;
}
.panel-login>.panel-heading a#login-form-link {
  width: 100%;
  text-align: left;
}

.panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {
  height: 45px;
  border: 0;
  font-size: 16px;
  -webkit-transition: all 0.1s linear;
  -moz-transition: all 0.1s linear;
  transition: all 0.1s linear;
  -webkit-box-shadow: none;
  box-shadow: none;
  border-bottom: 1px solid #e7e7e7;
  border-radius: 0px;
  padding: 6px 0px;
}
.panel-login input:hover,
.panel-login input:focus {
  outline:none;
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
  box-shadow: none;
  border-color: #ccc;
}
.btn-login {
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
.btn-login:hover,
.btn-login:focus {
  color: #fff;
  background-color: #252323;
}

.forgot{
  padding-top: 60px;
  
}
.forgot-password {
  
  text-decoration: underline;
  color: #70798c;
}
.forgot-password:hover,
.forgot-password:focus {
  text-decoration: underline;
  color: #666;
}

.btn-register {
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
.btn-register:hover,
.btn-register:focus {
  color: #fff;
  background-color: #252323;
}

.login-background{
background-color: #f5f1ed;
}
</style>


<c:if test="${not empty result }">
    <c:if test="${result == 'success'}">
      <div class="alert alert-success" role="success">
        ${message}
      </div>
    </c:if>
  </c:if>

  
<div class="main-content login-background">

<div class="container-fluid">
 <div class="row"><label></label></div>
   <div class="row">
    <div class="col-md-6 col-md-offset-3">
      <div class="panel panel-login">
       <div class="panel-heading">
          <div class="row">
            <div class="col-xs-6 tabs">
              <a href="#" class="active" id="login-form-link"><div class="login">LOGIN</div></a>
            </div>
            <div class="col-xs-6 tabs">
              <a href="#" id="register-form-link"><div class="register">REGISTER</div></a>
            </div>
          </div>
        </div>
        <div class="panel-body">
          <div class="row">
            <div class="col-lg-12">
              <form id="login-form" action="submitLogin" onsubmit="return ValidationLogin()" method="post" role="form" style="display: block;">
                <h2>LOGIN</h2>
                  <div class="form-group">
                    <input type="email" name="email" id="email1" class="form-control" placeholder="Email" value="">
                  </div>
                  <div class="form-group">
                    <input type="password" name="password" id="password1" class="form-control" placeholder="Password">
                  </div>
                  
                  <div class="col-sm-6 col-sm-offset-3">     
                        <input type="submit" name="login-submit" id="login-submit" class="form-control btn btn-login" value="Login">
                  </div>
                  
                  <div class="row forgot">
                  <div class="col-md-12 text-center ">
                       
                    <a class="forgot-password" href="forgotPassword">Forgot Password?</a>
                  </div>
                  </div>
              </form>
              <form id="register-form" action="register" onsubmit="return ValidationSignup()" method="post" class="form" style="display: none;">
                <h2>REGISTER</h2>

                <h2>Personal Info</h2>

                 <div class="row">
                  <div class="col-md-6">
                  <div class="form-group">
                    <input type="text" name="name" id="name" class="form-control" placeholder="Username" value="">
                  </div>
                  </div>
                  <div class="col-md-6">
                  <div class="form-group">
                    <input type="email" name="email" id="email" class="form-control" placeholder="Email Address" value="">
                  </div>
                  </div>
                 </div> 

                 <div class="row">
                  <div class="col-md-6">
                  <div class="form-group">
                    <input type="text" name="contact" id="contact" class="form-control" placeholder="Contact" value="">
                  </div>
                  </div>
                  <div class="col-md-6">
                   <div class="form-group">
                   <label class="control-label" for="date" style="display: none;"></label>
                    <input type="text" name="birthDate" id="date" class="form-control" placeholder="Date of birth">
                   </div> 
                  </div>
                 </div>

                <h2>Set password</h2>
                  <div class="row">
                  <div class="col-md-6">
                  <div class="form-group">
                    <input type="password" name="password" id="password" class="form-control" placeholder="Password">
                  </div>
                  </div>
                  <div class="col-md-6">
                  <div class="form-group">
                    <input type="password" name="confirm-password" id="confirmPassword" class="form-control" placeholder="Confirm Password">
                  </div>
                  </div>
                  </div>
                 <h2>Security Question</h2> 
                  <div class="form-group">
                    <select style="width:100%; height: 35px" name="securityQuestionId">
                        <option value="" disabled selected>Select a security question</option>
                      <c:forEach items="${securityQuestions}" var="question" varStatus="loop">
                        <option  value="${loop.index }">${question}</option>
                      </c:forEach>
      
                    </select>
                  </div>
                  <div class="form-group">
                    <input type="text" name="securityAnswer" id="securityAnswer" class="form-control" placeholder="Answer" value="">
                  </div>
                  <div class="form-group">
                    <div class="row">
                      <div class="col-sm-6 col-sm-offset-3">
                        <input type="submit" name="register-submit" id="register-submit" class="form-control btn btn-register" value="Register Now">
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
<script>

$(document).ready(function(){
      var date_input=$('input[name="birthDate"]');
      var options={
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true,
        changeMonth: true,
        changeYear: true,
        yearRange: "-120:+0"
      };
      date_input.datepicker(options);
    });

  $(function() {
    $('#login-form-link').click(function(e) {
      $("#login-form").delay(100).fadeIn(100);
    $("#register-form").fadeOut(100);
    $('#register-form-link').removeClass('active');
    $(this).addClass('active');
    e.preventDefault();
  });
  $('#register-form-link').click(function(e) {
    $("#register-form").delay(100).fadeIn(100);
    $("#login-form").fadeOut(100);
    $('#login-form-link').removeClass('active');
    $(this).addClass('active');
    e.preventDefault();
  });

});


  function ValidationSignup()
  {
    var name = document.getElementById("name").value;
    var email = document.getElementById("email").value;
    var contact = document.getElementById("contact").value;
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    var sec = document.getElementById("securityAnswer").value;

    var flag=true;
    var passReg=/(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/;
    var emailReg=/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/;
    var conReg=/^[0-9]*$/;

    

    if(name.length<5)
    {
      alert("Name must contain atleast 5 characters");
      flag=false;
    }

    if(!(password.match(passReg))){
      alert("Password must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters");
      flag=false;
    }

    if(password!=confirmPassword){
      alert("Re-entered password should be same as password");
      flag=false;
    }

    if(!(email.match(emailReg))){
      alert("Please enter email in proper format. For example: username@gmail.com");
      flag=false;
    }

    if(!(contact.match(conReg))){
      alert("Contact must contain digits only");
      flag=false;
    }

    if(contact.length==0){
      alert("Contact can't be empty");
      flag=false;
    }
    
    if(sec.length==0){
      alert("Please provide answer to your security question");
      flag=false;
    }

    

    return flag;



  }




  function ValidationLogin()
  {
    var email = document.getElementById("email1").value;
    var password = document.getElementById("password1").value;
    var flag=true;

    if(email.length==0){
      alert("Email can't be empty");
      flag=false;
    }

    if(password.length==0){
      alert("Password can't be empty");
      flag=false;
    }

    return flag;
  }

</script>


<%@include file="footer.jsp" %>


</body>
</html>