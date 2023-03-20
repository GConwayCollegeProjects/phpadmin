$(document).on( 'shown.bs.tab', 'a[data-toggle="tab"]', function (e) {
    console.log(e.target) // activated tab
})


$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    var target = $(e.target).attr("href") // activated tab
    alert(target);
});

$( "#fileSelect" ).click(function() {
    alert( "Handler for .click() called." );
});

fileSelect.addEventListener("click", function (e) {
    if (file) {
        file.click();
    }
    e.preventDefault(); // prevent navigation to "#"
}, false);


const fileSelect = document.getElementById("fileSelect"),
    file = document.getElementById("file"),




    file.addEventListener("change", handleFiles, false);
