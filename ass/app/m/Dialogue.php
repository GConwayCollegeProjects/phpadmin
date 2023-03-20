<?php


class Dialogue
{
private $image_1 = "<p> You can add a headline picture to your story very easily either from your existing library of pictures on the site or from your computer, tablet or smartphone.

Additional pictures can be included by using the gallery tab above.

A video clip can also be added by using the video tab above.

Do you want to add an image to your story?</p><br>

<a id='image_1a' >From your image library on the site</a><br>

<a id='image_1b' >From your your computer, tablet or smartphone</a><br>

<p>Pick ONE of these options to proceed.</p>
	
	" ;

	function __construct()
	{


	}

	/**
	 * @return string
	 */
	public function showDialogue($x): string
	{
		switch ($x) {
			case 1:
				return $this->image_1;
				break;
			case 2:
				return $this->login;
				break;
			case 3:
				return $this->register;
				break;
			case 4:
				return $this->reminder;
				break;
			case 5:
				return $this->password;
				break;
			case 6:
				return $this->picture;
				break;
		}
	}


}


}