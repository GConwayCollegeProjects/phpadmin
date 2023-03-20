// arguments: reference to select list, callback function (optional)
function getSelectedOptions(sel, fn) {
    var opts = [], opt;

    // loop through options in select list
    for (var i = 0, len = sel.options.length; i < len; i++) {
        opt = sel.options[i];

        // check if selected
        if (opt.selected) {
            // add to array of option elements to return from this function
            opts.push(opt);

            // invoke optional callback function if provided
            if (fn) {
                fn(opt);
            }
        }
    }

    // return array containing references to selected option elements
    return opts;
}



oData.append('nheadline', nheadline.value)

oData.append('nselect', nselect)

oData.append('nsource', nsource.value)

oData.append('nstart', nstart.value)

oData.append('ifile', ifile.files[0])

oData.append('icaption', icaption.value)
oData.append('vfile', vfile.files[0])

oData.append('vcaption', vcaption.value)
oData.append('pfile', pfile.files[0])

oData.append('pcaption', pcaption.value)
oData.append('url', url.value)

oData.append('ucaption', ucaption.value)