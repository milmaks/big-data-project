# ECL - struktura projekta

Fajlovi u okviru [root]() foldera:

**Constants.ecl**

Sadrži definicije putanja za HPCC okruženje i layout definicije za sve zajedničke fajlove.

**Load.ecl**

Sadrži layout definicije za fajlove koji opisuju potrošnju.

**Weather.ecl**

Sadrži layout definicije za fajlove koji opisuju vremenske uslove.

Fajlovi u okviru ovog foldera:

**01_Data_Import_Job.ecl**

Sadrži kod za importovanje podataka iz landing zone u Thor

**02_Data_Import_Validate_Load_Job.ecl**

Sadrži kod za validaciju importa podataka o potrošnji

**02_Data_Import_Validate_Weather_Job.ecl**

Sadrži kod za validaciju importa podataka o vremenskim uslovima

**03_Data_Patterns_Job.ecl**

Kreiranje Data Profile izveštaja nad sirovim podacima da bi se razumela struktura importovanih podataka i detalji o istim

**04_Clean_Job.ecl**

Kod za prečišćavanje sirovih podataka

**05_Enrich_Job.ecl**

Dodavanje dodatih atributa u prečišćenu verziju podataka koji mogu biti od dodatnog značaja u okviru analize 

**06_Data_Combine_Job.ecl**

Kod za spajanje podataka o potrošnji i vremenskim uslovima

**07_Data_Export_Job.ecl**

Kod za eksportovanje podataka iz Thor-a u landing zone

**08_Visualize_Job.ecl**

Kod za kreiranje podataka za vizuelizaciju određenog dana

**Visualize.eclnb**

ECL Notebook za vizuelizaciju korišćenjem OJS i d3 paketa