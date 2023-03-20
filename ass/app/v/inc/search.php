<div id='mysearch'>
    <!--    start of search -->
    <!-- Start of search row-->


    <!--  Flag Widget-->
    <div  id="default"  class="container nomargins">
        <img class="my-widgets flag nomargins" src="../ass/res/flags/UJ.png" alt="">
    </div>
    <!-- Home Widget -->


    <a href='javascript:goHome()'><img id = "home" class="my-widgets" src="../ass/res/img/home.png" ) /></a>


    <div class="heading"><h1>Cohortology Administration</h1></div>

    <!-- Search box	 -->

   <!-- <div id="searchdiv" >

        <p >
            <label for="topSearch"></label><input type = "text"
                                                  id = "topSearch"
                                                  size= "75"
                                                  value = ""
                                                  placeholder="Enter key word to search" />
        </p>

    </div>-->

    <!-- Search widget -->
   <!-- <div class="widget nomargins"  >
        <img class="my-widgets searchicon" src="../ass/res/img/SEARCH.png"  alt="">
    </div>
-->



    <!--    Start of user-->
    <div id='user-panel'>
		<?php
		$option = 'register';

		if (!isset($_SESSION['userid'])) {
			$user_panel = "<a href='javascript:fillRightbox(2)' style='color:white'>register/login</a>";
		}
		else {
			$user_panel = "<a href='app/u/doLogout.php' style='color:white'>logout</a>";
			if (!isset($_SESSION['userpic'])) {
				$pic = 'res/img/smiley.png';
				$user_pic =" <a href='javascript:load_ifrm()'><img class='my-widgets' src=" . $pic . " alt='' /></a>";
			} else {
				$pic = $_SESSION['userpic'];
				$pic = "data/pics/" . $pic;
				$user_pic ="<a href='javascript:load_ifrm()'><img class='my-widgets' src=" . $pic . " alt='' /></a>";
			}
		}

		echo $user_panel;
		//	echo $user_pic;

		?>


    </div>
    <!--End of User Panel-->


</div>
