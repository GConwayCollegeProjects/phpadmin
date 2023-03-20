
// Top Box Search input

    let topSearch = document.getElementById("topSearch");

function buttonClicked(){

    alert ('button pressed');
}


// Save Newsitem =====================================================================================================
let button = document.getElementById("nheadline");
button.addEventListener('click', function(ev) {

    alert ('button pressed');
// from rightbox newsitem

    let nheadline = document.getElementById("nheadline")
    let sel = document.getElementById("nselect")
    var opts = [], opt;
    for ( var i = 0, len = sel.options.length; i < len; i++ ) {
        opt = sel.options[i];
        if ( opt.selected === true ) {
        opts.push(opt);
        }
    }
    var nselect = opts;
    let nsource = document.getElementById("nsource")
    let nstart = document.getElementById("nstart")

// from leftbox

    let ifile = document.getElementById("ifile")
    let icaption = document.getElementById("icaption")
    let vfile = document.getElementById("vfile")
    let vcaption = document.getElementById("vcaption")
    let pfile = document.getElementById("pfile")
    let pcaption = document.getElementById("pcaption")
    let url = document.getElementById("url")
    let ucaption = document.getElementById("ucaption")

    var oOutput = document.getElementById("output"),
        oData = new FormData();


     oData.append('submit', 'submit');
     oData.append('ifile', ifile.files[0]);

    oData.append('icaption', icaption.value);


    var oReq = new XMLHttpRequest();
    oReq.open("POST", "app/u/mediaHandler.php", true);
    oReq.onload = function(oEvent) {
        if (oReq.status === 200) {
            oOutput.innerHTML = "Uploaded!";
        } else {
            oOutput.innerHTML = "Error " + oReq.status + " occurred when trying to upload your file.<br>";
        }
    };

    oReq.send(oData);
    ev.preventDefault();
}, false);
//end Save Newsitem ===================================================================================================
