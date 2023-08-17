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



// ===============================================================================================================
