<?php


class Tabs
{
private $navNews = "

<div class='container tabs '>
            <!-- Nav tabs -->
        <ul class='nav nav-tabs' role='tablist'>
            <li class='nav-item'>
                <a class='nav-link active' data-toggle='tab' href='#Text'>Text</a>
            </li>
            <li class='nav-item'>
                <a class='nav-link' data-toggle='tab' href='#Image'>Image</a>
            </li>
            <li class='nav-item'>
                <a class='nav-link' data-toggle='tab' href='#Video'>Video</a>
            </li>
            <li class='nav-item'>
                <a class='nav-link' data-toggle='tab' href='#Gallery'>Gallery</a>
            </li>
            <li class='nav-item'>
                <a class='nav-link' data-toggle='tab' href='#PDF'>PDF</a>
            </li>
            <li class='nav-item'>
                <a class='nav-link' data-toggle='tab' href='#URL'>URL</a>
            </li>
            <li class='nav-item'>
                <a class='nav-link' data-toggle='tab' href='#HTML'>HTML</a>
            </li>

        </ul>
        <!-- Tab panes -->
        <div class='tab-content'>
            <div id='Text' class='container tab-pane active'><br>
                <div id='text_container' class='container d-flex' style=' z-index: 2 ; margin: 50px 5% 5px auto ; position: relative;'>
                    <textarea id='tiny4' style='display: none; width:600px; height: 440px;'></textarea>
                    <textarea id='tiny3' style='display: none; width:600px; height: 440px;'></textarea>

                    <label for='tiny'></label><textarea id='tiny' style='z-index: 3;'>
    Why do we use it?

    It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).  </textarea>


                </div>
            </div>
            <div id='Image' class='container tab-pane fade'><br>
                <h3>Image</h3>
                <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
            </div>
            <div id='Video' class='container tab-pane fade'><br>
                <h3>Video</h3>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
            </div>
            <div id='Gallery' class='container tab-pane fade'><br>
                <h3>Gallery</h3>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
            </div>
            <div id='PDF' class='container tab-pane fade'><br>
                <h3>PDF</h3>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
            </div>
            <div id='URL' class='container tab-pane fade'><br>
                <h3>URL</h3>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
            </div>
            <div id='HTML' class='container tab-pane fade'><br>
                <h3>HTML</h3>
                <label for='tiny2'></label><textarea id='tiny2' style='display: none; width:600px; height: 440px;'></textarea>
            </div>

        </div>
    </div>


";









}