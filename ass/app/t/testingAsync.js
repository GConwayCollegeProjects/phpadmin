function SomeAjaxService(webServiceUrl)
{
    this.getSomeModel = function(someUniqueId, callback){
        var ajaxOptions = {
            url: webServiceUrl,
            data: {id : someUniqueId},
            // calls the callback you passed
            Success: function(data) { callback(new SomeModel(data)); }
        };
        // this is asynchronous and doesn't return anything
        $.ajax(ajaxOptions);
    };
}

var ajaxService = new SomeAjaxService("http://someurl");
// your callback down here
var myModel;
ajaxService.getSomeModel(1, function(model) {
    myModel = model;
    // do something with model
});

share
edited Jul 2 '11 at 13:30
answered Jul 2 '11 at 10:52
Finbarr
26.3k1010 gold badges5757 silver badges8787 bronze badges

Oh well guess callback will be the only way, thats good enough though. – somemvcperson Jul 2 '11 at 10:57
The beauty of javascript is in its asynchronous nature. Take full advantage of it! – Finbarr Jul 2 '11 at 11:02
1
@Finbarr: Indeed, although technically it's not the nature of JavaScript; JavaScript itself defines no asynchronous features at all, it just has really powerful features (functions being first-class objects, closures) that make it well-suited to event-driven environments. It's the environment (browser, NodeJS, etc.) that allows it to be event-driven (or doesn't, as in the case of Windows Script Host). – T.J. Crowder Jul 2 '11 at 11:13

Well, I've never heard of "Windows Script Host" before, but the name doesn't fill me with any confidence. – Finbarr Jul 2 '11 at 11:38

add a comment
2

I too had come across this problem and clearly the callback approach works, with the jqXHR object that is returned from the $.ajax() call implementing the Promise interface and thus I can make deferred calls to the done method (or even change the functionality of the done method at a later point in time. Here is one working sample:

//some separate js file to be included via a <script src=...></script>
//suppose it's named simpleWrappers.js
    function wrapAjax(dataURL,postData) {
        postData = (typeof postData === 'string') ? postData : "";
        respObj = $.ajax({
            url: dataURL
            , data: postData
            , dataType: 'json'
            , type: 'POST'
        });
        return respObj
    }

Now let's include the simpleWrappers.js file in some page with its own doc ready function

//...
<script src="js/simpleWrappers.js"></script>
    //...
    <script>
    $(document).ready(function() {
            //...
            myData = wrapAjax("scripts/returnCoolData.php?fname=fetchSuperCoolData");
            //now attach a done handler!
            myData.done(function(data,statusText,jqXHR) {
                //we'll do some trivial logging
                console.log("the status of the request was: " + statusText);
                //note, my data comes back in JSON, so I JSON.stringify() the data
                console.log("data returned is: " + JSON.stringify(data));
                //Note: don't expect responseText to be available, as in
                //console.log("responseText was: " + myData.responseText)
                //may well return "responseText was: undefined, see above answers
                //to grasp the calling context issue
            });
        }
        </script>

