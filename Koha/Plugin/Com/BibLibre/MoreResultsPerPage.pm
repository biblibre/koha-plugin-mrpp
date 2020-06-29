package Koha::Plugin::Com::BibLibre::MoreResultsPerPage;

use Modern::Perl;

use base qw(Koha::Plugins::Base);

use C4::Context;

our $VERSION = '1.1';

our $metadata = {
    name   => 'More Results Per Page',
    author => 'BibLibre',
    description => 'See more results per page',
    date_authored   => '2019-12-12',
    date_updated    => '2020-06-18',
    minimum_version => '18.11',
    maximum_version => undef,
    version         => $VERSION,
};

sub new {
    my ( $class, $args ) = @_;

    $args->{'metadata'} = $metadata;
    $args->{'metadata'}->{'class'} = $class;

    my $self = $class->SUPER::new($args);

    return $self;
}

# Mandatory even if does nothing
sub install {
    my ( $self, $args ) = @_;

    return 1;
}

# Mandatory even if does nothing
sub upgrade {
    my ( $self, $args ) = @_;

    return 1;
}

# Mandatory even if does nothing
sub uninstall {
    my ( $self, $args ) = @_;

    return 1;
}

sub intranet_js {
    my ( $self ) = @_;

    return q%
<script>
/*
 * Plugin More Results Per Page
 */

$.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null) {
       return null;
    }
    return decodeURI(results[1]) || 0;
}

$(document).ready(function(){
$("body#catalog_results nav ul.pagination").each(function(){

    /* Add buttons */
    var slink = $(this).find("a.nav").first().attr("href");
    slink = slink.replace(/&offset=\d*/g,"");
    $(this)
    .append('<li><a class="nav" href="'+slink+'&count=100">100</a></li>')
    .append('<li><a class="nav" href="'+slink+'&count=500">500</a></li>')
    .append('<li><a class="nav" href="'+slink+'&count=1000">1000</a></li>');

    /* Preserve count in pagination */
    var pcount = $.urlParam("count");
    if (pcount) {
        $(this).find("a.nav").attr("href",function(){
            var alink = $(this).attr("href");
            if (alink.indexOf("count=") == -1) {
                return alink + "&count=" + pcount;
            } else {
                return alink;
            }
        });
    }

});
});

</script>
%;
}

1;
