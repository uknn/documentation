Version : 0.76 rev b
Date : 16 Mai 2013
Auteurs : Samuel Forcier // David Lafrenière


   |-----------|
---|COMPILATION|---
   |-----------|
   
---WINDOWS--
# PATH=%PATH%;C:\Program Files\Eiffel Software\EiffelStudio 7.1 GPL\gcc\windows\mingw\bin
# -o remise2.exe "c:\users\utilisateur\documents\eiffel user files\7.1\precomp\spec\windows\EIFGENs\base-mt\W_code/mingw/precomp.lib" "C:\Program Files\Eiffel Software\EiffelStudio 7.1 GPL\library\net\spec\mingw\windows\lib\mtnet.lib" "../../../SDL-1.2.14/lib/libSDL.dll.a" "../../../SDL_mixer-1.2.12/lib/x86/SDL_mixer.dll" "../../../SDL_ttf-2.0.11/lib/x86/libfreetype-6.dll" "../../../SDL_ttf-2.0.11/lib/x86/SDL_ttf.dll" "../../../SDL_ttf-2.0.11/lib/x86/zlib1.dll" "C:\Program Files\Eiffel Software\EiffelStudio 7.1 GPL/studio/spec/windows/lib/mingw/mtwkbench.a"  
# remise2.exe

---LINUX---
# sudo apt-get install libsdl-1.2-dev
# sudo apt-get install libsdl-mixer1.2-dev
# sudo apt-get install libsdl-ttf2.0-0-dev
# gcc -o remise2 remise2.c -lsdl
# ./remise2


   |-------------|
---|COMMENT JOUER|---
   |-------------|
   
1. Les flèches directionelles du clavier font bouger le personnage
2. La barre d'espacement fait "tirer" le personnage
3. "tuer la grosse mouche" en utilisant les projectiles du personnage
4. Avoir le "highscore" le plus elevé avant de "mourrir"
5. Donner une très bonne évaluation à ce projet




             ,gaaaaaaaagaaaaaaaaaaaaagaaaaaaaag,
           ,aP8b    _,dYba,       ,adPb,_    d8Ya,
         ,aP"  Yb_,dP"   "Yba, ,adP"   "Yb,_dP  "Ya,
       ,aP"    _88"         )888(         "88_    "Ya,
     ,aP"   _,dP"Yb      ,adP"8"Yba,      dP"Yb,_   "Ya,
   ,aPYb _,dP8    Yb  ,adP"   8   "Yba,  dP    8Yb,_ dPYa,
 ,aP"  YdP" dP     YbdP"      8      "YbdP     Yb "YbP  "Ya,
I8aaaaaa8aaa8baaaaaa88aaaaaaaa8aaaaaaaa88aaaaaad8aaa8aaaaaa8I
`Yb,   d8a, Ya      d8b,      8      ,d8b      aP ,a8b   ,dP'
  "Yb,dP "Ya "8,   dI "Yb,    8    ,dP" Ib   ,8" aP" Yb,dP"
    "Y8,   "YaI8, ,8'   "Yb,  8  ,dP"   `8, ,8IaP"   ,8P"
      "Yb,   `"Y8ad'      "Yb,8,dP"      `ba8P"'   ,dP"
        "Yb,    `"8,        "Y8P"        ,8"'    ,dP"
          "Yb,    `8,         8         ,8'    ,dP"
            "Yb,   `Ya        8        aP'   ,dP"
              "Yb,   "8,      8      ,8"   ,dP"
                "Yb,  `8,     8     ,8'  ,dP"   Bling
                  "Yb, `Ya    8    aP' ,dP"     Bling
                    "Yb, "8,  8  ,8" ,dP"
                      "Yb,`8, 8 ,8',dP"
                        "Yb,Ya8aP,dP"
                          "Y88888P"
                            "Y8P"
                              "
