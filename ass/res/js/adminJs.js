

//-----------------------------------------------------------------------saveMedia starts
function saveMedia(x) {
    const oCaption = document.getElementById(x + "Caption");
    if (oCaption.value === "") {
        oCaption.style.borderStyle = "dotted";
        oCaption.style.borderColor = "red";
        oCaption.focus();
        return;
    } else {
        oCaption.style.borderStyle = 'solid';
        oCaption.style.borderWidth = 'thin';
        oCaption.style.borderColor = '#4e555b';
    }


    const  oEntry = document.getElementById(x + 'Entry');

    const  oFile = document.getElementById(x + "File");
    const  oUpload = document.getElementById(x + "Upload");
    const  oText1 = document.getElementById(x + "Text1");
    const  oText2 = document.getElementById(x + "Text2");
    const  oClear = document.getElementById(x + "Clear");


    oUpload.style.visibility = 'hidden';
    oEntry.style.visibility = 'hidden';


    const oOutput = document.getElementById(x + "Output");
    oOutput.style.display="block";

    var oData = new FormData();

//    console.log(oEntry.files[0]);

    oData.append('submit', 'submit');
    oData.append('file', oEntry.files[0]);
    oData.append('caption', oCaption.value);
    oData.append('type', x);

    


    var oReq = new XMLHttpRequest();


    oReq.onload = function () {
        if (oReq.status === 200 && oReq.readyState === 4) 
        {
            
            oCaption.readOnly = true;
            oFile.value = oReq.response;
           // console.log(oFile.value);
            switch(x) {
                case "i":
                    const src = "../ass/data/pics/" + oFile.value;
                    //console.log (window.location);
                    oText1.style.display = "none";
                    oOutput.style.display = "block";
                    oClear.style.display = "block";
                    oOutput.style.marginTop = '50px';
                    oOutput.innerHTML = "<img  src='" + src + "'" + " height='200px'  alt=''> ";
                    break;
                case "v":
                    src = "data/vids/" + oFile.value;
                    ext = oFile.value.split('.')[1];
                    oOutput.innerHTML = "<video height='200px'  preload='metadata'><source src='"+src+"' type='video/"+ext+"'></video>";
                    break;
                case "p":
                    src = "data/pdfs/" + oFile.value;
                    oOutput.innerHTML = "<img style='z-index: 999' src='../ass/res/img/pdf.png' height='200px'  alt=''> ";
                    break;
            }
            oClear.style.display = "block";       
        } else {
            oOutput.innerHTML = "Error " + oReq.status + " occurred when trying to upload your file. <br>";
        }
    };

    oReq.open("POST", "../ass/app/u/mediaHandler.php", true);
    oReq.send(oData);

}
// End of saveMedia

function showUpload(x) {
    const oUpload = document.getElementById(x + "Upload");
    const oSelect = document.getElementById(x + "Select");
    const oCaption = document.getElementById(x + "Caption");
    const oNew =  document.getElementById(x + "New");
    oUpload.style.display = 'block';
    oSelect.style.display = 'none';
    oNew.style.display = 'block';
    oCaption.style.display = 'block';
    oNew.style.marginTop = '50px';

}
// End of showUpload

function clearImage(x) {
    const  oEntry = document.getElementById(x + 'Entry');
    const  oCaption = document.getElementById(x + "Caption");
    const  oFile = document.getElementById(x + "File");
    const  oUpload = document.getElementById(x + "Upload");
    const  oSelect = document.getElementById(x + "Select");
    const  oClear = document.getElementById(x + "Clear");
    const  oText1 = document.getElementById(x + "Text1");
    const  oText2 = document.getElementById(x + "Text2");
    const  oOutput = document.getElementById(x + "Output");
    const oNew = document.getElementById(x+"New");
    oFile.value = "";
    oCaption.value = "";
    oEntry.value = "";
    oUpload.style.display = "none";
    oEntry.style.display = "block";
    oText1.style.display = "block";
    oText2.style.display = "block";
    oSelect.style.display = "block";
    oClear.style.display = "none";
    oNew.style.display = "none";
    oOutput.innerHTML = "";
}
// End of clearImage


function getCaption(value) {
    x = value.substr(0,1);
    id = value.substr(1);
    let oFile = document.getElementById(x + "File");
    let oCaption = document.getElementById(x + "Caption");
    let oClear = document.getElementById(x + "Clear");
    let oOutput = document.getElementById(x + "Output");
    let oText3 = document.getElementById(x + "Text3");
    const oNew = document.getElementById(x + "New");
    let oData = new FormData();
    oData.append('submit', 'submit');
    oData.append('id', id);
    oData.append('type', x);
    let oReq = new XMLHttpRequest();
    oReq.onload = function () {
        if (oReq.status === 200 && oReq.readyState === 4) {
            oText3.style.display = 'none';
            oNew.style.display = 'block';
            oCaption.style.display = 'block';
            oCaption.readOnly = false;
            oCaption.value = oReq.response;
            oClear.style.display = 'block';
            oClear.style.position = 'relative';
            oClear.style.marginTop = 0;
            oFile.value = id;
            switch(x) {
                case "i":
                    src = "../ass/data/pics/" + oFile.value;
                    oOutput.innerHTML = "<img  src='" + src + "'" + " height='200px'  alt=''> ";
                    break;
                case "v":
                    src = "../ass/data/vids/" + oFile.value;
                    oOutput.innerHTML = "<video  src='" + src + "'" + " height='200px' preload='metadata' ><source src='.$src.' type='.$vidtype.'></video>";
                    break;
                case "p":
                    src = "../ass/data/pdfs/" + oFile.value;
                    oOutput.innerHTML = "<img  src='../ass/res/img/pdf.png'" + " height='200px'  alt=''> ";
                    break;
            }
        } else {
            oOutput.innerHTML = "Error " + oReq.status + " occurred when trying to upload your file. <br>";
        }
    };
    if (x==='v'){
        oOutput.innerHTML = "Loading - please wait!";
    }
    oReq.open("POST", "../ass/app/u/fetchCaption.php", true);
    oReq.send(oData);
}
// End of getCaption

function fetchMedia(x) {

    const  oEntry = document.getElementById(x + "Entry");
    const  oCaption = document.getElementById(x + "Caption");
    const  oFile = document.getElementById(x + "File");
    const  oUpload = document.getElementById(x + "Upload");
    const  oSelect = document.getElementById(x + "Select");
    const  oClear = document.getElementById(x + "Clear");
    const  oText1 = document.getElementById(x + "Text1");
    const  oText2 = document.getElementById(x + "Text2");
    const  oText3 = document.getElementById(x + "Text3");
    const  oOutput = document.getElementById(x + "Output");
    const  oNew = document.getElementById(x + "New");
    oFile.value = "";
    oCaption.value = "";
    oEntry.value = "";
    [oSelect, oUpload, oText1, oText2, oText3, oClear, oNew].forEach(element => { element.style.display = "none"});
    oOutput.innerHTML = "";
    let oData = new FormData();
    oData.append('submit', 'submit');
    oData.append('type', x);
    let oReq = new XMLHttpRequest();
    oReq.onload = function () {
        if (oReq.status === 200 && oReq.readyState === 4) {
            oOutput.innerHTML = oReq.response;
            oClear.style.display = "block";  
            oClear.style.position = 'fixed';
            oClear.style.marginTop = '360px';
        } else {
            oOutput.innerHTML = "Error " + oReq.status + " occurred when trying to upload your file. <br>";
        }
    };
    if (x==='v'){
        oOutput.innerHTML = "Loading - please wait!";
    }
   
    oReq.open("POST", "../ass/app/u/fetchMedia.php", true);
    oReq.send(oData);
}
// End of fetchMedia


function fillRightbox(x)
{
    var right = document.getElementById("right-container");
    var left =  document.getElementById("left-container");
    $.ajax({
        type: 'POST',
        url: 'app/m/Rightbox.php',
        data: {
            'val': x,
        },
        success: function(r){
            if(x===3) {
                left.innerHTML = "";
                left.style.backgroundColor = '#ffffff';
               left.style.visibility = 'hidden';
            }
            if (r!=="blank") {

                right.innerHTML = r;
            }
        }
    });

}
// End of fillRightbox

function addMessage(x){
    let message = document.getElementById("message");
    x="<br>"+x;
    message.innerHTML = message.innerHTML.concat(x);
}


function fillLeftbox(x)
{
    var left = document.getElementById("left-container");
    $.ajax({
        type: 'POST',
        url: 'app/m/Leftbox.php',
        data: {
            'val': x,
        },
        success: function(l){
                if(x===2) {
                    left.value = "";
                    left.style.backgroundColor = 'none'
                    left.style.visibility = 'hidden';
                }
                    else {
                    left.innerHTML = l;
                    left.style.visibility = 'visible';
                }

                if (1!==null){
                    left.style.backgroundColor = '#f2f2f2';
                    }
                    array = [8, 13, 14, 15, 16,17, 18];
                    if (array.includes(x)) {
                        initTiny();
                }
            }

    });
}

function load_ifrm() {
    var site = "app/u/loadCropper.php"
    var ifrm = document.getElementsByName('cropper')[0]
    ifrm.height = '600px'
    ifrm.width = '800px'
    ifrm.src = site
    ifrm.style.zindex = '999'
    ifrm.style.border = 'solid'

}

function close_ifrm() {
    var site = ""
    var ifrm = document.getElementsByName('cropper')[0]
    ifrm.height = ''
    ifrm.width = ''
    ifrm.src = site
    ifrm.style.zindex = '999'
    ifrm.style.border = 'none'
    reload();
}

function initTiny(){
    tinymce.init({
        selector: '#tiny',
        width: 420,
        height: 420,
        plugins: 'advlist',
        content_css: '../ass/res/css/mycss.css'
    })
}
function goHome(){

    location.reload()
}


function reload() {

   location.reload()

}


function hello() {

    alert("Hello World")
}





function getOption(id) {

    let types = [
        'menu',
        'login',
        'register',
        'reset',
        'password',
        'picture',
       'routelist',
        'cohortlist',
        'userlist'
    ];
    let x = types.indexOf(id) + 1;
        fillRightbox(x);
        fillLeftbox(x);

}
     function getPselectValue() {
         let value = document.getElementById("pselect").value;
         getOption(value);
}


// Manipulation of Boostrap Toggleable Tabs ============================================================================
// Identifies actions based on tab clicked
$(document).on( 'shown.bs.tab', 'a[data-toggle="tab"]', function (e) {
    var target = $(e.target).attr("href");
    let tiny2 = document.getElementById('tiny2');
    let tiny3 = document.getElementById('tiny3');
    var text = tinyMCE.activeEditor.getContent();
    if (target !== '#Text' && target !== '#HTML') {
        tiny3.value = text;
        tiny2.value = text;
                }
            else{
        if (target === '#HTML') {
          tiny2.value = text;
          tiny3.value = text;
        }
            else{
            text = tiny3.value;
            tinyMCE.activeEditor.setContent(text);

        }

    }

});

function htmlSave(){
    let tiny2 = document.getElementById('tiny2');
    let tiny3 = document.getElementById('tiny3');
    tiny3.value = tiny2.value;


}

// Gets image from the image library - may use for galleries
function getImage(){
      $("select").imagepicker({
        hide_select : true,
        show_label  : false
    })
}

function getSelect() {
    var file=document.getElementById('xyz')
    file.click();

} false;

function getStored(i) {
    alert('clicked');

}

$("img").click(function(){
     var image = $(this).attr("id");
  var input =  document.getElementById('stored');
  input.value = image;
});

function testUpdate() {
    var input =  document.getElementById('ifile');
    input.value = 'updated';

}

//================================================================== WIP

function useAjax(url, callback) {
    var oReq = new XMLHttpRequest();
    oReq.onreadystatechange = function () {
        if (oReq.status === 200 && oReq.readyState === 4) {
            callback(this);
        }

    };
    oReq.open("POST", url, true);
    oReq.send();
}
// end of useAjax
