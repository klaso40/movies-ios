![movies-app-icon](https://user-images.githubusercontent.com/42782393/165767936-40ac7a83-76dd-4b65-bd3d-dad6619b5c52.png)

# Movies IOS

## Funkcie
 - vyhľadávanie filmov
 - filtrovanie podľa žánru
 - zobrazenie najlepšie hodnotených filmov
 - ukladanie obľúbených filmov
 
IOS aplikácia, ktorá zobrazuje najnovšie, najpopulárnejšie a najlepšie hodnotené filmy z portálu [themoviedb.org](https://www.themoviedb.org/). Aplikácia 
taktiež umožňuje filtrovať filmy podľa žánru a vyhľadávanie filmov podľa názvu. Taktiež si používateľ má možnosť uložiť svoje obľúbené filmy, aby sa k nim
vedel v budúcnosti rýchlejšie dostať.

O každom filme má používateľ možnosť sa dozvedieť jeho hodnotenie, obsah, herecké obsadenie, rok výroby a ďalšie údaje.

## Použíté knižnice
 - [alamofire](https://github.com/Alamofire/Alamofire)

## Technické detaily
Aplikácia na komunikáciu s API používa knižnicu [alamofire](https://github.com/Alamofire/Alamofire). Aplikácia sa nepripája priamo na TMDB API, 
ale na [moje vlastné API](https://github.com/klaso40/movies-api), v ktorom údaje spracujem do podoby potrebnej pre IOS aplikáciu. 
Aplikácia podporuje caching.

Obľúbené filmy sa ukladajú do [Core Data databázy](https://developer.apple.com/documentation/coredata). 
