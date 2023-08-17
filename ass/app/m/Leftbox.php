<?php
if (session_status() == PHP_SESSION_NONE) {
	session_start();
}

if (isset($_POST['val'])) {
	$val = $_POST['val'];

	$Leftbox = new Leftbox();
	$result = $Leftbox->fillLeftbox($val);
	echo $result;
}


class Leftbox
{

	private $message = "<div id='message' class='message' style='position: absolute ; margin: 150px 100px; background-color: red; color: white !important; border-style: solid; height: 200px; width: 300px;'><strong><p style='margin: auto auto;'>You need to be logged in to use this option. Register / Login NOW!</p></strong></div>";
	private $posting = "

	<div class='postingbox container' id='postingbox'>
    <div class='mypostings container' id='mypostings'>My Postings</div>

    <div class='pselector' id='pselector'>New Posting

        <select id='pselect' class='pselect'>
            <option value='newsitem'>News</option>
            <option value='announcement'>Announcements</option>
            <option value='vacancy'>Vacancies</option>
            <option value='events'>Events</option>
            <option value='trades'>Trades Needed</option>
            <option value='offers'>Offers</option>
            <option value='sales'>Sales and Wants</option>
            <option value='walks'>Walking Routes</option>
        </select>
        <button id='pbutton' onclick='getPselectValue()'>Continue</button>
    </div>
</div>
";
// End of "Posting" ===================================================================================================

	private $routelist = "  
  <div class='container tabs '>
            <!-- Nav tabs -->
        <ul class='nav nav-tabs' role='tablist'>
         <li class='nav-item'>
                <a class='nav-link active' data-toggle='tab' href='#Details'>Details</a>
            </li>
			   <li class='nav-item'>
                <a class='nav-link' data-toggle='tab' href='#Include'>Include</a>
            </li>
						
            <li class='nav-item'>
                <a class='nav-link ' data-toggle='tab' href='#Text'>Text</a>
            </li>
            <li class='nav-item'>
                <a class='nav-link' data-toggle='tab' href='#Image'>Image</a>
            </li>
                      <li class='nav-item'>
                <a class='nav-link' data-toggle='tab' href='#Meet' >Meet</a>
            </li>
                      <li class='nav-item'>
                <a class='nav-link' data-toggle='tab' href='#Map' >Map</a>
            </li>
            
                      <li class='nav-item'>
                <a class='nav-link' data-toggle='tab' href='#PDF' >PDF</a>
            </li>
            
                        
            <li class='nav-item'>
                <a class='nav-link' data-toggle='tab' href='#Video' >Video</a>
            </li>
            
            <li class='nav-item'>
                <a class='nav-link' data-toggle='tab' href='#HTML'>HTML</a>
            </li>

        </ul>
        <!-- Tab panes -->
      <!-- Tab panes -->   
      <!-- Start of Details Tab -->  
         <div id='tab-panes' class='tab-content nomargins'>
         
            <div id='Details' class='container active tab-pane  nomargins'><br>
			
			<label class='nomargins'>Route title: </label><br><input type='text' name='title' id='title'  placeholder='Add Route title' size = '50' ><br><br>
			
			
			
			<div class='row'>
            	<div class='col' style='max-width: 40%' ><label class='nomargins'>Distance (miles):</label><br>
				<input id='distance' type='text' name='distance'  size = '20' placeholder='Add distance' ></div>
				
				<div class='col' ><label class='nomargins'>Ascent (metres):</label><br><input id='ascent' type='text' name='ascent'  size = '20' placeholder='Add accumulated ascent' ></div>
				
			</div><br>
			
			<br>
			 <label class='nomargins'>Terrain encountered:</label><br>
			 <div class='container'>
			 <input type='checkbox' name='tarmac' id='terrain'  value='tarmac' ><label style='margin-left: 2px'>Tarmac</label>
			 <input type='checkbox' name='rocky' id='terrain'  value='rocky' ><label style='margin-left: 2px'>Rocky</label>
			 <input type='checkbox' name='scrambling' id='terrain'  value='scrambling' ><label style='margin-left: 2px'>Scrambling</label>
			 <input type='checkbox' name='steep' id='terrain'  value='steep' ><label style='margin-left: 2px'>Steep</label>
			<input type='checkbox' name='oa' id='terrain'  value='open access'><label style='margin-left: 2px'>Open Access</label><br>
			<input type='checkbox' name='easy' id='terrain'  value='easy' ><label style='margin-left: 2px'>Easy</label>
			<input type='checkbox' name='narrow' id='terrain'  value='narrow edges' ><label style='margin-left: 2px'>Narrow Edges</label>
			<input type='checkbox' name='wet' id='terrain'  value='wet' ><label style='margin-left: 2px'>Wet/Boggy</label>
			<input type='checkbox' name='wet' id='terrain'  value='challenging' ><label style='margin-left: 2px'>Challenging</label>
			</div> <br>
			
			<label class='nomargins'>Grade:</label><br>
			 <div class='container'>
			 
			 <input type='radio' name='grade' id='grade'  value='1' ><label style='margin-left: 2px'>Easy</label>
			 <input type='radio' name='grade' id='grade'  value='2' ><label style='margin-left: 2px'>Easy/Moderate</label>
			 <input type='radio' name='grade' id='grade'  value='3' ><label style='margin-left: 2px'>Moderate+</label>
			 <input type='radio' name='grade' id='grade'  value='4' ><label style='margin-left: 2px'>Strenuous</label>
			 <input type='radio' name='grade' id='grade'  value='5' ><label style='margin-left: 2px'>Extreme</label>
			</div> <br>
			
			
				
				
			  <label class='nomargins'>UK National Grid Reference:</label><br><input type='text' name='gridref' id='gridref'  placeholder='Add Grid Reference i.e. XX123456 (no other formats accepted)' size = '50' ><br>
				  
				 
				 
             </div>
			 
			   <div id='Include' class='container tab-pane  nomargins' >
                
				<label class='nomargins'>Preamble: </label><br><input type='text' name='preamble' id='preamble'  placeholder='Choose preamble or ignore, click to search ---> ' size = '50' >
				<a href='#'><img src='res\img\search.png' width='40px' style='display: inline' /></a><br>
				
				<label class='nomargins'>Footer: </label><br><input type='text' name='footer' id='footer'  placeholder='Choose footer or ignore, click to search --->  ' size = '50' >
				<a href='#'><img src='res\img\search.png' width='40px' style='display: inline' /></a><br>
				
				<label class='nomargins'>Notes: </label><br><input type='text' name='notes' id='notes'  placeholder='Choose notes or ignore, click to search --->  ' size = '50' >
				<a href='#'><img src='res\img\search.png' width='40px' style='display: inline' /></a><br>
				
				<label class='nomargins'>Links: </label><br>
				<input type='text' name='vr' id='vr'  placeholder='Add View Ranger link or ignore, click to paste ---> ' size = '50' ><a href='#'><img src='res\img\paste.png' width='40px' style='display: inline' /></a><br>
				<input type='text' name='os' id='os'  placeholder='Add OS Maps link or ignore, click to paste --->  ' size = '50' ><a href='#'><img src='res\img\paste.png' width='40px' style='display: inline' /></a><br>
				<input type='text' name='komoot' id='komoot'  placeholder='Add Komoot link or ignore, click to paste --->  ' size = '50' ><a href='#'><img src='res\img\paste.png' width='40px' style='display: inline' /></a><br>
				
			
			
			
			
			            </div>

     
            <div id='Text' class='container tab-pane  nomargins' >
			<div class='btn-group btn-justified'>
                        <button class='btn btn-warning navbar-btn'>Clear</button>
                        <button class='btn btn-warning navbar-btn'>Paste</button>
                        <button class='btn btn-warning navbar-btn'>Preview</button>
                        </div>
                <div id='text-container' class='container d-flex nomargins' >
                    <textarea  id='tiny4' ></textarea>
                    <textarea  id='tiny3' ></textarea>

                    <label for='tiny'></label><textarea id='tiny' ></textarea>


			                </div>
			            </div>
			       <!-- Start of Image Tab -->       	
			     <div id='Image' class='container tab-pane fade nomargins'><br>
				 	<div id='iSelect'>
						<button name='i' onclick='fetchMedia(this.name)'>SELECT</button>
						<p>from the images already saved in your account</p>
					</div>


					<div id='iText1' class='itext'><strong>OR</strong><br>
			     		<label class='itext' >Select an image from your computer (.jpg, .jpeg or .png only)</label>
						<input id='iEntry' type='file' name='i' accept='image/*' onchange='showUpload(this.name)'><br>
					</div>

			     	<div id='iUpload' style='display: none; margin-top: 5px'>
						<button  name='i' onclick='saveMedia(this.name)'>UPLOAD</button> 
						<p>to upload the selected image, (caption required first!).</p>
					</div>
					<div id='iOutput' style='position:absolute; margin-top: 25px'>
					</div>	

					<div id='iNew' style='display: none; margin-top: 250px;'>
				 	<label class='nomargins'>Image to be used:</label><br><input id='iFile' type='text' name='ifile'  size = '50' placeholder='No file selected' readonly>
			     	<label class='nomargins'>Caption to be used:</label><br><input type='text' name='icaption' id='iCaption'  placeholder='Choose image - then add/amend caption (required)' size = '50' ><br>
					</div>
				 
					<div id='iText3'>	</div>
					<div id='iText2'>	</div>     
			 			     
			     			      			     
 			      	<div id='iClear' style='display: none; margin-top: 360px; position: fixed;' >
						<button name='i' onclick='clearImage(this.name)'>Clear</button>
						<p>currently selected image choice.</p>
					</div>
 			   	</div>
 			   	<!-- Start of Meet Tab -->  
               	 <div id='Meet' class='container tab-pane fade nomargins'>
				 <label class='nomargins'>Location Name: </label><br><input type='text' name='loc_name' id='loc_name'  placeholder='Add NEW location name or click to search ---> ' size = '50' >
				<a href='#'><img src='res\img\search.png' width='40px' style='display: inline' /></a><br>
				
				<label class='nomargins'>Address</label><br>
				<input type='text' name='loc_add1' id='loc_add1'  placeholder='Add first address line of location ' size = '50' ><br>
				<input type='text' name='loc_add2' id='loc_add2'  placeholder='Add second address line of location ' size = '50' ><br>
				<input type='text' name='loc_add3' id='loc_add3'  placeholder='Add third address line of location ' size = '50' ><br>
				<input type='text' name='loc_town' id='loc_town'  placeholder='Select town of location ' size = '30' ><br>
				<input type='text' name='loc_county' id='loc_county'  placeholder='Select UK county of location ' size = '30' ><br>
				<div class='row'>
				<div class='col'><input type='text' name='loc_postcode' id='loc_postcode'  placeholder='Add UK postcode ' size = '30' ></div>
				<div class= 'col'><input type='text' name='loc_phone' id='loc_phone'  placeholder='Add contact phone number ' size = '30' ><br></div>
				</div>
				<div class='row'>
				<div class = 'col'><label class='nomargins'>What3Words Code: </label><br>
				<input type='text' name='loc_what3words' id='loc_what3words'  placeholder='' size = '10' ><a href='#'><img src='res\img\paste.png' width='40px' style='display: inline' /></a></div>
				<div class = 'col'><label class='nomargins'>UK National Grid Ref: (i.e. XX123456)</label><br>
				<input type='text' name='loc_osref' id='loc_osref'  placeholder='' size = '10' ><a href='#'><img src='res\img\paste.png' width='40px' style='display: inline' /></a></div>
				</div>
				
				
				<input type='text' name='loc_google' id='loc_google'  placeholder='Google maps link' size = '50' ><a href='#'><img src='res\img\paste.png' width='40px' style='display: inline' /></a>
				<input type='text' name='loc_streetview' id='loc_streetview'  placeholder='Google Streetview link' size = '50' ><a href='#'><img src='res\img\paste.png' width='40px' style='display: inline' /></a>
				<input type='text' name='loc_venue' id='loc_venue'  placeholder='Venue URL ' size = '50' ><a href='#'><img src='res\img\paste.png' width='40px' style='display: inline' /></a>
				<input type='text' name='loc_weather' id='loc_weather'  placeholder='Weather URL' size = '50' ><a href='#'><img src='res\img\paste.png' width='40px' style='display: inline' /></a>
				
				   
 			   	</div>
 			   	<!-- Start of Map Tab -->  
               	 <div id='Map' class='container tab-pane fade nomargins'><br>
			     <label class='nomargins'>GPX file to be used:</label><br><input id='mFile' type='text' name='ifile'  size = '50' placeholder='No file selected' readonly>
			     <label class='nomargins'>Caption to be used:</label><br><input type='text' name='icaption' id='mCaption'  placeholder='Choose GPX file then add/amend caption (required)' size = '50' ><br>
				 <div id='mOutput' style='position:absolute; margin-top: 25px'></div>	
				 <div id='mText3'>		     
			     <div id='mText1'<p class='itext'><strong>Either</strong><br>
			     <label class='itext' >Select an optional GPX file only</label><br><input id='mEntry' type='file' name='m' accept='.gpx' onchange='showUpload(this.name)' ></div><br>
			     <div id='mUpload' style='visibility: hidden; margin-top: 5px'><button  name='m' onclick='saveGPX(this.name)'>UPLOAD</button> to upload the selected GPX file, (caption required first!).</p></div>
 			     <p id='mText2' class='itext' ><strong>Or</strong><br>
 			     <div id='mSelect' ><button name='v' onclick='fetchGPX(this.name)'>SELECT</button> from the GPX files already saved in your account</p></div></div>
 			      <div id='mClear' style='visibility: hidden; margin-top: 60px' ><button name='v' onclick='clearImage(this.name)'>Clear</button> currently selected video choice.</p></div>
 			   	</div>
 			   	 			   	         
 			   	 <!-- Start of PDF Tab-->  
            <div id='PDF' class='container tab-pane fade nomargins'><br>
                   <label class='nomargins'>PDF to be used:</label><br><input id='pFile' type='text' name='pfile'  size = '50' placeholder='No file selected' readonly>
			     <label class='nomargins'>Caption to be used:</label><br><input type='text' name='pcaption' id='pCaption'  placeholder='Choose PDF - then add/amend caption (required)' size = '50' ><br>
				 <div id='pOutput' style='position:absolute; margin-top: 25px'></div>	
				 <div id='pText3'>		     
			     <div id='pText1'<p class='itext'><strong>Either</strong><br>
			     <label class='itext' >Select a PDF file from your computer.</label><br><input id='pEntry' type='file' name='p' accept='.pdf' onchange='showUpload(this.name)' ></div><br>
			     <div id='pUpload' style='visibility: hidden; margin-top: 5px'><button  name='p' onclick='saveMedia(this.name)'>UPLOAD</button> to upload the selected PDF, (caption required first!).</p></div>
 			     <p id='pText2' class='ptext' ><strong>Or</strong><br>
 			     <div id='pSelect' ><button name='p' onclick='fetchMedia(this.name)'>SELECT</button> from the PDF's already saved in your account</p></div></div>
 			      <div id='pClear' style='visibility: hidden; margin-top: 60px' ><button name='p' onclick='clearImage(this.name)'>Clear</button> currently selected PDF choice.</p></div>
            </div>
 		   	
			  	<!-- Start of Video Tab -->  
               	 <div id='Video' class='container tab-pane fade nomargins'><br>
			     <label class='nomargins'>Video to be used:</label><br><input id='vFile' type='text' name='ifile'  size = '50' placeholder='No file selected' readonly>
			     <label class='nomargins'>Caption to be used:</label><br><input type='text' name='icaption' id='vCaption'  placeholder='Choose video clip - then add/amend caption (required)' size = '50' ><br>
				 <div id='vOutput' style='position:absolute; margin-top: 25px'></div>	
				 <div id='vText3'>		     
			     <div id='vText1'<p class='itext'><strong>Either</strong><br>
			     <label class='itext' >Select an optional video clip mp3 and mp4 formats only</label><input id='vEntry' type='file' name='v' accept='video/*' onchange='showUpload(this.name)' ><br></div>
			     <div id='vUpload' style='visibility: hidden; margin-top: 5px'><button  name='v' onclick='saveMedia(this.name)'>UPLOAD</button> to upload the selected video clip, (caption required first!).</p></div>
 			     <p id='vText2' class='itext' ><strong>Or</strong><br>
 			     <div id='vSelect' ><button name='v' onclick='fetchMedia(this.name)'>SELECT</button> from the video clips already saved in your account</p></div></div>
 			      <div id='vClear' style='visibility: hidden; margin-top: 60px' ><button name='v' onclick='clearImage(this.name)'>Clear</button> currently selected video choice.</p></div>
 			   	</div>
	        	
            
            <!-- Start of HTML Tab -->  
            <div id='HTML' class='container tab-pane fade nomargins' >
                <div class='container nomargins'>
                    <div class='btn-group btn-justified'>
                        <button class='btn btn-danger navbar-btn' onclick='htmlSave()'>Save</button>
                        <button type='button' class='btn btn-danger dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
                           Remove
                        </button>
                        <div class='dropdown-menu'>
                            <a class='dropdown-item' href='#'>Image</a>
                            <a class='dropdown-item' href='#'>Map</a>
                            <a class='dropdown-item' href='#'>Video</a>
                            
                           
                        </div>
                        <button class='btn btn-danger navbar-btn'>Clear</button>
                        <button class='btn btn-danger navbar-btn'>Paste</button>
                        <button class='btn btn-danger navbar-btn'>Return</button>
                        </div>
						<div class='nomargins'>Now SAVE or lose edited changes.</div>


                </div>
                <!-- End of container               -->
                <label for='tiny2'></label><textarea id='tiny2' class='nomargins'></textarea>
                </div>
                <!-- End of HTML Tab Pane           -->
				 
        </div>
	
        <!-- End of Main Tab Pane       -->
<div id='message' class='message overflow-auto ' style='visibility: hidden; z-index: 99; position: absolute ; margin: 150px 100px; background-color: lightpink; color: black !important; border-style: solid; height: 200px; width: 300px;'><strong><p style='margin: auto auto;'></p></strong></div>
    </div>
    
    
    
";
	//=================================================================================================================
	//end of news item
/*	private $business = "";
	private $clubs = "";
	private $community = "";
	private $announcement = "";
	private $vacancy = "";
	private $events = "";
	private $trades = "";
	private $offers = "";
	private $sales = "";
	private $walks = "";
	private $contactus = "";
	private $donation = "";
	private $profile = "";
	private $newslist = "";
	private $buslist = "";
	private $clublist = "";
	private $communitylist = "";
	private $announcelist = "";
	private $vacancylist = "";
	private $eventlist = "";
	private $tradelist = "";
	private $offerlist = "";
	private $salelist = "";
	private $walklist = "";*/

	function __construct()
	{


	}

	/**
	 * @param $x
	 * @return string
	 */
	public function fillLeftbox($x): string
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
            'userlist',
            'message'

		);
		$object = $array[$x - 1];
		if (!isset($_SESSION['userid']) && ($object === 'posting' || $object === 'profile')) {
			return $this->message;
		} else {
			return $this->$object;
		}

	}
}

