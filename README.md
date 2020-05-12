# Migration circular diagram

This repo contains code and output reproducing and updating the charts in [Abel & Sander (2014)](https://science.sciencemag.org/content/343/6178/1520.abstract) showing a chord (circular) diagram of migration flows.

See also <http://download.gsb.bund.de/BIB/global_flow/> for interactive graphics.

The resulting charts in this repo show migration flows between 2015 and 2017.

## Data Sources

Source data and metadata is saved in `[data-input]`:

- excel file of [migration stocks data from the UN](https://www.un.org/en/development/desa/population/migration/data/estimates2/data/UN_MigrantStockByOriginAndDestination_2017.xlsx)
- TSV file of UN country codes from <from https://unstats.un.org/unsd/methodology/m49/overview/>

Both downloaded 4 May 2020.

## Outputs

- PDF charts contained in `[charts-output]` directory
- web preview of script and charts at <https://migration-circle.netlify.app/>
- HTML files in root folder: core script and colour page (see below)

## How to reproduce

The code is version controlled using Git and dependencies are captured using `renv`. 
Upon loading the project, `renv` will install the right versions of all needed packages in a local library. 

Then running `rmarkdown::render("index.Rmd")` should recreate the data and charts from source data saved in the repository.

## Bonus

`colors.Rmd` builds a HTML file with full information for reusing the project-specific colours used in the charts. See <https://migration-circle.netlify.app/colours.html> to view the result in HTML, which is also saved in the repo.

## Funding

Project supported by Technological Agency of the Czech Republic, project [Application of the contemporary research knowledge in political geography into teaching geography and social-scientific subjects at secondary schools](https://starfos.tacr.cz/en/project/TL02000195).

