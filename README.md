![movies-app-icon](https://user-images.githubusercontent.com/42782393/165767936-40ac7a83-76dd-4b65-bd3d-dad6619b5c52.png)

# Movies IOS

## Funkcie

Prezeranie filmov          |  Pridávanie filmov do obľúbených | Filtrovanie filmov |
:-------------------------:|:---------------------------------:|:--------------------:|
![Simulator Screen Recording - iPhone 13 - 2022-04-28 at 18 11 58](https://user-images.githubusercontent.com/42782393/165797428-837cdce4-0c2f-4f80-955e-77e399fc3d9e.gif) | ![2](https://user-images.githubusercontent.com/42782393/165798100-c981102c-5928-4f60-82ae-7a029ae4387d.gif) | ![3](https://user-images.githubusercontent.com/42782393/165800255-d076c900-a935-4d4b-b8bb-4919d845f878.gif)


Vyhľadávanie filmov |
:------------------:|
![4](https://user-images.githubusercontent.com/42782393/165801745-862e6adf-73da-49b9-a1ec-656f68258ba8.gif) |


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
