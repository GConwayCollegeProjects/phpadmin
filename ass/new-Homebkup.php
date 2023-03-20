<?php include("app/v/inc/header.php"); ?>
<body onload="showI(1)">
<!--Start of Outside Box-->
<div id="outside-container" class ="bigbox d-flex container " style="width:99%; ; background: url(../ass/res/img/leOld.png) ;border: dotted; margin:1% auto 0 auto; z-index: 1; height:600px !important">
<!--    Start of Top Container-->
<div id="top-container" class = "topbox container d-flex row " style="max-width:98%; margin:5px auto ; height:70px!important; background-color: #7d8285 ; border: solid ; position: relative" >

<!--    start of search -->
	<?php include("app/v/inc/search.php"); ?>
     <!--end of search/topbox-->
<!--    Start of main box-->
<div id="main-container" class="row container d-flex" style="max-width:100%; height:500px;!important  padding-top: 0px;  margin:20px 5px 5px 0px ; position: relative; ">
<!--    start of Left Block-->
<div id="left-container" class = "leftbox d-flex container col" style="width:550px; z-index: 1; background-color : white ; height:500px;!important  padding-top: 0px;  margin:0 2% 0 -2%  ; position: absolute; float:left">
<!--    // start of left-box toggable tabs nav and content-->
  --    // ^ END OF TOGGABLE TABS-->
    </div>
<!--    End of left block-->


<!--    Start of Right Block -->
<!--    -->

<div id="right-container" class = "rightbox container d-flex col "  style="width:26% !important; z-index: 3 ; height:500px;  background-color: #7d8285 ; margin: 0 -15px 0 65%;  position: relative; float:right !important">
<!-- Start of menu / entry options-->

    <div class='site-home'>


            <form action='app/u/newsHandler.php' method='post' name=news' id='news' autocomplete='off' >
                <h2 id='right_head' class='text-center'><strong>News</strong> entry!</h2>
                <div class='form-group mb-0 pb-0'><label for='nselect'>Select type of News story:<select class ='form-control nselect' id = 'nselect' title = 'Select the type news story that you wish to enter details for.'></select></label></div>


                <div class='form-group my-0 py-0'><label for='nheadline' >Enter News Headline:<input class='form-control' type='text' name = 'headline'  id ='nheadline' onblur ='checkScreen()' minlength = '5' maxlength = '50'  title= 'Enter news headline up to 50 characters in length with just a-z and 0-9 used' autocomplete='new-password'></label></div>
                <div class='buttons d-flex justify-content-center'' >
                    <button id='nimage' style='height: 50px; position:relative' onclick='getImage()'>Add Image</button>
                    <button id='nvideo' style='height: 50px; position: relative' onclick='getVideo()'>Add Video</button>
                </div>
                <div class='buttons d-flex justify-content-center' >
                <button id='ngallery' style='height: 50px; position:relative' onclick='getGallery()'>Add Image Gallery</button>
                </div>
                <div class='buttons d-flex justify-content-center' >
                <button id='npdf' style='height: 50px; position:relative' onclick='getPDF()'>Add PDF</button>
                <button id='nurl' style='height: 50px; position: relative' onclick='getURL()'>Add URL</button>
                </div>




                <div id ='nsource' class='form-group my-0 py-0'><label for='nheadline' >Source (if not Self) IMPORTANT!:<input class='form-control' type='text' name = 'headline'   onblur ='checkScreen()' minlength = '5' maxlength = '50'  title= 'Enter news headline up to 50 characters in length with just a-z and 0-9 used' autocomplete='new-password'></label></div>
                <div id ='nstart' class='form-group my-0 py-0'><label for='nheadline' >Date to be shown from:<input class='form-control' type='date' name = 'headline'   onblur ='checkScreen()' minlength = '5' maxlength = '50'  title= 'Enter news headline up to 50 characters in length with just a-z and 0-9 used' autocomplete='new-password'></label></div>


                <div id='nsubmit' class='form-group d-flex my-0 py-0'><button class='btn btn-primary btn-block' type='submit'  onclick='checkSubmit()'>Submit News Story</button></div>


        </div>
<!--    End of Right Box-->
    </div>
<!--    End of Main Container -->
    </div>


<!--    -->
<!--    -->
<!--    END of Menu / Entry Options-->
</div>
<!--End of Outside container-->




<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://cdn.tiny.cloud/1/k0a77hfh9uryhtf52x82yjfz4tu70ynrtk6iwnsmrkqoglzp/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<script src="../ass/res/js/image-picker.js"></script>
<script src="../ass/res/js/image-picker.min.js"></script>
<script type="text/javascript">

    function getImage(){
        document.getElementById('tiny3').style.display ="none";
        tinymce.editors['tiny'].hide();
        $("select").imagepicker({
            hide_select : true,
            show_label  : false
        })


    }
   function getHTML(){
       text=tinyMCE.activeEditor.getContent();
       document.getElementById('tiny3').value = text;
       document.getElementById('tiny2').value = text;
       document.getElementById('tiny2').style.display ="block";
       tinymce.editors['tiny'].hide();
       document.getElementById('tiny').style.display ="none";
 // alert();
         // alert(text)
   //document.getElementById("#tiny3").value = text;
     // var text=tinyMCE.activeEditor.getContent();

     // document.getElementById("#tiny2").innerHTML = text;


    }
   function getText(){
      text = document.getElementById('tiny2').value;
       document.getElementById('tiny2').style.display ="none";
       tinymce.editors['tiny'].show();
       tinyMCE.activeEditor.setContent(text);




      // text=tinyMCE.activeEditor.getContent();


       // alert();
       // alert(text)
       //document.getElementById("#tiny3").value = text;
       // var text=tinyMCE.activeEditor.getContent();

       // document.getElementById("#tiny2").innerHTML = text;


   }
    tinymce.init({
        selector: '#tiny',
        width: 600,
        height: 400,
        plugins: 'advlist',
        content_css: '../ass/res/css/mycss.css'
    }

    );

    </script>
<script src="../ass/res/js/myJS.js"></script>
</body>

</html>