/* myTemplater.js nml templating */
"use strict";

exports.doTheMagic = function(data, obj) {
    data = '' + data;                   // buffer to string
    let regex = /xpq/g;                 // dummy regex
    let a = Object.keys(obj);           // get keys from 4th param
    a.forEach(function(doo) {           // loop through then
        let regstr = `<42 ${doo} 24>`;  // materialize regex string from key
        regex = RegExp(regstr, 'g');    // create regex from that
        let s;
        if (typeof obj[doo] == 'object') {  // if object
            s = `<table>`;
            for (let c of obj[doo]) {       //  loop through obj (array)
                s += `<tr><td>${c.name}</td><td>${c.email}</td><td>${c.phone}</td></tr>`
            }
            s += `</table>`;
        } else if (typeof obj[doo] == 'string') {
            s = obj[doo];                   // if string, place it
        }
        data = data.replaceAll(regex, s);   // actual replace
    });

    return data;
};