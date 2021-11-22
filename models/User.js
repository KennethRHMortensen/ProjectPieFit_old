'use strict';

class User {
    constructor(name, email, phone, datetime) {
        this.name = name,
        this.email = email,
        this.phone = phone,
        this.datetime = datetime;
    }
}
module.exports = {
    User: User
};