# Obrada i vizuelizacija podataka o potrošnji električne energije u odnosu na vremenske uslove 
Prikaz obrađenih podataka o potrošnji električne energije po satima zajedno sa obrađenim podacima o vremenskoj prognozi u istom trenutku omogućava uvid u trendove promene potrošnje električne energije u zavisnosti od vremenskih prilika. Uočeni trendovi se mogu iskoristiti za detaljno proređivanje količine podataka za korišćenje u svrhu kreiranja modela za predviđanje potrošnje.

## ECL kod

Za pokretanje ovog koda neophodno je imati instalirano HPCC okruženje. Postoji više opcija koje je moguće upotrebiti:
1. [**HPCC Client Tools**](https://cdn.hpccsystems.com/install/docs/3_8_0_4rc_CE/HPCCClientTools.pdf)
2. [**Containerized HPCC Systems platform**](https://hpccsystems.com/running-hpcc-locally-with-helm/)
3. [**Virtualna mašina**](https://cdn.hpccsystems.com/install/docs/3_2_2_1/RunningHPCCinaVirtualMachine.pdf)

Za programiranje moguće je koristiti [**ECL IDE**](https://cdn.hpccsystems.com/releases/CE-Candidate-6.4.20/docs/TheECLIDEandHPCCClientTools-6.4.20-1.pdf) ili Visual Studio Code sa instaliranom HPCC ekstenzijom za [**ECL jezik**](https://marketplace.visualstudio.com/items?itemName=hpcc-systems.ecl).

Za podešavanje okruženja za pokretanje koristi se [launch.json](.vscode/launch.json) fajl.
Moduli se nalaze u okviru globalnog foldera dok su kodovi za izvršavanje smešteni u [Load_and_Weather](Load_and_Weather) folder.

## Vizuelizacija

Za potrebe vizuelizacije korišćeni su ObservableJS d3 paket u okviru [Visualize.eclnb](Load_and_Weather/Visualize.eclnb) kao i echarts u okviru web okruženja u [Visualization](Visualization) folderu.
