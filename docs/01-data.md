# __Data__ module

This module enables to load a dataset to be analyzed, which
provides the results of a set of _N_ methods over an ensemble
of _M_ systems, and a set of reference values to assess the errors.

The expected datafile format is a `csv` file organized as follows:

    "Names","Ref","Meth1","Meth2", ... ,"MethN"
    "Syst1",  0.1,    0.2,    0.3, ... ,   0.4
    ...
    "SystM",  0.5,    0.6,    0.7, ... ,   0.8

where the 1st column contains the systems names, the 2nd column the
reference values, and the following column the results for the methods
to be assessed. The first line should be a header containing the tags
"Names, "Ref", and the names of the _N_ methods. 

## Controls

* `Choose CSV file`: browse and select a single file 

* `Units`: type the units of the dataset (for plots' axis legends)

* `Switch to relative errors`: as the tag says...
