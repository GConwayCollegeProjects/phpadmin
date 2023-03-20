// Top Box Search input


// Save Newsitem =====================================================================================================


function newsUpload() {
    if (!finalNewscheck()){

    }
    else {
        document.getElementById("message").style.visibility = 'visible';

// from rightbox newsitem

        let subject = document.getElementById("subject");
        let sel = document.getElementById("select");
        let source = document.getElementById("source");
        let start = document.getElementById("start");
        let time = document.getElementById("time");

// from leftbox

        let iFile = document.getElementById("iFile");
        let iCaption = document.getElementById("iCaption");
        let vFile = document.getElementById("vFile");
        let vCaption = document.getElementById("vCaption");
        let pFile = document.getElementById("pFile");
        let pCaption = document.getElementById("pCaption");
        let URL = document.getElementById("URL");
        let uCaption = document.getElementById("uCaption");
        let Text = tinyMCE.activeEditor.getContent();


        var oOutput = document.getElementById("message"),
            oData = new FormData();


        oData.append('submit', 'submit');
        oData.append('subject', subject.value);
        oData.append('source', source.value);
        oData.append('start', start.value);
        oData.append('time', time.value);
        if (iFile.value !== "") {
            oData.append('iFile', iFile.value);
            oData.append('iCaption', iCaption.value);
        }
        if (vFile.value !== "") {
            oData.append('vFile', vFile.value);
            oData.append('vCaption', vCaption.value);
        }
        if (pFile.value !== "") {
            oData.append('pFile', pFile.value);
            oData.append('pCaption', pCaption.value);
        }
        if (URL.value !== "") {
            oData.append('URL', URL.value);
            oData.append('uCaption', uCaption.value);
        }
        oData.append('Text', Text);


        for (var i = 0, len = sel.options.length; i < len; i++) {
            opt = sel.options[i];
            if (opt.selected === true) {
                oData.append('select[]', opt.text);
            }
        }


        var oReq = new XMLHttpRequest();

        oReq.open("POST", "app/u/saveNewsitem.php", true);

        oReq.onload = function (oEvent) {
            if (oReq.status === 200 && oReq.readyState === oReq.DONE) {
                oOutput.innerHTML = "Upload in Progress!<br>";
            } else {
                oOutput.innerHTML = "Error " + oReq.status + " occurred when trying to upload your file.<br>";
            }
        };

        oReq.send(oData);
    }
} //end Save Newsitem ===================================================================================================
//==============================================================
// Save Media
// This function automates the saving of a 'new' media file from the users
// computer. It also updates the "to be used" fields for file and caption
//==============================================================
function saveMedia(x) {
    let oCaption = document.getElementById(x + "Caption");
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


    let oEntry = document.getElementById(x + 'Entry');

    let oFile = document.getElementById(x + "File");
    let oUpload = document.getElementById(x + "Upload");
    let oText1 = document.getElementById(x + "Text1");
    let oText2 = document.getElementById(x + "Text2");
    let oClear = document.getElementById(x + "Clear");


    oUpload.style.visibility = 'hidden';
    oEntry.style.visibility = 'hidden';


    let oOutput = document.getElementById(x + "Output");

    var oData = new FormData();

    oData.append('submit', 'submit');
    oData.append('file', oEntry.files[0]);
    oData.append('caption', oCaption.value);
    oData.append('type', x);


    var oReq = new XMLHttpRequest();


    oReq.onload = function () {
        if (oReq.status === 200 && oReq.readyState === 4) {
            oUpload.style.visibility = 'hidden';
            oEntry.style.visibility = 'hidden';
            oText1.style.visibility = 'hidden';
            oText2.style.visibility = 'hidden';
            oCaption.readOnly = true;
            oFile.value = oReq.response;
            switch(x) {
                case "i":
                    src = "data/pics/" + oFile.value;
                    oOutput.innerHTML = "<img style='z-index: 999' src='" + src + "'" + " height='200px'  alt=''> ";
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
            oClear.style.visibility = 'visible';
        } else {
            oOutput.innerHTML = "Error " + oReq.status + " occurred when trying to upload your file. <br>";
        }
    };

    oReq.open("POST", "../ass/app/u/mediaHandler.php", true);
    oReq.send(oData);

}

function showUpload(x) {
    let oUpload = document.getElementById(x + "Upload");
    let oSelect = document.getElementById(x + "Select");
    let oCaption = document.getElementById(x + "iCaption");
   oUpload.style.visibility = 'visible';
   oSelect.style.visibility = 'hidden';
}


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


function clearImage(x) {
    let oEntry = document.getElementById(x + 'Entry');
    let oCaption = document.getElementById(x + "Caption");
    let oFile = document.getElementById(x + "File");
    let oUpload = document.getElementById(x + "Upload");
    let oSelect = document.getElementById(x + "Select");
    let oClear = document.getElementById(x + "Clear");
    let oText1 = document.getElementById(x + "Text1");
    let oText2 = document.getElementById(x + "Text2");
    let oOutput = document.getElementById(x + "Output");
    oFile.value = "";
    oCaption.value = "";
    oEntry.value = "";
    oUpload.style.visibility = 'hidden';
    oEntry.style.visibility = 'visible';
    oText1.style.visibility = 'visible';
    oText2.style.visibility = 'visible';
    oSelect.style.visibility = 'visible';
    oClear.style.visibility = 'hidden';
    oOutput.innerHTML = "";
}
// ===============================================================================================================
function fetchMedia(x) {

    let oEntry = document.getElementById(x + "Entry");
    let oCaption = document.getElementById(x + "Caption");
    let oFile = document.getElementById(x + "File");
    let oUpload = document.getElementById(x + "Upload");
    let oSelect = document.getElementById(x + "Select");
    let oClear = document.getElementById(x + "Clear");
    let oText1 = document.getElementById(x + "Text1");
    let oText2 = document.getElementById(x + "Text2");
    let oText3 = document.getElementById(x + "Text3");
    let oOutput = document.getElementById(x + "Output");
    oFile.value = "";
    oCaption.value = "";
    oEntry.value = "";
    oUpload.style.visibility = 'hidden';
    oEntry.style.visibility = 'hidden';
    oText1.style.visibility = 'hidden';
    oText2.style.visibility = 'hidden';
    oText3.style.visibility = 'hidden';
    oClear.style.visibility = 'hidden';
    oOutput.innerHTML = "";


    let oData = new FormData();
    oData.append('submit', 'submit');
    oData.append('type', x);
    let oReq = new XMLHttpRequest();
    oReq.onload = function () {
        if (oReq.status === 200 && oReq.readyState === 4) {
           oCaption.readOnly = true;
            oOutput.innerHTML = oReq.response;
            oSelect.style.visibility = 'hidden';
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
//=====================================================================================================================
function getCaption(value) {
    x = value.substr(0,1);
    id = value.substr(1);
    let oFile = document.getElementById(x + "File");
    let oCaption = document.getElementById(x + "Caption");
    let oClear = document.getElementById(x + "Clear");
    let oOutput = document.getElementById(x + "Output");
    let oText3 = document.getElementById(x + "Text3");
    let oData = new FormData();
    oData.append('submit', 'submit');
    oData.append('id', id);
    oData.append('type', x);
    let oReq = new XMLHttpRequest();
    oReq.onload = function () {
        if (oReq.status === 200 && oReq.readyState === 4) {
           oText3.style.visibility = 'hidden';
           oCaption.readOnly = false;
            oCaption.value = oReq.response;
          oClear.style.visibility = 'visible'
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
