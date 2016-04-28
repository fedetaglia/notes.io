function __getWeather {
 curl http://wttr.in/$*
}

alias weather='__getWeather'