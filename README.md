# Koha plugin to see more results per page

OBSOLETE since Koha 20.05 with https://bugs.koha-community.org/bugzilla3/show_bug.cgi?id=14715

## Presentation

Adds in catalag search results page links to display more results per page : 100, 500 and 1000.
Default number of results is managed by numSearchResults system preference.

Actually only for intranet.

## Packaging

To create KPZ archive from git repository, run the following command:

``git archive --output=../koha-plugin.kpz --format=zip HEAD -- Koha``

