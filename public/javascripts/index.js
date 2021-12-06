'use strict';
import {makeCard, makeMenu, setTitles, setFooter} from './nQm.js';

const doSomething = function () {
    makeMenu('menu');
    setTitles('Piefit');
    makeCard('card');
    setFooter('nml', 2021);
}
window.addEventListener('load', doSomething);
