const fileSelect = document.getElementById("fileSelect"),
    file = document.getElementById("file"),
    fileList = document.getElementById("fileList");

fileSelect.addEventListener("click", function (e) {
    if (file) {
        file.click();
    }
    e.preventDefault(); // prevent navigation to "#"
}, false);

file.addEventListener("change", handleFiles, false);

function handleFiles() {
    if (!this.files.length) {
        fileList.innerHTML = "<p>No files selected!</p>";
    } else {
        fileList.innerHTML = "";
        const list = document.createElement("ul");
        fileList.appendChild(list);
        for (let i = 0; i < this.files.length; i++) {
            const li = document.createElement("li");
            list.appendChild(li);

            const img = document.createElement("img");
            img.src = URL.createObjectURL(this.files[i]);
            img.height = 200;
            img.onload = function() {
                URL.revokeObjectURL(this.src);
            }
            li.appendChild(img);
            document.getElementById("caption").style.display = 'block';
            document.getElementById("submit").style.display = 'block';
            document.getElementById("fileSelect").style.display = 'none';
            //const info = document.createElement("span");
            //info.innerHTML = this.files[i].name + ": " + this.files[i].size + " bytes";
            // li.appendChild(info);
        }
    }
}

function submitClick() {
    submit = document.getElementById("submit");

    if (submit) {
        submit.click();

    }
}
