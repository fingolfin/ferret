SetPackageInfo( rec(

PackageName := "ferret",
Subtitle := "Backtrack Search in Permutation Groups",
Version := "0.7.1",
Date := "19/10/2016", # dd/mm/yyyy format

Persons := [
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Christopher",
    LastName := "Jefferson",
    WWWHome := "http://caj.host.cs.st-andrews.ac.uk/",
    Email := "caj21@st-andrews.ac.uk",
    PostalAddress := Concatenation(
               "St Andrews\n",
               "Scotland\n",
               "UK" ),
    Place := "St Andrews",
    Institution := "University of St Andrews",
  ),
],

PackageWWWHome := "http://gap-packages.github.io/ferret/",

ArchiveURL     := Concatenation("https://github.com/gap-packages/ferret/",
                                "releases/download/v", ~.Version,
                                "/ferret-", ~.Version),
README_URL     := Concatenation( ~.PackageWWWHome, "README" ),
PackageInfoURL := Concatenation( ~.PackageWWWHome, "PackageInfo.g" ),

ArchiveFormats := ".tar.gz",

##  Status information. Currently the following cases are recognized:
##    "accepted"      for successfully refereed packages
##    "submitted"     for packages submitted for the refereeing
##    "deposited"     for packages for which the GAP developers agreed
##                    to distribute them with the core GAP system
##    "dev"           for development versions of packages
##    "other"         for all other packages
##
Status := "dev",

SourceRepository := rec( 
  Type := "git", 
  URL := "https://github.com/gap-packages/ferret"
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),

AbstractHTML   :=  "",

PackageDoc := rec(
  BookName  := "Ferret",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Backtrack Search in Permutation Groups",
),

Dependencies := rec(
  GAP := ">= 4.6",
  NeededOtherPackages := [ [ "GAPDoc", ">= 1.5" ] ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ],
),

AvailabilityTest := function()
  if Filename(DirectoriesPackagePrograms("ferret"), "hellod.so") = fail then
    Print("Error: Cannot load 'Ferret' due to missing binary library\n");
    Print("Please run './configure; make' in the 'pkg/ferret' directory\n");
    return fail;
  fi;
  return true;
end,

TestFile := "tst/testall.g",

#Keywords := [ "TODO" ],

AutoDoc := rec(
    TitlePage := rec(
        Copyright := """
&copyright; 2013-2016 by Christopher Jefferson<P/>
The Ferret package is free software;
you can redistribute it and/or modify it under the terms of the
<URL Text="GNU General Public License">http://www.fsf.org/licenses/gpl.html</URL>
as published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.
"""
    )
),

));


