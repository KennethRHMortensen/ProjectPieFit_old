'use strict';
/*
 * handlers.js
 * Requesthandlers to be called by the router mechanism
 */
const fs = require("fs");                                   // file system access
const httpStatus = require("http-status-codes");            // http sc
const models = require("../models/handleContacts");         // models are datahandlers
const lib = require("../controllers/libWebUtil");           // home grown utilities
const nmlPlate = require("../controllers/myTemplater");     // home grown templater

const getAndServe = async function (res, path, contentType) {   // asynchronous
    let args = [...arguments];                              // arguments to array
    let myargs = args.slice(3);                             // dump first three
    let obj;

    await fs.readFile(path, function(err, data) {           // awaits async read
        if (err) {
            console.log(`Not found file: ${path}`);
        } else {
            res.writeHead(httpStatus.OK, {                  // yes, write header
                "Content-Type": contentType
            });
                                                            // call templater
            while( typeof (obj = myargs.shift()) !== 'undefined' ) {
                data = nmlPlate.doTheMagic(data, obj)
            }

            res.write(data);
            res.end();
        }
    });
};

module.exports = {
    home(req, res) {
        let path = req.url;
        if (path === "/") {
            path = "/index";
        }
        path = "views" + path + ".html";
        let content = "text/html; charset=utf-8";
        getAndServe(res, path, content);
    },
    js(req, res) {
        let path = "public/javascripts" + req.url;
        let content = "application/javascript; charset=utf-8";
        getAndServe(res, path, content);
    },
    css(req, res) {
        let path = "public/stylesheets" + req.url;
        let content = "text/css; charset=utf-8";
        getAndServe(res, path, content);
    },
    png(req, res) {
        let path = "public/images" + req.url;
        let content = "image/png";
        getAndServe(res, path, content);
    },
    svg(req, res) {
        let path = "public" + req.url;
        let content = "image/svg+xml";
        getAndServe(res, path, content);
    },
    ico(req, res) {
        let path ="public" + req.url;
        let content = "image/x-icon";
        getAndServe(res, path, content);
    },

    notfound(req, res) {
        console.log(`Handler 'notfound' was called for route ${req.url}`);
        res.end();
    },

    async contacts(req, res) {
        let r = await models.showContacts(req, res);
        let content = "text/html; charset=utf-8";
        let path = "views/displayContacts.html";
        getAndServe(res, path, content, {contacts: r, a: 'right aside', b: 'left aside'}); // extra arg for templater
    },

    async receiveContacts(req, res, data) {
        let obj = lib.makeWebArrays(req, data);         // home made GET and POST objects
        await models.updContacts(req, res, obj);
        res.writeHead(httpStatus.MOVED_PERMANENTLY, {"Location": "http://localhost:3000"});
        res.end();
    }
}