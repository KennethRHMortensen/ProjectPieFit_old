"use strict";
/*
 * check if routed handler function exists
 * if yes call it, else complain
 */
const handlers = require("../controllers/handlers");  // handlers module
const requestHandlers = {                             // application urls here
    GET: {
        "/": handlers.home,
        "/page1": handlers.home,
        "/about": handlers.home,
        "/contact": handlers.home,
        "/contacts": handlers.contacts,
        "/notfound": handlers.notfound,
        "js": handlers.js,
        "css": handlers.css,
        "png": handlers.png,
        "svg": handlers.svg,
        "ico": handlers.ico
    },
    POST: {
        "/contact": handlers.receiveContacts
    }
}

module.exports = {
    route(req, res, bodydata) {
        let arr = req.url.split(".");
        let ext = arr[arr.length - 1];
        if (typeof requestHandlers[req.method][req.url] === 'function') {  // look for route
            requestHandlers[req.method][req.url](req, res, bodydata);      // if found use it
        } else if (typeof requestHandlers[req.method][ext] === "function") {
            requestHandlers[req.method][ext](req, res);
        } else {
            requestHandlers.GET["/notfound"](req, res);        // use notfound
        }
    }
}