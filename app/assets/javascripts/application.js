// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree.
//= require responsive
//= require gallery/slideshow
//= require gallery/galleria
//= require gallery/galleria/classic
//= require gallery/touch_touch

//= require jquery/jquery.easing-1.3
//= require jquery/jquery.elastislide
//= require jquery/jquery.tmpl.min


function countdown(time,id){

    //time brauchen wir später noch
    t = time;

    //Tage berechnen
    d = Math.floor(t/(60*60*24)) % 24;

    // Stunden berechnen
    h = Math.floor(t/(60*60)) % 24;


    // Minuten berechnen
    // Sekunden durch 60 ergibt Minuten
    // Minuten gehen von 0-59
    //also Modulo 60 rechnen
    m = Math.floor(t/60) %60;

    // Sekunden berechnen
    s = t %60;

    //Zeiten formatieren
    d = (d >  0) ? d+"d ":"";
    h = (h < 10) ? "0"+h : h;
    m = (m < 10) ? "0"+m : m;
    s = (s < 10) ? "0"+s : s;

    // Ausgabestring generieren
    strZeit = s;

    // Falls der Countdown noch nicht zurückgezählt ist
    if(time > 0)
    {
        //Countdown-Funktion erneut aufrufen
        //diesmal mit einer Sekunde weniger
        window.setTimeout('countdown('+ --time+',\''+id+'\')',1000);
    }
    else
    {
        //führe eine funktion aus oder refresh die seite
        //dieser Teil hier wird genau einmal ausgeführt und zwar
        //wenn die Zeit um ist.
        strZeit = "Fertig";
    }
    // Ausgabestring in Tag mit id="id" schreiben
    document.getElementById(id).innerHTML = strZeit;
}