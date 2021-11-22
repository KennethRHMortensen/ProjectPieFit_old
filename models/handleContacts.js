'use strict';
/*
 * models
 * handlers for data manipulation
 */
const maria = require("mysql2/promise");                               // file system access
const httpStatus = require("http-status-codes");        // http sc
const experimental = require("../controllers/myTemplater"); // highly experimental template
const dbp = require('./dbParams.js');

module.exports = {
    async updContacts(req, res, obj) {
        const dbh = await maria.createConnection(dbp);
        let sql = `insert into user values('${obj.POST.name}', '${obj.POST.email}', '${obj.POST.phone}')`
        await dbh.execute(sql);
    },

    async showContacts (req, res) {
        const dbh = await maria.createConnection(dbp);
        const [rows, fields] = await dbh.execute('select * from user');
        return rows;
    }
}