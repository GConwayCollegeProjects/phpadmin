<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
if (isset($_POST['val'])){
    $val = $_POST['val'];
  //  echo $val;
    $Rightbox = new Rightbox();
    $result = $Rightbox->fillRightbox($val);
    echo $result;
}

class Rightbox
{

    private $register = "
     <div class='site-home'>
       <div class='form-container'>
            <div class='image-holder'></div>
                <form action='app/u/regHandler.php' method='post' name=register' id='register' autocomplete='off' >
                    <h2 class='text-center'><strong>Register</strong> today!</h2>
                    <div class='form-group'><label for='rname'>Enter FULL name:<input class='form-control' type='text' name = 'name'  id ='rname' onblur ='setScreen()' minlength = '5' maxlength = '50'  title= 'Enter Full Name - only letters a-z allowed' autocomplete='new-password'></label></div>
                    <div class='form-group'><label for='rscreen' >Enter unique screen name:<input class='form-control' type='text' name = 'screen'  id ='rscreen' onblur ='checkScreen()' minlength = '5' maxlength = '20'  title= 'Enter Screen Name - only letters and numbers allowed without spaces' autocomplete='new-password'></label></div>
                    <div class='form-group'><label for='remail' >Enter personal email address:<input class='form-control' type='text' name = 'email'  id ='remail' onblur ='checkEmail()' minlength = '5' maxlength = '50'  title= 'Enter Email Address - only lowercase letters, numbers, @, - and . symbols allowed without spaces' autocomplete='new-password'></label></div>
                    <div class='form-group'><label for='rpass' >Enter password 5-10 characters:<input class='form-control' type='password' name = 'pass' id ='rpass' onblur ='checkPassword()' minlength = '5' maxlength = '10' title= 'Enter Password, this is case sensitive so remember it EXACTLY!' autocomplete='new-password'></label></div>
                    <div class='form-group'><label for='rrepeat' >Re-enter chosen password:<input class='form-control' type='password' name = 'pass-repeat' id ='rrepeat' onblur='checkRepeat()' minlength = '5' maxlength = '10'  title= 'Repeat EXACTLY as above. ' autocomplete='new-password'></label></div>
                    <div class='form-group'>
                    <div class='form-check'><label for='rcbox'><input class='form-check-input' type='checkbox' name=checkbox' id='rcbox' title='This must be ticked to proceed!'></label>I agree to the<a href 'res/lib/terms.html'> Terms of Use.</a> To find out what personal data we collect and how we use it, please visit our<a href 'res/lib/privacy.html'> Privacy Policy.</a></div>
                    </div>
                    <div class='form-group'><button class='btn btn-primary btn-block' type='submit' id='rsubmit' onclick='checkSubmit()'>Complete Registration</button></div>

                    <div class='already'>Already registered?<a  href='javascript:fillRightbox(2)'><strong>Login here</strong></a></div></form>

               </div> 
     </div>";

    private $login = "
     <div class='site-home'>
        <div class='form-container'>
            <div class='image-holder'></div>
                <form action='app/u/doLogin.php' method='post' name=login' autocomplete='off'>
                    <h2 class='text-center'><strong>Login</strong></h2>
                      <br> <br>
                      <br> <br>
                   <div class='form-group'><label><input class='form-control' type='text' name='email' placeholder='Email' autocomplete='new-password'></label></div>
                   <br> <br>
                    <div class='form-group'><label><input class='form-control' type='password' name='password' placeholder='Password' autocomplete='new-password'></label></div>
                    <a class='already' href='javascript:fillRightbox(4)'>Forgotten your password - <strong>Click here</strong></a>
                    <br> <br>
                    <div class='form-group'><button class='btn btn-primary btn-block' type='submit'>Login</button></div>
                      <br> <br>
                    <a class='already' href='javascript:fillRightbox(3)'>Not Registered - <strong>Click here</strong></a></form>

            </div>
     </div>";
    private $menu = "  
   
    
               
                      <div class='site-home '>        
                        <div class='form-container '>     
                      <form>
                       
                    <h2 class='options text-center'><strong>Options</strong></h2>
                     
                     <div class='panel-height overflow-auto'>
                     
                    
                                <div  class = 'my-nav' id='routelist'  onclick='getOption(this.id)' style='background-color: var(--my-green) !important' >                
                                <div class='my-burger'> <a  id='def'><img src='res/img/burger.png' alt=''/></a> 
                                </div>
                                <p>Add/Amend Routes</p>  </div>
                                
                                <div  class = 'my-nav' id='userlist'  onclick='getOption(this.id)' style='background-color: var(--my-purple) !important' >                
                                <div class='my-burger'> <a  id='def'><img width=30px height=30px src='res/img/burger.png' alt=''/></a>
                                </div>
                                <p>Add/Amend Users</p>  </div>   
                                
                                <div  class = 'my-nav' id='cohortlist'  onclick='getOption(this.id)' style='background-color: var(--my-orange) !important' >                
                                <div class='my-burger'> <a  id='def'><img width=30px height=30px src='res/img/burger.png' alt=''/></a>
                                </div>
                                <p>Add/Amend Cohorts</p>  </div>   
                                
                                
                                
                                                
                        
                   
    
    </div>
    
  
    </form>
      </div>
      </div>
   
    ";
    private $reset = "
     <div class='site-home'>
        <div class='form-container'>
            <div class='image-holder'></div>
                <form action='../../home.html' method='post' name=login' autocomplete='off'>
                    <h2 class='text-center'><strong>Reset Password</strong></h2>
                      <br> <br>
                        <br> <br>
                    <div class='form-group'><label><input class='form-control' type='text' name='lastname' placeholder='Last Name' autocomplete='new-password'></label></div> 
                      <br> <br>                    
                    
                    <div class='form-group'><label><input class='form-control' type='text' name='email' placeholder='Email' autocomplete='new-password'></label></div>
                      <br> <br>
                    <div class='form-group'><button class='btn btn-primary btn-block' type='submit'>Request Password Reset</button></div>   
                      <br> <br>
                    <a class='already' href=#>Now check your email. </a></form>

            </div>
     </div>";
// send temporary password bu email
    private $password = "
     <div class='site-home'>
        <div class='form-container'>
            <div class='image-holder'></div>
                <form action='../../home.html' method='post' name=login' autocomplete='off'>
                    <h2 class='text-center'><strong>Reset Password</strong></h2>
                    <div class='form-group'><label><input class='form-control' type='text' name='lastname' placeholder='Last Name' autocomplete='new-password'></label></div>
                    <div class='form-group'><label><input class='form-control' type='text' name='email' placeholder='Email' autocomplete='new-password'></label></div>
                    <div class='form-group'><button class='btn btn-primary btn-block' type='submit'>Submit</button></div>   
                    <a class='already' href=#>Now check your email. </a></form>

            </div>
     </div>";

    private $picture = '
<div class="site-home">
        <div class="form-container">
            <div class="image-holder"></div>

        
    <form method="post">

        <input type="file" name="image" class="image">

    </form>

</div>

</div>    

<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">

<div class="modal-dialog modal-lg" role="document">

<div class="modal-content">

<div class="modal-header">

<h5 class="modal-title" id="modalLabel"></h5>

<button type="button" class="close" data-dismiss="modal" aria-label="Close">

<span aria-hidden="true">×</span>

</button>

</div>

<div class="modal-body">

<div class="img-container">

<div class="row">

<div class="col-md-8">



</div>

<div class="col-md-4">

<div class="preview"></div>

</div>

</div>

</div>

</div>

<div class="modal-footer">

<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>

<button type="button" class="btn btn-primary" id="crop">Crop</button>

</div>

</div>

</div>

</div>';
//    end of picture


// ============================================================================================= Routelist Posting
    private $routelist = "
    
    <div class='site-home'>
    <h2 id='right_head' class='text-center'><strong>Route</strong> entry!</h2>
    <div class='form-group mb-0 pb-0'>
        
        <div  class='form-group my-0 py-0'><label for='host' >Hosted by:
        <input class='form-control' type='text' id='host' name = 'host'   minlength = '5' maxlength = '50'
        title= 'Type name to search ...' autocomplete='new-password'></label></div>



            
        <div class='container  mx-auto row' style='width: 200px' ><button id='submit' onclick='routeUpload()' class='btn btn-primary btn-block'
                                                                          type='button' >Submit Route Details</button></div>
        <div id='output' style='display: none'></div>

    </div>
    </div>


    
    
    
    ";

//    end of routelist

  /*  private $business = "blank";
    private $clubs = "blank";
    private $community = "blank";
    private $announcement = "blank";
    private $vacancy = "blank";
    private $events = "blank";
    private $trades = "blank";
    private $offers = "blank";
    private $sales = "blank";
    private $walks = "blank";
    private $contactus = "blank";
    private $donation = "blank";
    private $profile = "blank";
    private $newslist = "blank";
    private $buslist = "blank";
    private $clublist = "blank";
    private $communitylist = "blank";
    private $announcelist = "blank";
    private $vacancylist = "blank";
    private $eventlist = "blank";
    private $tradelist = "blank";
    private $offerlist = "blank";
    private $salelist = "blank";
    private $walklist = "blank";*/



    function __construct()
    {


    }

    /**
     * @param $x
     * @return string
     */

    public function fillRightbox($x): string
           {
              $array = array(
                   'menu',
                   'login',
                   'register',
                   'reset',
                   'password',
                   'picture',
                  'routelist',
                  'cohortlist',
                  'userlist'
               );
               $object = $array[$x-1];

               if (!isset($_SESSION['userid']) && ($object==='posting'||$object==='profile')){
                    return "blank";
                   }
                   else {
                       return $this->$object;
                   }

           }


}


