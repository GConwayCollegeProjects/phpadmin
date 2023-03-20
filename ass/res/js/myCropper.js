

// body on change image starts here

$("body").on("change", ".image", function(e){

    var files = e.target.files;

    var done = function (url) {

        image.src = url;

        $modal.modal('show');

    };

    var reader;

    var file;

    var url;


    if (files && files.length > 0) {

        file = files[0];


        if (URL) {

            done(URL.createObjectURL(file));

        } else if (FileReader) {

            reader = new FileReader();

            reader.onload = function (e) {

                done(reader.result);

            };

            reader.readAsDataURL(file);

        }

    }

});
//end

// show modal start here
$modal.on('shown.bs.modal', function () {

    cropper = new Cropper(image, {

        aspectRatio: 1,

        viewMode: 3,

        preview: '.preview'

    }); // new cropper


}).on('hidden.bs.modal', function () {

    cropper.destroy();

    cropper = null;

});
//end

// final crop function starts here

$("#crop").click(function(){

    canvas = cropper.getCroppedCanvas({

        width: 160,

        height: 160,

    });


    canvas.toBlob(function(blob) {

        url = URL.createObjectURL(blob);

        var reader = new FileReader();

        reader.readAsDataURL(blob);

        reader.onloadend = function() {

            var base64data = reader.result;



            $.ajax({

                type: "POST",

                dataType: "json",

                url: "app/u/cropHandler.php",

                data: {image: base64data},

                success: function(data){

                    console.log(data);

                    $modal.modal('hide');

                    alert("success upload image");

                }

            });

        }

    });

})
//end
