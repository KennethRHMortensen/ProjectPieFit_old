'use strict';
import {menu} from './menu.js';

export const $ = function (foo) {
    return document.getElementById(foo);
};
export const setTitles = function (title) {
    let targets = document.getElementsByClassName('title');
    for(let i = 0; i < targets.length; ++i) {
        targets[i].innerHTML = title;
    }
};
export const setFooter = function (bar, year) {
    let now = new Date();
    $('cpryear').innerHTML = `&copy; ${bar} ${year}-${now.getFullYear()}`;
};

export const roll = function (foo) {return Math.floor(Math.random()*foo)+1};

export const strCharRepl = function(s, c, j) {
    let ns = "";
    for (let i = 0; i < s.length; i++) {
        if (j === i) {
            ns += c;
        } else {
            ns += s.charAt(i);
        }
    }
    return ns;
};

let cardData = [{exercise: 'Fast Feet Steps', reps: '30'},{exercise: 'Plank Hip Dip', reps: '10'}]

function printCardData(where) {
    cardData.forEach(element => {
        let tr = document.createElement('tr');
        let exercise = document.createElement('td');
        let reps = document.createElement('td');        
    
        exercise.appendChild(document.createTextNode(element.exercise));
        reps.appendChild(document.createTextNode(element.reps));
    
        tr.append(exercise, reps);
    
        where.appendChild(tr);
    
    });
 };
    

export const makeCard = function (where) {

    
    
    let cardFront = document.createElement('div');
    let cardBack = document.createElement('div');
    let cardHeading = document.createElement('div');
    let h2 = document.createElement('h2');
    let pieFitLogo = document.createElement('img');
    let table = document.createElement('table');
    let tr = document.createElement('tr');
    let exerciseName = document.createElement('th');    
    let worktypeHeading = document.createElement('th');    
    let cardFooter = document.createElement('div');
    let instagramLogo = document.createElement('img');
    let instagramText = document.createElement('p');

    cardFront.setAttribute('class', 'card__front');
    cardBack.setAttribute('class', 'card__back');
    cardHeading.setAttribute('class', 'card__heading');
    cardFooter.setAttribute('class', 'card__footer');  
    
    
    cardFooter.append(instagramLogo, instagramText);
    instagramText.appendChild(document.createTextNode('#PiefitSomething'));    
    

    worktypeHeading.appendChild(document.createTextNode('REPS'));
    exerciseName.appendChild(document.createTextNode('EXERCISES'));
    tr.append(exerciseName, worktypeHeading);
    table.appendChild(tr);

    printCardData(table);
    
    h2.appendChild(document.createTextNode('AMRAP 12'));
    cardHeading.append(h2, pieFitLogo);
    
    cardFront.append(cardHeading, table, cardFooter);
    $(where).appendChild(cardFront);

}

export const makeMenu = function (where) {
    let nav = document.createElement('nav');
    let h1 = document.createElement('h1');
    h1.setAttribute('class', 'title');
    let list = document.createElement('ul');
    nav.appendChild(h1);
    nav.appendChild(list);
    menu.forEach( function(item) {
        let listitem = document.createElement('li');
        let link = document.createElement('a');
        link.setAttribute('href', item.url);
        let txt = document.createTextNode(item.text);
        link.appendChild(txt);
        listitem.appendChild(link);
        list.appendChild(listitem);
    });
    $(where).appendChild(nav);
};

let ntime;
export let nstop;
export const formaTid = function (t) {
    var m = t.getMinutes() >= 10 ? t.getMinutes() : "0" + t.getMinutes();
    var s = t.getSeconds() >= 10 ? t.getSeconds() : "0" + t.getSeconds();
    return t.getHours() + ":" + m + ":" + s;
};

export const bigBang = function () {
    clearInterval(nstop);
    ntime = new Date(1970,0,1,0,0,0);
    nstop = setInterval(function () {
        ntime.setSeconds(ntime.getSeconds() + 1);
        $('timer').innerHTML = formaTid(ntime);
    }, 1000);
};
