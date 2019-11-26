Working with CEMS-Floods data.

CEMS-Floods are responsible for the operation of the European Flood Awareness System (EFAS) and the Global Flood Awareness System (GLOFAS)

Data for both systems can be accessed freely via the Copernicus Climate Data Store (CDS) [Copernicus Climate Datastore](https://cds.climate.copernicus.eu)

We have created a git repository containing the details for the creation of a docker image in which you can execute code using Jupyter Notebooks 
to retrieve, convert, plot and interpret the EFAS data.

The docker image details are located within the GIT Repository here : [GIT HUB](https://github.com/enyfeo/efas)
 
The docker image does take a while to install and so we have uploaded the pre created docker image here : https://hub.docker.com/r/enyfeo/efas

    docker pull enyfeo/efas:latest

One of the examples will require access to the CDS System, therefore we recomend users register at [CDS](https://cds.climate.copernicus.eu) and follow
 instructions here and create an API Key [CDS API How To](https://cds.climate.copernicus.eu/api-how-to)
