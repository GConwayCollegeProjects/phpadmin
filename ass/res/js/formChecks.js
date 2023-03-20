// used to check new name entries for Individuals and create default Screen Name
function setScreen() {
    var name = document.getElementById('rname');
    string = name.value;
    string = string.trim();
    string = string.replace(/['"]+/g, '');
                if (string.length<8){
                name.title = "Invalid entry - must be 8 characters minimum"
                name.style.borderStyle = "dotted";
                name.style.borderColor= "red";
                name.focus();
                }
                else{
                name.title = "Enter Full Name - only letters a-z allowed"
                name.style.borderStyle = "none";
                var screen = document.getElementById('rscreen');
                var x = name.value;

                $.ajax({
                type: 'POST',
                dataType: 'JSON',
                url: 'app/u/screenHandler.php',
                data: {
                    'val': x,
                },
                success: function (data) {
                    if (screen.value===""){
                    screen.value = data[0]};
                    name.value = data[1];
                }
                });
            }


}
// used to check screenname not already used

function checkScreen(){
    var input = document.getElementById("rscreen");
    var x = input.value;
    if (x!=="") {
        $.ajax({
            type: 'POST',
            dataType: 'JSON',
            url: 'app/u/screenChecker.php',
            data: {
                'val': x,
            },
            success: function (data) {
                if (data === "true") {
                    input.title = "Name entered already taken - sorry"
                    input.style.borderStyle = "dotted";
                    input.style.borderColor = "red";
                    input.focus();
                } else {
                    input.title = "Enter Screen Name - only letters and numbers allowed without spaces"
                    input.style.borderStyle = "none";
                    input.style.borderColor = "red";
                }
            }
        });
    }
    else{
        input.title = "This cannot be blank - Please enter unique Screen Name";
        input.style.borderStyle = "dotted";
        input.style.borderColor = "red";
        input.focus();
    }
}

$(document).on("keydown", ":input:not(:submit)", function(event)
{
    return event.key !== "Enter";


});


// used to check email address is valid and not already used

function checkEmail(){
    var input = document.getElementById("remail");
    var x = input.value;

    if (x!=="") {
        $.ajax({
            type: 'POST',
            dataType: 'JSON',
            url: 'app/u/emailChecker.php',
            data: {
                'val': x,
            },
            success: function (data) {
                input.value = data[0];
                     var  y = data[1];

                if (y === "false") {
                    input.title = "Email already used or invalid - can try logging in or try another"
                    input.style.borderStyle = "dotted";
                    input.style.borderColor = "red";

                    input.focus();
                } else {
                    input.title = "Enter Email Address - only lowercase letters, numbers, @, - and . symbols allowed without spaces"
                    input.style.borderStyle = "none";

                }


            }
        });
    }
}

function checkRepeat(){
    var input = document.getElementById("rrepeat");
    var password = document.getElementById("rpass");
    var x = input.value;
    var y = password.value;


            if (!x===y){
                input.title = "Passwords don't match"
                input.style.borderStyle = "dotted";
                input.style.borderColor= "red";
                input.value = "";
                input.focus();
            }
            else{
                input.title = "Repeat EXACTLY as above. "
                input.style.borderStyle = "none";
                input.style.borderColor= "red";
            }


}

function finalNewscheck(){



    return true;
}














function InvalidInputHelper(input, options) {
    input.setCustomValidity(valOrFunction(options.defaultText, window, [input]));

    function changeOrInput() {
        if (input.value == "") {
            input.setCustomValidity(valOrFunction(options.emptyText, window, [input]));
        } else {
            input.setCustomValidity("");

        }
    }
}

function message() {

        var message = window.open('message.php',"" , height=150, width=250, top=100, left=400, scrollable=no, menubar=no, titlebar=no, status=no );
        message.document.write("<p>This is a message window</p>");
    }